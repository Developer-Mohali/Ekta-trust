Imports System.Globalization
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports MySql.Data.MySqlClient


Public Class Certificate
    Inherits System.Web.UI.Page

    Dim dateTable As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hdnMessageCertificate.Visible = False
        'If Not IsPostBack Then
        '    BindYearDropDown()
        'End If
    End Sub
    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim selectedYear As String = DdlYear.SelectedValue
        Dim dateTable As New DataTable()

        Dim query As String = "SELECT DISTINCT ID, bib_no, participate_name, gender, Event_Name, Net_Time, year 
                       FROM tblRunRegistrationUser 
                       WHERE phone = @phone AND year = @year"

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand(query, con)
                ' Use parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@phone", txtMobileNo.Text.Trim())
                cmd.Parameters.AddWithValue("@year", selectedYear.Trim())

                Using da As New MySqlDataAdapter(cmd)
                    da.Fill(dateTable)
                End Using
            End Using
        End Using

        If dateTable.Rows.Count > 0 Then
            hdnMessageCertificate.InnerText = "Congratulations! Your details are as follows."
            Session("participate_name") = dateTable
        Else
            hdnMessageCertificate.InnerText = "Result Not Found."
        End If

        getRec.DataSource = dateTable
        getRec.DataBind()
        hdnMessageCertificate.Visible = True
    End Sub


    'function to get years from registration table..
    Protected Sub BindYearDropDown()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim GetYears As String = "SELECT DISTINCT year FROM tblRunRegistrationUser ORDER BY year DESC"

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand(GetYears, con)
                con.Open()

                Dim reader As MySqlDataReader = cmd.ExecuteReader()

                ' Clear existing items before binding
                DdlYear.Items.Clear()

                ' Add years from the database
                While reader.Read()
                    Dim year As Integer = reader.GetInt32("year")
                    DdlYear.Items.Add(year.ToString())
                End While

                con.Close()
            End Using
        End Using
    End Sub

    Protected Sub DownloadButton1_Click(sender As Object, e As EventArgs)

        Dim selectedYear As String = DdlYear.SelectedValue

        If selectedYear = "2025" Then
            Dim candidateName, Hrs, min, sec, runCategory As String
            Dim categoryAndTimeFont As Decimal = 12.0F
            Dim time As DateTime
            Dim year As Integer = 2023
            ' Find the Button and get the corresponding GridViewRow
            Dim btn As Button = CType(sender, Button)
            Dim rowGridView As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            ' Find the HiddenField in the row
            Dim hfID As HiddenField = CType(rowGridView.FindControl("hfID"), HiddenField)
            Dim ID As String = hfID.Value
            dateTable = Session("participate_name")
            Dim filteredRows() As DataRow = dateTable.Select("ID = " & ID)
            For Each row As DataRow In filteredRows

                If IsDBNull(row.Item("Net_Time")) OrElse String.IsNullOrWhiteSpace(row.Item("Net_Time").ToString()) Then
                    Hrs = ""
                    min = ""
                    sec = ""
                Else
                    Dim timeParts() As String = row.Item("Net_Time").ToString().Trim().Split(":"c)

                    Select Case timeParts.Length
                        Case 3
                            ' Format: hh:mm:ss
                            Hrs = timeParts(0)
                            min = timeParts(1)
                            sec = timeParts(2)
                        Case 4
                            ' Format: hh:mm:ss:ms – ignore milliseconds
                            Hrs = timeParts(0)
                            min = timeParts(1)
                            sec = timeParts(2) ' You can capture timeParts(3) if needed as milliseconds
                        Case Else
                            ' Unexpected format
                            Hrs = ""
                            min = ""
                            sec = ""
                    End Select
                End If


                If IsDBNull(row.Item("participate_name")) Then
                    candidateName = ""
                Else
                    candidateName = row.Item("participate_name").ToString().ToUpper()

                End If
                If Not IsDBNull(row.Item("year")) Then
                    year = row.Item("year")
                End If

                If IsDBNull(row.Item("Event_Name")) Then
                    runCategory = ""
                Else


                    Dim eventName As String = row.Item("Event_Name").ToString().ToUpper().Trim()

                    If eventName.Contains("5K") Then
                        runCategory = "05 KM"
                    ElseIf eventName.Contains("10K") Then
                        runCategory = "10 KM"
                    ElseIf eventName.Contains("21K") Then
                        runCategory = "21KM"
                    End If



                End If
            Next
            ' candidateName = "LOKESH CHOUDHARY LOKESH CHOUDHARY"
            ' Dim templateFile As String = Server.MapPath("~/doc/EktaCertificatedesign.pdf")
            Dim templateFile As String = Server.MapPath("~/doc/RunforEqually6thedition.pdf")

            Dim inputPdf As Stream = New FileStream(templateFile, FileMode.Open, FileAccess.Read, FileShare.Read)
            Dim reader As PdfReader = New PdfReader(inputPdf)
            Dim pageSize As Rectangle = reader.GetPageSize(1)

            Using outputPdf As New MemoryStream()

                Using stamper As New PdfStamper(reader, outputPdf)

                    ' Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)
                    Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLDOBLIQUE, BaseFont.CP1252, False)

                    Dim overContent As PdfContentByte = stamper.GetOverContent(1)



                    ' Coordinates
                    'Dim x As Single = 702
                    'Dim y As Single = 280

                    '' Set background rectangle before drawing text
                    'overContent.SaveState()
                    'overContent.SetColorFill(BaseColor.WHITE)
                    'overContent.Rectangle(x, y - 5, 55, 25) ' width and height depend on font size and text length
                    'overContent.Fill()
                    'overContent.RestoreState()

                    '' Draw the text
                    'overContent.BeginText()
                    'overContent.SetFontAndSize(bf, 25.0F)
                    'overContent.SetTextMatrix(x, y)
                    'overContent.ShowText(year.ToString())
                    'overContent.EndText()

                    'Candidate Name
                    overContent.SaveState()
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, 14.0F) 'Font Size
                    'overContent.SetTextMatrix(570, 500)
                    'overContent.ShowText(candidateName)
                    overContent.ShowTextAligned(PdfContentByte.ALIGN_CENTER, candidateName, ((pageSize.Left + 20) + pageSize.Right) / 2, pageSize.GetTop(Utilities.MillimetersToPoints(74)), 0)
                    overContent.EndText()

                    'Run Category
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(350, 203)
                    overContent.ShowText(runCategory)
                    overContent.EndText()

                    'Hrs
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(452, 203)
                    overContent.ShowText(Hrs)
                    overContent.EndText()

                    'Min
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(505, 203)
                    overContent.ShowText(min)
                    overContent.EndText()

                    'Sec
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(555, 203)
                    overContent.ShowText(sec)
                    overContent.EndText()

                    overContent.RestoreState()

                    'Save the changes to file
                    stamper.Close()

                End Using


                Dim pdf As Byte() = outputPdf.ToArray()
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Buffer = False
                Response.Clear()
                Response.ClearContent()
                Response.ClearHeaders()
                Response.Charset = String.Empty
                Response.ContentType = "application/pdf"
                Response.AddHeader("content-length", pdf.Length.ToString())
                Response.AddHeader("Content-Disposition", "attachment;filename=" + candidateName + ".pdf;")
                Response.BinaryWrite(pdf)
                Response.Close()
            End Using
        Else
            Dim candidateName, Hrs, min, sec, runCategory As String
            Dim categoryAndTimeFont As Decimal = 20.0F
            Dim time As DateTime

            Dim btn As Button = CType(sender, Button)
            Dim rowGridView As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            ' Find the HiddenField in the row
            Dim hfID As HiddenField = CType(rowGridView.FindControl("hfID"), HiddenField)
            Dim ID As String = hfID.Value
            dateTable = Session("participate_name")
            Dim filteredRows() As DataRow = dateTable.Select("ID = " & ID)
            For Each row As DataRow In filteredRows

                If IsDBNull(row.Item("Net_Time")) OrElse String.IsNullOrWhiteSpace(row.Item("Net_Time").ToString()) Then
                    Hrs = ""
                    min = ""
                    sec = ""
                Else
                    Dim timeParts() As String = row.Item("Net_Time").ToString().Trim().Split(":"c)

                    Select Case timeParts.Length
                        Case 3
                            ' Format: hh:mm:ss
                            Hrs = timeParts(0)
                            min = timeParts(1)
                            sec = timeParts(2)
                        Case 4
                            ' Format: hh:mm:ss:ms – ignore milliseconds
                            Hrs = timeParts(0)
                            min = timeParts(1)
                            sec = timeParts(2) ' You can capture timeParts(3) if needed as milliseconds
                        Case Else
                            ' Unexpected format
                            Hrs = ""
                            min = ""
                            sec = ""
                    End Select
                End If


                If IsDBNull(row.Item("participate_name")) Then
                    candidateName = ""
                Else
                    candidateName = row.Item("participate_name").ToString().ToUpper()

                End If


                If IsDBNull(row.Item("Event_Name")) Then
                    runCategory = ""
                Else


                    Dim eventName As String = row.Item("Event_Name").ToString().ToUpper().Trim()

                    If eventName.Contains("5K") Then
                        runCategory = "05 KM"
                    ElseIf eventName.Contains("10K") Then
                        runCategory = "10 KM"
                    ElseIf eventName.Contains("21K") Then
                        runCategory = "21KM"
                    End If



                End If
            Next
            ' candidateName = "LOKESH CHOUDHARY LOKESH CHOUDHARY"
            Dim templateFile As String = Server.MapPath("~/doc/EktaCertificatedesign.pdf")
            'Dim templateFile As String = Server.MapPath("~/doc/ekta-certificate.pdf")

            Dim inputPdf As Stream = New FileStream(templateFile, FileMode.Open, FileAccess.Read, FileShare.Read)
            Dim reader As PdfReader = New PdfReader(inputPdf)
            Dim pageSize As Rectangle = reader.GetPageSize(1)

            Using outputPdf As New MemoryStream()

                Using stamper As New PdfStamper(reader, outputPdf)

                    Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)

                    Dim overContent As PdfContentByte = stamper.GetOverContent(1)

                    'Candidate Name
                    overContent.SaveState()
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, 24.0F) 'Font Size
                    'overContent.SetTextMatrix(570, 500)
                    'overContent.ShowText(candidateName)
                    overContent.ShowTextAligned(PdfContentByte.ALIGN_CENTER, candidateName, ((pageSize.Left + 25) + pageSize.Right) / 2, pageSize.GetTop(Utilities.MillimetersToPoints(155)), 0)
                    overContent.EndText()

                    'Run Category
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(560, 234)
                    overContent.ShowText(runCategory)
                    overContent.EndText()

                    'Hrs
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(750, 234)
                    overContent.ShowText(Hrs)
                    overContent.EndText()

                    'Min
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(835, 234)
                    overContent.ShowText(min)
                    overContent.EndText()

                    'Sec
                    overContent.BeginText()
                    overContent.SetFontAndSize(bf, categoryAndTimeFont) 'Font Size
                    overContent.SetTextMatrix(920, 234)
                    overContent.ShowText(sec)
                    overContent.EndText()

                    overContent.RestoreState()

                    'Save the changes to file
                    stamper.Close()

                End Using


                Dim pdf As Byte() = outputPdf.ToArray()
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Buffer = False
                Response.Clear()
                Response.ClearContent()
                Response.ClearHeaders()
                Response.Charset = String.Empty
                Response.ContentType = "application/pdf"
                Response.AddHeader("content-length", pdf.Length.ToString())
                Response.AddHeader("Content-Disposition", "attachment;filename=" + candidateName + ".pdf;")
                Response.BinaryWrite(pdf)
                Response.Close()
            End Using
        End If




    End Sub

    Protected Sub DownloadButton_Click(sender As Object, e As EventArgs)
        Dim selectedYear As String = DdlYear.SelectedValue
        Dim candidateName, Hrs, min, sec, runCategory As String
        Dim categoryAndTimeFont As Decimal = If(selectedYear = "2025", 12.0F, 20.0F)
        Dim year As Integer = 2023

        Dim btn As Button = CType(sender, Button)
        Dim rowGridView As GridViewRow = CType(btn.NamingContainer, GridViewRow)
        Dim hfID As HiddenField = CType(rowGridView.FindControl("hfID"), HiddenField)
        Dim ID As String = hfID.Value

        dateTable = Session("participate_name")
        Dim filteredRows() As DataRow = dateTable.Select("ID = " & ID)

        ' download runner certificate for 2026
        If selectedYear = "2026" Then
            Download2026Certificate(filteredRows)
            Return
        End If

        For Each row As DataRow In filteredRows
            ' Time Parsing
            If IsDBNull(row("Net_Time")) OrElse String.IsNullOrWhiteSpace(row("Net_Time").ToString()) Then
                Hrs = "" : min = "" : sec = ""

            Else
                Dim timeParts() As String = row.Item("Net_Time").ToString().Trim().Split(":"c)
                If timeParts.Length >= 3 Then
                    Hrs = timeParts(0)
                    min = timeParts(1)
                    sec = timeParts(2)
                End If
            End If

            ' Candidate Name
            candidateName = If(IsDBNull(row("participate_name")), "", row("participate_name").ToString().ToUpper())

            ' Year
            If Not IsDBNull(row("year")) Then year = row("year")

            ' Run Category
            If Not IsDBNull(row("Event_Name")) Then
                Dim eventName As String = row("Event_Name").ToString().ToUpper().Trim()
                If eventName.Contains("5K") Then
                    runCategory = "05KM"
                ElseIf eventName.Contains("10K") Then
                    runCategory = "10KM"
                ElseIf eventName.Contains("21K") Then
                    runCategory = "21KM"
                Else
                    runCategory = ""
                End If
            End If
        Next

        ' PDF Template
        Dim templateFile As String = If(selectedYear = "2025", Server.MapPath("~/doc/RunforEqually6thedition.pdf"), Server.MapPath("~/doc/EktaCertificatedesign.pdf"))
        Dim inputPdf As Stream = New FileStream(templateFile, FileMode.Open, FileAccess.Read, FileShare.Read)
        Dim reader As New PdfReader(inputPdf)
        Dim pageSize As Rectangle = reader.GetPageSize(1)

        Using outputPdf As New MemoryStream()
            Using stamper As New PdfStamper(reader, outputPdf)
                Dim fontName As String = If(selectedYear = "2025", BaseFont.HELVETICA, BaseFont.HELVETICA)
                Dim bf As BaseFont = BaseFont.CreateFont(fontName, BaseFont.CP1252, False)
                Dim overContent As PdfContentByte = stamper.GetOverContent(1)

                overContent.SaveState()

                ' Candidate Name
                overContent.BeginText()
                overContent.SetFontAndSize(bf, If(selectedYear = "2025", 14.0F, 24.0F))
                Dim pageSizeLeft As Integer = If(selectedYear = "2025", 10, 25)

                Dim yName = If(selectedYear = "2025", Utilities.MillimetersToPoints(74), Utilities.MillimetersToPoints(155))
                overContent.ShowTextAligned(PdfContentByte.ALIGN_CENTER, candidateName, ((pageSize.Left + pageSizeLeft) + pageSize.Right) / 2, pageSize.GetTop(yName), 0)
                overContent.EndText()

                ' Coordinates
                Dim coord = If(selectedYear = "2025", New With {.CatX = 350, .HrsX = 455, .MinX = 505, .SecX = 555, .Y = 203}, New With {.CatX = 560, .HrsX = 750, .MinX = 835, .SecX = 920, .Y = 234})

                ' Run Category
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.CatX, coord.Y)
                overContent.ShowText(runCategory)
                overContent.EndText()

                ' Hrs
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.HrsX, coord.Y)
                overContent.ShowText(Hrs)
                overContent.EndText()

                ' Min
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.MinX, coord.Y)
                overContent.ShowText(min)
                overContent.EndText()

                ' Sec
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.SecX, coord.Y)
                overContent.ShowText(sec)
                overContent.EndText()

                overContent.RestoreState()
                stamper.Close()
            End Using

            ' Output PDF
            Dim pdf As Byte() = outputPdf.ToArray()
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Buffer = False
            Response.Clear()
            Response.ClearContent()
            Response.ClearHeaders()
            Response.Charset = String.Empty
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", pdf.Length.ToString())
            Response.AddHeader("Content-Disposition", $"attachment;filename={candidateName}.pdf;")
            Response.BinaryWrite(pdf)
            Response.Close()
        End Using
    End Sub


    Protected Sub DownloadButtontest_Click(sender As Object, e As EventArgs)

        Dim selectedYear As String = DdlYear.SelectedValue
        Dim isNewFormat As Boolean = {"2025", "2026"}.Contains(selectedYear)

        Dim btn As Button = CType(sender, Button)
        Dim rowGridView As GridViewRow = CType(btn.NamingContainer, GridViewRow)
        Dim hfID As HiddenField = CType(rowGridView.FindControl("hfID"), HiddenField)
        Dim ID As String = hfID.Value

        Dim dt As DataTable = CType(Session("participate_name"), DataTable)
        Dim row As DataRow = dt.Select("ID = " & ID).FirstOrDefault()

        If row Is Nothing Then Exit Sub

        ' Extract Data
        Dim candidateName As String = GetCandidateName(row)
        Dim runCategory As String = GetRunCategory(row)
        Dim year As Integer = If(IsDBNull(row("year")), 2023, Convert.ToInt32(row("year")))

        Dim timeParts = GetTimeParts(row("Net_Time"))
        Dim Hrs = timeParts.Item1
        Dim Min = timeParts.Item2
        Dim Sec = timeParts.Item3

        ' PDF Setup
        Dim templateFile As String = GetTemplatePath(selectedYear, isNewFormat)
        Dim coords = GetCoordinates(isNewFormat)
        Dim fontSize As Decimal = If(isNewFormat, 12.0F, 20.0F)

        Using reader As New PdfReader(templateFile)
            Using outputPdf As New MemoryStream()
                Using stamper As New PdfStamper(reader, outputPdf)

                    Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)
                    Dim content As PdfContentByte = stamper.GetOverContent(1)
                    Dim pageSize As Rectangle = reader.GetPageSize(1)

                    content.SaveState()

                    ' Candidate Name
                    WriteText(content, bf,
                          If(isNewFormat, 14.0F, 24.0F),
                          candidateName,
                          PdfContentByte.ALIGN_CENTER,
                          ((pageSize.Left + If(isNewFormat, 10, 25)) + pageSize.Right) / 2,
                          pageSize.GetTop(If(isNewFormat,
                              Utilities.MillimetersToPoints(74),
                              Utilities.MillimetersToPoints(155)))
                )

                    ' Run Category + Time
                    WriteText(content, bf, fontSize, runCategory, coords.CatX, coords.Y)
                    WriteText(content, bf, fontSize, Hrs, coords.HrsX, coords.Y)
                    WriteText(content, bf, fontSize, Min, coords.MinX, coords.Y)
                    WriteText(content, bf, fontSize, Sec, coords.SecX, coords.Y)

                    content.RestoreState()
                End Using

                SendPdfToResponse(outputPdf.ToArray(), candidateName)

            End Using
        End Using

    End Sub
    Private Function GetCandidateName(row As DataRow) As String
        Return If(IsDBNull(row("participate_name")), "",
              row("participate_name").ToString().ToUpper())
    End Function
    Private Function GetRunCategory(row As DataRow) As String
        If IsDBNull(row("Event_Name")) Then Return ""

        Dim eventName As String = row("Event_Name").ToString().ToUpper()

        If eventName.Contains("5K") Then Return "05KM"
        If eventName.Contains("10K") Then Return "10KM"
        If eventName.Contains("21K") Then Return "21KM"

        Return ""
    End Function
    Private Function GetTimeParts(netTimeObj As Object) As Tuple(Of String, String, String)

        If IsDBNull(netTimeObj) OrElse String.IsNullOrWhiteSpace(netTimeObj.ToString()) Then
            Return Tuple.Create("", "", "")
        End If

        Dim parts = netTimeObj.ToString().Split(":"c)

        If parts.Length >= 3 Then
            Return Tuple.Create(parts(0), parts(1), parts(2))
        End If

        Return Tuple.Create("", "", "")
    End Function
    Private Function GetTemplatePath(selectedYear As String, isNewFormat As Boolean) As String
        Return If(isNewFormat,
              Server.MapPath("~/doc/RunforEqually6thedition.pdf"),
              Server.MapPath("~/doc/EktaCertificatedesign.pdf"))
    End Function
    Private Function GetCoordinates(isNewFormat As Boolean) As Object
        If isNewFormat Then
            Return New With {.CatX = 350, .HrsX = 455, .MinX = 505, .SecX = 555, .Y = 203}
        Else
            Return New With {.CatX = 560, .HrsX = 750, .MinX = 835, .SecX = 920, .Y = 234}
        End If
    End Function

    Private Sub WriteText(content As PdfContentByte, bf As BaseFont, fontSize As Decimal,
                      text As String, x As Single, y As Single)

        content.BeginText()
        content.SetFontAndSize(bf, fontSize)
        content.SetTextMatrix(x, y)
        content.ShowText(text)
        content.EndText()

    End Sub

    Private Sub WriteText(content As PdfContentByte, bf As BaseFont, fontSize As Decimal,
                      text As String, align As Integer, x As Single, y As Single)

        content.BeginText()
        content.SetFontAndSize(bf, fontSize)
        content.ShowTextAligned(align, text, x, y, 0)
        content.EndText()

    End Sub
    Private Sub SendPdfToResponse(pdf As Byte(), fileName As String)

        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Buffer = False
        Response.Clear()
        Response.ContentType = "application/pdf"

        Response.AddHeader("content-length", pdf.Length.ToString())
        Response.AddHeader("Content-Disposition", $"attachment;filename={fileName}.pdf")

        Response.BinaryWrite(pdf)
        Response.End()

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        Dim name, mobileNumber, comments As String

        Try
            name = txtName.Text
            mobileNumber = txtMobile.Text
            comments = txtComment.Text

            Dim query As String = "INSERT INTO FeedbackSuggestions (Name,MobileNumber,Comments)VALUES(@Name, @MobileNumber,@Comments)"
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As MySqlConnection = New MySqlConnection(constr)
                Using cmd As MySqlCommand = New MySqlCommand(query)
                    cmd.Parameters.AddWithValue("@Name", name)
                    cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber)
                    cmd.Parameters.AddWithValue("@Comments", comments)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Feedback/Suggestions Save successfully. ');", True)
        Catch ex As Exception

        End Try



    End Sub


    Public Function CraeteDonationCertificate(name As String, amount As String, paymentMode As String, donationDate As DateTime, donationNo As String) As String

        Try
            'Dim donorName As String = "SHRI YOGESH KUMAR JI"
            'amount = "10000"
            'Dim amountWords As String = "TEN THOUSAND RUPEES ONLY"
            'receiptNo = "048"
            'Dim paymentMode As String = "UPI"
            'Dim donationDate As String = DateTime.Now.ToString("dd/MM/yyyy")

            Dim templateFile As String = Server.MapPath("~/doc/donationTemplate.pdf")

            Dim reader As New iTextSharp.text.pdf.PdfReader(templateFile)
            Dim pageSize As iTextSharp.text.Rectangle = reader.GetPageSize(1)

            Using outputPdf As New MemoryStream()

                Using stamper As New PdfStamper(reader, outputPdf)

                    Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)
                    Dim cb As PdfContentByte = stamper.GetOverContent(1)

                    cb.BeginText()

                    ' 🔹 Receipt No
                    cb.SetFontAndSize(bf, 12)
                    cb.SetTextMatrix(80, 375)
                    cb.ShowText(donationNo)

                    ' 🔹 Date
                    cb.SetTextMatrix(700, 380)
                    cb.ShowText(donationDate)

                    ' 🔹 Donor Name
                    cb.SetFontAndSize(bf, 14)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, name, 240, 340, 0)

                    ' 🔹 Amount in Words
                    cb.SetFontAndSize(bf, 13)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, PaytmPaymentResponse.NumberToWords(amount), 200, 275, 0)

                    ' 🔹 Payment Mode
                    cb.SetFontAndSize(bf, 12)
                    cb.SetTextMatrix(350, 210)
                    cb.ShowText(paymentMode)

                    ' 🔹 Form Date
                    cb.SetFontAndSize(bf, 13)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, donationDate, 260, 175, 0)

                    ' 🔹 Amount Numeric (₹ box)
                    cb.SetFontAndSize(bf, 14)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, amount, 120, 95, 0)

                    cb.EndText()

                    stamper.Close()
                End Using

                Dim pdfBytes As Byte() = outputPdf.ToArray()

                Response.Clear()
                Response.ContentType = "application/pdf"
                Response.AddHeader("Content-Disposition", "attachment; filename=Donation_" & donationNo & ".pdf")
                Response.BinaryWrite(pdfBytes)
                Response.Flush()

                HttpContext.Current.ApplicationInstance.CompleteRequest()

            End Using
        Catch ex As Exception
            Console.WriteLine(ex)
        End Try

    End Function


    Private Sub Download2026Certificate(filteredRows As DataRow())
        Dim candidateName, Hrs, min, sec, runCategory As String
        Dim categoryAndTimeFont As Decimal = 12.0F

        For Each row As DataRow In filteredRows
            ' Time Parsing
            If IsDBNull(row("Net_Time")) OrElse String.IsNullOrWhiteSpace(row("Net_Time").ToString()) Then
                Hrs = "" : min = "" : sec = ""

            Else
                Dim timeParts() As String = row.Item("Net_Time").ToString().Trim().Split(":"c)
                If timeParts.Length >= 3 Then
                    Hrs = timeParts(0)
                    min = timeParts(1)
                    sec = (Math.Truncate(timeParts(2) * 10) / 10).ToString("0.00")       'formating sec
                End If
            End If

            ' Candidate Name
            candidateName = If(IsDBNull(row("participate_name")), "", row("participate_name").ToString().ToUpper())

            ' Run Category
            If Not IsDBNull(row("Event_Name")) Then
                Dim eventName As String = row("Event_Name").ToString().ToUpper().Trim()
                If eventName.Contains("5K") Then
                    runCategory = "05KM"
                ElseIf eventName.Contains("10K") Then
                    runCategory = "10KM"
                ElseIf eventName.Contains("21K") Then
                    runCategory = "21KM"
                Else
                    runCategory = ""
                End If
            End If
        Next

        ' PDF Template
        Dim templateFile As String = Server.MapPath("~/doc/RunForEquality7Certificate.pdf")

        Dim inputPdf As Stream = New FileStream(templateFile, FileMode.Open, FileAccess.Read, FileShare.Read)
        Dim reader As New PdfReader(inputPdf)
        Dim pageSize As Rectangle = reader.GetPageSize(1)

        Using outputPdf As New MemoryStream()
            Using stamper As New PdfStamper(reader, outputPdf)
                Dim fontName As String = BaseFont.HELVETICA
                Dim bf As BaseFont = BaseFont.CreateFont(fontName, BaseFont.CP1252, False)
                Dim overContent As PdfContentByte = stamper.GetOverContent(1)

                overContent.SaveState()

                ' Candidate Name
                overContent.BeginText()
                overContent.SetFontAndSize(bf, 14.0F)
                Dim pageSizeLeft As Integer = 10

                Dim yName = Utilities.MillimetersToPoints(74)
                overContent.ShowTextAligned(PdfContentByte.ALIGN_CENTER, candidateName, ((pageSize.Left + pageSizeLeft) + pageSize.Right) / 2, pageSize.GetTop(yName), 0)
                overContent.EndText()

                ' Coordinates
                Dim coord = New With {.CatX = 350, .HrsX = 455, .MinX = 505, .SecX = 550, .Y = 203}

                ' Run Category
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.CatX, coord.Y)
                overContent.ShowText(runCategory)
                overContent.EndText()

                ' Hrs
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.HrsX, coord.Y)
                overContent.ShowText(Hrs)
                overContent.EndText()

                ' Min
                overContent.BeginText()
                overContent.SetFontAndSize(bf, categoryAndTimeFont)
                overContent.SetTextMatrix(coord.MinX, coord.Y)
                overContent.ShowText(min)
                overContent.EndText()

                ' Sec
                overContent.BeginText()
                overContent.SetFontAndSize(bf, 11.0F)
                overContent.SetTextMatrix(coord.SecX, coord.Y)
                overContent.ShowText(sec)
                overContent.EndText()

                overContent.RestoreState()
                stamper.Close()
            End Using

            ' Output PDF
            Dim pdf As Byte() = outputPdf.ToArray()
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Buffer = False
            Response.Clear()
            Response.ClearContent()
            Response.ClearHeaders()
            Response.Charset = String.Empty
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", pdf.Length.ToString())
            Response.AddHeader("Content-Disposition", $"attachment;filename={candidateName}.pdf;")
            Response.BinaryWrite(pdf)
            Response.Close()
        End Using
    End Sub
End Class