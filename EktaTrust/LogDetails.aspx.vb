Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO

Public Class LogDetails
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
                Using cmd As New MySqlCommand("Select * from log Where IsDeleted=false order by Id desc")
                    'Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        sda.SelectCommand = cmd
                        'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
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
                Using cmd As New MySqlCommand("Select * from log WHERE IsDeleted=false And Id LIKE '%" + txtSearch.Text.Trim() + "%' order by Id desc")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        gvEvent.DataSource = dt
                        gvEvent.DataBind()
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End If

        End Using

    End Sub


    Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("update log set IsDeleted=@IsDeleted WHERE ID = @Id", con)
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

    'Protected Sub lnkDownload_Click(sender As Object, e As EventArgs)
    '    Dim filePath As String = CType(sender, LinkButton).CommandArgument
    '    Response.ContentType = ContentType
    '    filePath = Path.Combine(Server.MapPath("/UploadFile/"), filePath)
    '    Response.AppendHeader("Content-Disposition", ("attachment; filename=" + Path.GetFileName(filePath)))
    '    Response.WriteFile(filePath)
    '    Response.End()
    'End Sub

    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub



    'Protected Sub btnUpdate_Click1(sender As Object, e As EventArgs)
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New MySqlConnection(constr)
    '        Using cmd As New MySqlCommand("UPDATE MIPFacultyRegistration SET  Name=@Name, Email=@EmailID,Mobile=@MobileNumber,Address=@Address,Posting=@Posting,Occupatoin=@Occupation,SubjectSpecialistion=@Specalization,DateOfAvailabil=@Avlable WHERE ID = @Id", con)
    '            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(lblContactId.Text))
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
End Class