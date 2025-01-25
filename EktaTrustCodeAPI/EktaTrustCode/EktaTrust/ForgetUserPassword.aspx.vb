
Imports System.Net.Mail
Imports MySql.Data.MySqlClient

Public Class ForgetUserPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonSend_Click(sender As Object, e As EventArgs)

        Try
            Dim SendEmail As SendEmail = New SendEmail()
            Dim messageBody As String
            Dim status As String
            Dim ds As New DataSet()
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim cmd As New MySqlCommand("select Name, EmailId, Password from matrimonialDetails where PhoneNo =@Phone", con)
                cmd.Parameters.AddWithValue("@Phone", txtPhoneNo.Text)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                'userId = Convert.ToInt32(cmd.ExecuteScalar())
                Dim da As New MySqlDataAdapter(cmd)
                Dim dt As New DataTable()
                da.Fill(ds)
            End Using
            If ds.Tables(0).Rows.Count > 0 Then

                messageBody = "Hi " & Convert.ToString(ds.Tables(0).Rows(0)("Name")) & ", Please check your login details. User name: " + txtPhoneNo.Text & " Password: " & Convert.ToString(ds.Tables(0).Rows(0)("Password")) & " https://ektatrust.org.in/MatrimonialLogin Click here to login Regards, Administrator Ekta Trust ektatrust.org.in"
                'messageBody = "Dear " + Convert.ToString(ds.Tables(0).Rows(0)("Name")) + ", Your Password is " + Convert.ToString(ds.Tables(0).Rows(0)("Password")) + " for Matrimonial on Ekta Navnirman Trust.Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
                status = SendEmail.NewBlukSms(txtPhoneNo.Text, messageBody)
                lblMessage.Visible = False
                lblSuccess.Visible = True
                lblSuccess.Text = "Password send on registered mobile number!"

                'Dim Msg As New MailMessage()
                '' Sender e-mail address.
                'Msg.From = New MailAddress(textEmailAdd.Text)
                '' Recipient e-mail address.
                'Msg.[To].Add(textEmailAdd.Text)
                'Msg.Subject = "Password Notification"
                'Msg.Body = "Hi " & Convert.ToString(ds.Tables(0).Rows(0)("Name")) & ", <br/><br/>Please check your login details<br/><br/>User name: " & Convert.ToString(ds.Tables(0).Rows(0)("EmailId")) & "<br/>Password: " & Convert.ToString(ds.Tables(0).Rows(0)("Password")) & "<br/><a href='https://ektatrust.org.in/MatrimonialLogin'>Click here</a> to login<br/><br/>Regards,<br/>Administrator<br/>Ekta Trust<br/>ektatrust.org.in"
                'Msg.IsBodyHtml = True
                '' your remote SMTP server IP.
                'Dim smtp As New SmtpClient()
                'smtp.Host = "gmail.com"
                'smtp.Port = 587
                'smtp.Credentials = New System.Net.NetworkCredential("yourusername@gmail.com", "yourpassword")
                'smtp.EnableSsl = True
                'smtp.Send(Msg)
                ''Msg = null;
                'lblMessage.Text = "Your password details sent to your email!"
                '' Clear the textbox valuess
                'textEmailAdd.Text = ""
            Else
                lblMessage.Visible = True
                lblMessage.Text = "Account does not exist!"
                lblSuccess.Visible = False

            End If
        Catch ex As Exception
            Console.WriteLine("{0} Exception caught.", ex)
            lblMessage.Text = ex.Message
        End Try
    End Sub
End Class