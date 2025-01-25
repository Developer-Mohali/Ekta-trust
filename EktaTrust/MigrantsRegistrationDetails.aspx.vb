Imports System.Drawing
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class MigrantsRegistrationDetails
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
        End If
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'Tell the compiler that the control is rendered
        'explicitly by overriding the VerifyRenderingInServerForm event.
    End Sub
    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            'If txtSearch.Text = "" Then
            '    If DropDownList1.SelectedValue = "All" Then
            Using cmd As New MySqlCommand("Select * from labourregistration WHERE IsDeleted=false order by MigrantsId desc")
                Using sda As New MySqlDataAdapter(cmd)
                    cmd.Connection = con
                    con.Open()
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
        End Using
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
            gvEvent.AllowPaging = False
            Me.BindGridView()

            gvEvent.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In gvEvent.HeaderRow.Cells
                cell.BackColor = gvEvent.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In gvEvent.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = gvEvent.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = gvEvent.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            gvEvent.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using
    End Sub
    'Protected Sub gvEvent_RowDataBound1(sender As Object, e As GridViewRowEventArgs)
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
    '        If Session("RoleId") = "2" Then
    '            buttonId.Visible = False
    '        End If
    '    End If
    'End Sub
    'Protected Sub btnUpdate_Click1(sender As Object, e As EventArgs)
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New MySqlConnection(constr)
    '        Using cmd As New MySqlCommand("UPDATE labourregistration SET  Name=@Name, AdharCardNumber=@AdharCardNumber,MobileNumber=@MobileNumber,PresentAddress=@PresentAddress,NativeAddress=@NativeAddress WHERE ID = @MigrantsId", con)
    '            cmd.Parameters.AddWithValue("@MigrantsId", Convert.ToInt32(lblContactId.Text))
    '            cmd.Parameters.AddWithValue("@Name", textName.Text)
    '            cmd.Parameters.AddWithValue("@EmailID", Email.Text)
    '            cmd.Parameters.AddWithValue("@MobileNumber", Mobile.Text)
    '            cmd.Parameters.AddWithValue("@Address", Address.Text)
    '            cmd.Parameters.AddWithValue("@Posting", txtPosting.Text)
    '            cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text)
    '            cmd.Parameters.AddWithValue("@Specalization", txtSpecalization.Text)
    '            cmd.Parameters.AddWithValue("@Avlable", txtAvalability.Text)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            MessageUpdated.Text = "<b>Updated successfull.</b>"
    '            con.Close()
    '            con.Dispose()
    '        End Using
    '    End Using
    '    gvEvent.EditIndex = -1
    '    BindGridView()
    'End Sub


    'Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
    '    Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New MySqlConnection(constr)
    '        Using cmd As New MySqlCommand("update labourregistration set IsDeleted=@IsDeleted WHERE ID = @Id", con)
    '            cmd.Parameters.AddWithValue("@Id", Id)
    '            cmd.Parameters.AddWithValue("@IsDeleted", True)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            MessageUpdated.Text = "<b>Delete successfull.</b>"
    '            con.Close()
    '            con.Dispose()
    '        End Using
    '    End Using
    '    BindGridView()
    'End Sub

    'Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
    '    txtSearch.Text = ""
    '    BindGridView()
    'End Sub
    ''Else
    '                Using cmd As New MySqlCommand("Select * from labourregistration WHERE IsDeleted=false' order by Id desc")
    '                    Using sda As New MySqlDataAdapter(cmd)
    '                        cmd.Connection = con
    '                        con.Open()
    '                        Dim ds As New DataSet()
    '                        sda.Fill(ds)
    '                        If ds.Tables(0).Rows.Count > 0 Then
    '                            lblRecords.Text = ds.Tables(0).Rows.Count
    '                            gvEvent.DataSource = ds
    '                            gvEvent.DataBind()
    '                        End If
    '                        con.Close()
    '                        con.Dispose()
    '                    End Using
    '                End Using
    '            End If

    '        Else
    '            If DropDownList1.SelectedValue = "All" Then
    '                Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration WHERE IsDeleted=false and (Name LIKE '%" + txtSearch.Text.Trim() + "%' or Mobile LIKE '%" + txtSearch.Text.Trim() + "%') order by Id desc")
    '                    Using sda As New MySqlDataAdapter(cmd)
    '                        cmd.Connection = con
    '                        con.Open()
    '                        Dim ds As New DataSet()
    '                        sda.Fill(ds)
    '                        If ds.Tables(0).Rows.Count > 0 Then
    '                            lblRecords.Text = ds.Tables(0).Rows.Count
    '                            gvEvent.DataSource = ds
    '                            gvEvent.DataBind()
    '                        End If
    '                        con.Close()
    '                        con.Dispose()
    '                    End Using
    '                End Using
    '            Else
    '                Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration WHERE IsDeleted and ExamType='" + DropDownList1.SelectedValue + "' and (Name LIKE '%" + txtSearch.Text.Trim() + "%' or Mobile LIKE '%" + txtSearch.Text.Trim() + "%') order by Id desc")
    '                    Using sda As New MySqlDataAdapter(cmd)
    '                        cmd.Connection = con
    '                        con.Open()
    '                        Dim ds As New DataSet()
    '                        sda.Fill(ds)
    '                        If ds.Tables(0).Rows.Count > 0 Then
    '                            lblRecords.Text = ds.Tables(0).Rows.Count
    '                            gvEvent.DataSource = ds
    '                            gvEvent.DataBind()
    '                        End If
    '                        con.Close()
    '                        con.Dispose()
    '                    End Using
    '                End Using
    '            End If
    '        End If
    '    End Using
    'End Sub


End Class