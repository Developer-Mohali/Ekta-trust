Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Public Class JoinUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSubmitMessage_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim JoinId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Insert_JoinUs")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Address", textAddress.Text.Trim())
                    cmd.Parameters.AddWithValue("@Designation", textDesignation.Text.Trim())
                    cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@Message", textMessage.Text.Trim())
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now)

                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()

                    'userId = Convert.ToInt32(cmd.ExecuteScalar())

                    'Try
                    '    Dim Msg As New MailMessage()
                    '    Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()

                    '    ' Sender e-mail address.
                    '    Msg.From = New MailAddress(textEmail.Text)
                    '    ' Recipient e-mail address.
                    '    Msg.Body = (("Sender Name: " + textName.Text & "<br><br>Sender Email: ") + textEmail.Text & "<br><br>") + textAddress.Text + textDesignation.Text + textMobile.Text + textMessage.Text
                    '    ' your remote SMTP server IP.
                    '    Dim smtp As New SmtpClient()
                    '    smtp.Host = "gmail.com"
                    '    smtp.Port = 587
                    '    'smtp.Credentials = New System.Net.NetworkCredential("yourgmailemail@gmail.com", "yourgmailpassword")
                    '    smtp.EnableSsl = True
                    '    smtp.Send(Msg)
                    'Catch ex As Exception
                    '    Console.WriteLine("{0} Exception caught.", ex)
                    'End Try

                    Dim messageBody = "<p>Dear " + textName.Text + ",</p><p>Thank you for showing your interest to join ekta trust.</p><p>Regards,</p><p>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
                    Dim statusEmail = SendEmail.EventsendMailUser(textEmail.Text, "Matrimonial Registration", messageBody)

                    'Dim messageBodyMopbile = "Dear User, Your registration has been successfully done in Ekta Matrimonial. Your account details are : UserID: " + Phone + " Password: " + Password + " Regards, Administrator Ekta Navnirman Trust"
                    'Dim statusMobile = SendEmail.NewBlukSms(textMobile.Text, messageBodyMopbile)
                    con.Close()
                    textName.Text = ""
                    textEmail.Text = ""
                    textAddress.Text = ""
                    textDesignation.Text = ""
                    textMobile.Text = ""
                    textMessage.Text = ""
                    lblErrorMsg.Text = "Submit Successfully"
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Validate_Numeric(sender As Object, e As ServerValidateEventArgs)
        Dim r As New System.Text.RegularExpressions.Regex("^[0-9]+$")
        e.IsValid = r.IsMatch(textMobile.Text)
    End Sub

    'This function is used to Generate OTP Number and varify Email and Mobile no By OTP Number

    <System.Web.Services.WebMethod()>
    Public Shared Function OtpGenerate(ByVal OTPtype As String, EmailOrMobile As String) As String

        Dim otp As String = String.Empty
        Dim messageBody As String
        'Dim result As String
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
                messageBody = "<p>Dear User,</p><p>Your activation code is " + otp + " for Join Us</p><p>on Ekta Navnirman Trust.</p><p>&nbsp;</p><p>Regards,</p><p>Administrator</p><p>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
                status = SendEmail.EventsendMailUser(EmailOrMobile, "OTP for Matrimonial EktaTrust", messageBody)
            Else
                messageBody = "Dear User, Your activation code is " + otp + " for Join Us on Ekta Navnirman Trust.Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
                status = SendEmail.NewBlukSms(EmailOrMobile, messageBody)
                'status = SendEmail.sendSMS(EmailOrMobile, messageBody)
            End If
            SendEmail.log("SendOTP", "Success", "Join Us", EmailOrMobile, OTPtype, status, "", messageBody)

        Catch ex As Exception
            SendEmail.log("otpgenerateError", ex.ToString, "Join Us", "", "", "", "", "")
        End Try
        Return otp
    End Function
End Class