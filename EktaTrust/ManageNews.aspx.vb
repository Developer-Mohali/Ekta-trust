Imports MySql.Data.MySqlClient

Public Class ManageNews

    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim con As New MySqlConnection(constr)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
        End If

        btnUpdate.Visible = False
        btnCancel.Visible = False
        lblMessage.Text = ""

    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim cmd As MySqlCommand = New MySqlCommand("insert into TblNewsDetails(NewsTitle,NewsDescription,CreatedDate,IsActive,IsDeleted) values(@NewsTitle,@NewsDescp,@CreatedDate,@IsActive,@IsDeleted)", con)
        con.Open()
        cmd.Parameters.AddWithValue("@NewsTitle", txtNewsTitle.Text)
        cmd.Parameters.AddWithValue("@NewsDescp", txtNews.Text)
        cmd.Parameters.AddWithValue("@CreatedDate", DateAndTime.Now)
        cmd.Parameters.AddWithValue("@IsActive", True)
        cmd.Parameters.AddWithValue("@IsDeleted", False)
        cmd.ExecuteNonQuery()
        con.Close()
        BindGridView()
        lblMessage.Text = "Inserted Sucessfully"
        lblMessage.ForeColor = System.Drawing.Color.Green
    End Sub

    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        hdnid.Value = gvNews.DataKeys(gvrow.RowIndex).Value.ToString()
        txtNewsTitle.Text = gvrow.Cells(0).Text
        txtNews.Text = gvrow.Cells(1).Text
        chkactive.Checked = gvrow.Cells(3).Text
        btnAdd.Visible = False
        btnCancel.Visible = True
        btnUpdate.Visible = True

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Dim cmd As MySqlCommand = New MySqlCommand("update TblNewsDetails set NewsTitle=@NewsTitle, NewsDescription=@NewsDescp,ModifiedDate=@ModifiedDate, IsActive=@Isactive  WHERE ID = @Id", con)
        con.Open()
        cmd.Parameters.AddWithValue("@Id", hdnid.Value)
        cmd.Parameters.AddWithValue("@NewsTitle", txtNewsTitle.Text)
        cmd.Parameters.AddWithValue("@NewsDescp", txtNews.Text)
        cmd.Parameters.AddWithValue("@ModifiedDate", DateAndTime.Now)
        cmd.Parameters.AddWithValue("Isactive", chkactive.Checked).ToString()
        cmd.ExecuteNonQuery()
        con.Close()
        BindGridView()
        btnUpdate.Visible = True
        btnCancel.Visible = True
        lblMessage.Text = "Updated Sucessfully"
        lblMessage.ForeColor = System.Drawing.Color.Green

    End Sub

    Protected Sub gvNews_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvNews.DataKeys(e.RowIndex).Values(0))
        Dim cmd As New MySqlCommand("update TblNewsDetails set IsDeleted=@IsDeleted WHERE ID = @Id", con)
        cmd.Parameters.AddWithValue("@Id", Id)
            cmd.Parameters.AddWithValue("@IsDeleted", True)
            cmd.Connection = con
            con.Open()
            cmd.ExecuteNonQuery()
        lblMessage.Text = "<b>Deleted Successfully.</b>"
        lblMessage.ForeColor = System.Drawing.Color.Green
        con.Close()
        con.Dispose()
        BindGridView()
    End Sub

    Protected Sub gvNews_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvNews.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub
    Private Sub BindGridView()
        Dim cmd As New MySqlCommand("Select * from TblNewsDetails WHERE IsDeleted=0  order by ID desc")
        Using sda As New MySqlDataAdapter(cmd)
            cmd.Connection = con
            con.Open()
            Dim ds As New DataSet()
            sda.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                gvNews.DataSource = ds
                gvNews.DataBind()
            End If
            con.Close()

        End Using
    End Sub
    Public Sub Clear()
        txtNews.Text = ""
        txtNewsTitle.Text = ""
        lblMessage.Text = ""

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
        Clear()
        btnAdd.Visible = True
        btnUpdate.Visible = False
        btnCancel.Visible = False
    End Sub
End Class