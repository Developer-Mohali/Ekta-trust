Imports MySql.Data.MySqlClient
Imports Newtonsoft.Json

Public Class PaytmCallBack
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' 🔴 Handle Paytm POST callback
        If Request.HttpMethod = "POST" AndAlso Not String.IsNullOrEmpty(Request.Form("ORDERID")) Then

            HandlePaytmCallback()

        End If

        ' ✅ Handle redirect message (clean UX)
        If Not IsPostBack Then
            Dim status As String = Request.QueryString("status")

            If status = "success" Then
                ' ShowMessage("Payment Successful!", True)
            ElseIf status = "failed" Then
                ' ShowMessage("Payment Failed!", False)
            End If
        End If
    End Sub

    Private Sub HandlePaytmCallback()

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

                ' 🔴 IMPORTANT: Prevent duplicate processing
                'If IsOrderAlreadyProcessed(orderId) Then Exit Sub

                If status = "TXN_SUCCESS" Then

                    ' ✅ Update DB → SUCCESS
                    UpdateOrder(orderId, "Success", txnId, fullResponseJson)

                    ' Redirect to avoid resubmission
                    Response.Redirect("PaytmPaymentResponse.aspx?status=success&orderId=" & orderId)

                Else

                    ' ❌ Update DB → FAILED
                    UpdateOrder(orderId, "Failed", txnId, fullResponseJson)

                    Response.Redirect("PaytmPaymentResponse.aspx?status=failed&orderId=" & orderId)

                End If

            Else
                'ShowMessage("Checksum mismatch", False)
            End If

        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->HandlePaytmCallback ::: Error ::: {ex.Message}", ex)
        End Try

    End Sub


    Private Sub UpdateOrder(orderId As String, status As String, txnId As String, apiResponse As String)

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
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            Logger.LogError($"Error in PaytmCallBack->UpdateOrder ::: Error ::: {ex.Message}", ex)
        End Try
    End Sub
End Class