Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Public Class Enroll
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
        End If
    End Sub
    Protected Sub ButtonSubmitMessage_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim StudentId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("EnRoll_Student")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                    cmd.Parameters.AddWithValue("@FatherName", fatherName.Text.Trim())
                    cmd.Parameters.AddWithValue("@FatherOccupation", fatherOccupation.Text.Trim())
                    cmd.Parameters.AddWithValue("@MotherName", MotherName.Text.Trim())
                    cmd.Parameters.AddWithValue("@MotherOccupation", MotherOccupation.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Category", category.SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@DOB", textDOB.Text.Trim())
                    cmd.Parameters.AddWithValue("@Class", textClass.Text.Trim())
                    cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@SchoolName", schoolName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Percentage", percentage.Text.Trim())
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now)

                    'cmd.Parameters.AddWithValue("@Sex", String.Empty)
                    'cmd.Parameters.AddWithValue("@Nationality", String.Empty)
                    'cmd.Parameters.AddWithValue("@SelectCourse", String.Empty)
                    'cmd.Parameters.AddWithValue("@Message", String.Empty)


                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    'Try
                    'Dim Msg As New MailMessage()
                    'Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()
                    ' Sender e-mail address.
                    'Msg.From = New MailAddress(textEmail.Text)
                    ' Recipient e-mail address.
                    'Msg.Body = (("Sender Name: " + textName.Text & "<br><br>Sender Email: ") + textEmail.Text & "<br><br>") + ddlSex.SelectedItem.Value + textDOB.Text + textNationality.Text + ddlSelectCourse.SelectedItem.Value + textMobile.Text + textMessage.Text
                    'your remote SMTP server IP.
                    'Dim smtp As New SmtpClient()
                    'smtp.Host = "gmail.com"
                    'smtp.Port = 587
                    'smtp.Credentials = New System.Net.NetworkCredential("yourgmailemail@gmail.com", "yourgmailpassword")
                    'smtp.EnableSsl = True
                    'smtp.Send(Msg)
                    'Catch ex As Exception
                    'Console.WriteLine("{0} Exception caught.", ex)
                    'End Try
                    con.Close()
                    lblErrorMsg.Text = "Record Saved Successfully"
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Validate_Numeric(sender As Object, e As ServerValidateEventArgs)
        Dim r As New System.Text.RegularExpressions.Regex("^[0-9]+$")
        e.IsValid = r.IsMatch(textMobile.Text)
    End Sub
End Class