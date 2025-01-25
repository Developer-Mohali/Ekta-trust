Imports System.IO

Public Class videoplay
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("~/Files/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If

        'Save the File to the Directory (Folder).
        FileUpload1.SaveAs(folderPath & Path.GetFileName(FileUpload1.FileName))

        'Display the success message.
        lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded."
    End Sub

End Class