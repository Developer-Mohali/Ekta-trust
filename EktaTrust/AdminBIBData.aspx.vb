Imports iTextSharp.text.pdf
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class AdminBIBData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function GetJsonData(id As String) As String
        ' fetch Paytm payment response from paytm api...
        Dim response = PaytmCallBack.CheckPaytmStatus(id)
        If Not String.IsNullOrEmpty(response) Then
            Return response
        End If
        ' Fetch JSON from DB
        Dim jsonData As String = ""
        Dim connStr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(connStr)
            Using cmd As New MySqlCommand("SELECT PaytmResponse FROM bibdata WHERE OrderId=@Id", con)
                cmd.Parameters.AddWithValue("@Id", id)

                con.Open()
                Dim result = cmd.ExecuteScalar()

                If result IsNot Nothing Then
                    jsonData = result.ToString()
                End If
            End Using
        End Using

        Return jsonData

    End Function
End Class