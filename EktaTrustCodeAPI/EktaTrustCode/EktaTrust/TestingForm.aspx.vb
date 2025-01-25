Imports System.IO
Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.Web.Script.Serialization
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Public Class TestingForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub MIP_Registration(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim fileName As String = Path.GetFileName(FileUpload.PostedFile.FileName)
        Dim extension = Path.GetFileName(fileName)
        Dim fullName = "file" + extension
        FileUpload.PostedFile.SaveAs((Server.MapPath("~/UploadFile/") + fullName))

    End Sub
End Class