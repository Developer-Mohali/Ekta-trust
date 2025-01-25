Imports System.IO
Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.Web.Script.Serialization
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Public Class MIPRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim masterlbl As String = Request.QueryString("ExamType")
        If masterlbl = "RPSC" Then
            lblTitle.Text = "THE RAJASTHAN STATE & SUBORDINATE SERVICES COMBINED COMPETITIVE (MAINS) EXAMINATION, 2018."
            divTermscondition.Visible = False
            chbCondition.Checked = True
        Else
            lblTitle.Text = "MOCK INTERVIEW PROGRAMME (MIP) - Registration for 2018"
            divTermscondition.Visible = True
        End If

        If Not Page.IsPostBack Then
        End If
    End Sub

    Protected Sub MIP_Registration(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim SendEmail As SendEmail = New SendEmail()
        Dim Statusmessages = String.Empty
        Dim Examtype As String = String.Empty
        Dim masterlbl As String = Request.QueryString("ExamType")
        If masterlbl Is Nothing Then
            Response.Redirect("MIPRegistration.aspx")
        Else
            Examtype = Request.QueryString("ExamType")
        End If
        Using con As New MySqlConnection(constr)
            Try
                If chbCondition.Checked Then
                    Using result As New MySqlCommand("Select Mobile From MIPRegistration WHERE Mobile = @MobileNumber and IsDeleted=0")
                        Using sda1 As New MySqlDataAdapter(result)

                            Dim fileName As String = Path.GetFileName(FileUpload.PostedFile.FileName)
                            Dim extension = Path.GetFileName(fileName)
                            Dim fullName = textName.Text + extension
                            FileUpload.PostedFile.SaveAs((Server.MapPath("~/UploadFile/") + fullName))
                            Dim emailId As String = String.Empty
                            Dim subject As String = String.Empty
                            Dim body As String = String.Empty
                            Dim bodyUser As String = String.Empty
                            Dim Name As String = String.Empty
                            Dim DocumentType As String = String.Empty
                            Dim Title As String = String.Empty
                            Dim status As String = String.Empty

                            result.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                            result.Connection = con
                            Dim dt As New DataTable()
                            sda1.Fill(dt)
                            If dt.Rows.Count <= 0 Then

                                Using cmd As New MySqlCommand("InsertMIPRegistration")
                                    Using sda As New MySqlDataAdapter()
                                        cmd.CommandType = CommandType.StoredProcedure
                                        cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                                        cmd.Parameters.AddWithValue("@RollNo", RollNo.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim())
                                        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                        cmd.Parameters.AddWithValue("@UploadFile", fullName)
                                        cmd.Parameters.AddWithValue("@ExamType", Examtype)
                                        cmd.Parameters.AddWithValue("@IsDeleted", False)
                                        cmd.Connection = con
                                        con.Open()
                                        DocumentType = fileName
                                        Name = textName.Text
                                        cmd.ExecuteNonQuery()

                                        subject = "New MIP Request-" + textName.Text + "-" + RollNo.Text + ""
                                        body = "Hello Admin,<br/><br/>There is one new MIP Registration Request from below condidate:<br/><br/><b>Name:</b> " + Name + "<br/><b>Roll No:</b>" + RollNo.Text + "<br/><b>Email Address:</b> " + textEmail.Text + "<br/><b>Mobile Number: </b>" + textMobile.Text + "<br/><b>Address: </b>" + TextAddress.Text + "<br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."

                                        Dim toEmail As String = String.Empty
                                        Dim RetValue As String = ""
                                        'Dim fromEmailAddress As String = "mails@rezinfo.co.in"
                                        Try
                                            If masterlbl = "RPSC" Then
                                                toEmail = System.Configuration.ConfigurationManager.AppSettings("ToRPSC")
                                            Else
                                                toEmail = System.Configuration.ConfigurationManager.AppSettings("ToUPSC")
                                            End If

                                            ' Dim CC As String = System.Configuration.ConfigurationManager.AppSettings("ToCC")
                                            Dim mailMessage = New System.Net.Mail.MailMessage(toEmail, toEmail)
                                            mailMessage.Attachments.Add(New Attachment(FileUpload.PostedFile.InputStream, fullName))
                                            'mailMessage.Bcc.Add(New MailAddress(CC))
                                            mailMessage.Subject = subject
                                            mailMessage.Body = body
                                            mailMessage.IsBodyHtml = True
                                            mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
                                            Dim smtpClient = New SmtpClient()
                                            smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
                                            'smtpClient.EnableSsl = true
                                            smtpClient.Send(mailMessage)
                                        Catch ex As Exception
                                            'RetValue =  ex.Message;

                                        End Try


                                        SendEmail = SmsSent("For MIP Registration", "SMS")

                                        'This  method call SMS.
                                        If SendEmail.TemplateType = "SMS" Then

                                            ' Split string based on spaces
                                            Dim Unames As String() = textName.Text.Trim().Split(New Char() {" "c})
                                            ' Seperate the first name from the rest of the string
                                            Dim lastName As String = textName.Text.Trim().Substring(Unames(0).Length())
                                            bodyUser = GetMergedData(SendEmail.BodyMessage, Convert.ToString(Unames(0)), "")
                                            'This is sent SMS for user.
                                            status = SendEmail.NewBlukSms(textMobile.Text.Trim(), bodyUser)
                                            Dim tokenJson = JsonConvert.SerializeObject(status)

                                            'Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
                                            'status = jsonResult.Values(1)
                                            SendEmail.log("ErrorStep9", status, "MIPRegistration", textMobile.Text.Trim(), SendEmail.TemplateType, bodyUser, "", "")
                                        End If
                                        'This  method call EMAIL.
                                        SendEmail = MailSent("For MIP Registration", "EMAIL")
                                        If SendEmail.TemplateType = "EMAIL" Then
                                            bodyUser = GetMergedData(SendEmail.BodyMessage, textName.Text.Trim(), "")
                                            'This is sent MAIL for user.
                                            status = SendEmail.sendMailUser(textEmail.Text.Trim(), SendEmail.Subject, bodyUser)
                                            SendEmail.log("ErrorStep10", status, "MIPFacultyRegistration", textEmail.Text.Trim(), SendEmail.TemplateType, bodyUser, status, "")
                                        End If


                                        chbCondition.Checked = False
                                        con.Close()
                                        con.Dispose()
                                        lblConditionMessage.Visible = False
                                        lblErrorMsg.Visible = True
                                        lblErrorMsgMobile.Visible = False
                                        Statusmessages = "Success"
                                        lblErrorMsg.Text = "Submitted successfully. MIP Team will contact you shortly. Thanks !"
                                        'SendEmail.log("ErrorStep11", Statusmessages, "MIPFacultyRegistration", "", "", "", "", "")
                                        SendEmail.log("ErrorStep11", Statusmessages, "EventRegister", "", "", "", "", "Name:" + Name + ",EamilId:" + emailId + ",MobileNo:" + textMobile.Text + ",Address:" + TextAddress.Text + "")
                                        Reset()
                                    End Using
                                End Using
                            Else
                                lblErrorMsg.Visible = False
                                lblConditionMessage.Visible = False
                                lblErrorMsgMobile.Visible = True
                                lblErrorMsgMobile.Text = "You are already registered with this number. Thanks !"
                            End If
                        End Using
                    End Using
                Else
                    lblErrorMsgMobile.Visible = False
                    lblConditionMessage.Visible = True
                    lblErrorMsg.Visible = False
                    lblConditionMessage.Text = "Please Check Terms and conditions"
                End If
            Catch ex As Exception
                Statusmessages = "Error"
                SendEmail.log("ErrorStep12", Statusmessages, "EventRegister", "", "", "", "", "Name:" + textName.Text + ",EamilId:" + textEmail.Text + ",MobileNo:" + textMobile.Text + ",Address:" + TextAddress.Text + "")
                ' SendEmail.log("ErrorStep12", ex.Message, "MIPFacultyRegistration", "", "", "", "", "")
            End Try

        End Using

    End Sub

    Private Function GetMergedData(Message As String, UserName As String, OTP As String) As String

        Message = Replace(Message, "#UserName#", UserName)
        Message = Replace(Message, "#OTPCode#", OTP)
        Return Message

    End Function
    Public Function Reset()
        textName.Text = ""
        textEmail.Text = ""
        textMobile.Text = ""
        RollNo.Text = ""
        TextAddress.Text = ""
    End Function

    'This method use to get data from Template for SMS.
    Private Function SmsSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then

            If getTamplate.Tables.Count > 0 Then

                If getTamplate.Tables(0).Rows.Count > 0 Then

                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
                End If
            End If

        End If
        Return SendEmail

    End Function
    'This method use to get data from Template for EMAIL.
    Private Function MailSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then

            If getTamplate.Tables.Count > 0 Then

                If getTamplate.Tables(0).Rows.Count > 0 Then

                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.Subject = getTamplate.Tables(0).Rows(0)("Title")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
                End If
            End If

        End If
        Return SendEmail

    End Function
End Class