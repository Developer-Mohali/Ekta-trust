Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Public Class Contact
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            FillCaptcha()
        End If
    End Sub
    Private Sub FillCaptcha()
        Try
            Dim random As New Random()
            Dim combination As String = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            Dim captcha As New StringBuilder()
            For i As Integer = 0 To 5
                captcha.Append(combination(random.[Next](combination.Length)))
            Next
            Session("captcha") = captcha.ToString()
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx"
        Catch

            Throw
        End Try
    End Sub
    Protected Sub ButtonSendMessage_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim ContactId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Insert_ContactUs")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@EmailAddress", textEmailAdd.Text.Trim())
                    'cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim())
                    'cmd.Parameters.AddWithValue("@Message", TextMessage.Text.Trim())
                    'cmd.Parameters.AddWithValue("@Date", DateTime.Now)
                    'cmd.Parameters.AddWithValue("@CAPTCHAImage", textCaptcha.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    'If Session("Captcha").ToString() = textCaptcha.Text Then
                    '    lblmsg.Text = ""
                    'Else
                    '    lblmsg.Text = "Please try again"
                    '    textCaptcha.Text = ""
                    '    Return
                    'End If
                    FillCaptcha()
                    Try
                        Dim Msg As New MailMessage()
                        Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()

                        ' Sender e-mail address.
                        'Msg.From = New MailAddress(textEmailAdd.Text)
                        ' Recipient e-mail address.
                        'Msg.Body = TextMessage.Text
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
                    'lblErrorMsg.Text = "Message Send Successfully"
                End Using
            End Using
        End Using
    End Sub
    Protected Sub btnRefresh_Click(sender As Object, e As EventArgs)
        FillCaptcha()
    End Sub

    Protected Sub Validate_Numeric(sender As Object, e As ServerValidateEventArgs)
        Dim r As New System.Text.RegularExpressions.Regex("^[0-9]+$")
        'e.IsValid = r.IsMatch(textMobile.Text)
    End Sub
End Class