Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports System.Drawing
Imports System.IO

Public Class TrainingActivity
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
            If ddlSearchBy.SelectedItem.Text = "Name" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Email" Then
                getEmpRecords(ddlSearchBy.SelectedItem.Text, txtSearch.Text.Trim())
            ElseIf ddlSearchBy.SelectedItem.Text = "Training" Then
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
            Using cmd As New MySqlCommand("Select_Training")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            lblRecords.Text = ds.Tables(0).Rows.Count
                            gvPerson.DataSource = ds
                            gvPerson.DataBind()
                        End If
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
            cmd = New MySqlCommand("Get_Search", con)
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
            Using cmd As New MySqlCommand("UPDATE training SET Name=@Name, Email=@Email, Training=@Training, Mobile=@Mobile, CreateDate=@CreateDate WHERE TrainingId = @TrainingId", con)
                cmd.Parameters.AddWithValue("@TrainingId", Convert.ToInt32(lblTrainingId.Text))
                cmd.Parameters.AddWithValue("@Name", textName.Text)
                cmd.Parameters.AddWithValue("@Email", textEmail.Text)
                cmd.Parameters.AddWithValue("@Training", ddlTraining.SelectedItem.Value)
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
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim TrainingId As Integer = Convert.ToInt32(gvPerson.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM training WHERE TrainingId = @TrainingId", con)
                cmd.Parameters.AddWithValue("@TrainingId", TrainingId)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        BindGridView()
    End Sub
    Protected Sub imgbtn_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblTrainingId.Text = gvPerson.DataKeys(gvrow.RowIndex).Value.ToString()
        Dim roleId = Session("RoleId").ToString()
        If roleId = "2" Then
            textName.Text = gvrow.Cells(0).Text
            textEmail.Text = gvrow.Cells(1).Text
            ddlTraining.SelectedItem.Value = gvrow.Cells(2).Text
            textMobile.Text = gvrow.Cells(3).Text

            textName.ReadOnly = True
            textEmail.ReadOnly = True
            ddlTraining.Enabled = False
            textMobile.ReadOnly = True
            btnUpdate.Visible = False

        Else
            textName.Text = gvrow.Cells(0).Text
            textEmail.Text = gvrow.Cells(1).Text
            ddlTraining.SelectedItem.Value = gvrow.Cells(2).Text
            textMobile.Text = gvrow.Cells(3).Text
        End If
       
        Me.ModalPopupExtender1.Show()
        BindGridView()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            gvPerson.AllowPaging = False
            Me.BindGridView()

            gvPerson.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In gvPerson.HeaderRow.Cells
                cell.BackColor = gvPerson.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In gvPerson.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = gvPerson.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = gvPerson.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            gvPerson.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using

    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
End Class