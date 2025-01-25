Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Public Class Trust_Activities
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSubmitActivities_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim TrustId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Insert_SUGGESTION")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FirstName", textFirstName.Text.Trim())
                    cmd.Parameters.AddWithValue("@LastName", textLastName.Text.Trim())
                    cmd.Parameters.AddWithValue("@CompanyName", textCampName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Title", textTitle.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Activity", textActivity.Text.Trim())
                    cmd.Parameters.AddWithValue("@Discription", textMessage.Text.Trim())
                    cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)

                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    Try
                        Dim Msg As New MailMessage()
                        Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()

                        ' Sender e-mail address.
                        Msg.From = New MailAddress(textEmail.Text)
                        ' Recipient e-mail address.
                        Msg.Body = (("Sender FirstName: " + textFirstName.Text & "<br><br>Sender Email: ") + textEmail.Text & "<br><br>") + textCampName.Text + textMobile.Text + textLastName.Text + textActivity.Text + textMessage.Text
                        ' your remote SMTP server IP.
                        Dim smtp As New SmtpClient()
                        smtp.Host = "gmail.com"
                        smtp.Port = 587
                        'smtp.Credentials = New System.Net.NetworkCredential("yourgmailemail@gmail.com", "yourgmailpassword")
                        smtp.EnableSsl = True
                        smtp.Send(Msg)
                    Catch ex As Exception
                        Console.WriteLine("{0} Exception caught.", ex)
                    End Try
                    con.Close()
                    lblErrorMsg.Text = "Message Submit Successfully"
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Validate_Numeric(sender As Object, e As ServerValidateEventArgs)
        Dim r As New System.Text.RegularExpressions.Regex("^[0-9]+$")
        e.IsValid = r.IsMatch(textMobile.Text)
    End Sub
End Class