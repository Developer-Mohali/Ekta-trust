Imports System
Imports System.Collections.Generic
Imports System.IO
Imports System.Net
Imports MySql.Data.MySqlClient
Imports Newtonsoft.Json
Imports Paytm

Public Class PaytmCallBack
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim PaymentFrom As String = ""

        ' getting previous page info, so update payment info in particular table...
        If Request.UrlReferrer IsNot Nothing Then
            Dim previousPageUrl As String = Request.UrlReferrer.AbsoluteUri
            If previousPageUrl.Contains("Donation") Then
                PaymentFrom = "Donation"
            End If
        End If



        ' 🔴 Handle Paytm POST callback
        If Request.HttpMethod = "POST" AndAlso Not String.IsNullOrEmpty(Request.Form("ORDERID")) Then

            HandlePaytmCallback(PaymentFrom)

        End If
    End Sub

    Private Sub HandlePaytmCallback(PaymentFrom As String)

        Try
            Dim merchantKey As String = ConfigurationManager.AppSettings("MerchantKey")

            Dim paytmParams As New Dictionary(Of String, String)

            Dim paymentFor As String = Request.QueryString("paymentfor")

            ' 🔹 Read all Paytm POST data
            For Each key As String In Request.Form.Keys
                paytmParams.Add(key, Request.Form(key))
            Next

            Dim checksum As String = paytmParams("CHECKSUMHASH")
            paytmParams.Remove("CHECKSUMHASH")

            Dim fullResponseJson As String = JsonConvert.SerializeObject(paytmParams)

            Dim isValid As Boolean = Paytm.Checksum.verifySignature(paytmParams, merchantKey, checksum)

            If isValid Then

                Dim status As String = Request.Form("STATUS")
                Dim orderId As String = Request.Form("ORDERID")
                Dim txnId As String = Request.Form("TXNID")
                Dim paymentMode As String = Request.Form("PAYMENTMODE")

                If status = "TXN_SUCCESS" Then

                    ' ✅ Update DB → SUCCESS
                    If paymentFor.Trim().ToLower() = "donation" Then
                        UpdateOderInDonation(orderId, "Success", txnId, fullResponseJson, paymentMode)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=success&orderId=" & orderId & "&type=donation", False)
                    Else
                        UpdateOrderInBIB(orderId, "Success", txnId, fullResponseJson)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=success&orderId=" & orderId & "&type=registration", False)
                    End If

                    Context.ApplicationInstance.CompleteRequest()
                Else

                    ' ❌ Update DB → FAILED
                    If paymentFor.Trim().ToLower() = "donation" Then
                        UpdateOderInDonation(orderId, "Failed", txnId, fullResponseJson, paymentMode)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=failed&orderId=" & orderId & "&type=donation", False)
                    Else
                        UpdateOrderInBIB(orderId, "Failed", txnId, fullResponseJson)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=failed&orderId=" & orderId & "&type=registration", False)
                    End If

                    Context.ApplicationInstance.CompleteRequest()
                End If

            Else
                'ShowMessage("Checksum mismatch", False)
            End If

        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->HandlePaytmCallback ::: Error ::: {ex.Message}", ex)
        End Try

    End Sub


    Public Shared Sub UpdateOrderInBIB(orderId As String, status As String, txnId As String, apiResponse As String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Dim Query As String = "UPDATE bibdata SET PaymentStatus=@paymentStatus, PaytmResponse= @paytmResponse, TxnId = @txnId
                                    WHERE OrderId=@orderId"

                Using cmd As New MySqlCommand(Query, con)
                    cmd.Parameters.AddWithValue("@paymentStatus", status)
                    cmd.Parameters.AddWithValue("@paytmResponse", apiResponse)
                    cmd.Parameters.AddWithValue("@txnId", txnId)
                    cmd.Parameters.AddWithValue("@orderId", orderId)

                    con.Open()
                    Dim RowAffected = cmd.ExecuteNonQuery()
                    If (RowAffected = 0) Then
                        Logger.LogInfo("UpdateOrderInBIB ::: Paytm Payment transaction update failed:::" & Environment.NewLine & "PaytmResponse:::" & apiResponse)
                    End If
                End Using
            End Using
        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->UpdateOrder ::: Error ::: {ex.Message}", ex)
        End Try
    End Sub

    Public Shared Function GenerateSerialNumber() As String
        Dim serialNumber As String = "000001"

        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT COUNT(DonationID) FROM db_a460a8_ekta.donation WHERE PaymentStatus = 'Success'", con)

                    con.Open()
                    Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                    ' Increment for next serial
                    count += 1

                    ' Format to 6 digits
                    serialNumber = count.ToString("D6")
                End Using
            End Using

        Catch ex As Exception
            ' handle/log error if needed
        End Try

        Return serialNumber
    End Function

    Public Shared Sub UpdateOderInDonation(orderId As String, status As String, txnId As String, apiResponse As String, paymentMode As String)

        Dim serialNumber As String

        If status = "Success" Then
            serialNumber = GenerateSerialNumber()
        End If


        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Try
            Using con As New MySqlConnection(constr)
                Dim Query As String = "UPDATE donation SET PaymentStatus=@paymentStatus, PaytmResponse= @paytmResponse, TxnId = @txnId, ModeOfPayment = @ModeOfPayment, SerialNo=@SerialNo
                                    WHERE OrderId=@orderId"

                Using cmd As New MySqlCommand(Query, con)
                    cmd.Parameters.AddWithValue("@paymentStatus", status)
                    cmd.Parameters.AddWithValue("@paytmResponse", apiResponse)
                    cmd.Parameters.AddWithValue("@txnId", txnId)
                    cmd.Parameters.AddWithValue("@orderId", orderId)
                    cmd.Parameters.AddWithValue("@ModeOfPayment", paymentMode)
                    cmd.Parameters.AddWithValue("@SerialNo", serialNumber)

                    con.Open()
                    Dim RowAffected = cmd.ExecuteNonQuery()
                    If (RowAffected = 0) Then
                        Logger.LogInfo("UpdateOderInDonation ::: Paytm Payment transaction update failed:::" & Environment.NewLine & "PaytmResponse:::" & apiResponse)
                    End If
                End Using
            End Using
        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->UpdateOderInDonation ::: Error ::: {ex.Message}", ex)
        End Try
    End Sub

    ' Update payment status in DB inCase user don't attempt the payment or close the paytm popup...
    <System.Web.Services.WebMethod()>
    Public Shared Sub UpdatePaymentStatus(orderId As String, status As String, apiResponse As String, isDonation As Boolean)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim Query As String
        Try
            Using con As New MySqlConnection(constr)
                If isDonation Then
                    Query = "UPDATE donation SET PaymentStatus=@paymentStatus, PaytmResponse= @paytmResponse WHERE OrderId=@orderId"
                Else
                    Query = "UPDATE bibdata SET PaymentStatus=@paymentStatus, PaytmResponse= @paytmResponse WHERE OrderId=@orderId"
                End If

                Using cmd As New MySqlCommand(Query, con)
                    cmd.Parameters.AddWithValue("@paymentStatus", status)
                    cmd.Parameters.AddWithValue("@paytmResponse", apiResponse)
                    cmd.Parameters.AddWithValue("@orderId", orderId)

                    con.Open()
                    Dim RowAffected = cmd.ExecuteNonQuery()
                    If (RowAffected = 0) Then
                        Logger.LogInfo("UpdatePaymentStatus ::: Paytm Payment transaction update failed::: FROM PAGE IsDonation : " & isDonation & Environment.NewLine & "PaytmResponse:::" & apiResponse)
                    End If
                End Using
            End Using
        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->UpdatePaymentStatus ::: Error ::: {ex.Message}", ex)
        End Try
    End Sub

    Public Shared Function CheckPaytmStatus(orderId As String) As String
        Try
            Dim mid As String = ConfigurationManager.AppSettings("MID")
            Dim merchantKey As String = ConfigurationManager.AppSettings("MerchantKey")
            Dim url As String = ConfigurationManager.AppSettings("PaytmStatusApiURL")

            Dim body As New Dictionary(Of String, String)()
            Dim head As New Dictionary(Of String, String)()
            Dim requestBody As New Dictionary(Of String, Object)()

            body.Add("mid", mid)
            body.Add("orderId", orderId)

            ' Generate Checksum
            Dim paytmChecksum As String = Checksum.generateSignature(
            JsonConvert.SerializeObject(body), merchantKey)

            head.Add("signature", paytmChecksum)

            requestBody.Add("body", body)
            requestBody.Add("head", head)

            Dim post_data As String = JsonConvert.SerializeObject(requestBody)

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
            Dim webRequest As HttpWebRequest = CType(webRequest.Create(url), HttpWebRequest)

            webRequest.Method = "POST"
            webRequest.ContentType = "application/json"
            webRequest.Timeout = 30000 ' 30 seconds

            Dim byteArray As Byte() = System.Text.Encoding.UTF8.GetBytes(post_data)
            webRequest.ContentLength = byteArray.Length

            Using requestStream As Stream = webRequest.GetRequestStream()
                requestStream.Write(byteArray, 0, byteArray.Length)
            End Using

            Using response As HttpWebResponse = CType(webRequest.GetResponse(), HttpWebResponse)
                Using responseReader As New StreamReader(response.GetResponseStream())
                    Dim responseData As String = responseReader.ReadToEnd()

                    ' ✅ RETURN RESPONSE
                    Return responseData
                End Using
            End Using

        Catch ex As WebException
            ' Handle API errors
            If ex.Response IsNot Nothing Then
                Using reader As New StreamReader(ex.Response.GetResponseStream())
                    Dim errorResponse As String = reader.ReadToEnd()
                    Logger.LogError($"Paytm API Error: {errorResponse}", ex)
                    Return errorResponse
                End Using
            End If

            Logger.LogError($"Error in CheckPaytmStatus: {ex.Message}", ex)
            Return "ERROR"

        Catch ex As Exception
            Logger.LogError($"Error in CheckPaytmStatus: {ex.Message}", ex)
            Return "ERROR"
        End Try
    End Function
End Class