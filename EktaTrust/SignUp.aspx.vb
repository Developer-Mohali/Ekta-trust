Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient
Public Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim userId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("User_SignUp")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FirstName", textFirstName.Text.Trim())
                    cmd.Parameters.AddWithValue("@LastName", textLastName.Text.Trim())
                    cmd.Parameters.AddWithValue("@EmailAddress", textEmailId.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", textPassword.Text.Trim())
                    cmd.Parameters.AddWithValue("@PhoneNo", textPhoneNo.Text.Trim())
                    cmd.Parameters.AddWithValue("@Address", textAddress.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    con.Close()

                End Using
            End Using
            Dim message As String = String.Empty
            Select Case userId
                Case -1
                    message = "Username already exists.\nPlease choose a different username."
                    Exit Select
                Case -2
                    message = "Supplied email address has already been used."
                    Exit Select
                Case Else
                    message = "Registration successful.\nUser Id: " + userId.ToString()
                    Exit Select
            End Select
            ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        End Using
    End Sub
End Class