Imports MySql.Data.MySqlClient

Public Class ModificationEmailAndSms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)

                Using result As New MySqlCommand("Select Title,Category,TemplateType From Template WHERE Title = @Title and Category=@Category and TemplateType=@TemplateType")
                    Using sda1 As New MySqlDataAdapter(result)
                        result.Parameters.AddWithValue("@Title", txtTitle.Text.Trim())
                        result.Parameters.AddWithValue("@Category", drpEvent.SelectedItem.Text.Trim())
                        result.Parameters.AddWithValue("@TemplateType", drpTemplateType.SelectedItem.Text.Trim())
                        result.Connection = con
                        con.Open()
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        If dt.Rows.Count > 0 Then
                            Message.Text = "Already exists."
                        Else
                            Using cmd As New MySqlCommand("InsertTemplate")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.AddWithValue("@Category", drpEvent.SelectedItem.Text.Trim())
                                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim())
                                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim())
                                    cmd.Parameters.AddWithValue("@TemplateType", drpTemplateType.SelectedItem.Text.Trim())
                                    cmd.Connection = con
                                    cmd.ExecuteNonQuery()
                                    Message.Text = "Submit Successfull."
                                    txtMessage.Text = ""

                                    txtTitle.Text = ""
                                    con.Close()
                                    con.Dispose()

                                End Using
                            End Using
                        End If
                    End Using
                End Using


                
            End Using

        Catch ex As Exception

        End Try
    End Sub

End Class