Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports MySql.Data.MySqlClient

Public Class SendEmail

    Public Shared Function sendMail(Messageto As String, subject As String, body As String) As String

        Dim RetValue As String = ""
        'Dim fromEmailAddress As String = "mails@rezinfo.co.in"
        Try
            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim mail As MailMessage = New MailMessage()
            mail.From = New MailAddress(fromMail)
            mail.[To].Add(fromMail)
            mail.Subject = subject
            mail.Body = body
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)
            'Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            'Dim mailMessage = New System.Net.Mail.MailMessage(fromMail, fromMail)
            ''mailMessage.Bcc.Add(New MailAddress(cc))
            'mailMessage.Subject = subject
            'mailMessage.Body = body
            'mailMessage.IsBodyHtml = True
            'mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            'Dim smtpClient = New SmtpClient()
            'smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))

            '' smtpClient.EnableSsl = true;

            'smtpClient.Send(mailMessage)
        Catch ex As Exception
            log("ErrorStep1", ex.Message, "sendMail", "", "", "", "", "")
            'RetValue =  ex.Message;
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function

    'Event Registration mail
    Public Shared Function EventRegistrationSendMail(Messageto As String, subject As String, body As String) As String

        Dim RetValue As String = ""
        'Dim fromEmailAddress As String = "mails@rezinfo.co.in"
        Try
            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            Dim mail As MailMessage = New MailMessage()
            mail.From = New MailAddress(fromMail)
            mail.[To].Add(toEmail)
            mail.Subject = subject
            mail.Body = body
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)


            'Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            '' Dim adminTo As String = System.Configuration.ConfigurationManager.AppSettings("ToCC")
            'Dim mailMessage = New System.Net.Mail.MailMessage(toEmail, toEmail)
            ''mailMessage.Bcc.Add(New MailAddress(cc))
            'mailMessage.Subject = subject
            'mailMessage.Body = body
            'mailMessage.IsBodyHtml = True
            'mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            'Dim smtpClient = New SmtpClient()
            'smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
            '' smtpClient.EnableSsl = true;

            'smtpClient.Send(mailMessage)
        Catch ex As Exception
            log("ErrorStep1", ex.Message, "EventRegistrationSendMail", "", "", "", "", "")
            'RetValue =  ex.Message;
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function
    'Event user Registration mail send

    Public Shared Function EventsendMailUser(Messageto As String, subject As String, body As String) As String

        Dim RetValue As String = ""
        Try

            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            Dim mail As MailMessage = New MailMessage()
            mail.From = New MailAddress(toEmail)
            mail.[To].Add(Messageto)
            mail.Subject = subject
            mail.Body = body
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)
            'Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            ''Dim AdminFrom As String = System.Configuration.ConfigurationManager.AppSettings("ToCC")
            'Dim mailMessage = New System.Net.Mail.MailMessage(toEmail, Messageto)
            'mailMessage.Bcc.Add(New MailAddress(cc))
            'mailMessage.Subject = subject
            'mailMessage.Body = body
            'mailMessage.IsBodyHtml = True
            'mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            'Dim smtpClient = New SmtpClient()
            'smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
            '' smtpClient.EnableSsl = true

            'smtpClient.Send(mailMessage)
        Catch ex As Exception
            log("ErrorStep1", ex.Message, "EventsendMailUser", "", "", "", "", "")
            'RetValue =  ex.Message;
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function


    'This function used to send sms.
    Public Function NewBlukSms(ByVal mobileNumber As String, ByVal mobileMessage As String) As String

        'Dim uname As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")

        '"baf4708ad9cc41937d817fe3071dfff319fa418b"
        Dim pass As String = System.Configuration.ConfigurationManager.AppSettings("pass")
        Dim uname As String = System.Configuration.ConfigurationManager.AppSettings("userName")
        Dim numbers = mobileNumber
        Dim message = mobileMessage
        Dim strPost
        Dim priority As String = System.Configuration.ConfigurationManager.AppSettings("priority")
        Dim stype As String = System.Configuration.ConfigurationManager.AppSettings("stype")
        Dim sender As String = System.Configuration.ConfigurationManager.AppSettings("senderName")
        'Dim sender As String = System.Configuration.ConfigurationManager.AppSettings("Sender")
        Dim url As String = "http://bhashsms.com/api/sendmsg.php?"
        'Dim sender = "EKTA-T"
        'Dim uname = "ektanavnirmantrust@gmail.com"
        'Dim hash = "baf4708ad9cc41937d817fe3071dfff319fa418b"
        strPost = url + "user=" + uname _
        + "&pass=" + pass _
        + "&sender=" + sender _
        + "&phone=" + mobileNumber _
        + "&text=" + WebUtility.UrlEncode(message) _
        + "&priority=" + priority _
        + "&stype=" + stype


        Dim request As WebRequest = WebRequest.Create(strPost)
        request.Method = "POST"
        Dim byteArray As Byte() = Encoding.UTF8.GetBytes(strPost)
        request.ContentType = "application/x-www-form-urlencoded"
        request.ContentLength = byteArray.Length
        Dim dataStream As Stream = request.GetRequestStream()
        dataStream.Write(byteArray, 0, byteArray.Length)
        dataStream.Close()

        Dim response As WebResponse = request.GetResponse()
        dataStream = response.GetResponseStream()
        Dim reader As New StreamReader(dataStream)
        Dim responseFromServer As String = reader.ReadToEnd()

        reader.Close()
        dataStream.Close()
        response.Close()

        If responseFromServer.Length > 0 Then
            Return responseFromServer
        Else
            Return CType(response, HttpWebResponse).StatusDescription
        End If
        Return responseFromServer
    End Function



    'This function used to send sms.
    Public Function sendSMS(ByVal mobileNumber As String, ByVal mobileMessage As String) As String

        Dim uname As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
        '"baf4708ad9cc41937d817fe3071dfff319fa418b"
        Dim hash As String = System.Configuration.ConfigurationManager.AppSettings("ApiKey")
        Dim numbers = mobileNumber
        Dim message = mobileMessage
        Dim strPost As String
        Dim sender As String = System.Configuration.ConfigurationManager.AppSettings("Sender")
        Dim url As String = "http://api.textlocal.in/send/?"
        'Dim sender = "EKTA-T"
        'Dim uname = "ektanavnirmantrust@gmail.com"
        'Dim hash = "baf4708ad9cc41937d817fe3071dfff319fa418b"
        strPost = url + "username=" + uname _
        + "&hash=" + hash _
        + "&numbers=" + numbers _
        + "&message=" + WebUtility.UrlEncode(message) _
       + "&sender=" + sender

        Dim request As WebRequest = WebRequest.Create(strPost)
        request.Method = "POST"
        Dim byteArray As Byte() = Encoding.UTF8.GetBytes(strPost)
        request.ContentType = "application/x-www-form-urlencoded"
        request.ContentLength = byteArray.Length
        Dim dataStream As Stream = request.GetRequestStream()
        dataStream.Write(byteArray, 0, byteArray.Length)
        dataStream.Close()

        Dim response As WebResponse = request.GetResponse()
        dataStream = response.GetResponseStream()
        Dim reader As New StreamReader(dataStream)
        Dim responseFromServer As String = reader.ReadToEnd()

        reader.Close()
        dataStream.Close()
        response.Close()

        If responseFromServer.Length > 0 Then
            Return responseFromServer
        Else
            Return CType(response, HttpWebResponse).StatusDescription
        End If
        Return responseFromServer
    End Function


    Public Subject As String
    Public BodyMessage As String
    Public TemplateType As String
    Public Property Id() As String
    Public Property Name() As String
    Public Property EamilID() As String
    Public Property MobileNumber() As String
    Public Property Address() As String
    Public Property MobileMessage() As String
    Public Property EmailMessage() As String
    Public Property EmailType() As String
    Public Property MobileType() As String
    Public Property SendMessageTo() As String
    Public Property SuccessfullMessage() As String
    Public Property Message() As String
    Public Property Category() As String
    Public Property Title() As String

    Public Shared Function TemplateSetMessage(ByVal category As String, ByVal templatetype As String) As DataSet
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim templates As DataSet = New DataSet
        Using con As New MySqlConnection(constr)
            Dim GetData As New List(Of SendEmail)()
            Using cmd As New MySqlCommand("Select * from Template WHERE Category=@Category and TemplateType=@TemplateType")
                cmd.Parameters.AddWithValue("@Category", category)
                cmd.Parameters.AddWithValue("@TemplateType", templatetype)
                cmd.Connection = con
                con.Open()
                Dim adapter As MySqlDataAdapter = New MySqlDataAdapter(cmd)

                adapter.Fill(templates, "templates")
            End Using
        End Using
        Return templates

    End Function



    Public Shared Function log(ByVal ErrorStep As String, FailureMessage As String, MethodName As String, SmsMobileNumber As String, SmsType As String, SmsMessage As String, SmsStatus As String, UserDescription As String) As String


        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Insertlog")
                Using sda As New MySqlDataAdapter()

                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@PageUrl", HttpContext.Current.Request.Url.AbsoluteUri)
                    cmd.Parameters.AddWithValue("@ErrorStep", ErrorStep.Trim())
                    cmd.Parameters.AddWithValue("@FailureMessage", FailureMessage.Trim())
                    cmd.Parameters.AddWithValue("@MethodName", MethodName.Trim())
                    cmd.Parameters.AddWithValue("@IPAddress", GetIPAddress())
                    cmd.Parameters.AddWithValue("@BrowserName", HttpContext.Current.Request.Browser.Browser)
                    cmd.Parameters.AddWithValue("@BrowserVersion", HttpContext.Current.Request.Browser.Version)
                    cmd.Parameters.AddWithValue("@MobileDeviceName", HttpContext.Current.Request.Browser.MobileDeviceModel)
                    cmd.Parameters.AddWithValue("@MobileDevice", HttpContext.Current.Request.Browser.IsMobileDevice)
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                    cmd.Parameters.AddWithValue("@IsDeleted", False)
                    cmd.Parameters.AddWithValue("@SmsMobileNumber", SmsMobileNumber)
                    cmd.Parameters.AddWithValue("@SmsType", SmsType)
                    cmd.Parameters.AddWithValue("@SmsMessage", SmsMessage)
                    cmd.Parameters.AddWithValue("@SmsStatus", SmsStatus)
                    cmd.Parameters.AddWithValue("@UserDescription", UserDescription)
                    cmd.Connection = con
                    con.Open()
                    Try
                        cmd.ExecuteNonQuery()
                        con.Close()
                        con.Dispose()
                    Catch ex As Exception

                    End Try
                End Using
            End Using
        End Using
        Return vbNull
    End Function


    Public Shared Function GetIPAddress() As String
        Dim ipAddress As String = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If String.IsNullOrEmpty(ipAddress) Then
            ipAddress = HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        End If
        Return ipAddress
    End Function
    'Registration mail send

    Public Shared Function sendMailUser(Messageto As String, subject As String, body As String) As String

        'Dim RetValue As String = ""
        'Try
        '    'Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
        '    Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
        '    'Dim mailMessage = New System.Net.Mail.MailMessage(fromMail, Messageto)
        '    Dim mailMessage = New System.Net.Mail.MailMessage
        '    mailMessage.From = New MailAddress(fromMail)
        '    mailMessage.Bcc.Add(Messageto)
        '    mailMessage.Subject = subject
        '    mailMessage.Body = body
        '    mailMessage.IsBodyHtml = True
        '    mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
        '    Dim smtpClient = New SmtpClient()
        '    smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
        '    ' smtpClient.EnableSsl = true;

        '    smtpClient.Send(mailMessage)
        'Catch ex As Exception
        '    'RetValue =  ex.Message;
        '    RetValue = "<font color='red'>Error while sending Email.</font>"
        'End Try
        'Return RetValue

        Dim RetValue As String = ""
        'Dim fromEmailAddress As String = "mails@rezinfo.co.in"
        Try
            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim FromMaill As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
            Dim mail As MailMessage = New MailMessage()
            mail.From = New MailAddress(FromMaill)
            mail.[To].Add(Messageto)
            mail.Bcc.Add(Messageto)
            mail.Subject = subject
            mail.Body = body
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)

            ''Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            'Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
            'Dim mailMessage = New System.Net.Mail.MailMessage(fromMail, Messageto)
            ''mailMessage.Bcc.Add(New MailAddress(Messageto))
            'mailMessage.Subject = subject
            'mailMessage.Body = body
            'mailMessage.IsBodyHtml = True
            'mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            'Dim smtpClient = New SmtpClient()
            'smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
            ''smtpClient.EnableSsl = False

            'smtpClient.Send(mailMessage)
        Catch ex As Exception
            log("ErrorStep1", ex.Message, "sendMailUser", "", "", "", "", "")
            'RetValue =  ex.Message;
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function


    Public Shared Function sendMailUserAll(Messageto As String, subject As String, body As String) As String

        Dim RetValue As String = ""
        Try
            Dim BCCMessageList As String = "cde5@pqr3.com,cdew@pqrw.com,cde@pqr.com,cde1@pqr1.com"
            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim FromMaill As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
            Dim mail As MailMessage = New MailMessage()
            mail.From = New MailAddress(FromMaill)
            mail.Bcc.Add(Messageto)
            mail.Subject = subject
            mail.Body = body
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)

            'Dim BCCMessageList As String = "cde5@pqr3.com,cdew@pqrw.com,cde@pqr.com,cde1@pqr1.com"
            ''Dim toEmail As String = System.Configuration.ConfigurationManager.AppSettings("ToAdmin")
            'Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")
            ''Dim mailMessage = New System.Net.Mail.MailMessage(fromMail, Messageto)
            'Dim mailMessage = New System.Net.Mail.MailMessage
            'mailMessage.From = New MailAddress(fromMail)
            'mailMessage.Bcc.Add(Messageto)
            'mailMessage.Subject = subject
            'mailMessage.Body = body
            'mailMessage.IsBodyHtml = True
            'mailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            'Dim smtpClient = New SmtpClient()

            'smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings("EnableSSL"))
            '' smtpClient.EnableSsl = true;

            'smtpClient.Send(mailMessage)
        Catch ex As Exception
            log("ErrorStep1", ex.Message, "sendMailUserAll", "", "", "", "", "")
            'RetValue =  ex.Message;
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function

    Public Shared Function SendMailWithAttachment(toEmail As String, Messageto As String, subject As String, body As String) As String
        Dim RetValue As String = ""
        Try

            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim FromMaill As String = System.Configuration.ConfigurationManager.AppSettings("ToEmailID")

            Dim mail As MailMessage = New MailMessage()
            ' ✅ Correct FROM (your system email)
            mail.From = New MailAddress(FromMaill, "Ekta Navnirman Trust")

            ' ✅ Correct TO (email + name)
            'mail.To.Add(New MailAddress(toEmail.Trim(), Messageto))
            mail.To.Add("webdev316@gmail.com")
            mail.Subject = subject
            mail.Body = body
            mail.IsBodyHtml = True
            Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
            Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
            smtp.Credentials = Credentials
            smtp.Send(mail)

        Catch ex As Exception
            log("ErrorStep1", ex.Message, "SendMailWithAttachment", "", "", "", "", "")
            RetValue = "<font color='red'>Error while sending Email.</font>"
        End Try
        Return RetValue
    End Function
End Class
