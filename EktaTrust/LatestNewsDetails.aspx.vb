Imports MySql.Data.MySqlClient

Public Class LatestNewsDetails
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim LastInsertrow
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
        lblMessage.Visible = False

    End Sub
    ' This function is used to bind the grid and show the value on page load
    Private Sub BindGrid()
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT Newid,Title,NewDescription, DATE_FORMAT(CreatedDate,'%m/%d/%Y')as CreatedDate,IsDeleted  FROM LatestNews")
                    Using sda As New MySqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using dt As New DataTable()
                            sda.Fill(dt)
                            Dim data

                            gridViewNotification.DataSource = dt
                            ' dt.Rows(1)("IsDeleted") = dt
                            gridViewNotification.DataBind()
                        End Using
                    End Using
                End Using
            End Using
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ButtonSubmitMessage_Click(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim Statusmessages = String.Empty
        Using con As New MySqlConnection(constr)

            Try
                Using cmd1 As New MySqlCommand("SELECT LAST_INSERT_ID() FROM LatestNews")
                    Using sda1 As New MySqlDataAdapter()
                        cmd1.Connection = con
                        sda1.SelectCommand = cmd1
                        Using dt As New DataTable()
                            sda1.Fill(dt)
                            Dim DataType As String = dt.Rows(0).Item(0)
                            LastInsertrow = DataType
                        End Using
                    End Using
                End Using

                Using cmd As New MySqlCommand("AddLatestNews")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Newid", LastInsertrow + 1)
                        cmd.Parameters.AddWithValue("@Title", txtBoxTitle.Text.Trim())
                        cmd.Parameters.AddWithValue("@NewDescription", AddNewsLatest.Text.Trim())
                        cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@IsDeleted", False)
                        cmd.Connection = con
                        con.Open()

                        cmd.ExecuteNonQuery()
                        con.Close()
                        con.Dispose()
                        lblMessage.Visible = True
                        Statusmessages = "Success"
                        lblMessage.Text = "Submitted successfully. Thanks !"
                        Reset()
                        Me.BindGrid()
                        'SendEmail.log("ErrorStep11", Statusmessages, "MIPFacultyRegistration", "", "", "", "", "")


                    End Using
                End Using
                'Catch

            Catch ex As Exception
                lblMessage.Text = "Please try again later"

            End Try






        End Using




    End Sub
    Public Function Reset()
        txtBoxTitle.Text = ""

        AddNewsLatest.Text = ""
    End Function
    Protected Sub GridViewNews_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> gridViewNotification.EditIndex Then
            TryCast(e.Row.Cells(0).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        End If
    End Sub

    Protected Sub gridViewNotification_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridViewNotification.EditIndex = e.NewEditIndex
        Me.BindGrid()
    End Sub

    Protected Sub gridViewNotification_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gridViewNotification.EditIndex = -1
        Me.BindGrid()
    End Sub

    Protected Sub gridViewNotification_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridViewNotification.Rows(e.RowIndex)
        Dim Newid As Integer = Convert.ToInt32(gridViewNotification.DataKeys(e.RowIndex).Values(0))
        Dim Title As String = TryCast(row.Cells(2).Controls(1), TextBox).Text
        Dim NewDescription As String = TryCast(row.Cells(2).Controls(1), TextBox).Text
        Dim CreatedDate As String = TryCast(row.Cells(3).Controls(1), TextBox).Text
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE LatestNews SET Title = @Title, NewDescription = @NewDescription, CreatedDate=@CreatedDate WHERE Newid = @Newid")
                cmd.Parameters.AddWithValue("@Newid", Newid)
                cmd.Parameters.AddWithValue("@Title", Title)
                cmd.Parameters.AddWithValue("@NewDescription", NewDescription)
                cmd.Parameters.AddWithValue("@CreatedDate", CreatedDate)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        gridViewNotification.EditIndex = -1
        Me.BindGrid()
    End Sub

    Protected Sub gridViewNotification_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Newid As Integer = Convert.ToInt32(gridViewNotification.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM LatestNews WHERE Newid = @Newid")
                cmd.Parameters.AddWithValue("@Newid", Newid)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindGrid()
    End Sub
End Class