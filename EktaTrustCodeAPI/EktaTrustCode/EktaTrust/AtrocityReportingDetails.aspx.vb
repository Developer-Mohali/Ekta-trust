Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Drawing
Public Class AtrocityReportingDetails
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
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

                    Using cmd As New MySqlCommand("SELECT Id,ReporterName,ReporterEmail,ReporterPhone,Details,VictimsName,VictimsMobile,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR FROM ektatrust.AtrocitiesReporting where DeletedStatus= false order by Id desc")
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
                    Using cmd As New MySqlCommand("SELECT Id,ReporterName,ReporterEmail,ReporterPhone,Details,VictimsName,VictimsMobile,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR FROM ektatrust.AtrocitiesReporting where ReporterName LIKE '%" + txtSearch.Text.Trim() + "%' or ReporterPhone LIKE '%" + txtSearch.Text.Trim() + "%' and DeletedStatus=false order by Id desc")
                        Using sda As New MySqlDataAdapter(cmd)
                            cmd.Connection = con
                            con.Open()
                            Dim dt As New DataTable()
                            sda.Fill(dt)
                            gvEvent.DataSource = dt
                            gvEvent.DataBind()
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
    Protected Sub Atrocity_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Dim ds As New DataSet()
            Dim SendEmail As SendEmail = New SendEmail()
            Dim messageBody As String = String.Empty
            Dim email As String = String.Empty
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("update ektatrust.AtrocitiesReporting set DeletedStatus=true where Id = @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Id)
                    cmd.Parameters.AddWithValue("@DeletedDate", DateAndTime.Now)
                    cmd.Parameters.AddWithValue("@DeletedStatus", True)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    MessageUpdated.Text = "<b>Delete successfully!</b>"
                    con.Close()
                    con.Dispose()

                    Dim objcmd As New MySqlCommand("select Id,ReporterName,ReporterEmail,ReporterPhone,Details,VictimsName,VictimsMobile,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR from ektatrust.AtrocitiesReporting where Id =@Id", con)
                    objcmd.Parameters.AddWithValue("@Id", Id)
                    objcmd.Connection = con
                    con.Open()
                    objcmd.ExecuteNonQuery()
                    con.Close()
                    con.Dispose()
                    Dim da As New MySqlDataAdapter(objcmd)
                    Dim dt As New DataTable()
                    da.Fill(ds)
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

    'this function is used to get Atrocities Reporting data in popup menu
    Protected Function GetProfileData(id)

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Dim objDataReader As MySqlDataReader
            Try
                'HiddenViewUserId.Value = Session("ID").ToString()
                Using objSqlCmd As New MySqlCommand("SELECT Id,ReporterName,ReporterEmail,ReporterPhone,Details,VictimsName,VictimsMobile,Place,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR FROM ektatrust.AtrocitiesReporting where Id = @id")
                    objSqlCmd.Parameters.AddWithValue("@Id", id)
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()
                    If objDataReader.Read() Then
                        'Imageurl = objDataReader(35).ToString()
                        'extension = System.IO.Path.GetExtension(Imageurl)
                        reporterName.Text = objDataReader(1).ToString()
                        reporterEmail.Text = objDataReader(2).ToString()
                        reporterPhone.Text = objDataReader(3).ToString()
                        details.Text = objDataReader(4).ToString()
                        victimsName.Text = objDataReader(5).ToString()
                        victimsMobile.Text = objDataReader(6).ToString()
                        place.Text = objDataReader(7).ToString()
                        labelDor.Text = objDataReader(8).ToString()
                    End If
                End Using
            Catch ex As Exception
                Response.Redirect("CareerCounsellingDetails.aspx")
            End Try
        End Using
    End Function
    Protected Sub gridRequestDetails_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridRequestDetails.PageIndex = e.NewPageIndex
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

    Protected Sub gridRequestDetails_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gridRequestDetails.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Dim ds As New DataSet()
            Dim SendEmail As SendEmail = New SendEmail()
            Dim messageBody As String = String.Empty
            Dim email As String = String.Empty
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("update ektatrust.AtrocitiesReporting set DeletedStatus=@IsDeleted WHERE Id = @Id", con)
                    cmd.Parameters.AddWithValue("@Id", Id)
                    cmd.Parameters.AddWithValue("@DeletedStatus", True)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    lblRequestMessage.Text = "<b>Delete successfully!</b>"
                    con.Close()
                    con.Dispose()

                    Dim objcmd As New MySqlCommand("SELECT Id,ReporterName,ReporterEmail,ReporterPhone,Details,VictimsName,VictimsMobile,DATE_FORMAT(CreatedDate,'%d/%m/%Y') as DOR FROM ektatrust.AtrocitiesReporting where Id =@id", con)
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
                    'messageBody = "<p>Dear " & Convert.ToString(ds.Tables(0).Rows(0)("Name")) & ",</p><p>Your account has been deleted </p><p>From Ekta Navnirman Trust.</p><p>Regards,</p><br/>Administrator<br/>Ekta Navnirman Trust</p>"
                    'email = Convert.ToString(ds.Tables(0).Rows(0)("EmailId"))
                    ' SendEmail.EventsendMailUser(email, "Notification for account delete", messageBody)
                End Using
            End Using
            'RequestGridBind()
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
End Class