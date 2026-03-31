Imports System.Data
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports System.Drawing
Imports MySql.Data.MySqlClient
Public Class ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonChangePassword_Click(sender As Object, e As EventArgs)

        Dim oldPassword As String = TextOldPassword.Text.Trim()
        Dim newPassword As String = textNewPassword.Text.Trim()
        Dim confirmPassword As String = textConfirmPassword.Text.Trim()

        Try
            ' Validate match (extra safety, even though CompareValidator exists)
            If newPassword <> confirmPassword Then
                lblErrorMsg.Text = "New password and confirm password do not match."
                Exit Sub
            End If

            ' Example: Get current user ID (modify as per your session/login system)
            Dim userId As String = Session("UserId").ToString()

            ' Connection string from Web.config
            Dim connStr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(connStr)
                con.Open()

                ' Check and Update new password
                Dim cmd As New MySqlCommand("UPDATE signup SET Password=@NewPassword WHERE UserId=@UserId AND Password=@Password", con)
                cmd.Parameters.AddWithValue("@NewPassword", newPassword)
                cmd.Parameters.AddWithValue("@UserId", userId)
                cmd.Parameters.AddWithValue("@Password", oldPassword)

                Dim rows As Integer = cmd.ExecuteNonQuery()

                If rows > 0 Then
                    lblErrorMsg.ForeColor = Drawing.Color.Green
                    lblErrorMsg.Text = "Password changed successfully!"
                Else
                    lblErrorMsg.Text = "Old password is incorrect."
                End If

            End Using

        Catch ex As Exception
            lblErrorMsg.Text = ex.Message
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Protected Sub ButtonChangePassword_ClickOld(ByVal sender As Object, ByVal e As EventArgs)

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Get_ChangePassword")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@OldPassword", TextOldPassword.Text.Trim())
                    'cmd.Parameters.AddWithValue("@NewPassword", textNewPassword.Text.Trim())
                    'cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    Dim da As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)
                    con.Close()
                    'lblErrorMsg.Text = "Successfully Change Password"
                End Using
            End Using

        End Using
    End Sub
End Class