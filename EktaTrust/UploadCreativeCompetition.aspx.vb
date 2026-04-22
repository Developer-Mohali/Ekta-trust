Imports System.Data
Imports System.IO
Imports System.Web.Services
Imports MySql.Data.MySqlClient

Public Class UploadCreativeCompetition
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    ' AJAX: Check Mobile
    <WebMethod()>
    Public Shared Function CheckMobile(mobile As String) As Object
        Dim result As New Dictionary(Of String, Object)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim cmd As New MySqlCommand("SELECT Id, Name, EmailID, MobileNumber, Contest, Address FROM RegistrationCreativeCompetition WHERE MobileNumber = @MobileNumber LIMIT 1", con)
                cmd.Parameters.AddWithValue("@MobileNumber", mobile)
                con.Open()
                Using dr As MySqlDataReader = cmd.ExecuteReader()
                    If dr.Read() Then
                        result("success") = True
                        result("Name") = dr("Name").ToString()
                        result("Email") = dr("EmailID").ToString()
                        result("Mobile") = dr("MobileNumber").ToString()
                        result("Contest") = dr("Contest").ToString()
                        result("Address") = dr("Address").ToString()
                        result("ID") = dr("Id").ToString()
                    Else
                        result("success") = False
                        result("message") = "Mobile number not found."
                    End If
                End Using
            End Using
        Catch ex As Exception
            result("success") = False
            result("message") = ex.Message
        End Try
        Return result
    End Function

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            Dim registrationId As String = hdnIDClient.Value
            Dim mobile As String = hdnMobileClient.Value
            Dim file As HttpPostedFile = FileUpload.PostedFile

            If String.IsNullOrEmpty(registrationId) Then
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "Please search and select a participant first."
                Return
            End If

            If file Is Nothing OrElse file.ContentLength = 0 Then
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "No file selected."
                Return
            End If

            Dim ext = Path.GetExtension(file.FileName).ToLower()
            Dim fileTypeLabel As String = ""

            Dim imageExt = {".jpg", ".jpeg", ".png", ".gif", ".bmp"}
            Dim videoExt = {".mp4", ".mov", ".avi", ".mkv"}
            Dim docExt = {".pdf"}

            If imageExt.Contains(ext) Then
                fileTypeLabel = "Image"
            ElseIf videoExt.Contains(ext) Then
                fileTypeLabel = "Video"
            ElseIf docExt.Contains(ext) Then
                fileTypeLabel = "Document"
            Else
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "Invalid file type. Allowed: PDF, images, videos."
                Return
            End If

            Dim maxSize As Long = 1024L * 1024L * 1024L
            If file.ContentLength > maxSize Then
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "File exceeds 1 GB."
                Return
            End If

            Dim uploadFolder = Server.MapPath("~/Uploads/CreativeCompetition/")
            If Not Directory.Exists(uploadFolder) Then Directory.CreateDirectory(uploadFolder)

            Dim fileName = $"{mobile}_{DateTime.Now:yyyyMMddHHmmss}{ext}"
            Dim filePath = Path.Combine(uploadFolder, fileName)
            file.SaveAs(filePath)

            ' Save DB entry
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim query As String = "INSERT INTO CreativeCompetitionUploads (RegistrationId, FileName, FileType) VALUES (@RegId, @FileName, @FileType)"
                Using cmd As New MySqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@RegId", registrationId)
                    cmd.Parameters.AddWithValue("@FileName", fileName)
                    cmd.Parameters.AddWithValue("@FileType", fileTypeLabel)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            lblMessage.ForeColor = Drawing.Color.Green
            lblMessage.Text = "File uploaded successfully!"
        Catch ex As Exception
            lblMessage.ForeColor = Drawing.Color.Red
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub

End Class
