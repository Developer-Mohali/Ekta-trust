Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports System.Text
Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Imports System.Net

Public Class ForgotPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim fromMail As String = System.Configuration.ConfigurationManager.AppSettings("From")
            Dim Password As String = System.Configuration.ConfigurationManager.AppSettings("Password")
            Dim ds As New DataSet()
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim cmd As New MySqlCommand("select FirstName, EmailAddress, Password from signup where EmailAddress =@EmailAddress", con)
                cmd.Parameters.AddWithValue("@EmailAddress", textEmailAdd.Text)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                'userId = Convert.ToInt32(cmd.ExecuteScalar())
                Dim da As New MySqlDataAdapter(cmd)
                Dim dt As New DataTable()
                da.Fill(ds)
            End Using
            If ds.Tables(0).Rows.Count > 0 Then
                Dim mail As MailMessage = New MailMessage()
                mail.From = New MailAddress(fromMail)
                mail.[To].Add(textEmailAdd.Text)
                mail.Subject = "Password Notification"
                mail.Body = "Hi " & Convert.ToString(ds.Tables(0).Rows(0)("FirstName")) & ", <br/><br/>Please check your login details<br/><br/>User name: " & Convert.ToString(ds.Tables(0).Rows(0)("EmailAddress")) & "<br/>Password: " & Convert.ToString(ds.Tables(0).Rows(0)("Password")) & "<a href='https://ektatrust.org.in/login'>Click here</a> to login.<br/><br/>Regards,<br/>Administrator<br/>Ekta Trust<br/>ektatrust.org.in"
                Dim smtp As SmtpClient = New SmtpClient("mail.ektatrust.org.in", 8889)
                Dim Credentials As NetworkCredential = New NetworkCredential(fromMail, Password)
                smtp.Credentials = Credentials
                smtp.Send(mail)

                'Msg = null;
                lblMessage.Text = "Your password details sent to your email!"
                ' Clear the textbox valuess
                textEmailAdd.Text = ""
            Else
                lblMessage.Text = "Email id does not exist!"
            End If
        Catch ex As Exception
            SendEmail.log("ErrorStep1", ex.Message, "ForgotPassword", "", "", "", "", "")
            Console.WriteLine("{0} Exception caught.", ex)
            lblMessage.Text = ex.Message
        End Try

    End Sub

    Private Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs)


    End Sub
End Class