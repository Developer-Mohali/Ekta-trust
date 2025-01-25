Imports System.IO
Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail

Public Class PaymetConfirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            SetPaymentStatus()
        End If
    End Sub

    Private Sub SetPaymentStatus()
        Try
            If Not Session("phone") Is Nothing And Not Session("email") Is Nothing Then

                Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
                Using con As New MySqlConnection(constr)
                    Using result As New MySqlCommand("Select Mobile From  registration WHERE MobileNumber = @Mobile")
                        Using sda1 As New MySqlDataAdapter(result)
                            result.Parameters.AddWithValue("@Mobile", Session("phone"))
                            result.Connection = con
                            Dim dt As New DataTable()
                            sda1.Fill(dt)
                            If dt.Rows.Count >= 0 Then
                                Using cmd As New MySqlCommand("Update registration set Payment = @status where EmailID=@email and MobileNumber=@Mobile")
                                    Using sda As New MySqlDataAdapter()
                                        cmd.CommandType = CommandType.Text
                                        cmd.Parameters.AddWithValue("@status", "successfully")
                                        cmd.Parameters.AddWithValue("@email", Session("email"))
                                        cmd.Connection = con
                                        con.Open()
                                        cmd.ExecuteNonQuery()
                                        con.Close()
                                        con.Dispose()
                                    End Using
                                End Using
                            End If
                        End Using
                    End Using
                End Using
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class