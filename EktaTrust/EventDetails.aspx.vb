Imports MySql.Data.MySqlClient
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Drawing
Imports System.IO
Imports Newtonsoft.Json

Public Class EventDetails
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
    'This method use To bind Gridview.
    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            'Using cmd As New MySqlCommand("Select *,DATE_FORMAT(CreateDate,'%d/%m/%Y') as CreatedDate from registration WHERE Name LIKE '%" + txtSearch.Text.Trim() + "%' or MobileNumber LIKE '%" + txtSearch.Text.Trim() + "%' order by Id desc")
            Dim Query As String
            Query = "Select *,case RegistrationType when 0 then 'Offline' else 'Online' end RegistrationType from registration
                                            where CreateDate like '%" + ddlYear.Text.Trim() + "%' AND (Name LIKE 
                                            '%" + txtSearch.Text.Trim() + "%' or MobileNumber LIKE '%" + txtSearch.Text.Trim() + "%')
                                             order by Id desc"

            Using cmd As New MySqlCommand(Query)
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Dim ds As New DataSet()
                    sda.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        lblRecords.Text = ds.Tables(0).Rows.Count
                        gvEvent.DataSource = ds
                        gvEvent.DataBind()
                    End If
                End Using
                con.Close()
                con.Dispose()
            End Using
        End Using
    End Sub

    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        BindGridView()
    End Sub

    Protected Sub gvEvent_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM registration WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Deleted successfull.</b>"
                con.Close()
                con.Dispose()
            End Using
        End Using
        BindGridView()
    End Sub

    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblContactId.Text = gvEvent.DataKeys(gvrow.RowIndex).Value.ToString()
        Dim roleId = Session("RoleId").ToString()
        If roleId = "2" Then
            If gvrow.Cells(1).Text = "&nbsp;" Then
                textEmail.Text = ""
            Else
                textEmail.Text = gvrow.Cells(1).Text
            End If
            If gvrow.Cells(3).Text = "&nbsp;" Then
                textAddress.Text = ""
            Else
                textAddress.Text = gvrow.Cells(3).Text
            End If
            textName.Text = gvrow.Cells(0).Text
            textMobile.Text = gvrow.Cells(5).Text
            textEvent.Text = gvrow.Cells(2).Text
            textAddress.ReadOnly = True
            textName.ReadOnly = True
            textMobile.ReadOnly = True
            textEvent.ReadOnly = True
            textEmail.ReadOnly = True
            textDOB.ReadOnly = True
            textGender.ReadOnly = True
            btnUpdate.Visible = False
        Else
            If gvrow.Cells(1).Text = "&nbsp;" Then
                textEmail.Text = ""
            Else
                textEmail.Text = gvrow.Cells(1).Text
            End If
            If gvrow.Cells(3).Text = "&nbsp;" Then
                textAddress.Text = ""
            Else
                textAddress.Text = gvrow.Cells(3).Text
            End If
            textName.Text = gvrow.Cells(0).Text
            textMobile.Text = gvrow.Cells(5).Text
            textEvent.Text = gvrow.Cells(2).Text
            textGender.Text = gvrow.Cells(9).Text
            textDOB.Text = gvrow.Cells(10).Text
        End If
        Me.ModalPopupExtender1.Show()
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Dim dob As DateTime = DateTime.Parse(Request.Form(textDOB.UniqueID))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE registration SET  Name=@Name, EmailID=@EmailID,MobileNumber=@MobileNumber,Event=@Event,Address=@Address,Gender=@Gender,DOB=@DOB  WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(lblContactId.Text))
                cmd.Parameters.AddWithValue("@Name", textName.Text)
                cmd.Parameters.AddWithValue("@EmailID", textEmail.Text)
                cmd.Parameters.AddWithValue("@MobileNumber", textMobile.Text)
                cmd.Parameters.AddWithValue("@Event", textEvent.Text)
                cmd.Parameters.AddWithValue("@Address", textAddress.Text)
                cmd.Parameters.AddWithValue("@Gender", textGender.Text)
                cmd.Parameters.AddWithValue("@DOB", dob)
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

    'Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Cells(0).Text = Regex.Replace(e.Row.Cells(0).Text, txtSearch.Text.Trim(),
    '        Function(match As Match) String.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value),
    '                    RegexOptions.IgnoreCase)
    '    End If
    'End Sub
    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)
        Me.ModalPopupExtender1.Show()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Response.Clear()
        Response.Buffer = True
        Dim fname As DateTime = DateTime.Now
        Response.AddHeader("content-disposition", "attachment;filename=EventDetails" + fname + ".xls")
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

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub

    Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)
            Dim linkbuttonId As LinkButton = DirectCast(e.Row.FindControl("lnkDownload"), LinkButton)
            If linkbuttonId.CommandArgument.Length = 0 Then
                linkbuttonId.Visible = False
            End If
            If Session("RoleId") = "2" Then
                buttonId.Visible = False
            End If
        End If
    End Sub

    ' This method is used to create for download file.
    Protected Sub lnkDownload_Click(sender As Object, e As EventArgs)
        Dim filePath As String = CType(sender, LinkButton).CommandArgument
        Response.ContentType = ContentType
        filePath = Path.Combine(Server.MapPath("/UploadFile/EventRecords/"), filePath)
        Dim filename As String = Path.GetFileName(filePath)
        If filename IsNot "" Then
            Response.AppendHeader("Content-Disposition", ("attachment; filename=" + Path.GetFileName(filePath)))
            Response.WriteFile(filePath)
            Response.End()
        End If
    End Sub

    Protected Sub btnAddNew_Click1(sender As Object, e As EventArgs)
        Dim dob As DateTime = DateTime.Parse(Request.Form(TextBox1.UniqueID))

        'Dim dob As Date = Request.Form(TextBox1.UniqueID)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Selected Date: " & dob & "');", True)
        Dim Statusmessages = String.Empty
        Dim registrationType As [Boolean] = False
        Dim roleId As String = DirectCast(HttpContext.Current.Session("RoleId"), String)
        If roleId = "1" Then
            registrationType = False
        Else
            registrationType = True
        End If
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                'If chbCondition.Checked Then
                Using result As New MySqlCommand("Select MobileNumber From registration WHERE MobileNumber = @MobileNumber")
                    Using sda1 As New MySqlDataAdapter(result)
                        Dim fileName As String = String.Empty
                        Dim emailId As String = String.Empty
                        Dim subject As String = String.Empty
                        Dim body As String = String.Empty
                        Dim bodyUser As String = String.Empty
                        Dim Name As String = String.Empty
                        Dim DocumentType As String = String.Empty
                        Dim Title As String = String.Empty
                        Dim SendEmail As SendEmail = New SendEmail()
                        Dim status
                        result.Parameters.AddWithValue("@MobileNumber", txtMobile.Text)
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        If drpEvent.SelectedValue Is "1" Then
                            fileName = Path.GetFileName(FileUploadFile.PostedFile.FileName)
                            FileUploadFile.PostedFile.SaveAs((Server.MapPath("~/UploadFile/EventRecords/") + fileName))
                        Else
                            fileName = ""
                        End If
                        'If dt.Rows.Count <= 0 Then
                        Using cmd As New MySqlCommand("Insert_EventRegistration")
                            Using sda As New MySqlDataAdapter()
                                cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim())
                                cmd.Parameters.AddWithValue("@EmailID", txtEmail.Text.Trim())
                                cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text.Trim())
                                cmd.Parameters.AddWithValue("@Event", drpEvent.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                                cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                cmd.Parameters.AddWithValue("@ShirtSize", ddlTShirt.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@EmergencyName", txtEName.Text)
                                cmd.Parameters.AddWithValue("@EmergencyNumber", txtEmobile.Text)
                                cmd.Parameters.AddWithValue("@RegistrationType", registrationType)
                                cmd.Parameters.AddWithValue("@AttachedFile", fileName)
                                cmd.Parameters.AddWithValue("@Gender", drpGender.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@DOB", dob)
                                cmd.Connection = con
                                con.Open()
                                cmd.ExecuteNonQuery()
                                Name = txtName.Text
                                subject = "New Event Request-" + txtName.Text + ""
                                body = "Hello Admin,<br/><br/>There is one new Event Registration Request from below member:<br/><br/><b>Name:</b> " + txtName.Text + "<br/><b>Eamil Address:</b> " + txtEmail.Text + "<br/><b>Mobile Number:</b> " + txtMobile.Text + "<br/><b>Event: </b>" + drpEvent.SelectedValue + "<br/><b>Address: </b>" + txtAddress.Text + "<br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                SendEmail.EventRegistrationSendMail(emailId, subject, body)
                                If roleId = "1" Then
                                    SendEmail = SmsSent("Event Register", "SMS")
                                Else
                                    SendEmail = SmsSent("For Event Registration", "SMS")
                                End If
                                If SendEmail.TemplateType = "SMS" Then
                                    ' Split string based on spaces
                                    Dim Unames As String() = txtName.Text.Trim().Split(New Char() {" "c})
                                    Dim distnace As String = drpEvent.SelectedItem.Text
                                    ' Seperate the first name from the rest of the string
                                    Dim lastName As String = txtName.Text.Substring(Unames(0).Length())
                                    'bodyUser = GetMergedData(SendEmail.BodyMessage, Convert.ToString(Unames(0)))
                                    bodyUser = GetMergedDistance(SendEmail.BodyMessage, Convert.ToString(Unames(0)), distnace)
                                    ' bodyUser = GetMergedDistance(SendEmail.BodyMessage, Convert.ToString(Unames(0)), distnace)
                                    'This is sent SMS for user.
                                    If txtMobile.Text = "" Then
                                        status = "Not send message"
                                    Else
                                        status = SendEmail.NewBlukSms(txtMobile.Text, bodyUser)
                                        Dim tokenJson = JsonConvert.SerializeObject(status)
                                    End If
                                    'Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
                                    'status = jsonResult.Values(1)
                                    SendEmail.log("ErrorStep1", status, "EventRegister", txtMobile.Text, SendEmail.TemplateType, bodyUser, "", "")
                                End If
                                'This  method call EMAIL.
                                SendEmail = MailSent("For Event Registration", "EMAIL")
                                If SendEmail.TemplateType = "EMAIL" Then
                                    bodyUser = GetMergedDistance(SendEmail.BodyMessage, txtName.Text, drpEvent.SelectedItem.Text)
                                    'This is sent mail for user.
                                    status = SendEmail.EventsendMailUser(txtEmail.Text, SendEmail.Subject, bodyUser)
                                    SendEmail.log("ErrorStep2", status, "EventRegister", txtEmail.Text, SendEmail.TemplateType, bodyUser, status, "")
                                End If
                                Statusmessages = "Success"
                                MessageUpdated.Text = "Event Registration successfully"
                                con.Close()
                                con.Dispose()
                                SendEmail.log("ErrorStep3", Statusmessages, "EventRegister", "", "", "", "", "Name:" + txtName.Text + ",EamilId:" + txtEmail.Text + ",MobileNo:" + txtMobile.Text + ",Event:" + drpEvent.SelectedItem.Text + ",Address:" + txtAddress.Text + "")
                                txtAddress.Text = ""
                                txtEmail.Text = ""
                                txtEmobile.Text = ""
                                txtEName.Text = ""
                                txtMobile.Text = ""
                                txtName.Text = ""
                                BindGridView()
                            End Using
                        End Using
                    End Using
                End Using
            Catch ex As Exception
                MessageUpdated.Text = "Please try again!"
                Statusmessages = "Error"
                SendEmail.log("ErrorStep4", ex.Message, "EventRegister", "", "", "", "", "Name:" + txtName.Text + ",EamilId:" + txtEmail.Text + ",MobileNo:" + txtMobile.Text + ",Event:" + drpEvent.SelectedItem.Text + ",Address:" + txtAddress.Text + "")
            End Try
        End Using
    End Sub

    'This method use to get data from Template for SMS.
    Private Shared Function SmsSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then
            If getTamplate.Tables.Count > 0 Then
                If getTamplate.Tables(0).Rows.Count > 0 Then
                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
                End If
            End If
        End If
        Return SendEmail
    End Function

    Private Shared Function GetMergedDistance(Message As String, UserName As String, drpEvent As String) As String
        Message = Replace(Message, "#UserName#", UserName)
        Message = Replace(Message, "#Distance#", drpEvent)
        Return Message
    End Function

    'This method use to get data from Template for EMAIL.
    Private Shared Function MailSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then
            If getTamplate.Tables.Count > 0 Then
                If getTamplate.Tables(0).Rows.Count > 0 Then
                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.Subject = getTamplate.Tables(0).Rows(0)("Title")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
                End If
            End If
        End If
        Return SendEmail
    End Function
End Class