Imports MySql.Data.MySqlClient

Public Class Career_Counselling
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <System.Web.Services.WebMethod()>
    Public Shared Function Submitdata(name As String, phone As String, email As String, education As String, address As String, cCGuidance As String) As String
        Dim Statusmessages = String.Empty
        Dim registrationType As [Boolean] = False

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("Insert_CareerCounselling")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myName", name.Trim())
                        cmd.Parameters.AddWithValue("@myPhone", phone.Trim())
                        cmd.Parameters.AddWithValue("@myEmail", email.Trim())
                        cmd.Parameters.AddWithValue("@myEducation", education.Trim())
                        cmd.Parameters.AddWithValue("@myAddress", address.Trim())
                        cmd.Parameters.AddWithValue("@myMessage", cCGuidance.Trim())
                        cmd.Parameters.AddWithValue("@myCreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myCreatedStatus", True)
                        cmd.Parameters.AddWithValue("@myDeletedDate", "")
                        cmd.Parameters.AddWithValue("@myDeletedStatus", False)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        Statusmessages = "Thank you, expert will talk to you soon."
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            Catch e As Exception
                Statusmessages = "Error"
            End Try
        End Using
        Return Statusmessages
    End Function
End Class

