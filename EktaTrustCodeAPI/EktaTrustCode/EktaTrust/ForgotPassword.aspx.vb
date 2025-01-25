Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports System.Text
Imports System.Net.Mail
Imports MySql.Data.MySqlClient

Public Class ForgotPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
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
                Dim Msg As New MailMessage()
                ' Sender e-mail address.
                Msg.From = New MailAddress(textEmailAdd.Text)
                ' Recipient e-mail address.
                Msg.[To].Add(textEmailAdd.Text)
                Msg.Subject = "Password Notification"
                Msg.Body = "Hi " & Convert.ToString(ds.Tables(0).Rows(0)("FirstName")) & ", <br/><br/>Please check your login details<br/><br/>User name: " & Convert.ToString(ds.Tables(0).Rows(0)("EmailAddress")) & "<br/>Password: " & Convert.ToString(ds.Tables(0).Rows(0)("Password")) & "<a href='https://ektatrust.org.in/login'>Click here</a> to login.<br/><br/>Regards,<br/>Administrator<br/>Ekta Trust<br/>ektatrust.org.in"
                Msg.IsBodyHtml = True
                ' your remote SMTP server IP.
                Dim smtp As New SmtpClient()
                smtp.Host = "gmail.com"
                smtp.Port = 587
                smtp.Credentials = New System.Net.NetworkCredential("yourusername@gmail.com", "yourpassword")
                smtp.EnableSsl = True
                smtp.Send(Msg)
                'Msg = null;
                lblMessage.Text = "Your password details sent to your email!"
                ' Clear the textbox valuess
                textEmailAdd.Text = ""
            Else
                lblMessage.Text = "Email id does not exist!"
            End If
        Catch ex As Exception
            Console.WriteLine("{0} Exception caught.", ex)
            lblMessage.Text = ex.Message
        End Try

    End Sub

    
End Class