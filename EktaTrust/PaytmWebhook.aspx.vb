Imports System.Web
Imports System.Web.Services
Imports MySql.Data.MySqlClient
Imports Newtonsoft.Json

Public Class PaytmWebhook
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.ContentType = "text/plain"
        Try
            Logger.LogWebHookInfo("Webhook Pageload called. Res::: ", JsonConvert.SerializeObject(Request.Form.Keys))

            Dim paytmParams As New Dictionary(Of String, String)()
            Dim merchantKey As String = ConfigurationManager.AppSettings("MerchantKey")
            ' Read POST data
            For Each key As String In Request.Form.Keys
                paytmParams.Add(key, Request.Form(key))
            Next

            If paytmParams.Count = 0 Then
                Logger.LogWebHookInfo("Request form data not found from Paytm Webhook called.")
                Return
            End If
            Dim checksum As String = paytmParams("CHECKSUMHASH")
            paytmParams.Remove("CHECKSUMHASH")
            Dim orderId As String = paytmParams("ORDERID")
            Dim txnId As String = paytmParams("TXNID")
            Dim fullResponseJson As String = JsonConvert.SerializeObject(paytmParams)
            Dim paymentMode As String = paytmParams("PAYMENTMODE")
            Dim paymentFor As String = GetPaymentType(orderId)

            ' Verify Checksum
            Dim isValid As Boolean = Paytm.Checksum.verifySignature(paytmParams, merchantKey, checksum)

            If isValid Then
                If paytmParams("STATUS") = "TXN_SUCCESS" Then
                    ' ✅ Update DB → SUCCESS
                    If paymentFor.Trim().ToLower() = "donation" Then
                        PaytmCallBack.UpdateOderInDonation(orderId, "Success", txnId, fullResponseJson, paymentMode)
                        Logger.LogWebHookInfo("SUCCESS Status updated in DB for donation")
                    ElseIf paymentFor.Trim().ToLower() = "registration" Then
                        PaytmCallBack.UpdateOrderInBIB(orderId, "Success", txnId, fullResponseJson)
                        Logger.LogWebHookInfo("SUCCESS Status updated in DB for registration")
                    Else
                        Logger.LogWebHookInfo($"paymentFor not found in Donation and Registration. ORDERID:: {orderId} ::: PaytmFullResponse:::" & fullResponseJson)
                    End If
                Else
                    ' ❌ Update DB → FAILED
                    If paymentFor.Trim().ToLower() = "donation" Then
                        PaytmCallBack.UpdateOderInDonation(orderId, "Failed", txnId, fullResponseJson, paymentMode)
                        Logger.LogWebHookInfo("Failed Status updated in DB for donation")
                    ElseIf paymentFor.Trim().ToLower() = "registration" Then
                        PaytmCallBack.UpdateOrderInBIB(orderId, "Failed", txnId, fullResponseJson)
                        Logger.LogWebHookInfo("Failed Status updated in DB for registration")
                    Else
                        Logger.LogWebHookInfo($"paymentFor not found in Donation and Registration. ORDERID:: {orderId} ::: PaytmFullResponse:::" & fullResponseJson)
                    End If
                End If
                'Context.Response.Write("Checksum Matched")
            Else
                Logger.LogWebHookInfo("Checksum Mismatched in ProcessRequest, while request from paytm using Webhook.")
            End If
            ' ✅ FINAL SUCCESS RESPONSE (CRITICAL)
            WriteResponse("OK")
        Catch ex As Exception
            Logger.LogError($"Error in WebHook::ProcessRequest ::: Error ::: {ex.Message}", ex)
            Logger.LogWebHookInfo($"JSON Response from Paytm on error ::: {JsonConvert.SerializeObject(Request.Form.Keys)}")

            WriteResponse("ERROR")
        End Try
    End Sub

    ' ✅ Centralized response handler (VERY IMPORTANT)
    Private Sub WriteResponse(message As String)
        Try
            Response.StatusCode = 200
            Response.Write(message)
            Response.Flush()
            Response.End()
        Catch
            ' ignore response errors
        End Try
    End Sub

    Function GetPaymentType(orderId As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Dim query As String = "
            SELECT 'donation' AS paymentType 
            FROM donation 
            WHERE OrderId = @orderId
            UNION
            SELECT 'registration' AS paymentType 
            FROM bibdata 
            WHERE OrderId = @orderId
            LIMIT 1"

            Using cmd As New MySqlCommand(query, con)
                cmd.Parameters.AddWithValue("@orderId", orderId)

                con.Open()

                Dim result = cmd.ExecuteScalar()

                If result IsNot Nothing Then
                    Return result.ToString()
                Else
                    Return "unknown"
                End If
            End Using
        End Using
    End Function
End Class