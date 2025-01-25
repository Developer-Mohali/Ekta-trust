Imports System.Drawing
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class CertificationReport
    Inherits System.Web.UI.Page
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
    ''' Bind the Certification data in the grid view
    ''' </summary>
    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            If txtSearch.Text = "" Then
                Using cmd As New MySqlCommand("Select DISTINCT * from tblrunregistrationuser order by ID desc")
                    'Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        sda.SelectCommand = cmd
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
                Using cmd As New MySqlCommand("Select DISTINCT * from tblrunregistrationuser WHERE bib_no LIKE '%" + txtSearch.Text.Trim() + "%' order by ID desc")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Connection = con
                        con.Open()
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        lblRecords.Text = dt.Rows.Count
                        gvEvent.DataSource = dt
                        gvEvent.DataBind()
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End If
        End Using

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
    ''' <summary>
    ''' Import data from CSV file and save in the DB
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub ImportFromExcel(sender As Object, e As EventArgs) Handles btnUpload.Click

        Try

            If certificateFileUpload.PostedFile.ContentLength > 0 Then

                Dim folderPath As String = Server.MapPath("~/CertificateFiles/")
                Dim fileName = Convert.ToString(Guid.NewGuid())

                Dim fileNameNew As String = fileName + "_" + certificateFileUpload.FileName

                ' SAVE THE SELECTED FILE IN THE ROOT DIRECTORY.
                'certificateFileUpload.SaveAs(folderPath & Path.GetFileName(certificateFileUpload.FileName))
                certificateFileUpload.SaveAs(folderPath & fileNameNew)

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


                Dim count As Int32
                count = dt.Rows.Count
                If dt.Rows.Count > 0 Then
                    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
                    Using con As New MySqlConnection(constr)
                        For Each dtrow As DataRow In dt.Rows
                            Using cmd As New MySqlCommand("Insert_RunRegistrationUser")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.Add(New MySqlParameter("bib_no", Convert.ToInt32(dtrow.Item("bib_no"))))
                                    cmd.Parameters.Add(New MySqlParameter("start_time", (dtrow.Item("Start time"))))
                                    cmd.Parameters.Add(New MySqlParameter("gun_time", (dtrow.Item("Gun time"))))
                                    cmd.Parameters.Add(New MySqlParameter("split1", (dtrow.Item("Split1"))))
                                    cmd.Parameters.Add(New MySqlParameter("finish_time", (dtrow.Item("Finish time"))))
                                    cmd.Parameters.Add(New MySqlParameter("gross_time", (dtrow.Item("Gross time"))))
                                    cmd.Parameters.Add(New MySqlParameter("net_time", (dtrow.Item("Net Time"))))
                                    cmd.Parameters.Add(New MySqlParameter("overall_speed", (dtrow.Item("Overall Speed (kmph)"))))
                                    cmd.Parameters.Add(New MySqlParameter("overall_pace", (dtrow.Item("Overall Pace (min/km)"))))
                                    cmd.Parameters.Add(New MySqlParameter("category_rank", (dtrow.Item("Category Rank"))))
                                    cmd.Parameters.Add(New MySqlParameter("gender_rank", (dtrow.Item("Gender Rank"))))
                                    cmd.Parameters.Add(New MySqlParameter("overall_rank", (dtrow.Item("Overall Rank"))))
                                    cmd.Parameters.Add(New MySqlParameter("event_category", (dtrow.Item("Event Category"))))
                                    cmd.Parameters.Add(New MySqlParameter("event_subCategory", (dtrow.Item("Event Sub-Category"))))
                                    cmd.Parameters.Add(New MySqlParameter("event_name", (dtrow.Item("Event Name"))))
                                    cmd.Parameters.Add(New MySqlParameter("participate_name", (dtrow.Item("Participant Name"))))
                                    cmd.Parameters.Add(New MySqlParameter("gender", (dtrow.Item("gender"))))
                                    cmd.Parameters.Add(New MySqlParameter("email", (dtrow.Item("email"))))
                                    cmd.Parameters.Add(New MySqlParameter("phone", (dtrow.Item("Phone"))))
                                    cmd.Parameters.Add(New MySqlParameter("yearData", "2023"))
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

    End Sub

    ''' <summary>
    ''' Delete the Certification data from the grid view
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub gvMIP_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("delete from tblrunregistrationuser WHERE ID = @Id", con)
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

End Class