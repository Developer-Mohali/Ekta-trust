Imports MySql.Data.MySqlClient

Public Class Covid191
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    'Protected Sub ButtonSignInClick(sender As Object, e As EventArgs)
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Try
    '        Using con As New MySqlConnection(constr)
    '            Dim body As String
    '            Using result As New MySqlCommand("Select EmailAddress From User WHERE EmailAddress =@EmailAddress")
    '                Using sda1 As New MySqlDataAdapter(result)
    '                    result.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim())
    '                    result.Connection = con
    '                    con.Open()
    '                    Dim dt As New DataTable()
    '                    sda1.Fill(dt)
    '                    If dt.Rows.Count > 0 Then
    '                        Using cmd As New MySqlCommand("UPDATE User SET Password=@Password WHERE  EmailAddress=@EmailAddress")
    '                            Using sda As New MySqlDataAdapter()
    '                                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim())
    '                                cmd.Parameters.AddWithValue("@Password", txtconfirpass.Text.Trim())
    '                                cmd.Connection = con
    '                                cmd.ExecuteNonQuery()
    '                                'Dim subject = "Register New User"
    '                                'body = "Hi " + txtName.Text + ", <br/><br/>Your account has been created successfully.<br/><br/>Your account details are-<br/></br><b>Email Id- </b>" + txtEmail.Text + "<br/><b>Password-</b>" + txtPassword.Text + "<br/><br/><a href='https://ektatrust.org.in/login' target='_blank'>Login here</a><br/><br/> Thanks and Regards," + "<br/>Ekta Navnirman Trust. <br/>Site Administrator.<br/>"
    '                                'SendEmail.sendMailUser(txtEmail.Text, subject, body)
    '                                'Reset()
    '                                message.Text = "<b>Password change Successfull.</b>"
    '                                con.Close()
    '                                con.Dispose()
    '                            End Using
    '                        End Using

    '                    Else
    '                        message.Text = "<b>Your email address not exists.</b>"
    '                    End If
    '                End Using
    '            End Using
    '        End Using

    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Public Function Reset()
    '    txtconfirpass.Text = ""
    '    txtEmail.Text = ""
    '    txtNewPass.Text = ""

    'End Function


End Class