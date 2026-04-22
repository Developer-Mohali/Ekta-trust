Imports System.Configuration
Imports System.Data
Imports System.Drawing
Imports System.IO
Imports iTextSharp.xmp.impl
Imports MySql.Data.MySqlClient

Public Class UpdateUserCreativeCompetition
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("RoleId") Is Nothing Then
            Response.Redirect("/LogIn.aspx")
            Return
        End If

        ' Your existing Page_Load logic
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If

        If Not IsPostBack Then
            Dim userId As String = Request.QueryString("UserId")
            If String.IsNullOrEmpty(userId) Then
                Response.Redirect("RegistrationCreativeCompetition.aspx")
            Else
                LoadUserData(userId)
                HandleFileDeletion()
            End If
        End If
    End Sub


    Private Sub LoadUserData(userId As String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim dt As New DataTable()
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT * FROM RegistrationCreativeCompetition WHERE Id=@Id", con)
                cmd.Parameters.AddWithValue("@Id", userId)
                Using da As New MySqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
        End Using

        If dt.Rows.Count > 0 Then
            Dim row = dt.Rows(0)
            textName.Text = row("Name").ToString()
            textEmail.Text = row("EmailID").ToString()
            textMobile.Text = row("MobileNumber").ToString()
            TextAddress.Text = row("Address").ToString()

            ' Select contest
            Dim contestName As String = row("Contest").ToString()
            If drpContest.Items.FindByText(contestName) IsNot Nothing Then
                drpContest.SelectedValue = drpContest.Items.FindByText(contestName).Value
            End If

            LoadUserFiles(Convert.ToInt32(row("Id")))
        End If
    End Sub

    Private Sub LoadUserFiles(registrationId As Integer)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim dt As New DataTable()
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT Id, FileName, FileType FROM CreativeCompetitionUploads WHERE RegistrationId=@RegId ORDER BY CreatedDate DESC", con)
                cmd.Parameters.AddWithValue("@RegId", registrationId)
                Using da As New MySqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
        End Using

        If dt.Rows.Count > 0 Then
            Dim html As String = "<ul>"
            For Each row As DataRow In dt.Rows
                Dim fileName = row("FileName").ToString()
                Dim fileId = row("Id").ToString()
                html &= $"<li><a href='~/Uploads/CreativeCompetition/{fileName}' target='_blank'>{fileName}</a> ({row("FileType")}) <a href='?UserId={registrationId}&deleteFileId={fileId}' onclick='return confirm(""Are you sure?"")'>[Remove]</a></li>"
            Next
            html &= "</ul>"
            litExistingFiles.Text = html
        Else
            litExistingFiles.Text = "No files uploaded yet."
        End If
    End Sub

    Private Sub HandleFileDeletion()
        Dim deleteIdStr As String = Request.QueryString("deleteFileId")
        Dim userId As String = Request.QueryString("UserId")
        If Not String.IsNullOrEmpty(deleteIdStr) AndAlso Not String.IsNullOrEmpty(userId) Then
            Dim deleteId As Integer
            If Integer.TryParse(deleteIdStr, deleteId) Then
                DeleteFile(deleteId)
                Response.Redirect(Request.Url.AbsolutePath & "?UserId=" & userId)
            End If
        End If
    End Sub

    Private Sub DeleteFile(fileId As Integer)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                con.Open()
                Dim fileName As String = ""
                Using cmd As New MySqlCommand("SELECT FileName FROM CreativeCompetitionUploads WHERE Id=@Id", con)
                    cmd.Parameters.AddWithValue("@Id", fileId)
                    Dim obj = cmd.ExecuteScalar()
                    If obj IsNot Nothing Then fileName = obj.ToString()
                End Using

                Using cmd As New MySqlCommand("DELETE FROM CreativeCompetitionUploads WHERE Id=@Id", con)
                    cmd.Parameters.AddWithValue("@Id", fileId)
                    cmd.ExecuteNonQuery()
                End Using

                Dim path As String = Server.MapPath("~/Uploads/CreativeCompetition/" & fileName)
                If File.Exists(path) Then File.Delete(path)
            End Using
        Catch ex As Exception
            lblFileError.Visible = True
            lblFileError.Text = "Error deleting file: " & ex.Message
        End Try
    End Sub

    Protected Sub UpdateRegistration(sender As Object, e As EventArgs)
        ' 🔹 Show loader start (on backend)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowLoader", "showLoader();", True)

        lblErrorMsgMobile.Text = ""
        lblErrorMsgMobile.Visible = False
        Dim userId As String = Request.QueryString("UserId")
        If String.IsNullOrEmpty(userId) Then Exit Sub

        Try
            Using con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
                con.Open()

                Using cmdCheck As New MySqlCommand("SELECT Id FROM RegistrationCreativeCompetition WHERE MobileNumber=@Mobile AND Id<>@Id", con)
                    cmdCheck.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    cmdCheck.Parameters.AddWithValue("@Id", userId)
                    Dim exists = cmdCheck.ExecuteScalar()
                    If exists IsNot Nothing Then
                        lblErrorMsgMobile.Visible = True
                        lblErrorMsgMobile.Text = "Mobile number already registered."
                        Return
                    End If
                End Using

                Using cmd As New MySqlCommand("UPDATE RegistrationCreativeCompetition SET Name=@Name, EmailID=@Email, MobileNumber=@Mobile, Contest=@Contest, Address=@Address WHERE Id=@Id", con)
                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@Contest", drpContest.SelectedItem.Text.Trim())
                    cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim())
                    cmd.Parameters.AddWithValue("@Id", userId)
                    cmd.ExecuteNonQuery()
                End Using

                If FileUpload.HasFiles Then
                    For Each file As HttpPostedFile In FileUpload.PostedFiles
                        If file IsNot Nothing AndAlso file.ContentLength > 0 Then
                            Dim safeFileName = GetSafeFileName(file.FileName)
                            Dim ext = Path.GetExtension(safeFileName).ToLower()
                            Dim nameOnly = Path.GetFileNameWithoutExtension(safeFileName)
                            Dim fileTypeLabel As String = ""

                            Dim imageExt = {".jpg", ".jpeg", ".png", ".gif", ".bmp"}
                            Dim videoExt = {".mp4", ".mov", ".avi", ".mkv"}
                            Dim docExt = {".pdf", ".doc", ".docx", ".txt", ".xls", ".xlsx", ".ppt", ".pptx"}

                            If imageExt.Contains(ext) Then
                                fileTypeLabel = "Image"
                            ElseIf videoExt.Contains(ext) Then
                                fileTypeLabel = "Video"
                            ElseIf docExt.Contains(ext) Then
                                fileTypeLabel = "Document"
                            Else
                                fileTypeLabel = "Other"
                            End If

                            If file.ContentLength > 1024L * 1024L * 1024L Then
                                lblErrorMsgMobile.Visible = True
                                lblErrorMsgMobile.Text &= "File '" & file.FileName & "' not uploaded. Exceeds 1 GB.<br/>"
                                Continue For
                            End If

                            Dim uploadFolder = Server.MapPath("~/Uploads/CreativeCompetition/")
                            If Not Directory.Exists(uploadFolder) Then Directory.CreateDirectory(uploadFolder)

                            Dim fileName = $"{textMobile.Text}_{nameOnly}{ext}"
                            Dim filePath = Path.Combine(uploadFolder, fileName)
                            file.SaveAs(filePath)

                            Using uploadCmd As New MySqlCommand("INSERT INTO CreativeCompetitionUploads (RegistrationId, FileName, FileType, CreatedDate) VALUES (@RegId, @FileName, @FileType, NOW())", con)
                                uploadCmd.Parameters.AddWithValue("@RegId", userId)
                                uploadCmd.Parameters.AddWithValue("@FileName", fileName)
                                uploadCmd.Parameters.AddWithValue("@FileType", fileTypeLabel)
                                uploadCmd.ExecuteNonQuery()
                            End Using
                        End If
                    Next
                End If
            End Using

            lblErrorMsg.ForeColor = System.Drawing.Color.Green
            lblErrorMsg.Text = "Registration updated successfully!"
            LoadUserData(userId)
        Catch ex As Exception
            lblErrorMsg.ForeColor = System.Drawing.Color.Red
            lblErrorMsg.Text = "Error: " & ex.Message
        Finally
            ' 🔹 Hide loader after backend completes
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "hideLoader();", True)
        End Try
    End Sub

    Public Function GetSafeFileName(originalName As String) As String
        If String.IsNullOrWhiteSpace(originalName) Then
            Return String.Empty
        End If

        ' Extract filename only
        Dim fileName As String = Path.GetFileName(originalName.Trim())
        Dim nameOnly As String = Path.GetFileNameWithoutExtension(fileName)
        Dim extension As String = Path.GetExtension(fileName)

        ' Replace invalid chars + collapse multiple underscores in one go
        nameOnly = Regex.Replace(nameOnly, "[^A-Za-z0-9_]+", "_")

        ' Remove leading or trailing underscores
        nameOnly = nameOnly.Trim("_"c)

        ' Reserved Windows device names
        Dim reservedNames As String() = {
            "CON", "PRN", "AUX", "NUL",
            "COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9",
            "LPT1", "LPT2", "LPT3", "LPT4", "LPT5", "LPT6", "LPT7", "LPT8", "LPT9"
        }

        If reservedNames.Contains(nameOnly.ToUpper()) Then
            nameOnly &= "_file"
        End If

        ' Final safe file name
        Dim safeName As String = nameOnly & extension

        ' === CHECK FOR DUPLICATES ===
        Dim uploadFolderPhysical = Server.MapPath("~/Uploads/CreativeCompetition/")
        Dim counter = 1

        While File.Exists(Path.Combine(uploadFolderPhysical, safeName))
            safeName = $"{nameOnly}_{counter}{extension}"
            counter += 1
        End While

        Return safeName
    End Function

End Class
