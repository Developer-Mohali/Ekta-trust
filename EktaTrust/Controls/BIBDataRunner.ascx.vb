Imports System.Drawing
Imports System.IO
Imports System.Net
Imports Microsoft.VisualBasic.ApplicationServices
Imports MySql.Data.MySqlClient

Public Class BIBDataRunner
    Inherits System.Web.UI.UserControl
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            MessageUpdated.Text = ""
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
        End If
    End Sub
    ''' <summary>
    ''' Bind the BIB data data in the grid view
    ''' </summary>
    ''' 
    Private Sub BindGridView()

        Dim userId As Integer = 0
        Dim roleId As Integer = 0

        If Session("RoleId") IsNot Nothing Then
            roleId = Convert.ToInt32(Session("RoleId"))
        End If
        If Session("UserId") IsNot Nothing Then
            userId = Convert.ToInt32(Session("UserId"))
        End If

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim query As String = ""
            Dim cmd As New MySqlCommand()
            cmd.Connection = con

            If roleId = 1 Then
                ' Admin: See all data
                If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                    query = "SELECT DISTINCT * FROM bibdata ORDER BY ID DESC"
                Else
                    query = "SELECT DISTINCT * FROM bibdata WHERE BIBNo LIKE @BIBNo ORDER BY ID DESC"
                    cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                End If
            Else
                ' Non-admin: Filter by userId
                If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                    query = "SELECT DISTINCT * FROM bibdata WHERE UserId = @UserId ORDER BY ID DESC"
                Else
                    query = "SELECT DISTINCT * FROM bibdata WHERE UserId = @UserId AND BIBNo LIKE @BIBNo ORDER BY ID DESC"
                    cmd.Parameters.AddWithValue("@BIBNo", "%" & txtSearch.Text.Trim() & "%")
                End If
                cmd.Parameters.AddWithValue("@UserId", userId)
            End If

            cmd.CommandText = query
            Using sda As New MySqlDataAdapter(cmd)
                Dim dt As New DataTable()
                con.Open()
                sda.Fill(dt)
                con.Close()

                lblRecords.Text = dt.Rows.Count
                gvEvent.DataSource = dt
                gvEvent.DataBind()
            End Using
        End Using

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

        Try

            If BIBDataFileUpload.PostedFile.ContentLength > 0 Then
                Dim fileExt As String = Path.GetExtension(BIBDataFileUpload.FileName).ToLower()

                If fileExt <> ".csv" Then
                    MessageUpdated.Text = "Only .csv file are allowed."
                    MessageUpdated.ForeColor = Color.Red
                    Return
                End If

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
                If Session("RoleId") IsNot Nothing Then
                    roleId = Convert.ToInt32(Session("RoleId"))
                End If
                If Session("UserId") IsNot Nothing Then
                    userId = Convert.ToInt32(Session("UserId"))
                End If
                Dim currentYear As Integer = DateTime.Now.Year
                Dim count As Int32
                count = dt.Rows.Count

                'if user is not superAdmin, check limit permission to add more bib data...
                If roleId = 3 Then
                    ' get user assigned limit
                    Dim userInfo As Dictionary(Of String, String) = GetUserDetails(userId)
                    Dim bibUserCount As Integer = GetBIBCountByUserId(userId)
                    Dim userAddCount = (Convert.ToInt32(userInfo("BIBUserLimit")) - bibUserCount)
                    If userAddCount < count Then
                        MessageUpdated.Text = "<b style='color: red;'>Please contact to Administrator, Limit Exceed: " + userAddCount.ToString() + "</b>"
                        Return
                    End If
                End If

                If dt.Rows.Count > 0 Then
                    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
                    Using con As New MySqlConnection(constr)
                        For Each dtrow As DataRow In dt.Rows
                            Using cmd As New MySqlCommand("InsertBIBData")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.Add(New MySqlParameter("p_BankReferenceNo", (dtrow.Item("Bank Reference No"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_BIBNo", (dtrow.Item("BIB No"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_MobileNumber", (dtrow.Item("Mobile Number"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_RunnerName", (dtrow.Item("Runner Name"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_RunCatagory", (dtrow.Item("Run Catagory"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_TShirtSize", (dtrow.Item("T-Shirt Size"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_Gender", (dtrow.Item("Gender"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_BloodGroup", (dtrow.Item("Blood Group"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_EmailID", (dtrow.Item("Email ID"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_RoleID", (roleId)))
                                    cmd.Parameters.Add(New MySqlParameter("p_CategoryName", (dtrow.Item("Category Name"))))
                                    cmd.Parameters.Add(New MySqlParameter("p_Year", (currentYear)))
                                    cmd.Parameters.Add(New MySqlParameter("p_UserId", (userId)))
                                    cmd.Connection = con
                                    con.Open()
                                    cmd.ExecuteNonQuery()
                                    con.Close()
                                    con.Dispose()
                                End Using
                            End Using
                        Next
                    End Using
                End If
            Else
                lblMessage.Text = "Please select a file"
                lblMessage.ForeColor = Color.Red
            End If
        Catch ex As Exception

        End Try
        Me.BindGridView()
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
        txtCategory.Visible = True
        txtName.Visible = True
        ddlGender.Visible = True
        txtBloodGroup.Visible = True
        txtTshirtSize.Visible = True
        txtMobile.Visible = True
        txtRunCategory.Visible = True
        txtBibNumber.Visible = True
        txtYear.Visible = True
        Reset()
        Me.ModalPopupExtender1.Show()
    End Sub

    Protected Sub gvMIP_RowAction(sender As Object, e As GridViewCommandEventArgs)
        ' Get the selected row's ID
        Dim id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.CommandArgument).Value)

        ' called delete function..
        If e.CommandName = "DeleteRow" Then
            RowDeleting(id)
            Return
        Else
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
                            txtCategory.Text = reader("CategoryName").ToString()
                            txtName.Text = reader("RunnerName").ToString()
                            ddlGender.SelectedValue = reader("Gender").ToString()
                            txtBloodGroup.Text = reader("BloodGroup").ToString()
                            txtTshirtSize.Text = reader("TShirtSize").ToString()
                            txtMobile.Text = reader("MobileNumber").ToString()
                            txtRunCategory.SelectedValue = reader("RunCatagory").ToString()
                            txtBibNumber.Text = reader("BIBNo").ToString()
                            txtYear.Text = reader("Year").ToString()
                            txtEmail.Text = reader("EmailID").ToString()
                        End If
                    End Using
                End Using
            End Using

            ' Show the modal popup
            ModalPopupExtender1.Show()
        End If
    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim bankReference As String = txtBankRef.Text
        Dim category As String = txtCategory.Text
        Dim name As String = txtName.Text
        Dim gender As String = ddlGender.SelectedValue
        Dim email As String = txtEmail.Text
        Dim bloodGroup As String = txtBloodGroup.Text
        Dim tshirtSize As String = txtTshirtSize.Text
        Dim mobile As String = txtMobile.Text
        Dim runCategory As String = txtRunCategory.Text
        Dim bibNumber As String = txtBibNumber.Text
        Dim year As String = txtYear.Text
        Dim idToUpdate As Integer = 0
        Integer.TryParse(hfEditID.Value, idToUpdate)

        If idToUpdate > 0 Then
            UpdateBibData()
        Else
            Dim IsPermitted As Boolean = HavingBIBLimit()
            If (IsPermitted = False) Then
                MessageUpdated.Text = "<b style='color: red;'>Adding Limit Exceed, Please contact Administrator</b>"
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
                            cmd.Parameters.Add(New MySqlParameter("p_BloodGroup", bloodGroup))
                            cmd.Parameters.Add(New MySqlParameter("p_EmailID", email))
                            cmd.Parameters.Add(New MySqlParameter("p_RoleID", (roleId)))
                            cmd.Parameters.Add(New MySqlParameter("p_CategoryName", category))
                            cmd.Parameters.Add(New MySqlParameter("p_Year", (year)))
                            cmd.Parameters.Add(New MySqlParameter("p_UserId", (userId)))
                            cmd.Connection = con
                            con.Open()
                            cmd.ExecuteNonQuery()
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                End Using
            Catch ex As Exception
                lblError.Text = ex.ToString()
                lblError.Visible = True
            End Try
            MessageUpdated.Text = "<b>Added Successfully</b>"
            BindGridView()
        End If
    End Sub

    Protected Sub UpdateBibData()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim query As String

            query = "UPDATE bibdata SET BankReferenceNo=@bankRef, CategoryName=@cat, RunnerName=@name, gender=@gender, BloodGroup=@blood, TShirtSize=@size, MobileNumber=@mobile, RunCatagory=@run, BIBNo=@bib, Year=@year, EmailID=@email WHERE ID=@id"

            Using cmd As New MySqlCommand(query, con)
                cmd.Parameters.AddWithValue("@bankRef", txtBankRef.Text.Trim())
                cmd.Parameters.AddWithValue("@cat", txtCategory.Text.Trim())
                cmd.Parameters.AddWithValue("@name", txtName.Text.Trim())
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue)
                cmd.Parameters.AddWithValue("@blood", txtBloodGroup.Text.Trim())
                cmd.Parameters.AddWithValue("@size", txtTshirtSize.Text.Trim())
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text.Trim())
                cmd.Parameters.AddWithValue("@run", txtRunCategory.Text.Trim())
                cmd.Parameters.AddWithValue("@bib", txtBibNumber.Text.Trim())
                cmd.Parameters.AddWithValue("@year", txtYear.Text.Trim())
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim())
                cmd.Parameters.AddWithValue("@id", hfEditID.Value.Trim())

                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        ' Clear form and refresh
        hfEditID.Value = ""
        MessageUpdated.Text = "<b>Updated Successfully</b>"
        BindGridView()
    End Sub

    Public Function HavingBIBLimit() As Boolean
        Dim count As Integer = 0
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
                count = GetBIBCountByUserId(userId)
                ' return true if limit not exceed to assigned limit..
                If Convert.ToInt32(userInfo("BIBUserLimit")) < count Then
                    Return True
                End If
            End If
        End If

        Return False
    End Function

    Public Function GetBIBCountByUserId(userId As Integer) As Integer
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT COUNT(*) FROM bibdata WHERE UserId = @userId and RoleID = @roleId", con)
                cmd.Parameters.AddWithValue("@userId", userId)
                cmd.Parameters.AddWithValue("@roleId", 3)
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
                            userDetails("BIBUserLimit") = reader("BIBUserLimit").ToString()

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
        Using client As New WebClient()
            Dim folderPath As String = Server.MapPath("~/Files/BibData/BIBInsertSample.csv")
            Dim destinationPath As String = "C:\Downloads\BIBInsertSample.csv"
            Try
                client.DownloadFile(folderPath, destinationPath)
                Console.WriteLine("File downloaded successfully to: " & destinationPath)
            Catch ex As Exception
                Console.WriteLine("Error downloading file: " & ex.Message)
            End Try
        End Using
    End Sub
End Class