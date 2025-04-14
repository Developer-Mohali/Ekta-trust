Imports System.Drawing
Imports System.IO
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


    Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("delete from bibdata WHERE ID = @Id", con)
                cmd.Parameters.AddWithValue("@Id", Id)
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
End Class