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

    End Sub
    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim Bib_Num As Int32
        Dim constr, GetValue As String

        Bib_Num = Convert.ToInt32(txtbibNo.Text)

        constr = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        GetValue = "Select  bib_no, participate_name,  gender, Event_Name, Net_Time 
                                       From tblRunRegistrationUser WHERE bib_no = " + txtbibNo.Text + " and year=2023 LIMIT 1 "
        Using con As New MySqlConnection(constr)
            Using result As New MySqlCommand(GetValue)
                result.Connection = con
                con.Open()
                result.ExecuteNonQuery()

                Dim da As New MySqlDataAdapter(result)
                da.Fill(dateTable)

                If dateTable.Rows.Count > 0 Then
                    hdnMessageCertificate.InnerText = "Congratulations Your details are as follows!"
                    Session("participate_name") = dateTable
                    getRec.DataSource = dateTable
                    getRec.DataBind()
                Else
                    getRec.DataSource = dateTable
                    getRec.DataBind()
                    hdnMessageCertificate.InnerText = "Result Not Found."
                End If
                con.Close()
                hdnMessageCertificate.Visible = True
            End Using
        End Using
    End Sub

    Protected Sub DownloadButton_Click(sender As Object, e As EventArgs)

        Dim candidateName, Hrs, min, sec, runCategory As String
        Dim categoryAndTimeFont As Decimal = 20.0F
        Dim time As DateTime

        dateTable = Session("participate_name")

        For Each row As DataRow In dateTable.Rows

            If IsDBNull(row.Item("Net_Time")) Then
                Hrs = ""
                min = ""
                sec = ""
            Else
                Dim datetine() As String
                datetine = row.Item("Net_Time").Trim().Split(":")

                ' Dim time1 As DateTime = Convert.ToDateTime(datetine)

                '  time = DateTime.ParseExact(datetine, "HH:mm:ss", CultureInfo.InvariantCulture)
                ' time = DateTime.ParseExact(time1, "HH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.None)
                ' "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, result

                Hrs = datetine(0)
                min = datetine(1)
                sec = datetine(2)
            End If


            If IsDBNull(row.Item("participate_name")) Then
                candidateName = ""
            Else
                candidateName = row.Item("participate_name").ToString().ToUpper()

            End If

            If IsDBNull(row.Item("Event_Name")) Then
                runCategory = ""
            Else
                If row.Item("Event_Name").Contains("5K") = True Then
                    runCategory = "05 KM"
                ElseIf row.Item("Event_Name").Contains("10K") = True Then
                    runCategory = "10 KM"
                ElseIf row.Item("Event_Name").Contains("21K") = True Then
                    runCategory = "21 KM"

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


End Class