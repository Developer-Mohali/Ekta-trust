Imports System.IO
Imports MySql.Data.MySqlClient


Public Class RegistrationCreativeCompetition
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ' Get the DDLId from query string
            Dim ddlId As String = Request.QueryString("DDLId")

            If Not String.IsNullOrEmpty(ddlId) Then
                ' Check if the dropdown has that value
                If drpContest.Items.FindByValue(ddlId) IsNot Nothing Then
                    drpContest.SelectedValue = ddlId
                End If
            Else
                drpContest.SelectedValue = 1
            End If
            chbCondition.Checked = True

        End If
    End Sub

    'Protected Sub Insert_Contest_Registration(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
    '    If Not chbCondition.Checked Then
    '        ' Show condition message and exit early
    '        lblErrorMsgMobile.Visible = False
    '        lblConditionMessage.Visible = True
    '        lblErrorMsg.Visible = False
    '        lblConditionMessage.Text = "Please Check Terms and conditions"
    '        Return
    '    End If
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New MySqlConnection(constr)
    '        Using result As New MySqlCommand("Select MobileNumber From RegistrationCreativeCompetition WHERE MobileNumber = @MobileNumber")
    '            Using sda1 As New MySqlDataAdapter(result)

    '                Dim emailId As String = String.Empty
    '                Dim subject As String = String.Empty
    '                Dim body As String = String.Empty
    '                Dim bodyUser As String = String.Empty
    '                Dim Name As String = String.Empty
    '                Dim DocumentType As String = String.Empty

    '                result.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
    '                result.Connection = con
    '                Dim dt As New DataTable()
    '                sda1.Fill(dt)
    '                If dt.Rows.Count <= 0 Then

    '                    Using cmd As New MySqlCommand("INSERT INTO RegistrationCreativeCompetition (Name, EmailID, MobileNumber, Contest, Address, CreateDate) VALUES (@Name, @EmailID, @MobileNumber, @Contest, @Address, @CreateDate)", con)
    '                        Using sda As New MySqlDataAdapter()
    '                            cmd.CommandType = CommandType.Text
    '                            cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
    '                            cmd.Parameters.AddWithValue("@EmailID", textEmail.Text.Trim())
    '                            cmd.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
    '                            cmd.Parameters.AddWithValue("@Contest", drpContest.SelectedItem.Text.Trim())
    '                            cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim())
    '                            cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
    '                            Name = textName.Text
    '                            subject = "New Contest Request-" + textName.Text + ""
    '                            body = "Hello Admin,<br/><br/>There is one new Contest Registration Request from below member:<br/><br/><b>Name:</b> " + Name + "<br/><b>Eamil Address:</b> " + textEmail.Text + "<br/><b>Mobile Number:</b> " + textMobile.Text + "<br/><b>Contest: </b>" + drpContest.SelectedItem.Text + "<br/><b>Address: </b>" + TextAddress.Text + "<br/><br/>Please click here to <a href='http://ektatrust.org.in/Login' >signIn</a><br/><br/><br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
    '                            Dim objSendEmail As SendEmail = New SendEmail()
    '                            objSendEmail.sendMail(emailId, subject, body)
    '                            bodyUser = "Hello " + Name + ",<br/><br/>Thanks for you Contest Registration Request with Ekta Navnirman Trust.<br/>Our team will contact you very soon.<br/><br/><br/><br/><br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
    '                            'This method Call For UserSend mail,
    '                            emailId = textEmail.Text
    '                            objSendEmail.sendMailUser(emailId, subject, bodyUser)
    '                            cmd.Connection = con
    '                            con.Open()
    '                            cmd.ExecuteNonQuery()
    '                            textName.Text = ""
    '                            textEmail.Text = ""
    '                            textMobile.Text = ""
    '                            drpContest.Text = ""
    '                            TextAddress.Text = ""
    '                            chbCondition.Checked = False
    '                            con.Close()
    '                            con.Dispose()
    '                            lblConditionMessage.Visible = False
    '                            lblErrorMsg.Visible = True
    '                            lblErrorMsgMobile.Visible = False
    '                            lblErrorMsg.Text = "Submitted successfully. Our Team will contact you shortly. Thanks !"
    '                        End Using
    '                    End Using
    '                Else
    '                    lblErrorMsg.Visible = False
    '                    lblConditionMessage.Visible = False
    '                    lblErrorMsgMobile.Visible = True
    '                    lblErrorMsgMobile.Text = "You are already registered with this number. Thanks !"
    '                End If
    '            End Using
    '        End Using
    '    End Using
    'End Sub

    Protected Sub Insert_Contest_Registration(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        If Not chbCondition.Checked Then
            lblErrorMsgMobile.Visible = False
            lblConditionMessage.Visible = True
            lblErrorMsg.Visible = False
            lblConditionMessage.Text = "Please Check Terms and Conditions"
            Return
        End If
        ' 🔹 Show loader start (on backend)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowLoader", "showLoader();", True)
        Dim con As MySqlConnection = Nothing

        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            con = New MySqlConnection(constr)

            ' Check for duplicate mobile number
            Using result As New MySqlCommand("SELECT MobileNumber FROM RegistrationCreativeCompetition WHERE MobileNumber = @MobileNumber", con)
                result.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                Dim dt As New DataTable()

                Using sda1 As New MySqlDataAdapter(result)
                    sda1.Fill(dt)
                End Using

                If dt.Rows.Count <= 0 Then
                    ' Insert into main registration table
                    Using cmd As New MySqlCommand("INSERT INTO RegistrationCreativeCompetition (Name, EmailID, MobileNumber, Contest, Address, CreateDate) VALUES (@Name, @EmailID, @MobileNumber, @Contest, @Address, @CreateDate)", con)
                        cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                        cmd.Parameters.AddWithValue("@EmailID", textEmail.Text.Trim())
                        cmd.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                        cmd.Parameters.AddWithValue("@Contest", drpContest.SelectedItem.Text.Trim())
                        cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim())
                        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)

                        con.Open()
                        cmd.ExecuteNonQuery()

                        ' Get Registration ID
                        Dim regIdCmd As New MySqlCommand("SELECT LAST_INSERT_ID();", con)
                        Dim registrationId As Integer = Convert.ToInt32(regIdCmd.ExecuteScalar())

                        ' Send Emails
                        Dim Name As String = textName.Text
                        Dim emailId As String = textEmail.Text
                        Dim subject As String = "New Contest Request - " + Name
                        Dim body As String = $"Hello Admin,<br/><br/>There is one new Contest Registration Request:<br/><b>Name:</b> {Name}<br/><b>Email:</b> {emailId}<br/><b>Mobile:</b> {textMobile.Text}<br/><b>Contest:</b> {drpContest.SelectedItem.Text}<br/><b>Address:</b> {TextAddress.Text}<br/><br/>Please <a href='http://ektatrust.org.in/Login'>Sign In</a><br/><br/><b>Thanks</b>,<br/>Ekta Navnirman Trust"

                        Dim objSendEmail As New SendEmail()
                        objSendEmail.sendMail("", subject, body)

                        Dim bodyUser As String = $"Hello {Name},<br/><br/>Thanks for your Contest Registration with Ekta Navnirman Trust. We will contact you soon.<br/><br/><b>Thanks</b>,<br/>Ekta Navnirman Trust"
                        objSendEmail.sendMailUser(emailId, subject, bodyUser)

                        ' ✅ File Upload Section
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

                                    ' Save file
                                    Dim uploadFolder = Server.MapPath("~/Uploads/CreativeCompetition/")
                                    If Not Directory.Exists(uploadFolder) Then Directory.CreateDirectory(uploadFolder)

                                    Dim fileName = $"{textMobile.Text}_{nameOnly}{ext}"
                                    Dim filePath = Path.Combine(uploadFolder, fileName)
                                    file.SaveAs(filePath)

                                    ' Insert into database
                                    Using uploadCmd As New MySqlCommand("INSERT INTO CreativeCompetitionUploads (RegistrationId, FileName, FileType, CreatedDate) VALUES (@RegId, @FileName, @FileType, NOW())", con)
                                        uploadCmd.Parameters.AddWithValue("@RegId", registrationId)
                                        uploadCmd.Parameters.AddWithValue("@FileName", fileName)
                                        uploadCmd.Parameters.AddWithValue("@FileType", fileTypeLabel)
                                        uploadCmd.ExecuteNonQuery()
                                    End Using
                                End If
                            Next
                        End If

                        ' Clear Form
                        textName.Text = ""
                        textEmail.Text = ""
                        textMobile.Text = ""
                        drpContest.SelectedIndex = 1
                        TextAddress.Text = ""
                        chbCondition.Checked = False

                        lblConditionMessage.Visible = False
                        lblErrorMsg.Visible = True
                        lblErrorMsgMobile.Visible = False
                        lblErrorMsg.Text = "Submitted successfully. Our Team will contact you shortly. Thanks!"
                    End Using
                Else
                    lblErrorMsg.Visible = False
                    lblConditionMessage.Visible = False
                    lblErrorMsgMobile.Visible = True
                    lblErrorMsgMobile.Text = "You are already registered with this number. Thanks!"
                End If
            End Using
        Catch ex As Exception
            lblErrorMsg.Visible = False
            lblErrorMsgMobile.Visible = True
            lblErrorMsgMobile.Text = "An error occurred: " & ex.Message
        Finally
            If con IsNot Nothing AndAlso con.State = ConnectionState.Open Then
                con.Close()
            End If
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