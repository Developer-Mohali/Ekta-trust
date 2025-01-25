Imports MySql.Data.MySqlClient

Public Class TemplateListing
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("RoleId") Is Nothing Then
            Response.Redirect("/login")

        End If

        If Not IsPostBack Then
            gvTamplate.AllowPaging = True
            gvTamplate.PageSize = 15
            BindGridView()
        End If
    End Sub




    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    
        Using con As New MySqlConnection(constr)
          Try
            If txtSearch.Text = "" Then
                Using cmd As New MySqlCommand("Select * from Template order by Id desc")
                    'Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                            If ds.Tables(0).Rows.Count > 0 Then
                                lblRecords.Text = ds.Tables(0).Rows.Count
                                gvTamplate.DataSource = ds
                                gvTamplate.DataBind()
                            End If
                        con.Close()
                        con.Dispose()
                    End Using
                End Using

            Else
                Using cmd As New MySqlCommand("Select * from Template WHERE TemplateType LIKE '%" + txtSearch.Text.Trim() + "%' or Category LIKE '%" + txtSearch.Text.Trim() + "%' order by Id desc")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                            con.Open()
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                        'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            If ds.Tables(0).Rows.Count > 0 Then
                                lblRecords.Text = ds.Tables(0).Rows.Count
                                gvTamplate.DataSource = ds
                                gvTamplate.DataBind()
                            End If
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End If
 Catch ex As Exception

        End Try
        End Using
   
    End Sub
 

    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Dim btndetails As ImageButton = TryCast(sender, ImageButton)
            Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
            id.Text = gvTamplate.DataKeys(gvrow.RowIndex).Value.ToString()
            lblCategory.Text = gvrow.Cells(0).Text
            Dim roleId = Session("RoleId").ToString()
            Dim smsType = gvrow.Cells(3).Text
         
            If roleId = "2" Then
                Using cmd As New MySqlCommand("Select * from Template WHERE id=" + id.Text + "")
                    Dim GetData As New List(Of SendEmail)()
                    cmd.Connection = con
                    con.Open()
                    Using sdr As MySqlDataReader = cmd.ExecuteReader()
                        While (sdr.Read())
                            txtMessage.Text = sdr("Message").ToString()
                            txtTitle.Text = sdr("Title").ToString()
                            txtMessage.ReadOnly = True
                            txtTitle.ReadOnly = True
                            btnUpdate.Visible = False
                          
                        End While
                    End Using

                End Using
            Else
                Using cmd As New MySqlCommand("Select * from Template WHERE id=" + id.Text + "")
                    Dim GetData As New List(Of SendEmail)()
                    cmd.Connection = con
                    con.Open()
                    Using sdr As MySqlDataReader = cmd.ExecuteReader()
                        While (sdr.Read())
                            txtMessage.Text = sdr("Message").ToString()
                            txtTitle.Text = sdr("Title").ToString()
                        End While
                    End Using

                End Using
            End If
           

            'txtMessage.Visible = True
            'pnlpopup.Visible = True
            'End If
            Me.ModalPopupExtender1.Show()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub gvTamplate_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvTamplate.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub

    Protected Sub gvTamplate_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvTamplate.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)

                Using cmd As New MySqlCommand("Delete from Template  WHERE Id= @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Id)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    MessageUpdated.Text = "<b>Delete successfull.</b>"
                    con.Close()
                    con.Dispose()
                End Using
            End Using
        Catch ex As Exception

        End Try
        BindGridView()
    End Sub

    Protected Sub btnUpdate_Click1(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("UPDATE Template SET  Message=@Message,Title=@Title WHERE Id = @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(id.Text))
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text)
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    MessageUpdated.Text = "<b>Updated successfull.</b>"
                    con.Close()
                    con.Dispose()
                End Using
            End Using
        Catch ex As Exception

        End Try
        gvTamplate.EditIndex = -1
        BindGridView()
    End Sub
  
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
         Me.BindGridView()
    End Sub



    Protected Sub gvTamplate_RowDataBound1(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub
End Class