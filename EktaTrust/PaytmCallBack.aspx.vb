Imports MySql.Data.MySqlClient
Imports Newtonsoft.Json

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

                If status = "TXN_SUCCESS" Then

                    ' ✅ Update DB → SUCCESS
                    If PaymentFrom = "Donation" Then
                        UpdateOderInDonation(orderId, "Success", txnId, fullResponseJson)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=success&orderId=" & orderId & "&type=donation", False)
                    Else
                        UpdateOrderInBIB(orderId, "Success", txnId, fullResponseJson)
                        Response.Redirect("PaytmPaymentResponse.aspx?status=success&orderId=" & orderId & "&type=registration", False)
                    End If

                    Context.ApplicationInstance.CompleteRequest()
                Else

                    ' ❌ Update DB → FAILED
                    If PaymentFrom = "Donation" Then
                        UpdateOderInDonation(orderId, "Failed", txnId, fullResponseJson)
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


    Private Sub UpdateOrderInBIB(orderId As String, status As String, txnId As String, apiResponse As String)
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

    Private Sub UpdateOderInDonation(orderId As String, status As String, txnId As String, apiResponse As String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim paymentMode As String = Request.Form("PAYMENTMODE")
        Try
            Using con As New MySqlConnection(constr)
                Dim Query As String = "UPDATE donation SET PaymentStatus=@paymentStatus, PaytmResponse= @paytmResponse, TxnId = @txnId, ModeOfPayment = @ModeOfPayment
                                    WHERE OrderId=@orderId"

                Using cmd As New MySqlCommand(Query, con)
                    cmd.Parameters.AddWithValue("@paymentStatus", status)
                    cmd.Parameters.AddWithValue("@paytmResponse", apiResponse)
                    cmd.Parameters.AddWithValue("@txnId", txnId)
                    cmd.Parameters.AddWithValue("@orderId", orderId)
                    cmd.Parameters.AddWithValue("@ModeOfPayment", paymentMode)

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
End Class