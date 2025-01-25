Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Drawing


Public Class MIPRegistrationDetails
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
    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            If txtSearch.Text = "" Then
                If DropDownList1.SelectedValue = "All" Then
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE IsDeleted=false order by Id desc")
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
                Else
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE ExamType='" + DropDownList1.SelectedValue + "' and IsDeleted=false order by Id desc")
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
                End If
            Else
                If DropDownList1.SelectedValue = "All" Then
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE IsDeleted=false and (Name LIKE '%" + txtSearch.Text.Trim() + "%' or Mobile LIKE '%" + txtSearch.Text.Trim() + "%') order by Id desc")
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
                Else
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE IsDeleted=false and ExamType='" + DropDownList1.SelectedValue + "' and (Name LIKE '%" + txtSearch.Text.Trim() + "%' or Mobile LIKE '%" + txtSearch.Text.Trim() + "%') order by Id desc")
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
                End If
            End If
        End Using
    End Sub


    Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("update MIPRegistration set IsDeleted=@IsDeleted WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Id)
                cmd.Parameters.AddWithValue("@IsDeleted", True)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Delete successfull.</b>"
                con.Close()
                con.Dispose()
            End Using
        End Using
        BindGridView()
    End Sub


    Protected Sub imgbtn_Click1(sender As Object, e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblContactId.Text = gvEvent.DataKeys(gvrow.RowIndex).Value.ToString()
        Dim roleId = Session("RoleId").ToString()
        If roleId = "2" Then
            textName.Text = gvrow.Cells(0).Text
            RollNo.Text = gvrow.Cells(1).Text
            Address.Text = gvrow.Cells(2).Text
            Email.Text = gvrow.Cells(3).Text
            Mobile.Text = gvrow.Cells(4).Text
            Mobile.ReadOnly = True
            Email.ReadOnly = True
            Address.ReadOnly = True
            RollNo.ReadOnly = True
            textName.ReadOnly = True
            btnUpdate.Visible = False

        Else
            textName.Text = gvrow.Cells(0).Text
            RollNo.Text = gvrow.Cells(1).Text
            Address.Text = gvrow.Cells(2).Text
            Email.Text = gvrow.Cells(3).Text
            Mobile.Text = gvrow.Cells(4).Text
        End If

        Me.ModalPopupExtender1.Show()
    End Sub

    Protected Sub lnkDownload_Click(sender As Object, e As EventArgs)
        Dim filePath As String = CType(sender, LinkButton).CommandArgument
        Response.ContentType = ContentType
        filePath = Path.Combine(Server.MapPath("/UploadFile/"), filePath)
        Response.AppendHeader("Content-Disposition", ("attachment; filename=" + Path.GetFileName(filePath)))
        Response.WriteFile(filePath)
        Response.End()
    End Sub

    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub



    Protected Sub btnUpdate_Click1(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE MIPRegistration SET  Name=@Name,RollNo=@RollNo, Email=@EmailID,Mobile=@MobileNumber,Address=@Address  WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(lblContactId.Text))
                cmd.Parameters.AddWithValue("@Name", textName.Text)
                cmd.Parameters.AddWithValue("@EmailID", Email.Text)
                cmd.Parameters.AddWithValue("@MobileNumber", Mobile.Text)
                cmd.Parameters.AddWithValue("@RollNo", RollNo.Text)
                cmd.Parameters.AddWithValue("@Address", Address.Text)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Updated successfull.</b>"
                con.Close()
                con.Dispose()
            End Using
        End Using
        gvEvent.EditIndex = -1
        BindGridView()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.BindGridView()
    End Sub

    Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = Regex.Replace(e.Row.Cells(0).Text, txtSearch.Text.Trim(),
            Function(match As Match) String.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value),
                        RegexOptions.IgnoreCase)
        End If

    End Sub




    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub

    Protected Sub Button1_Click1(sender As Object, e As EventArgs)
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

    Protected Sub gvEvent_RowDataBound1(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        txtSearch.Text = ""
        BindGridView()
    End Sub

    '================DropDownlist for filter by Year==========================
    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs)
        txtSearch.Text = ""
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            If txtSearch.Text = "" Then
                If DropDownList2.SelectedValue = "All" Then
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE IsDeleted=false order by Id desc")
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
                Else
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from MIPRegistration WHERE EXTRACT(YEAR FROM CreateDate) ='" + DropDownList2.SelectedValue + "' and IsDeleted=false order by Id desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                            If ds.Tables(0).Rows.Count > 0 Then
                                lblRecords.Text = ds.Tables(0).Rows.Count
                                gvEvent.DataSource = ds
                                gvEvent.DataBind()
                            Else
                                lblRecords.Text = 0
                                gvEvent.DataSource = Nothing
                                gvEvent.DataBind()
                            End If
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                End If
            End If

        End Using
        '================DropDownlist for filter by Year End==========================

    End Sub

End Class