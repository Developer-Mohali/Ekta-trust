Imports System.IO
Imports MySql.Data.MySqlClient
Public Class ProfileMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ' this function and method used to send request to delete account

    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteAccount(ByVal id As Int32) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                Using cmd As New MySqlCommand("Update matrimonialDetails set DeleteAccountRequest = @request, RequestDateForAccountDelete =@requestDate WHERE ID = @id")
                    cmd.Parameters.AddWithValue("@request", True)
                    cmd.Parameters.AddWithValue("@id", id)
                    cmd.Parameters.AddWithValue("@requestDate", DateTime.Now)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()

                End Using

                SendEmail.log("step 1", "Success", "Delete Account Request", "", "", "", "", "id:" + id.ToString() + ",DeleteAccountRequest:" + True + "")
                Statusmessages = "Delete account request add successfully!"

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "Delete Account Request", "", "", "", "", "id:" + id.ToString() + ",DeleteAccountRequest:" + True + "")
                Statusmessages = "Delete account request not add successfully!!"

            End Try
        End Using
        Return Statusmessages
    End Function

    'This function is used to return on Matrimonial Login page after logout and all session abandon
    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session("ID") = ""
        Session.Abandon()
        Response.Redirect("MatrimonialLogin.aspx")
    End Sub

End Class