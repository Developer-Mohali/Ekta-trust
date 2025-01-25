Imports MySql.Data.MySqlClient

Public Class FeedbackAndSuggestion
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            MessageUpdated.Text = ""
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
        End If
    End Sub


    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            If txtSearch.Text = "" Then
                Using cmd As New MySqlCommand("Select DISTINCT * from FeedbackSuggestions order by Id desc")
                    'Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        sda.SelectCommand = cmd
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            lblRecords.Text = ds.Tables(0).Rows.Count
                            gvEvent.DataSource = ds
                            gvEvent.DataBind()
                        End If
                        con.Close()
                        con.Dispose()
                    End Using
                End Using

            Else
                Using cmd As New MySqlCommand("Select DISTINCT * from FeedbackSuggestions WHERE MobileNumber LIKE '%" + txtSearch.Text.Trim() + "%' order by ID desc")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        lblRecords.Text = dt.Rows.Count
                        gvEvent.DataSource = dt
                        gvEvent.DataBind()
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End If
        End Using

    End Sub

    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.BindGridView()
    End Sub

End Class