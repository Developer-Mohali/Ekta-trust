Imports System.Data
Imports System.Data.SqlClient
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
    Protected Sub ButtonChangePassword_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Get_ChangePassword")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@OldPassword", TextOldPassword.Text.Trim())
                    cmd.Parameters.AddWithValue("@NewPassword", textNewPassword.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    Dim da As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)
                    con.Close()
                    lblErrorMsg.Text = "Successfully Change Password"
                End Using
            End Using

        End Using
    End Sub
End Class