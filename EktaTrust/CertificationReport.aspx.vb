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
            If certificateFileUpload.HasFile Then
                Dim folderPath As String = Server.MapPath("~/CertificateFiles/")
                Dim uniqueFileName As String = Guid.NewGuid().ToString() & "_" & Path.GetFileName(certificateFileUpload.FileName)
                Dim fullFilePath As String = Path.Combine(folderPath, uniqueFileName)

                ' Save uploaded file
                certificateFileUpload.SaveAs(fullFilePath)

                Dim dt As New DataTable()

                Using SR As New StreamReader(fullFilePath)
                    ' Read column headers
                    Dim headerLine As String = SR.ReadLine()
                    If String.IsNullOrEmpty(headerLine) Then
                        lblMessage.Text = "The uploaded file is empty."
                        lblMessage.ForeColor = Color.Red
                        Return
                    End If

                    Dim headers As String() = headerLine.Split(","c)
                    For Each header As String In headers
                        dt.Columns.Add(New DataColumn(header.Trim()))
                    Next

                    ' Read data rows
                    While Not SR.EndOfStream
                        Dim values As String() = SplitCSV(SR.ReadLine())
                        If values.Length = dt.Columns.Count Then
                            dt.Rows.Add(values)
                        End If
                    End While
                End Using

                ' Insert into DB
                If dt.Rows.Count > 0 Then
                    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

                    Using con As New MySqlConnection(constr)
                        con.Open()
                        For Each dtrow As DataRow In dt.Rows
                            Using cmd As New MySqlCommand("Insert_RunRegistrationUser", con)
                                cmd.CommandType = CommandType.StoredProcedure

                                cmd.Parameters.AddWithValue("bib_no", Convert.ToInt32(dtrow("bib_no")))
                                cmd.Parameters.AddWithValue("start_time", dtrow("Start time"))
                                cmd.Parameters.AddWithValue("gun_time", dtrow("Gun time"))
                                cmd.Parameters.AddWithValue("split1", dtrow("Split1"))
                                cmd.Parameters.AddWithValue("finish_time", dtrow("Finish time"))
                                cmd.Parameters.AddWithValue("gross_time", dtrow("Gross time"))
                                cmd.Parameters.AddWithValue("net_time", dtrow("Net Time"))
                                cmd.Parameters.AddWithValue("overall_speed", dtrow("Overall Speed (kmph)"))
                                cmd.Parameters.AddWithValue("overall_pace", dtrow("Overall Pace (min/km)"))
                                cmd.Parameters.AddWithValue("category_rank", dtrow("Category Rank"))
                                cmd.Parameters.AddWithValue("gender_rank", dtrow("Gender Rank"))
                                cmd.Parameters.AddWithValue("overall_rank", dtrow("Overall Rank"))
                                cmd.Parameters.AddWithValue("event_category", dtrow("Event Category"))
                                cmd.Parameters.AddWithValue("event_subCategory", dtrow("Event Sub-Category"))
                                cmd.Parameters.AddWithValue("event_name", dtrow("Event Name"))
                                cmd.Parameters.AddWithValue("participate_name", dtrow("Participant Name"))
                                cmd.Parameters.AddWithValue("gender", dtrow("gender"))
                                cmd.Parameters.AddWithValue("email", dtrow("email"))
                                cmd.Parameters.AddWithValue("phone", dtrow("Phone"))
                                cmd.Parameters.AddWithValue("yearData", dtrow("dateyear"))

                                cmd.ExecuteNonQuery()
                            End Using
                        Next
                    End Using

                    lblMessage.Text = $"{dt.Rows.Count} records successfully imported."
                    lblMessage.ForeColor = Color.Green
                Else
                    lblMessage.Text = "No data rows found in file."
                    lblMessage.ForeColor = Color.Red
                End If
            Else
                lblMessage.Text = "Please select a file."
                lblMessage.ForeColor = Color.Red
            End If

        Catch ex As Exception
            lblMessage.Text = "An error occurred while processing the file."
            lblMessage.ForeColor = Color.Red
            ' Log the exception (optional: using a logger or writing to a file/event log)
        End Try
        Me.BindGridView()
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