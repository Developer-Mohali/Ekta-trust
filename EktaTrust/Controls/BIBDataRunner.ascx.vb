Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Globalization
Imports System.IO
Imports System.Net
Imports iTextSharp.text.pdf
Imports Microsoft.VisualBasic.ApplicationServices
Imports MySql.Data.MySqlClient
Imports Mysqlx.Crud

Public Class BIBDataRunner
    Inherits System.Web.UI.UserControl
    'Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Dim connStr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim limitToAdd As Int32
    Dim loginId As Int32
    Public Const MSG_BIBDataExists As String = "<b style='color: red;'>Failed to Add or BIB data already exists.</b>"
    Public Const MSG_AllowedCsvOnly As String = "<b style='color: red;'>Only .csv file is allowed.</b>"
    Public Const MSG_DataNotFoundInCsv As String = "<b style='color: red;'>BIB data not found in CSV. Please check CSV</b>"
    Public Const MSG_AddLimitExceed As String = "<b style='color: red;'>Adding Limit Exceed, Please contact to Administrator.</b>"
    Public Const MSG_AddSuccess As String = "<b>Added Successfully</b>"
    Public Const MSG_UpdateSuccess As String = "<b>Update Successfully</b>"
    Dim expectedHeaders As String() = {
    "Payment Reference",
    "Contact Number",
    "Runner Name",
    "Run Category",
    "T-Shirt Size",
    "Gender",
    "Blood Group",
    "Email ID",
    "Emergency Contact Name",
    "Emergency Contact Number",
    "Runner DOB"
}

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If con.State = ConnectionState.Closed Then
        '    con.Open()
        'End If
        If Session("UserId") IsNot Nothing Then
            loginId = Convert.ToInt32(Session("UserId"))
        End If
        MessageUpdated.Text = ""
        'txtCategory.Text = "Registration For RUN FOR EQUALITY"
        If Not IsPostBack Then

            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
            BindBiBUsersDropDown()
        End If
    End Sub
    ''' <summary>
    ''' Bind the BIB data data in the grid view
    ''' </summary>
    ''' 
    Private Sub BindGridView()

        Dim userId As Integer = 0
        Dim roleId As Integer = 0
        Dim selectedUser As String = ddlBiBCreatedUsers.SelectedValue
        Try
            If Session("RoleId") IsNot Nothing Then
                roleId = Convert.ToInt32(Session("RoleId"))
            End If
            If Session("UserId") IsNot Nothing Then
                userId = Convert.ToInt32(Session("UserId"))
            End If

            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim query As String = "SELECT DISTINCT bd.ID, bd.BIBNo, bd.RunnerName, bd.RunCatagory, bd.TShirtSize, bd.Gender, bd.RunnerDOB, 
                                        bd.MobileNumber, bd.EmergencyContactName, bd.EmergencyContactNumber, Amount, 
                                        bd.BankReferenceNo, PaymentStatus, OrderId, COALESCE(u.Name, CONCAT_WS(' ', s.FirstName, s.LastName)) AS CreatedBy, bd.CreatedAt FROM bibdata bd 
                                        left join user u  on bd.UserId = u.ID
                                        left join signup s on s.UserId = bd.UserId"
                Dim cmd As New MySqlCommand()
                cmd.Connection = con

                If roleId = 1 Then
                    ' Admin: See all data
                    If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                        If String.IsNullOrEmpty(selectedUser) = False Then
                            query += $" WHERE bd.UserId = @UserId"
                            cmd.Parameters.AddWithValue("@UserId", selectedUser)
                        End If
                    Else
                        If String.IsNullOrEmpty(selectedUser) Then
                            query += " WHERE bd.BIBNo LIKE @BIBNo OR bd.PaymentStatus LIKE @payStatus"
                            cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                            cmd.Parameters.AddWithValue("@payStatus", "%" & txtSearch.Text.Trim() & "%")
                        Else
                            query += $" WHERE bd.UserId = @UserId bd.BIBNo LIKE @BIBNo "
                            cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                            cmd.Parameters.AddWithValue("@UserId", selectedUser)
                        End If
                    End If
                Else
                    divCreatedByView.Visible = False
                    btnExport.Visible = False
                    divUploadUserDDL.Visible = False
                    divtxtDateSearch.Visible = False
                    ' Non-admin: Filter by userId
                    Dim userInfo As Dictionary(Of String, String) = GetUserDetails(userId)
                    Dim bibUserCount As Integer = GetBIBCountByUserId(userId)
                    limitToAdd = (Convert.ToInt32(userInfo("BIBUserLimit")) - bibUserCount)   ' getting add count that user can add BIB data...
                    AddCount.Text = $"<br><b>Available Add BIB Count : {If(limitToAdd < 0, 0, limitToAdd)}<b>"
                    If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                        query += " WHERE bd.UserId = @UserId "
                    Else
                        query += " WHERE bd.UserId = @UserId AND bd.BIBNo LIKE @BIBNo "
                        cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                    End If
                    cmd.Parameters.AddWithValue("@UserId", userId)
                End If

                ' Additional filtration and make order desc...
                If String.IsNullOrEmpty(txtDateSearch.Text) = False And query.Contains("WHERE") Then
                    query += " And DATE(bd.CreatedAt) = @CreatedDate"
                    cmd.Parameters.AddWithValue("@CreatedDate", txtDateSearch.Text)
                ElseIf String.IsNullOrEmpty(txtDateSearch.Text) = False Then
                    query += " WHERE DATE(bd.CreatedAt) = @CreatedDate"
                    cmd.Parameters.AddWithValue("@CreatedDate", txtDateSearch.Text)
                ElseIf query.Contains("WHERE") Then
                    query += " And YEAR = @YearBy"
                    cmd.Parameters.AddWithValue("@YearBy", ddlYearBy.SelectedValue)
                Else
                    query += " WHERE YEAR = @YearBy"
                    cmd.Parameters.AddWithValue("@YearBy", ddlYearBy.SelectedValue)
                End If
                query += $" ORDER BY bd.ID DESC"

                cmd.CommandText = query
                Using sda As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    con.Open()
                    sda.Fill(dt)
                    con.Close()

                    lblRecords.Text = dt.Rows.Count
                    If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                        Try
                            Dim total = dt.AsEnumerable().Where(Function(row) row("PaymentStatus").ToString() = "Success").Sum(Function(row) Convert.ToDecimal(row("Amount")))
                            lblTotalAmount.Text = total.ToString()
                        Catch ex As Exception
                        End Try
                    End If
                    gvEvent.DataSource = dt
                    gvEvent.DataBind()
                End Using
            End Using
        Catch ex As Exception
            MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Protected Sub ddlYearBy_SelectedIndexChanged(sender As Object, e As EventArgs)
        BindGridView()
    End Sub


    Protected Sub RowDeleting(Id As Integer)
        ''Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("delete from bibdata WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Delete successfully</b>"
                con.Close()
                con.Dispose()
            End Using
        End Using
        BindGridView()
    End Sub


    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.BindGridView()
    End Sub

    Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = Regex.Replace(e.Row.Cells(0).Text, txtSearch.Text.Trim(),
            Function(match As Match) String.Format("<span style='background-color:#D9EDF7'>{0}</span>", match.Value),
                        RegexOptions.IgnoreCase)
        End If

    End Sub

    Protected Sub ImportFromExcel(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim rowAffected = 0
        Dim totalRows As Int32
        Dim duplicateRecords As Int32
        Dim requiredFields As Int32
        Dim insertedRecords = 0
        Dim proceedRecords = 0
        Try

            If BIBDataFileUpload.PostedFile.ContentLength > 0 Then
                Dim fileExt As String = Path.GetExtension(BIBDataFileUpload.FileName).ToLower()

                If fileExt <> ".csv" Then
                    MessageUpdated.Text = MSG_AllowedCsvOnly
                    Return
                End If
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowLoader", "$('#loader').show()", True)
                Dim folderPath As String = Server.MapPath("~/Files/BibData/")
                Dim fileName = Convert.ToString(Guid.NewGuid())

                Dim fileNameNew As String = fileName + "_" + BIBDataFileUpload.FileName

                ' SAVE THE SELECTED FILE IN THE ROOT DIRECTORY.
                'certificateFileUpload.SaveAs(folderPath & Path.GetFileName(certificateFileUpload.FileName))
                BIBDataFileUpload.SaveAs(folderPath & fileNameNew)

                'Dim SR As StreamReader = New StreamReader(folderPath & Path.GetFileName(certificateFileUpload.FileName))
                Dim SR As StreamReader = New StreamReader(folderPath & fileNameNew)
                Dim i As Long = 0
                Dim line As String = SR.ReadLine()

                'HEADER VALIDATION: Validate the CSV file header, if it's not correct header show error...
                If String.IsNullOrWhiteSpace(line) Then
                    MessageUpdated.Text = "<b style='color:red;'>CSV file header is missing.</b>"
                    Return
                End If

                Dim csvHeaders As String() = line.Split(","c).Select(Function(h) h.Trim()).ToArray()

                ' HEADER COUNT CHECK
                If csvHeaders.Length <> expectedHeaders.Length Then
                    MessageUpdated.Text = "<b style='color:red;'>CSV header column count mismatch.</b>"
                    Return
                End If

                ' HEADER NAME CHECK
                For num As Integer = 0 To expectedHeaders.Length - 1
                    If Not csvHeaders(num).Equals(expectedHeaders(num), StringComparison.OrdinalIgnoreCase) Then
                        MessageUpdated.Text = $"<b style='color:red;'>Invalid CSV header at position {num + 1}. " &
                         $"Expected: '{expectedHeaders(num)}', Found: '{csvHeaders(num)}'</b>"
                        Return
                    End If
                Next
                'END OF HEADER VALIDATION

                Dim strArray As String() = line.Split(",")
                Dim dt As DataTable = New DataTable()
                Dim row As DataRow

                For Each s As String In strArray
                    dt.Columns.Add(New DataColumn(s))
                Next

                While Not SR.EndOfStream

                    strArray = SplitCSV(SR.ReadLine)
                    If strArray.Length Then
                        row = dt.NewRow()
                        row.ItemArray = strArray
                        dt.Rows.Add(row)
                    End If

                End While
                Dim roleId As Integer = 0
                Dim userId As Integer = 0
                Dim uploadedBy As Integer = ddlUploadedBy.SelectedValue
                If Session("RoleId") IsNot Nothing Then
                    roleId = Convert.ToInt32(Session("RoleId"))
                End If
                If Session("UserId") IsNot Nothing Then
                    userId = Convert.ToInt32(Session("UserId"))
                End If
                Dim currentYear As Integer = DateTime.Now.Year
                totalRows = dt.Rows.Count
                If totalRows <= 0 Then
                    MessageUpdated.Text = MSG_DataNotFoundInCsv
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
                    Return
                End If

                'if user is not superAdmin, check limit permission to add more bib data...
                If roleId = 3 Then
                    ' get user assigned limit
                    Dim userInfo As Dictionary(Of String, String) = GetUserDetails(userId)
                    Dim bibUserCount As Integer = GetBIBCountByUserId(userId)
                    limitToAdd = (Convert.ToInt32(userInfo("BIBUserLimit")) - bibUserCount)   ' getting add count that user can add BIB data...
                    If limitToAdd <= 0 Then
                        MessageUpdated.Text = MSG_AddLimitExceed
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
                        Return
                    End If

                    If totalRows > limitToAdd Then
                        MessageUpdated.Text = $"{limitToAdd} record only inserted as you don't have more limit to add. Please contact to Administrator <br/>"
                    End If
                End If

                If dt.Rows.Count > 0 Then
                    Using con As New MySqlConnection(connStr)
                        For Each dtrow As DataRow In dt.Rows
                            proceedRecords = proceedRecords + 1
                            Dim bibNo As String = GetNextBibNumber(dtrow.Item("Run Category"))
                            Using cmd As New MySqlCommand("InsertBIBData")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.Add(New MySqlParameter("p_BankReferenceNo", dtrow.Item("Payment Reference")))
                                    cmd.Parameters.Add(New MySqlParameter("p_BIBNo", bibNo))
                                    cmd.Parameters.Add(New MySqlParameter("p_MobileNumber", dtrow.Item("Contact Number")))
                                    cmd.Parameters.Add(New MySqlParameter("p_RunnerName", dtrow.Item("Runner Name")))
                                    cmd.Parameters.Add(New MySqlParameter("p_RunCatagory", dtrow.Item("Run Category")))
                                    cmd.Parameters.Add(New MySqlParameter("p_TShirtSize", dtrow.Item("T-Shirt Size")))
                                    cmd.Parameters.Add(New MySqlParameter("p_Gender", dtrow.Item("Gender")))
                                    cmd.Parameters.Add(New MySqlParameter("p_BloodGroup", dtrow.Item("Blood Group")))
                                    cmd.Parameters.Add(New MySqlParameter("p_EmailID", dtrow.Item("Email ID")))
                                    cmd.Parameters.Add(New MySqlParameter("p_RoleID", roleId))
                                    'cmd.Parameters.Add(New MySqlParameter("p_CategoryName", dtrow.Item("Category Name")))
                                    cmd.Parameters.Add(New MySqlParameter("p_CategoryName", "Registration For RUN FOR EQUALITY"))
                                    cmd.Parameters.Add(New MySqlParameter("p_Year", currentYear))
                                    cmd.Parameters.Add(New MySqlParameter("p_UserId", If(String.IsNullOrEmpty(uploadedBy), userId, uploadedBy)))
                                    cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactName", dtrow.Item("Emergency Contact Name")))
                                    cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactNumber", dtrow.Item("Emergency Contact Number")))
                                    cmd.Parameters.Add(New MySqlParameter("p_RunnerDOB", If(IsValidDate(dtrow("Runner DOB").ToString()), CDate(dtrow("Runner DOB")), DBNull.Value)))
                                    cmd.Parameters.Add(New MySqlParameter("p_CreatedBy", loginId))
                                    cmd.Parameters.Add(New MySqlParameter("p_OrderId", ""))
                                    cmd.Parameters.Add(New MySqlParameter("p_PaymentStatus", ""))
                                    cmd.Parameters.Add(New MySqlParameter("p_Amount", ""))
                                    cmd.Parameters.Add(New MySqlParameter("p_TxnId", ""))
                                    cmd.Parameters.Add(New MySqlParameter("p_PaytmResponse", ""))
                                    cmd.Connection = con
                                    con.Open()
                                    Try
                                        rowAffected = cmd.ExecuteNonQuery()
                                    Catch ex As MySqlException
                                        If ex.Message.Contains("Duplicate entry") Then
                                            duplicateRecords = duplicateRecords + 1
                                        ElseIf ex.Message.Contains("One or more required fields") Then
                                            requiredFields = requiredFields + 1
                                        End If
                                    End Try
                                    con.Close()
                                End Using
                            End Using
                            'If roleId = 3 Then
                            If rowAffected > 0 Then
                                insertedRecords = insertedRecords + 1
                            End If
                            If roleId = 3 AndAlso insertedRecords >= limitToAdd Then
                                Exit For 'break loop
                            End If
                            'End If
                        Next
                    End Using
                End If
            Else
                MessageUpdated.Text = "<b style='color: red;'>Please select a file</b>"
                Return
            End If
        Catch ex As Exception
            MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "<script>document.getElementById('loader').style.display = 'none';</script>", False)
        End Try
        If insertedRecords > 0 Then
            MessageUpdated.Text = MessageUpdated.Text & "Total Records: " & totalRows &
                      "<br/> Successfully Added: " & insertedRecords &
                      "<br/> Duplicate Records: " & duplicateRecords &
                      "<br/> Invalid BIB Records: " & requiredFields &
                      "<br/> Skipped Records: " & (totalRows - proceedRecords)
            BindGridView()
        Else
            MessageUpdated.Text = "<b style='color: red;'>One or more required fields (RunnerName, Gender, RunCategory, MobileNumber) are missing or empty.</b>"
        End If
    End Sub
    Shared csvSplit As Regex = New Regex("(?:^|,)(""(?:[^""]+|"""")*""|[^,]*)", RegexOptions.Compiled)

    Public Shared Function SplitCSV(ByVal input As String) As String()
        Dim list As List(Of String) = New List(Of String)()
        Dim curr As String = Nothing
        If input <> Nothing Then
            For Each match As Match In csvSplit.Matches(input)
                curr = match.Value

                If 0 = curr.Length Then
                    list.Add("")
                End If

                list.Add(curr.TrimStart(","c))
            Next
        Else
            list.Add("")
        End If

        Return list.ToArray()
    End Function

    Protected Sub AddBIB_Click(sender As Object, e As EventArgs)
        lblError.Visible = False
        'txtCategory.Visible = True
        txtName.Visible = True
        ddlGender.Visible = True
        ' txtBloodGroup.Visible = True
        txtTshirtSize.Visible = True
        txtMobile.Visible = True
        txtRunCategory.Visible = True
        txtBibNumber.Visible = True
        ' txtYear.Visible = True
        'select the current year in dropdown...
        Dim currentYear As String = DateTime.Now.Year.ToString()
        ' If txtYear.Items.FindByValue(currentYear) IsNot Nothing Then
        'txtYear.SelectedValue = currentYear
        'End If

        Reset()
        Me.ModalPopupExtender1.Show()
    End Sub

    Protected Sub gvMIP_RowAction(sender As Object, e As GridViewCommandEventArgs)
        Try
            If Not String.IsNullOrEmpty(e.CommandArgument?.ToString()) Then

                ' Get the selected row's ID
                Dim id As Integer = Convert.ToInt32(e.CommandArgument)
                'If id >= 0 AndAlso id < gvEvent.DataKeys.Count Then
                '    id = Convert.ToInt32(gvEvent.DataKeys(id).Value)
                'End If

                ' called delete function..
                If e.CommandName = "DeleteRow" Then
                    RowDeleting(id)
                    Return
                ElseIf e.CommandName = "EditRow" Then
                    ' Store it in a hidden field for saving after editing
                    hfEditID.Value = id.ToString()

                    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
                    Using con As New MySqlConnection(constr)
                        Using cmd As New MySqlCommand("SELECT * FROM bibdata WHERE ID = @Id", con)
                            cmd.Parameters.AddWithValue("@Id", id)
                            con.Open()
                            Using reader As MySqlDataReader = cmd.ExecuteReader()
                                If reader.Read() Then
                                    txtBankRef.Text = reader("BankReferenceNo").ToString()
                                    'txtCategory.Text = reader("CategoryName").ToString()
                                    txtName.Text = reader("RunnerName").ToString()
                                    ddlGender.SelectedValue = If(reader("Gender").ToString().ToLower().StartsWith("m"), "Male", "Female")
                                    'txtBloodGroup.Text = reader("BloodGroup").ToString()
                                    txtTshirtSize.Text = reader("TShirtSize").ToString()
                                    txtMobile.Text = reader("MobileNumber").ToString()
                                    txtRunCategory.SelectedValue = reader("RunCatagory").ToString().Replace(" ", "").ToUpper()
                                    txtBibNumber.Text = reader("BIBNo").ToString()
                                    'txtYear.Text = reader("Year").ToString()
                                    'txtEmail.Text = reader("EmailID").ToString()
                                    txtEmgName.Text = reader("EmergencyContactName").ToString()
                                    txtEmgMobile.Text = reader("EmergencyContactNumber").ToString()
                                    txtDOB.Text = reader("RunnerDOB").ToString()
                                    ddlStatusOfPayment.SelectedValue = reader("PaymentStatus").ToString().Replace(" ", "")
                                End If
                            End Using
                        End Using
                    End Using

                    ' Show the modal popup
                    ModalPopupExtender1.Show()
                End If

            End If
        Catch ex As Exception
            MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
        End Try
    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim bankReference As String = txtBankRef.Text
        Dim category As String = "Registration For RUN FOR EQUALITY" 'txtCategory.Text
        Dim name As String = txtName.Text
        Dim gender As String = ddlGender.SelectedValue
        'Dim email As String = txtEmail.Text
        'Dim bloodGroup As String = txtBloodGroup.Text
        Dim tshirtSize As String = txtTshirtSize.Text
        Dim mobile As String = txtMobile.Text
        Dim runCategory As String = txtRunCategory.Text
        Dim bibNumber As String = txtBibNumber.Text
        Dim year As String = DateTime.Now.Year.ToString() 'txtYear.Text
        Dim idToUpdate As Integer = 0
        Dim emergencyContactName As String = txtEmgName.Text
        Dim emergencyContactNumber As String = txtEmgMobile.Text
        Dim runnerDOB As String = txtDOB.Text
        Dim statusOfPayment As String = ""

        If ddlStatusOfPayment.SelectedItem IsNot Nothing Then
            statusOfPayment = ddlStatusOfPayment.SelectedItem.Text
        End If
        Integer.TryParse(hfEditID.Value, idToUpdate)
        Dim rowAffected = 0

        If idToUpdate > 0 Then
            UpdateBibData(idToUpdate)
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
            Return
        End If
        Dim IsPermitted As Boolean = HavingBIBLimit()
        If (IsPermitted = False And idToUpdate <= 0) Then
            MessageUpdated.Text = MSG_AddLimitExceed
            Return
        End If
        Dim roleId As Integer = 0
        Dim userId As Integer = 0
        If Session("RoleId") IsNot Nothing Then
            roleId = Convert.ToInt32(Session("RoleId"))
        End If
        If Session("UserId") IsNot Nothing Then
            userId = Convert.ToInt32(Session("UserId"))
        End If

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("InsertBIBData")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New MySqlParameter("p_BankReferenceNo", bankReference))
                        cmd.Parameters.Add(New MySqlParameter("p_BIBNo", bibNumber))
                        cmd.Parameters.Add(New MySqlParameter("p_MobileNumber", mobile))
                        cmd.Parameters.Add(New MySqlParameter("p_RunnerName", name))
                        cmd.Parameters.Add(New MySqlParameter("p_RunCatagory", runCategory))
                        cmd.Parameters.Add(New MySqlParameter("p_TShirtSize", tshirtSize))
                        cmd.Parameters.Add(New MySqlParameter("p_Gender", gender))
                        cmd.Parameters.Add(New MySqlParameter("p_BloodGroup", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_EmailID", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_RoleID", (roleId)))
                        cmd.Parameters.Add(New MySqlParameter("p_CategoryName", category))
                        cmd.Parameters.Add(New MySqlParameter("p_Year", (year)))
                        cmd.Parameters.Add(New MySqlParameter("p_UserId", (userId)))
                        cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactName", (emergencyContactName)))
                        cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactNumber", (emergencyContactNumber)))
                        cmd.Parameters.Add(New MySqlParameter("p_RunnerDOB", (runnerDOB)))
                        cmd.Parameters.Add(New MySqlParameter("p_CreatedBy", (loginId)))
                        cmd.Parameters.Add(New MySqlParameter("p_OrderId", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_PaymentStatus", statusOfPayment))
                        cmd.Parameters.Add(New MySqlParameter("p_Amount", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_TxnId", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_PaytmResponse", ""))
                        cmd.Connection = con
                        con.Open()
                        Try
                            rowAffected = cmd.ExecuteNonQuery()
                        Catch ex As MySqlException
                            If ex.Message.Contains("Duplicate entry") Then
                                MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
                            ElseIf ex.Message.Contains("One or more required fields") Then
                                MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
                            Else
                                MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
                            End If
                        End Try
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
        If rowAffected > 0 Then
            MessageUpdated.Text = MSG_AddSuccess
            BindGridView()
            'Else
            'MessageUpdated.Text = MSG_BIBDataExists
        End If
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        '' End If
    End Sub

    Protected Sub UpdateBibData(bibRecordId As Integer)
        Try
            If IsBIBDataInserted(bibRecordId) Then
                MessageUpdated.Text = MSG_BIBDataExists
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "clickCancelButton", "$('#" & btnCancel.ClientID & "').click();", True)
                Return
            End If
            'Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(connStr)
                Dim query As String

                'query = "UPDATE bibdata SET BankReferenceNo=@bankRef, RunnerName=@name, gender=@gender, BloodGroup=@blood, 
                'TShirtSize =@size, MobileNumber=@mobile, RunCatagory=@run, BIBNo=@bib, Year=@year, EmailID=@email, EmergencyContactName=@emergencyContactName,
                'EmergencyContactNumber =@emergencyContactNumber, RunnerDOB=@runnerDOB WHERE ID=@id"
                query = "UPDATE bibdata SET BankReferenceNo=@bankRef, RunnerName=@name, gender=@gender, 
                        TShirtSize=@size, MobileNumber=@mobile, RunCatagory=@run, BIBNo=@bib, EmergencyContactName=@emergencyContactName,
                         EmergencyContactNumber=@emergencyContactNumber, RunnerDOB=@runnerDOB, PaymentStatus=@PaymentStatus WHERE ID=@id"

                Using cmd As New MySqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@bankRef", txtBankRef.Text.Trim())
                    'cmd.Parameters.AddWithValue("@cat", txtCategory.Text.Trim())
                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim())
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue)
                    'cmd.Parameters.AddWithValue("@blood", txtBloodGroup.Text.Trim())
                    cmd.Parameters.AddWithValue("@size", txtTshirtSize.Text.Trim())
                    cmd.Parameters.AddWithValue("@mobile", txtMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@run", txtRunCategory.Text.Trim())
                    cmd.Parameters.AddWithValue("@bib", txtBibNumber.Text.Trim())
                    'cmd.Parameters.AddWithValue("@year", txtYear.Text.Trim())
                    'cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@emergencyContactName", txtEmgName.Text.Trim())
                    cmd.Parameters.AddWithValue("@emergencyContactNumber", txtEmgMobile.Text.Trim())
                    cmd.Parameters.AddWithValue("@runnerDOB", txtDOB.Text.Trim())
                    cmd.Parameters.AddWithValue("@id", bibRecordId)
                    cmd.Parameters.AddWithValue("@PaymentStatus", ddlStatusOfPayment.SelectedItem.Text)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Clear form and refresh
            hfEditID.Value = ""
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "clickCancelButton", "$('#" & btnCancel.ClientID & "').click();", True)
            MessageUpdated.Text = MSG_UpdateSuccess
            BindGridView()
        Catch ex As Exception
            MessageUpdated.Text = $"<b style='color: red;'>{ex.Message}</b>"
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "clickCancelButton", "$('#" & btnCancel.ClientID & "').click();", True)
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Private Function IsBIBDataInserted(bibRecordId As Integer) As Boolean
        Dim exists As Boolean = False

        ' Update with your actual connection string
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Dim query As String = " SELECT 1  FROM BIBData WHERE ((Year = @Year  AND BIBNo = @BIBNo AND MobileNumber = @MobileNumber) Or (BIBNo = @BIBNo)) and ID <> @Id"

        Using conn As New MySqlConnection(connectionString)
            Using cmd As New MySqlCommand(query, conn)
                ' Add parameters
                cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year.ToString())
                cmd.Parameters.AddWithValue("@BIBNo", txtBibNumber.Text.Trim())
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text.Trim())
                cmd.Parameters.AddWithValue("@Id", bibRecordId)

                Try
                    conn.Open()
                    Dim result = cmd.ExecuteScalar()

                    If result IsNot Nothing Then
                        exists = True
                    End If

                Catch ex As Exception
                    ' Handle exception as needed
                    MessageUpdated.Text = $"{ex.Message}"
                End Try
            End Using
        End Using

        Return exists
    End Function

    Public Function HavingBIBLimit() As Boolean
        Dim bibDataUserAddedCount As Integer = 0
        Dim userId As Integer = 0
        Dim roleId As Integer = 0

        If Session("RoleId") IsNot Nothing Then
            roleId = Convert.ToInt32(Session("RoleId"))
        End If
        If Session("UserId") IsNot Nothing Then
            userId = Convert.ToInt32(Session("UserId"))
        End If

        ' check login is superAdmin,if yes grant true permission to add bib data..
        If roleId = 1 Then
            Return True
        Else
            Dim userInfo As Dictionary(Of String, String) = GetUserDetails(userId)
            If userInfo.Count > 0 Then
                bibDataUserAddedCount = GetBIBCountByUserId(userId)
                ' return true if limit not exceed to assigned limit..
                If (Convert.ToInt32(userInfo("BIBUserLimit")) - bibDataUserAddedCount) > 0 Then
                    Return True
                End If
            End If
        End If

        Return False
    End Function

    Public Function GetBIBCountByUserId(userId As Integer) As Integer
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT COUNT(ID) FROM bibdata WHERE CreatedBy = @userId and RoleID = @roleId", con)
                cmd.Parameters.AddWithValue("@userId", userId)
                cmd.Parameters.AddWithValue("@roleId", 3)   'sub admin role'
                ' cmd.Parameters.AddWithValue("@year", DateTime.Now.Year)
                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function

    Public Function GetUserDetails(userId As Integer) As Dictionary(Of String, String)
        Dim userDetails As New Dictionary(Of String, String)()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("select id,Name,EmailAddress,Address,MobileNumber,role.roleName,User.BIBUserLimit from User INNER JOIN role on User.RoleId=role.RoleId WHERE id = @id", con)
                    cmd.Parameters.AddWithValue("@id", userId.ToString())
                    con.Open()

                    Using reader As MySqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            'userDetails("ID") = reader("id").ToString()
                            'userDetails("Name") = reader("Name").ToString()
                            'userDetails("EmailAddress") = reader("EmailAddress").ToString()
                            'userDetails("RoleName") = reader("roleName").ToString()
                            userDetails("BIBUserLimit") = If(String.IsNullOrEmpty(Convert.ToString(reader("BIBUserLimit"))), "0", Convert.ToString(reader("BIBUserLimit")))

                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception
            Console.Write(ex.ToString())
        End Try
        Return userDetails
    End Function

    Protected Sub DownloadFile()
        Dim folderPath As String = Server.MapPath("~/Files/BibData/BIBInsertSample.csv")
        Dim fileName As String = "BIBInsertSample.csv"

        If File.Exists(folderPath) Then
            ' Set response headers for file download
            Response.Clear()
            Response.ContentType = "text/csv"
            Response.AddHeader("Content-Disposition", "attachment; filename=" & fileName)

            ' Write file to response stream
            Response.WriteFile(folderPath)

            ' End the response
            Response.Flush()
            Response.End()
        Else
            ' Handle file not found
            Response.Write("File not found")
        End If
    End Sub

    Public Sub BindBiBUsersDropDown()
        Dim query As String = "
        SELECT DISTINCT COALESCE(u.ID, s.UserID) UserId,
       COALESCE(
           NULLIF(u.Name,''),
           CONCAT_WS(' ', NULLIF(s.FirstName,''), NULLIF(s.LastName,'')),
           'Unknown'
                   ) AS BiBUsers
            FROM bibdata bd
            LEFT JOIN user u  ON bd.UserId = u.ID
            LEFT JOIN signup s ON s.UserId = bd.UserId
            WHERE
                COALESCE(
                    NULLIF(u.Name,''),
                    CONCAT_WS(' ', NULLIF(s.FirstName,''), NULLIF(s.LastName,'')),
                    ''
                ) <> '';"

        Using con As New MySqlConnection(connStr)
            Using cmd As New MySqlCommand(query, con)
                Using da As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)

                    ddlBiBCreatedUsers.DataSource = dt
                    ddlBiBCreatedUsers.DataTextField = "BiBUsers"
                    ddlBiBCreatedUsers.DataValueField = "UserId"
                    ddlBiBCreatedUsers.DataBind()
                End Using
            End Using
        End Using

        ddlUploadedBy.Items.Clear()

        For Each item As ListItem In ddlBiBCreatedUsers.Items
            Dim newItem As New ListItem(item.Text, item.Value)
            ddlUploadedBy.Items.Add(newItem)

            ' Auto-select logged-in user
            If item.Value = loginId Then
                ddlUploadedBy.SelectedValue = loginId
            End If
        Next

        ' Optional default item
        ddlBiBCreatedUsers.Items.Insert(0, New ListItem("All", ""))

    End Sub

    Protected Sub ddlBiBCreatedUsers_SelectedIndexChanged(sender As Object, e As EventArgs)
        BindGridView()
    End Sub

#Region "Export to Excel"
    Private Function GetExportData() As DataTable
        Dim dt As New DataTable()
        Try
            Dim selectedUser As String = ddlBiBCreatedUsers.SelectedValue

            Using con As New MySqlConnection(connStr)
                Dim query As String = "SELECT DISTINCT bd.BIBNo, bd.RunnerName, bd.RunCatagory as `Run Category`, bd.TShirtSize, bd.Gender, bd.RunnerDOB, 
                                        bd.MobileNumber as `Contact Number`, bd.EmergencyContactName, bd.EmergencyContactNumber,
                                        bd.BankReferenceNo as `Payment Reference`, PaymentStatus as `Payment Status`, OrderId, COALESCE(u.Name, CONCAT_WS(' ', s.FirstName, s.LastName)) AS CreatedBy, bd.CreatedAt as `Registration At` 
                                        bd.TxnId as `Transaction Id` FROM bibdata bd 
                                        left join user u  on bd.UserId = u.ID
                                        left join signup s on s.UserId = bd.UserId"
                Dim cmd As New MySqlCommand()
                cmd.Connection = con

                ' Admin: See all data
                If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                    If String.IsNullOrEmpty(selectedUser) = False Then
                        query += $" WHERE bd.UserId = @UserId"
                        cmd.Parameters.AddWithValue("@UserId", selectedUser)
                    End If
                Else
                    If String.IsNullOrEmpty(selectedUser) Then
                        query += " WHERE bd.BIBNo LIKE @BIBNo OR bd.PaymentStatus LIKE @payStatus"
                        cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                        cmd.Parameters.AddWithValue("@payStatus", "%" & txtSearch.Text.Trim() & "%")
                    Else
                        query += $" WHERE bd.UserId = @UserId bd.BIBNo LIKE @BIBNo OR bd.PaymentStatus LIKE @payStatus"
                        cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                        cmd.Parameters.AddWithValue("@payStatus", "%" & txtSearch.Text.Trim() & "%")
                        cmd.Parameters.AddWithValue("@UserId", selectedUser)
                    End If
                End If

                ' Additional filtration by created date...
                If String.IsNullOrEmpty(txtDateSearch.Text) = False And query.Contains("WHERE") Then
                    query += " DATE(bd.CreatedAt) = @CreatedDate"
                    cmd.Parameters.AddWithValue("@CreatedDate", txtDateSearch.Text)
                ElseIf String.IsNullOrEmpty(txtDateSearch.Text) = False Then
                    query += " WHERE DATE(bd.CreatedAt) = @CreatedDate"
                    cmd.Parameters.AddWithValue("@CreatedDate", txtDateSearch.Text)
                ElseIf query.Contains("WHERE") Then
                    query += " And YEAR(bd.CreatedAt) = @YearBy"
                    cmd.Parameters.AddWithValue("@YearBy", ddlYearBy.SelectedValue)
                Else
                    query += " WHERE YEAR(bd.CreatedAt) = @YearBy"
                    cmd.Parameters.AddWithValue("@YearBy", ddlYearBy.SelectedValue)
                End If

                ' Order by id, so latest data comes first...
                query += " ORDER BY bd.ID DESC"

                cmd.CommandText = query
                Using sda As New MySqlDataAdapter(cmd)
                    con.Open()
                    sda.Fill(dt)
                    con.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw
        End Try
        Return dt
    End Function

    Protected Sub btnExport_ClickOLD(sender As Object, e As EventArgs)
        Try
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowLoader", "$('#loader').show()", True)
            Dim dt As DataTable = GetExportData()

            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("Content-Disposition", "attachment;filename=BibReport.xls")
            Response.ContentType = "application/vnd.ms-excel"

            Dim sb As New StringBuilder()

            ' Header
            For Each col As DataColumn In dt.Columns
                sb.Append(col.ColumnName & vbTab)
            Next
            sb.AppendLine()

            ' Rows
            For Each row As DataRow In dt.Rows
                For Each col As DataColumn In dt.Columns
                    sb.Append(row(col).ToString().Replace(vbTab, "") & vbTab)
                Next
                sb.AppendLine()
            Next

            Response.Write(sb.ToString())
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
            Response.End()
        Catch
            MessageUpdated.Text = "Got error while exporting excel"
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Protected Sub btnExport_Click(sender As Object, e As EventArgs)
        Try
            Dim dt As DataTable = GetExportData()

            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=BibReport.xls")
            Response.ContentType = "application/vnd.ms-excel"
            Response.Charset = ""

            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            hw.WriteLine("<table border='1'>")

            ' Header
            hw.WriteLine("<tr>")
            For Each col As DataColumn In dt.Columns
                hw.WriteLine("<th style='background-color:#d9d9d9'>" & col.ColumnName & "</th>")
            Next
            hw.WriteLine("</tr>")

            ' Rows
            For Each row As DataRow In dt.Rows
                hw.WriteLine("<tr>")
                For i As Integer = 0 To dt.Columns.Count - 1
                    Dim cellValue As String = row(i).ToString()
                    Dim bgColor As String = ""

                    ' Column index 10 = Payment Status
                    If i = 10 Then
                        Select Case cellValue.Trim().ToLower()
                            Case "success"
                                bgColor = "LightGreen"
                            Case "pending"
                                bgColor = "LightYellow"
                            Case "failed"
                                bgColor = "LightCoral"
                            Case "cancelled"
                                bgColor = "LightGray"
                            Case "expired"
                                bgColor = "Orange"
                            Case Else
                                bgColor = "White"
                        End Select
                        hw.WriteLine("<td style='background-color:" & bgColor & "'>" & cellValue & "</td>")
                    ElseIf i = 12 AndAlso (String.IsNullOrEmpty(cellValue) Or cellValue = "&nbsp;") Then
                        hw.WriteLine("<td>Self</td>")
                    Else
                        hw.WriteLine("<td>" & cellValue & "</td>")
                    End If

                Next
                hw.WriteLine("</tr>")
            Next

            hw.WriteLine("</table>")

            Response.Write(sw.ToString())
            Response.End()

        Catch
            MessageUpdated.Text = "Got error while exporting excel"
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub
#End Region

    Public Function IsValidDate(inputDate As String) As Boolean
        If String.IsNullOrWhiteSpace(inputDate) Then
            Return False
        End If

        Dim parsedDate As DateTime
        Try

            ' Strict HTML5 date format: yyyy-MM-dd
            Return DateTime.TryParseExact(
            inputDate.Trim(),
            "yyyy-MM-dd",
            CultureInfo.InvariantCulture,
            DateTimeStyles.None,
            parsedDate
        )
        Catch

        End Try
        Return False
    End Function

    Private Function Reset()
        txtBankRef.Text = String.Empty
        txtBibNumber.Text = String.Empty
        ' txtCategory.Text = "Registration For RUN FOR EQUALITY"
        'txtEmail.Text = String.Empty
        txtMobile.Text = String.Empty
        txtName.Text = String.Empty
        ddlGender.Text = String.Empty
        'txtBloodGroup.Text = String.Empty
        txtTshirtSize.Text = String.Empty
        txtMobile.Text = String.Empty
        txtRunCategory.ClearSelection()
        txtEmgMobile.Text = String.Empty
        txtEmgName.Text = String.Empty
        txtDOB.Text = String.Empty
    End Function

    Protected Sub txtRunCategory_SelectedIndexChanged(
    sender As Object, e As EventArgs) Handles txtRunCategory.SelectedIndexChanged

        If String.IsNullOrEmpty(txtRunCategory.SelectedValue) Then
            txtBibNumber.Text = ""
            Exit Sub
        End If

        ' Call your DB-safe function
        txtBibNumber.Text = GetNextBibNumber(txtRunCategory.SelectedValue)
        Me.ModalPopupExtender1.Show()
    End Sub


    Private Function GetNextBibNumber(category As String) As String
        Try
            Dim prefix As String = category.ToLower().Replace("km", "") ' "21", "10", "5"
            If prefix.Length = 1 Then prefix = "50" ' "50"
            If prefix.Contains("21.09") Then prefix = "21"

            Dim lastBib As String = Nothing

            Using con As New MySqlConnection(connStr)
                Using cmd As New MySqlCommand("SELECT MAX(BIBNo) FROM bibdata WHERE BIBNo LIKE CONCAT(@Prefix, '%') AND CHAR_LENGTH(BIBNo) = 6", con)

                    cmd.Parameters.AddWithValue("@Prefix", prefix)

                    con.Open()
                    lastBib = Convert.ToString(cmd.ExecuteScalar())
                End Using
            End Using

            ' If first record
            If String.IsNullOrEmpty(lastBib) Then
                Return prefix & "0001"   ' 6 digits start
            End If

            ' Increment safely
            ' Extract numeric part ONLY
            Dim numericPart As Integer = Integer.Parse(lastBib.Substring(prefix.Length))

            ' Increment & pad to 4 digits
            Return prefix & (numericPart + 1).ToString("D4")

            'Dim nextNumber As Long = CLng(lastBib) + 1
            'Return nextNumber.ToString("D6")
        Catch ex As Exception
            Console.Write(ex)
            Throw
        End Try
    End Function

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) 'Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim createdByCell As TableCell = e.Row.Cells(10)
            Dim createdBy = createdByCell.Text.Trim().ToLower()
            If String.IsNullOrEmpty(createdBy) Or createdBy = "&nbsp;" Then
                createdByCell.Text = "Self"
            End If

            ' Payment Status column index (zero-based)
            Dim cell As TableCell = e.Row.Cells(8)
            Dim status As String = cell.Text.Trim().ToLower()

            Select Case status
                Case "success"
                    cell.BackColor = System.Drawing.Color.LightGreen
                Case "pending"
                    cell.BackColor = System.Drawing.Color.LightYellow
                Case "failed"
                    cell.BackColor = System.Drawing.Color.LightCoral
                Case "cancelled"
                    cell.BackColor = System.Drawing.Color.LightGray
                Case "expired"
                    cell.BackColor = System.Drawing.Color.Orange
                Case Else
                    cell.BackColor = System.Drawing.Color.White
            End Select

        End If
    End Sub

    Protected Sub generate_Certificate(sender As Object, e As EventArgs)
        Try
            Dim btn As LinkButton = CType(sender, LinkButton)
            Dim row As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            Dim orderId As String = row.Cells(9).Text.Trim().ToLower()

            Dim paymentStatus As String = row.Cells(8).Text.Trim().ToLower()
            If paymentStatus = "success" Then
                ' 👉 Call your PDF function
                CreateRunReceiptCertificate(orderId)

            Else
                MessageUpdated.Text = "Only Success payment generate Receipt"
                MessageUpdated.ForeColor = Color.Red
            End If
        Catch ex As Exception
            MessageUpdated.Text = ex.Message
            MessageUpdated.ForeColor = Color.Red
        End Try
    End Sub


    Private Function CreateRunReceiptCertificate(orderId As String) As String

        Try

            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Dim dt As New DataTable()

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT BIBNo, RunnerName, RunCatagory, TShirtSize, Amount,TxnId, createdAt FROM bibdata WHERE OrderId=@orderId", con)

                    cmd.Parameters.AddWithValue("@orderId", orderId)

                    Using da As New MySqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using

                End Using
            End Using

            ' ✅ Check data exists
            If dt.Rows.Count = 0 Then
                Throw New Exception("No donation record found.")
            End If

            Dim row As DataRow = dt.Rows(0)

            Dim runnerName As String = If(IsDBNull(row("RunnerName")), "", row("RunnerName").ToString())
            Dim amount As Decimal = If(IsDBNull(row("Amount")), 0, Convert.ToDecimal(row("Amount")))
            Dim transactionId As String = If(IsDBNull(row("TxnId")), "", row("TxnId").ToString())
            Dim bibNo As String = If(IsDBNull(row("BIBNo")), "", row("BIBNo").ToString())
            Dim runCategory As String = If(IsDBNull(row("RunCatagory")), "", row("RunCatagory").ToString())
            Dim transDate As String = If(IsDBNull(row("createdAt")), "", Convert.ToDateTime(row("createdAt")).ToString("dd/MM/yyyy"))
            Dim runCatagory As String = If(IsDBNull(row("RunCatagory")), "", row("RunCatagory").ToString())
            Dim tShirtSize As String = If(IsDBNull(row("TShirtSize")), "", row("TShirtSize").ToString())

            Dim runDate As String = "14/04/2026"


            Dim templateFile As String = Server.MapPath("~/doc/runRegistration.pdf")

            Dim reader As New iTextSharp.text.pdf.PdfReader(templateFile)
            Dim pageSize As iTextSharp.text.Rectangle = reader.GetPageSize(1)

            Using outputPdf As New MemoryStream()

                Using stamper As New PdfStamper(reader, outputPdf)

                    Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)
                    Dim cb As PdfContentByte = stamper.GetOverContent(1)

                    cb.BeginText()

                    ' 🔹 Receipt No
                    cb.SetFontAndSize(bf, 22)
                    cb.SetTextMatrix(135, 660)
                    cb.ShowText(bibNo)

                    ' 🔹 Date
                    cb.SetTextMatrix(1255, 660)
                    cb.ShowText(transDate)

                    ' 🔹 Runner Name
                    cb.SetFontAndSize(bf, 25)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, runnerName.ToUpper(), 250, 600, 0)

                    ' 🔹 Run Cat
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, runCatagory, 250, 540, 0)

                    ' 🔹 Tshirt
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, tShirtSize, 250, 480, 0)

                    ' 🔹 Run Date
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, runDate, 250, 430, 0)

                    ' 🔹 Amount in Words
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, PaytmPaymentResponse.NumberToWords(amount), 250, 305, 0)

                    ' 🔹 Transaction Id
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, transactionId, 330, 255, 0)

                    ' 🔹 Amount Numeric (₹ box)
                    cb.SetFontAndSize(bf, 30)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, amount, 260, 130, 0)

                    cb.EndText()

                    stamper.Close()
                End Using

                Dim pdfBytes As Byte() = outputPdf.ToArray()

                Response.Clear()
                Response.ContentType = "application/pdf"
                Response.AddHeader("Content-Disposition", "attachment; filename=RunReceipt_" & bibNo & ".pdf")
                Response.BinaryWrite(pdfBytes)
                Response.Flush()

                HttpContext.Current.ApplicationInstance.CompleteRequest()

            End Using
        Catch ex As Exception
            Console.WriteLine(ex)
        End Try

    End Function

    Protected Sub btnBindGrid_Click(sender As Object, e As EventArgs)
        BindGridView()
    End Sub
End Class