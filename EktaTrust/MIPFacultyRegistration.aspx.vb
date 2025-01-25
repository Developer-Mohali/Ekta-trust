Imports System.IO
Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.Web.Script.Serialization
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Public Class MIPFacultyRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim masterlbl As String = Request.QueryString("ExamType")
        If masterlbl = "RPSC" Then
            divTermscondition.Visible = False
            chbCondition.Checked = True
        Else
            divTermscondition.Visible = True
        End If
    End Sub

    Protected Sub ButtonSubmitMessage_Click(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click

        Dim Statusmessages As String = String.Empty
        Dim SendEmail As SendEmail = New SendEmail()
        Dim Examtype As String = String.Empty
        If Request.QueryString("ExamType") Is Nothing Then
            Response.Redirect("MIPFacultyRegistration.aspx")
        Else
            Examtype = Request.QueryString("ExamType")
        End If
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                If chbCondition.Checked Then
                    Using result As New MySqlCommand("Select Mobile From  MIPFacultyRegistration WHERE Mobile = @Mobile and IsDeleted=0")
                        Using sda1 As New MySqlDataAdapter(result)
                            Dim Title As String = String.Empty
                            Dim emailId As String = String.Empty
                            Dim subject As String = String.Empty
                            Dim body As String = String.Empty
                            Dim bodyUser As String = String.Empty
                            Dim Name As String = String.Empty
                            Dim DocumentType As String = String.Empty
                            Dim status As String = String.Empty

                            result.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim())
                            result.Connection = con
                            Dim dt As New DataTable()
                            sda1.Fill(dt)
                            If dt.Rows.Count <= 0 Then
                                Using cmd As New MySqlCommand("InsertMIPFacultyRegistration")
                                    Using sda As New MySqlDataAdapter()
                                        cmd.CommandType = CommandType.StoredProcedure
                                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Email", txtEmail2.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Posting", txtPosting.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Occupatoin", txtOccupation.Text.Trim())
                                        cmd.Parameters.AddWithValue("@SubjectSpecialistion", txtSubSpecialistion.Text.Trim())
                                        cmd.Parameters.AddWithValue("@DateOfAvailabil", txtDate.Text.Trim())
                                        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                        cmd.Parameters.AddWithValue("@IsDeleted", False)
                                        cmd.Parameters.AddWithValue("@Examtype", Examtype)
                                        cmd.Connection = con
                                        con.Open()
                                        cmd.ExecuteNonQuery()
                                        'DocumentType = fileName
                                        Name = txtName.Text
                                        subject = "New MIP Faculty Request-" + txtName.Text
                                        body = "Hello Admin,<br/><br/>There is one new MIP Faculty Registration Request from below condidate:<br/><br/><b>Name:</b> " + Name + "<br/><b>Email Address:</b>" + txtEmail2.Text + "<br/><b>Mobile Number: </b>" + txtMobile.Text + "<br/><b>Address: </b>" + txtAddress.Text + "<br/><b>Current Posting: </b>" + txtPosting.Text + "<br/><b>Occupation: </b>" + txtOccupation.Text + "<br/><b>Date of Availability: </b>" + txtDate.Text + "<br/><b>Specialization: </b>" + txtSubSpecialistion.Text + "<br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        Dim RetValue As String = ""
                                        Dim toEmail As String = String.Empty
                                        ' Dim Data = SendEmail.sendMail(emailId, subject, body)
                                        Try
                                            If Examtype = "RPSC" Then
                                                toEmail = System.Configuration.ConfigurationManager.AppSettings("ToRPSC")
                                            Else
                                                toEmail = System.Configuration.ConfigurationManager.AppSettings("ToCC")
                                            End If

                                            ' Dim CC As String = System.Configuration.ConfigurationManager.AppSettings("ToCC")
                                            Dim mailMessage = New System.Net.Mail.MailMessage(toEmail, toEmail)
                                            ' mailMessage.Attachments.Add(New Attachment(FileUpload.PostedFile.InputStream, fullName))
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
                                        SendEmail = SmsSent("For Faculty Registration", "SMS")

                                        'This  method call SMS.
                                        If SendEmail.TemplateType = "SMS" Then

                                            ' Split string based on spaces
                                            Dim Unames As String() = Name.Split(New Char() {" "c})

                                            ' Seperate the first name from the rest of the string
                                            Dim lastName As String = Name.Substring(Unames(0).Length())

                                            bodyUser = GetMergedData(SendEmail.BodyMessage, Convert.ToString(Unames(0)), "")
                                            'This is sent SMS for user.
                                            status = SendEmail.NewBlukSms(txtMobile.Text.Trim(), bodyUser)
                                            Dim tokenJson = JsonConvert.SerializeObject(status)

                                            'Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
                                            'status = jsonResult.Values(1)
                                            SendEmail.log("ErrorStep5", status, "Faculty Registration", txtMobile.Text.Trim(), SendEmail.TemplateType, bodyUser, "", "")
                                        End If
                                        'This  method call EMAIL.
                                        SendEmail = MailSent("For Faculty Registration", "EMAIL")
                                        If SendEmail.TemplateType = "EMAIL" Then
                                            bodyUser = GetMergedData(SendEmail.BodyMessage, txtName.Text, "")
                                            'This is sent MAIL for user.
                                            status = SendEmail.sendMailUser(txtEmail2.Text, SendEmail.Subject, bodyUser)
                                            SendEmail.log("ErrorStep6", status, "Faculty Registration", txtEmail2.Text, SendEmail.TemplateType, bodyUser, status, "")
                                        End If
                                       


                                        chbCondition.Checked = False
                                        con.Close()
                                        con.Dispose()
                                        lblConditionMessage.Visible = False
                                        lblErrorMsgMobile.Visible = False
                                        lblErrorMsg.Visible = True
                                        lblErrorMsg.Text = "Submitted successfully. MIP Team will contact you shortly. Thanks !"
                                        Statusmessages = "success"
                                        SendEmail.log("ErrorStep7", Statusmessages, "EventRegister", "", "", "", "", "Name:" + txtName.Text + ",EamilId:" + txtEmail2.Text + ",MobileNo:" + txtMobile.Text + ",Address:" + txtAddress.Text + "")
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
                'SendEmail.log("ErrorStep8", ex.Message, "Faculty Registration", "", "", "", "")
                SendEmail.log("ErrorStep8", ex.Message, "EventRegister", "", "", "", "", "Name:" + txtName.Text + ",EamilId:" + txtEmail2.Text + ",MobileNo:" + txtMobile.Text + ",Address:" + txtAddress.Text + "")
            End Try


        End Using
    End Sub
    'End Sub

    Private Function GetMergedData(Message As String, UserName As String, OTP As String) As String

        Message = Replace(Message, "#UserName#", UserName)
        Message = Replace(Message, "#OTPCode#", OTP)
        Return Message

    End Function
    Public Function Reset()
        txtAddress.Text = ""
        txtDate.Text = ""
        txtEmail2.Text = ""
        txtMobile.Text = ""
        txtName.Text = ""
        txtOccupation.Text = ""
        txtPosting.Text = ""
        txtSubSpecialistion.Text = ""
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


    <System.Web.Services.WebMethod()>
    Public Shared Function OtpGenerate(ByVal OTPtype As String, EmailOrMobile As String) As String

        Dim otp As String = String.Empty
        Dim messageBody As String
        Dim status As String
        Dim SendEmail As SendEmail = New SendEmail()

        Try
            Dim alphabets As String = "1234567890"
            alphabets += Convert.ToString(alphabets)
            'Dim length As Integer = Integer.Parse("2")

            For i As Integer = 0 To 6 - 1
                Dim character As String = String.Empty
                Do
                    Dim index As Integer = New Random().Next(0, alphabets.Length)
                    character = alphabets.ToCharArray()(index).ToString()
                Loop While otp.IndexOf(character) <> -1
                otp += character
            Next

            If "Email" = OTPtype Then
                messageBody = "<p>Dear User,</p><p>Your activation code is " + otp + " for MIP Registration</p><p>on Ekta Navnirman Trust.</p><p>&nbsp;</p><p>Regards,</p><p>Administrator</p><p>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
                status = SendEmail.EventsendMailUser(EmailOrMobile, "OTP for MIP Registration on EktaTrust", messageBody)
            Else
                messageBody = "Dear User, Your activation code is " + otp + " for MIP Registration on Ekta Navnirman Trust.Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
                status = SendEmail.NewBlukSms(EmailOrMobile, messageBody)
            End If
            SendEmail.log("SendOTP", "Success", "MatrimonialRegistration", EmailOrMobile, OTPtype, status, "", "")

        Catch ex As Exception
            SendEmail.log("otpgenerate", ex.ToString, "MIPRegister", "", "", "", "", "")
        End Try
        Return otp

    End Function


End Class