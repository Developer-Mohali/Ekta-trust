Imports iTextSharp.text.pdf
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class AdminBIBData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function GetJsonData(id As String, currentStatus As String, paymentFor As String) As String
        ' fetch Paytm payment response from paytm api...
        Dim response = PaytmCallBack.CheckPaytmStatus(id)
        If Not String.IsNullOrEmpty(response) Then
            ' update payment status in DB, if its success in current response
            Try
                If Not (currentStatus.ToUpper().Contains("SUCCESS") Or currentStatus.ToUpper().Contains("FAILED") Or currentStatus.ToUpper().Contains("CANCELLED")) Then
                    Dim json = Newtonsoft.Json.Linq.JObject.Parse(response)
                    Dim status = json("body")("resultInfo")("resultStatus").ToString()
                    Dim taxId = json("body")("txnId").ToString()
                    If status = "TXN_SUCCESS" Then
                        If paymentFor.ToLower().Equals("donation") Then
                            PaytmCallBack.UpdateOderInDonation(id, "Success", taxId, response)
                        Else
                            PaytmCallBack.UpdateOrderInBIB(id, "Success", taxId, response)
                        End If
                    ElseIf status = "TXN_FAILURE" Then
                        If paymentFor.ToLower().Equals("donation") Then
                            PaytmCallBack.UpdateOderInDonation(id, "Failed", taxId, response)
                        Else
                            PaytmCallBack.UpdateOrderInBIB(id, "Failed", taxId, response)
                        End If
                    End If
                End If
            Catch ex As Exception
                Logger.LogError($"Error in GetJsonData :: OrderId :: {id} :: Error :::", ex)
            End Try
            Return response
        End If
        Return String.Empty
    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Sub UpdatePendingPaymentStatus()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Dim dt As New DataTable()
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT OrderId FROM bibdata WHERE PaymentStatus='Pending'", con)
                    Using da As New MySqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
            End Using

            If dt.Rows.Count > 0 Then
                For Each row In dt.Rows
                    GetJsonData(row("OrderId"), "Pending", "Registration")
                Next
            End If
        Catch ex As Exception
            Logger.LogError($"Error in UpdatePendingPaymentStatus :: Error :::", ex)
        End Try
    End Sub
End Class