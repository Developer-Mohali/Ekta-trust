Imports MySql.Data.MySqlClient

Public Class UserDetails
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim roleId = ""
        If Session("RoleId") IsNot Nothing Then
            roleId = Session("RoleId").ToString()
        Else
            Response.Redirect("LogIn.aspx")
        End If


        If roleId = "2" Then
            Button2.Visible = False
        Else
            Button2.Visible = True
        End If
        If Not IsPostBack Then
            BindRoledropdown()
            gvUser.AllowPaging = True
            gvUser.PageSize = 15
            BindGridView()
        End If
    End Sub


    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Try
                If txtSearch.Text = "" Then
                    Using cmd As New MySqlCommand("select id,Name,EmailAddress,Address,MobileNumber,role.roleName from User INNER JOIN role on User.RoleId=role.RoleId order by Id desc")
                        'Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                            lblRecords.Text = ds.Tables(0).Rows.Count
                            gvUser.DataSource = ds
                            gvUser.DataBind()
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using

                Else
                    Using cmd As New MySqlCommand("select id,Name,EmailAddress,Address,MobileNumber,role.roleName from User INNER JOIN role on User.RoleId=role.RoleId  WHERE Name LIKE '%" + txtSearch.Text.Trim() + "%' or EmailAddress LIKE '%" + txtSearch.Text.Trim() + "%' order by Id desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                            lblRecords.Text = ds.Tables(0).Rows.Count
                            gvUser.DataSource = ds
                            gvUser.DataBind()
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                End If
            Catch ex As Exception

            End Try
        End Using

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Me.BindGridView()
    End Sub

    Protected Sub gvUser_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvUser.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)

                Using cmd As New MySqlCommand("Delete from User  WHERE Id= @Id", con)
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



    'This function used to role get and bind dropdown.'
    Protected Sub BindRoledropdown()
        Try
            'conenction path for database
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim roleId = Session("RoleId").ToString()
                con.Open()
                Dim cmd As New MySqlCommand("Select RoleName,RoleId from role where RoleId <> 1", con)
                Dim da As New MySqlDataAdapter(cmd)
                Dim ds As New DataSet()
                da.Fill(ds)
                con.Close()

                drpRole.DataSource = ds
                drpRole.DataTextField = "RoleName"
                drpRole.DataValueField = "RoleId"
                drpRole.DataBind()

                'Select "BIB User" by text
                Dim item = drpRole.Items.FindByText("BIB User")
                If item IsNot Nothing Then
                    drpRole.ClearSelection()
                    item.Selected = True
                End If

            End Using
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Dim btndetails As ImageButton = TryCast(sender, ImageButton)
            Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
            id.Text = gvUser.DataKeys(gvrow.RowIndex).Value.ToString()
            'lblCategory.Text = gvrow.Cells(0).Text

            Dim smsType = gvrow.Cells(3).Text
            'If smsType = "SMS" Then
            '    MessageUpdated.Text = "<b>Don't Edit SMS</b>"
            '    txtMessage.Visible = False
            '    pnlpopup.Visible = False
            'ElseIf smsType = "EMAIL" Then

            Using cmd As New MySqlCommand("Select * from User WHERE ID=" + id.Text + "")
                Dim GetData As New List(Of SendEmail)()
                cmd.Connection = con
                con.Open()
                Using sdr As MySqlDataReader = cmd.ExecuteReader()
                    While (sdr.Read())
                        Dim roleId = Session("RoleId").ToString()
                        btnUpdate.Text = "Update"
                        lblId.Visible = True
                        txtName.Text = sdr("Name").ToString()
                        txtEmail.Text = sdr("EmailAddress").ToString()
                        hdnOriginalEmail.Value = sdr("EmailAddress").ToString()
                        txtMobile.Text = sdr("MobileNumber").ToString()
                        txtAddress.Text = sdr("Address").ToString()
                        txtPassword.Attributes("value") = sdr("Password").ToString()
                        txtConfirmPass.Attributes("value") = sdr("Password").ToString()
                        txtBibUserLimit.Text = sdr("BIBUserLimit").ToString()
                        drpRole.SelectedValue = sdr("RoleId").ToString()

                    End While
                End Using

            End Using

            'txtMessage.Visible = True
            'pnlpopup.Visible = True
            'End If
            Me.ModalPopupExtender1.Show()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        If id.Text = "" Then
            Try
                Using con As New MySqlConnection(constr)
                    Dim body As String
                    Using result As New MySqlCommand("Select EmailAddress From User WHERE LOWER(EmailAddress) = LOWER(@EmailAddress)")
                        Using sda1 As New MySqlDataAdapter(result)
                            result.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim())
                            result.Connection = con
                            con.Open()
                            Dim dt As New DataTable()
                            sda1.Fill(dt)
                            If dt.Rows.Count > 0 Then
                                MessageUpdated.Text = "<b style='color:red;'>Email already exists.</b>"
                            Else
                                Using cmd As New MySqlCommand("Insert into User(Name,EmailAddress,Address,MobileNumber,Password,CreatedDate,RoleId,BIBUserLimit)values(@Name,@EmailAddress,@Address,@MobileNumber,@Password,@CreatedDate,@RoleId,@BIBUserLimit)")
                                    Using sda As New MySqlDataAdapter()

                                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim())
                                        cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim())
                                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text.Trim())
                                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim())
                                        cmd.Parameters.AddWithValue("@RoleId", drpRole.SelectedValue.Trim())
                                        cmd.Parameters.AddWithValue("@CreatedDate", DateAndTime.Now)
                                        cmd.Parameters.AddWithValue("@BIBUserLimit", If(String.IsNullOrWhiteSpace(txtBibUserLimit.Text), DBNull.Value, txtBibUserLimit.Text.Trim()))
                                        cmd.Connection = con
                                        cmd.ExecuteNonQuery()
                                        Dim subject = "Register New User"
                                        body = "Hi " + txtName.Text + ", <br/><br/>Your account has been created successfully.<br/><br/>Your account details are-<br/></br><b>Email Id- </b>" + txtEmail.Text + "<br/><b>Password-</b>" + txtPassword.Text + "<br/><br/><a href='https://ektatrust.org.in/login' target='_blank'>Login here</a><br/><br/> Thanks and Regards," + "<br/>Ekta Navnirman Trust. <br/>Site Administrator.<br/>"
                                        SendEmail.sendMailUser(txtEmail.Text, subject, body)
                                        Reset()
                                        MessageUpdated.Text = "<b>Submit Successfull.</b>"
                                        con.Close()
                                        con.Dispose()
                                        'gvUser.EditIndex = -1
                                        'BindGridView()

                                    End Using
                                End Using
                            End If
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                End Using

            Catch ex As Exception
                SendEmail.log("ErrorStep1", ex.Message, "UserDetailsUpdation", "", "", "", "", "")
            End Try
        Else
            Try
                If Not String.Equals(txtEmail.Text.Trim(),
                     hdnOriginalEmail.Value.Trim(),
                     StringComparison.OrdinalIgnoreCase) Then

                    ' Email changed → check duplicate
                    If IsEmailDuplicate(txtEmail.Text) Then
                        MessageUpdated.Text = "<b style='color:red;'>Email already exists.</b>"
                        Exit Sub
                    End If

                End If
                Using con As New MySqlConnection(constr)
                    Using cmd As New MySqlCommand("UPDATE User SET  Name=@Name,EmailAddress=@EmailAddress,Address=@Address,MobileNumber=@MobileNumber,RoleId=@RoleId,BIBUserLimit=@BIBUserLimit,Password=@Password WHERE Id = @Id", con)
                        cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(id.Text))
                        cmd.Parameters.AddWithValue("@Name", txtName.Text)
                        cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text)
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text)
                        cmd.Parameters.AddWithValue("@RoleId", drpRole.SelectedValue)
                        cmd.Parameters.AddWithValue("@BIBUserLimit", If(String.IsNullOrWhiteSpace(txtBibUserLimit.Text), DBNull.Value, txtBibUserLimit.Text.Trim()))
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim())
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                        con.Dispose()
                        ' gvUser.EditIndex = -1
                        'BindGridView()
                        MessageUpdated.Text = "<b>Updated successfull.</b>"

                    End Using
                End Using
            Catch ex As Exception

            End Try
        End If

        gvUser.EditIndex = -1
        BindGridView()
    End Sub

    Private Function IsEmailDuplicate(email As String) As Boolean
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT COUNT(*) FROM User WHERE LOWER(EmailAddress) = LOWER(@Email)", con)

                cmd.Parameters.AddWithValue("@Email", email.Trim())

                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar()) > 0
                con.Close()
                con.Dispose()
            End Using
        End Using
    End Function


    Protected Sub gvUser_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        txtPassword.Visible = True
        txtConfirmPass.Visible = True
        lblId.Visible = False
        lblConfirmPass.Visible = True
        lblPassword.Visible = True
        Reset()
        Me.ModalPopupExtender1.Show()
    End Sub

    Public Function Reset()
        hdnOriginalEmail.Value = String.Empty
        btnUpdate.Text = "Add"
        txtAddress.Text = String.Empty
        txtEmail.Text = String.Empty
        txtMobile.Text = String.Empty
        txtName.Text = String.Empty

        ' For password fields, you need to change the TextMode temporarily
        txtConfirmPass.TextMode = TextBoxMode.SingleLine
        txtConfirmPass.Text = String.Empty
        txtConfirmPass.TextMode = TextBoxMode.Password
        txtPassword.TextMode = TextBoxMode.SingleLine
        txtPassword.Text = String.Empty
        txtPassword.TextMode = TextBoxMode.Password

        txtSearch.Text = String.Empty
        id.Text = String.Empty
        txtBibUserLimit.Text = ""
        drpRole.ClearSelection()
    End Function

End Class