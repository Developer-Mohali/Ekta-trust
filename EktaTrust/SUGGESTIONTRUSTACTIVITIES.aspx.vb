Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports MySql.Data.MySqlClient
Public Class SUGGESTIONTRUSTACTIVITIES
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            gvPerson.AllowPaging = True
            gvPerson.PageSize = 15
            BindGridView()
        End If
    End Sub
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        Dim dt As New DataTable()
        Dim cmd As New MySqlCommand()
        Dim adp As New MySqlDataAdapter()
        Try
            If ddlSearchBy.SelectedItem.Text = "FirstName" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "LastName" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "CompanyName" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Title" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Email" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Activity" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Discription" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Mobile" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            Else
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "Message", "alert('Error occured : " & ex.Message.ToString() & "');", True)
        Finally
            dt.Clear()
            dt.Dispose()
            cmd.Dispose()
            con.Close()
            'BindEmpGrid()
        End Try
    End Sub
    Private Sub BindGridView()
         Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("select_SUGGESTION")

                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        gvPerson.DataSource = dt
                        gvPerson.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub ddlSearchBy_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlSearchBy.SelectedIndexChanged
        If ddlSearchBy.SelectedItem.Text = "All" Then
            txtSearch.Text = String.Empty
            txtSearch.Enabled = False
        Else
            txtSearch.Enabled = True
            txtSearch.Text = String.Empty
            txtSearch.Focus()
        End If
    End Sub
    Protected Sub gvPerson_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gvPerson.PageIndex = e.NewPageIndex
        BindGridView()
    End Sub
    Private Sub getEmpRecords(searchBy As String, searchVal As String)
        Dim dt As New DataTable()
        Dim cmd As New MySqlCommand()
        Dim adp As New MySqlDataAdapter()
        Try
            cmd = New MySqlCommand("Select_TrustSearch", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SearchBy", searchBy)
            cmd.Parameters.AddWithValue("@SearchValue", searchVal)
            adp.SelectCommand = cmd
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                gvPerson.DataSource = dt
                gvPerson.DataBind()
            Else
                gvPerson.DataSource = dt
                gvPerson.DataBind()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", True)
        Finally
            dt.Clear()
            dt.Dispose()
            cmd.Dispose()
            con.Close()
        End Try
    End Sub
   
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE suggestion SET FirstName=@FirstName, LastName=@LastName, CompanyName=@CompanyName, Title=@Title, Email=@Email, Activity=@Activity, Discription=@Discription, Mobile=@Mobile, CreateDate=@CreateDate WHERE TrustId = @TrustId", con)
                cmd.Parameters.AddWithValue("@TrustId", Convert.ToInt32(lblTrustId.Text))
                cmd.Parameters.AddWithValue("@FirstName", textFirstName.Text)
                cmd.Parameters.AddWithValue("@LastName", textLastName.Text)
                cmd.Parameters.AddWithValue("@CompanyName", textCompanyName.Text)
                cmd.Parameters.AddWithValue("@Title", textTitle.Text)
                cmd.Parameters.AddWithValue("@Email", textEmail.Text)
                cmd.Parameters.AddWithValue("@Activity", textActivity.Text)
                cmd.Parameters.AddWithValue("@Discription", textDiscription.Text)
                cmd.Parameters.AddWithValue("@Mobile", textMobile.Text)
                cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

        gvPerson.EditIndex = -1
        BindGridView()
    End Sub
    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        'If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> gvPerson.EditIndex Then
        '    TryCast(e.Row.Cells(9).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        'End If
    End Sub
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim TrustID As Integer = Convert.ToInt32(gvPerson.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM suggestion WHERE TrustId = @TrustId", con)
                Using sda As New MySqlDataAdapter()

                    cmd.Parameters.AddWithValue("@TrustID", TrustID)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End Using
        BindGridView()
    End Sub
    Protected Sub imgbtn_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblTrustId.Text = gvPerson.DataKeys(gvrow.RowIndex).Value.ToString()
        textFirstName.Text = gvrow.Cells(0).Text
        textLastName.Text = gvrow.Cells(1).Text
        textCompanyName.Text = gvrow.Cells(2).Text
        textTitle.Text = gvrow.Cells(3).Text
        textEmail.Text = gvrow.Cells(4).Text
        textActivity.Text = gvrow.Cells(5).Text
        textDiscription.Text = gvrow.Cells(6).Text
        textMobile.Text = gvrow.Cells(7).Text
        Me.ModalPopupExtender1.Show()
    End Sub
End Class