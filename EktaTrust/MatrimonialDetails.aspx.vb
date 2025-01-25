Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Drawing

Public Class MatrimonialDetails

    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Private ctrl As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'this is use to load 15 recordes at a time in gridview
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            gridRequestDetails.AllowPaging = True
            gridRequestDetails.PageSize = 15
            BindGridView()
            requestpanel.Visible = False
        End If

    End Sub

    ' this function is used to show some information in gride view and seach by name and mobile no
    Private Sub BindGridView()
        matrimonialPanel.Visible = True
        requestpanel.Visible = False
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try

            Using con As New MySqlConnection(constr)
                If txtSearch.Text = "" Then

                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(DateOfBirth,'%d/%m/%Y') as DOB,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR  from matrimonialDetails WHERE IsDeleted=false order by Id desc")
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
                    Using cmd As New MySqlCommand("Select *,DATE_FORMAT(DateOfBirth,'%d/%m/%Y') as DOB,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR  from matrimonialDetails WHERE (Name LIKE '%" + txtSearch.Text.Trim() + "%' or PhoneNo LIKE '%" + txtSearch.Text.Trim() + "%') and IsDeleted=false order by Id desc")
                        'Using cmd As New MySqlCommand("Select *,DATE_FORMAT(DateOfBirth,'%d/%m/%Y') as DOB from matrimonialDetails WHERE (Name LIKE '%" + txtSearch.Text.Trim() + "%' or PhoneNo LIKE '%" + txtSearch.Text.Trim() + "%') and IsDeleted=false order by Id desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            Dim dt As New DataTable()
                            sda.Fill(dt)
                            lblRecords.Text = dt.Rows.Count
                            gvEvent.DataSource = dt
                            gvEvent.DataBind()
                            'con.Close()
                            'con.Dispose()
                        End Using
                        con.Close()
                        con.Dispose()
                    End Using
                End If

            End Using
        Catch ex As Exception

        End Try

    End Sub

    ' this function is used to delete the user by admin
    Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Dim ds As New DataSet()
            Dim SendEmail As SendEmail = New SendEmail()
            Dim messageBody As String = String.Empty
            Dim email As String = String.Empty
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("update matrimonialDetails set IsDeleted=@IsDeleted WHERE ID = @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Id)
                    cmd.Parameters.AddWithValue("@IsDeleted", True)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    MessageUpdated.Text = "<b>Delete successfully!</b>"
                    con.Close()
                    con.Dispose()

                    Dim objcmd As New MySqlCommand("select Name, EmailId from matrimonialDetails where ID =@id", con)
                    objcmd.Parameters.AddWithValue("@id", Id)
                    objcmd.Connection = con
                    con.Open()
                    objcmd.ExecuteNonQuery()
                    con.Close()
                    con.Dispose()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    Dim da As New MySqlDataAdapter(objcmd)
                    Dim dt As New DataTable()
                    da.Fill(ds)
                    messageBody = "<p>Dear " & Convert.ToString(ds.Tables(0).Rows(0)("Name")) & ",</p><p>Your account has been deleted </p><p>From Ekta Navnirman Trust.</p><p>Regards,</p><br/>Administrator<br/>Ekta Navnirman Trust</p>"
                    email = Convert.ToString(ds.Tables(0).Rows(0)("EmailId"))
                    SendEmail.EventsendMailUser(email, "Notification for account delete", messageBody)
                End Using
            End Using
            BindGridView()
        Catch ex As Exception
        End Try
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
    End Sub

    ' this function is used to show all details of the Selected user

    Protected Sub imgbtn_Click1(sender As Object, e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        Dim id As Integer = gvEvent.DataKeys(gvrow.RowIndex).Value.ToString()
        GetProfileData(id)
        Me.ModalPopupExtender1.Show()
    End Sub


    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub

    ' this is used for search button click
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

    Protected Sub gvEvent_RowDataBound1(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub

    'this function is used to 
    Protected Function GetProfileData(id)
        Dim Name As String = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Dim extension As String
            Dim Imageurl As String
            Dim objDataReader As MySqlDataReader
            Try
                'HiddenViewUserId.Value = Session("ID").ToString()
                Using objSqlCmd As New MySqlCommand("Select * from matrimonialDetails WHERE ID = @id")
                    objSqlCmd.Parameters.AddWithValue("@id", id)
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()
                    If objDataReader.Read() Then
                        Imageurl = objDataReader(35).ToString()
                        extension = System.IO.Path.GetExtension(Imageurl)
                        lblEmail.Text = objDataReader(1).ToString()
                        lblName.Text = objDataReader(3).ToString()
                        lblMobileNo.Text = objDataReader(2).ToString()

                        lblFatherName.Text = objDataReader(4).ToString()
                        lblMotherName.Text = objDataReader(5).ToString()
                        lblAddress.Text = objDataReader(6).ToString()
                        lblDateOfBirth.Text = Convert.ToDateTime(objDataReader(7).ToString())
                        lblGender.Text = objDataReader(8).ToString()
                        lblCategory.Text = objDataReader(9).ToString()

                        lblMotherProfession.Text = objDataReader(11).ToString()
                        lblFatherProfession.Text = objDataReader(12).ToString()
                        lblEducation.Text = objDataReader(13).ToString()
                        lblfamilySocialWork.Text = objDataReader(14).ToString()
                        lblFamilyDisease.Text = objDataReader(15).ToString()
                        lblFamilyAchievement.Text = objDataReader(16).ToString()
                        labelDor.Text = objDataReader(17).ToString()
                        lblLastName.Text = objDataReader(21).ToString()
                        lblNativePlace.Text = objDataReader(22).ToString()
                        lblFoodHabbit.Text = objDataReader(24).ToString()
                        lblLanguage.Text = objDataReader(25).ToString()

                        lblSmoke.Text = objDataReader(26).ToString()
                        lblDrink.Text = objDataReader(27).ToString()
                        lblGrandFather.Text = objDataReader(28).ToString()
                        lblGrandMother.Text = objDataReader(29).ToString()
                        lblNoOfBrothers.Text = objDataReader(30).ToString()
                        lblMarriedBrothers.Text = objDataReader(31).ToString()
                        lblNoOfSisters.Text = objDataReader(32).ToString()
                        lblMarriedSisters.Text = objDataReader(33).ToString()
                        lblFamilyFoodType.Text = objDataReader(34).ToString()
                        lblPartnerMaritalStatus.Text = objDataReader(41).ToString()
                        lblPartnerQualification.Text = objDataReader(40).ToString()
                        lblPartnerAgeRange.Text = objDataReader(38).ToString() + " To " + objDataReader(39).ToString()
                        lblPartnerHeightRange.Text = objDataReader(43).ToString() + " To " + objDataReader(44).ToString()
                        lblHeight.Text = objDataReader(42).ToString()
                        lblWeight.Text = objDataReader(45).ToString() + "KG"
                        lblQualification.Text = objDataReader(20).ToString()
                        lblMaritalStatus.Text = objDataReader(47).ToString()

                        lblOccupationType.Text = objDataReader(48).ToString()
                        lblAnnualIncome.Text = objDataReader(49).ToString()
                        lblJobDiscription.Text = objDataReader(50).ToString()
                        lblOccupation.Text = objDataReader(10).ToString()
                        lblPostingUpdate.Text = objDataReader(23).ToString()
                        lblPermanentAddress.Text = objDataReader(46).ToString()
                        Name = objDataReader(3).ToString()
                    End If
                End Using
            Catch ex As Exception
                Response.Redirect("MatrimonialDetails.aspx")
            End Try
        End Using
        Return Name
    End Function

    Protected Sub btnShowRequest_Click(sender As Object, e As EventArgs)
        Me.RequestGridBind()
    End Sub

    Private Sub RequestGridBind()

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            requestpanel.Visible = True
            matrimonialPanel.Visible = False
            Using con As New MySqlConnection(constr)
                If txtSearchRequest.Text = "" Then
                    Using cmd As New MySqlCommand("Select ID, Name, EmailId, PhoneNo, Gender, DATE_FORMAT(DateOfBirth,'%d/%m/%Y') as DOB, case DeleteAccountRequest when 0 then 'No Request' else 'Request Delete' END AS DeleteAccountRequest from matrimonialDetails WHERE DeleteAccountRequest=True and IsDeleted=false order by RequestDateForAccountDelete desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            Dim ds As New DataSet()
                            sda.Fill(ds)
                            If ds.Tables(0).Rows.Count > 0 Then
                                lblRecordCount.Text = ds.Tables(0).Rows.Count
                                gridRequestDetails.DataSource = ds
                                gridRequestDetails.DataBind()
                            End If
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using

                Else
                    Using cmd As New MySqlCommand("Select ID, Name, EmailId, PhoneNo, Gender, DATE_FORMAT(DateOfBirth,'%d/%m/%Y') as DOB, case DeleteAccountRequest when 0 then 'No Request' else 'Request Delete' END AS DeleteAccountRequest from matrimonialDetails WHERE Name LIKE '%" + txtSearchRequest.Text.Trim() + "%' or PhoneNo LIKE '%" + txtSearchRequest.Text.Trim() + "%' and DeleteAccountRequest=True and IsDeleted=false order by RequestDateForAccountDelete desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            'cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim())
                            Dim dt As New DataTable()
                            sda.Fill(dt)
                            gridRequestDetails.DataSource = dt
                            gridRequestDetails.DataBind()
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                End If

            End Using
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSearchRequest_Click(sender As Object, e As EventArgs)
        Me.RequestGridBind()
    End Sub

    Protected Sub btnMatrimonialAll_Click(sender As Object, e As EventArgs)
        Me.BindGridView()
    End Sub

    Protected Sub gridRequestDetails_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridRequestDetails.PageIndex = e.NewPageIndex
        Me.RequestGridBind()
    End Sub

    Protected Sub gridRequestDetails_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gridRequestDetails.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Dim ds As New DataSet()
            Dim SendEmail As SendEmail = New SendEmail()
            Dim messageBody As String = String.Empty
            Dim email As String = String.Empty
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("update matrimonialDetails set IsDeleted=@IsDeleted WHERE ID = @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Id)
                    cmd.Parameters.AddWithValue("@IsDeleted", True)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    lblRequestMessage.Text = "<b>Delete successfully!</b>"
                    con.Close()
                    con.Dispose()

                    Dim objcmd As New MySqlCommand("select Name, EmailId from matrimonialDetails where ID =@id", con)
                    objcmd.Parameters.AddWithValue("@id", Id)
                    objcmd.Connection = con
                    con.Open()
                    objcmd.ExecuteNonQuery()
                    con.Close()
                    con.Dispose()
                    'userId = Convert.ToInt32(cmd.ExecuteScalar())
                    Dim da As New MySqlDataAdapter(objcmd)
                    Dim dt As New DataTable()
                    da.Fill(ds)
                    messageBody = "<p>Dear " & Convert.ToString(ds.Tables(0).Rows(0)("Name")) & ",</p><p>Your account has been deleted </p><p>From Ekta Navnirman Trust.</p><p>Regards,</p><br/>Administrator<br/>Ekta Navnirman Trust</p>"
                    email = Convert.ToString(ds.Tables(0).Rows(0)("EmailId"))
                    SendEmail.EventsendMailUser(email, "Notification for account delete", messageBody)
                End Using
            End Using
            RequestGridBind()
        Catch ex As Exception
        End Try
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "HideLabel();", True)
    End Sub

    Protected Sub gridRequestDetails_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub

    ' This method is used for download details in word document.
    Protected Sub btnDelete_Click1(sender As Object, e As ImageClickEventArgs)

        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        Dim id As Integer = gvEvent.DataKeys(gvrow.RowIndex).Value.ToString()
        Dim Name As String = GetProfileData(id)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.word"
        Response.ContentEncoding = System.Text.Encoding.UTF8
        Response.AddHeader("Content-Disposition", "attachment;filename=" + Name + ".doc")
        Response.Charset = ""
        EnableViewState = False
        Dim table As New Table()
        Dim row As New TableRow()
        row.Cells.Add(New TableCell())
        row.Cells(0).Controls.Add(divRecord)
        table.Rows.Add(row)
        Dim oStringWriter As New System.IO.StringWriter()
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)
        table.RenderControl(oHtmlTextWriter)
        Response.Write(oStringWriter.ToString())
        Response.[End]()
    End Sub

End Class