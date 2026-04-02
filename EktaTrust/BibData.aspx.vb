Imports System.Data.OleDb
Imports MySql.Data.MySqlClient

Public Class BibData
    Inherits System.Web.UI.Page

    Dim dateTable As New DataTable
    Protected year As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hdnMsgBiBData.Visible = False
        year = Request.QueryString("year")?.ToString()
    End Sub

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim path As String = Server.MapPath("~/Files/BibData/BibData.xlsx")
        Dim mobile As String = txtMobileNo.Text

        'dateTable = LoadAndFilterExcel(path, mobile)
        dateTable = GetBIBDataByNumber(mobile)

        If dateTable.Rows.Count > 0 Then
            hdnMsgBiBData.InnerText = "Congratulations Your details are as follows!"
            Session("bib_data") = dateTable
        Else
            hdnMsgBiBData.InnerText = "Result Not Found."
        End If

        getRec.DataSource = dateTable
        getRec.DataBind()
        hdnMsgBiBData.Visible = True
    End Sub

    Private Function LoadAndFilterExcel(filePath As String, mobileNumber As String) As DataTable
        Dim resultTable As New DataTable()
        resultTable.Columns.Add("category_name")
        resultTable.Columns.Add("participate_name")
        resultTable.Columns.Add("gender")
        resultTable.Columns.Add("blood_group")
        resultTable.Columns.Add("tshirt_size")
        resultTable.Columns.Add("run_category")
        resultTable.Columns.Add("bib_no")
        resultTable.Columns.Add("collect_bib")

        Try
            'Dim connStr As String = "Provider=Microsoft.ACE.OLEDB.12.0;" &
            '                    "Data Source=" & filePath & ";" &
            '                    "Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=1';"
            Dim connStr As String = "Provider=Microsoft.ACE.OLEDB.12.0;" &
                        "Data Source=" & filePath & ";" &
                        "Extended Properties=""Excel 12.0;HDR=YES;IMEX=1"";"
            Using conn As New OleDbConnection(connStr)
                conn.Open()
                Dim schemaTable As DataTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
                Dim sheetName As String = schemaTable.Rows(0)("TABLE_NAME").ToString()

                Dim query As String = $"SELECT * FROM [{sheetName}]"
                Dim adapter As New OleDbDataAdapter(query, conn)
                Dim dt As New DataTable()
                adapter.Fill(dt)

                Dim filteredRows = dt.AsEnumerable().Where(Function(r)
                                                               Dim mobileRaw As String = Convert.ToString(r("Mobile Number")).Trim()
                                                               Dim mobileParts = mobileRaw.Split("/"c)
                                                               Return mobileParts.Any(Function(m) m.Trim() = mobileNumber)
                                                           End Function).ToList()

                ' 🧠 Note: Match the exact column headers from Excel
                For Each row As DataRow In filteredRows
                    Dim newRow As DataRow = resultTable.NewRow()

                    newRow("category_name") = If(String.IsNullOrWhiteSpace(row("Category Name").ToString()), "Registration For RUN FOR EQUALITY", row("Category Name").ToString())
                    newRow("participate_name") = row("Runner Name").ToString()
                    newRow("gender") = GetNormalizeGender(row("Gender").ToString())
                    newRow("blood_group") = If(row("Blood Group").ToString() = "-", "", row("Blood Group").ToString())
                    newRow("tshirt_size") = If(row("T-Shirt Size").ToString() = "-", "", row("T-Shirt Size").ToString())
                    newRow("run_category") = If(row("Run Catagory").ToString() = "-", "", row("Run Catagory").ToString())

                    newRow("bib_no") = If(String.IsNullOrWhiteSpace(row("BIB No").ToString()), "Updated soon", row("BIB No").ToString())
                    newRow("collect_bib") = If(String.IsNullOrWhiteSpace(row("Venue to Collect BIB").ToString()), "Institute of Local Self Government, Tonk Road Jaipur", row("Venue to Collect BIB").ToString())

                    resultTable.Rows.Add(newRow)
                Next
            End Using

        Catch ex As Exception
            hdnMsgBiBData.InnerText = ex.Message
            hdnMsgBiBData.Visible = True
        End Try

        Return resultTable
    End Function

    Private Function GetNormalizeGender(gender As String) As String
        Dim normalizeGender As String = gender.Trim().ToLower()

        Select Case normalizeGender
            Case "m"
                Return "Male"
            Case "f"
                Return "Female"
            Case "-"
                Return ""
            Case Else
                Return gender ' return original value if not matched
        End Select
    End Function

    Private Function GetBIBDataByNumber(mobile As String) As DataTable
        Dim dt As New DataTable()

        Try
            year = Request.QueryString("year")?.ToString()
            Dim query As String =
                "SELECT DISTINCT CategoryName as category_name, RunnerName as participate_name, Gender as gender, BloodGroup as blood_group, TShirtSize as tshirt_size,
                  RunCatagory as run_category, BIBNo as bib_no, CollectBIB as collect_bib FROM bibdata WHERE MobileNumber = @mobile AND Year = @year and paymentstatus='success'"

            Dim constr As String =
                ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand(query, con)

                    cmd.Parameters.AddWithValue("@mobile", mobile)
                    cmd.Parameters.AddWithValue("@year", year)

                    Using sda As New MySqlDataAdapter(cmd)
                        con.Open()
                        sda.Fill(dt)
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Throw   ' don't swallow errors
        End Try

        Return dt
    End Function

End Class