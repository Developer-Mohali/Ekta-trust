Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports MySql.Data.MySqlClient
Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    'Protected Sub buttonclick(sender As Object, e As EventArgs)
    '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
    'End Sub

    Protected Sub ButtonSubmitMessage_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim TrustId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Add_Trust")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@FeedBackType", ddlFeedBack.SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@Comment", textComment.Text.Trim())
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    lblErrorMsg.Text = "Submit Successfully"
                End Using
            End Using
        End Using
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function GetDataforMessage(ByVal email As String) As String
        Try
            Dim isDeleted As Boolean
            isDeleted = False
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)

                Using result As New MySqlCommand("Select EmailId From  SignupEmail WHERE EmailId =@email")
                    Using sda1 As New MySqlDataAdapter(result)

                        result.Parameters.AddWithValue("@email", email)
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        If dt.Rows.Count <= 0 Then
                            Using cmd As New MySqlCommand("insert into SignupEmail (EmailId,IsDeleted) values(@email,@IsDeleted)")
                                cmd.Parameters.AddWithValue("@email", email)
                                cmd.Parameters.AddWithValue("@IsDeleted", isDeleted)
                                cmd.Connection = con
                                con.Open()
                                cmd.ExecuteReader()
                                Dim msg As Int16 = 2
                                Return msg
                                'Return MsgBox("Your Email Id save successfully")
                            End Using
                        Else
                            Dim msg As Int16 = 1
                            Return msg
                            'Return MsgBox("This is already Ragistred please try another email id")
                        End If
                    End Using
                End Using
            End Using
        Catch e As Exception

        End Try
    End Function
End Class

