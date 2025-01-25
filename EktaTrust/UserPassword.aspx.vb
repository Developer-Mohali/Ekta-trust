Imports System.IO
Imports MySql.Data.MySqlClient
Public Class UserPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonChangePassword_Click(sender As Object, e As EventArgs)

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("Update matrimonialDetails set Password = @password WHERE ID = @id and Password = @Oldpassword")
                    cmd.Parameters.AddWithValue("@password", textNewPassword.Text.Trim())
                    cmd.Parameters.AddWithValue("@id", Session("ID").ToString())
                    cmd.Parameters.AddWithValue("@Oldpassword", TextOldPassword.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()
                End Using

                SendEmail.log("step 1", "Success", "UpdatePassword", "", "", "", "", "id:" + ID.ToString() + ",new password:" + textNewPassword.Text.Trim() + ",Old Password:" + TextOldPassword.Text.Trim() + "")
                Response.Write("<script>alert('Password change successfully!');</script>")
            Catch ex As Exception

                SendEmail.log("Error", ex.Message, "UpdatePassword", "", "", "", "", "id:" + ID.ToString() + ",new password:" + textNewPassword.Text.Trim() + ",Old Password:" + TextOldPassword.Text.Trim() + "")
                Response.Write("<script>alert('Password not change successfully!');</script>")
            End Try

        End Using

    End Sub
End Class