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
                    If status = "TXN_SUCCESS" Then
                        PaytmCallBack.UpdatePaymentStatus(id, "Success", response, paymentFor.ToLower().Equals("donation"))
                    ElseIf status = "TXN_FAILURE" Then
                        PaytmCallBack.UpdatePaymentStatus(id, "Failed", response, paymentFor.ToLower().Equals("donation"))
                    End If
                End If
            Catch ex As Exception

            End Try
            Return response
        End If
        Return String.Empty
    End Function
End Class