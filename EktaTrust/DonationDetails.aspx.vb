Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports MySql.Data.MySqlClient
Imports Mysqlx.XDevAPI.Common

Public Class DonationDetails
    Inherits System.Web.UI.Page
    'Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("EmailStatus") IsNot Nothing AndAlso Session("EmailStatus").ToString() = "SUCCESS" Then

            MessageUpdated.Text = "Email sent successfully."
            MessageUpdated.ForeColor = Color.Green

            Session("EmailStatus") = Nothing
        End If

        If Request.QueryString("downloadReceipt") IsNot Nothing Then

            GenerateDonationReceipt(Request.QueryString("downloadReceipt"))

            HttpContext.Current.ApplicationInstance.CompleteRequest()
            Return

        End If

        'If con.State = ConnectionState.Closed Then
        '    con.Open()
        'End If
        If Not IsPostBack Then
            'ScriptManager.RegisterStartupScript(
            'Me,
            'Me.GetType(),
            '"clearReloadFlag",
            '"sessionStorage.removeItem('certificateReload');",
            'True)
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
            'SearchCustomers()
        Else
            MessageUpdated.Text = ""        ' clear message to UI, if recall to server...
        End If
    End Sub

    'This method use To bind Gridview.
    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand()
                Dim sql As String = "SELECT DonationID, FullName, Amount, MobileNumber, ModeOfPayment, PanNuber, PaymentStatus, Address, OrderId,TxnId, CreatedDate, PaymentType, EmailId, DonationDate, BankNarration, CertificateGenerated
                                    FROM Donation"
                If Not String.IsNullOrEmpty(txtSearch.Text) Then
                    If ddlSearchBy.SelectedItem.Text = "Full Name" Then
                        sql += " WHERE FullName LIKE @Search"
                    ElseIf ddlSearchBy.SelectedItem.Text = "Payment Status" Then
                        sql += " WHERE PaymentStatus LIKE @Search"
                    Else ' All
                        sql += " WHERE (FullName LIKE @Search OR PaymentStatus LIKE @Search OR OrderId Like @Search)"
                    End If
                    cmd.Parameters.AddWithValue("@Search", "%" & txtSearch.Text.Trim() & "%")
                End If
                If sql.Contains(" WHERE") Then
                    sql += " And YEAR(CreatedDate) = @YearBy And IFNULL(IsDeleted, 0) = 0"
                Else
                    sql += " WHERE YEAR(CreatedDate) = @YearBy And IFNULL(IsDeleted, 0) = 0"
                End If
                cmd.Parameters.AddWithValue("@YearBy", ddlYear.SelectedValue)
                ' order by desc
                sql += " order by DonationID desc"
                cmd.CommandText = sql
                cmd.Connection = con
                Using sda As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    con.Close()
                    lblRecords.Text = dt.Rows.Count
                    lblTotalAmount.Text = 0
                    If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                        Try
                            Dim total = dt.AsEnumerable().Where(Function(row) Not String.IsNullOrEmpty(row("Amount").ToString())).Sum(Function(row) Convert.ToDecimal(row("Amount")))
                            lblTotalAmount.Text = total.ToString()
                        Catch ex As Exception
                        End Try
                    End If
                    gvEvent.DataSource = dt
                    gvEvent.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        BindGridView()
        'Me.SearchCustomers()
    End Sub

    'This method is used To Delete the data
    Protected Sub gvEvent_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Update Donation set IsDeleted = 1 WHERE DonationID = @DonationID", con)
                cmd.Parameters.AddWithValue("@DonationID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Deleted successfull.</b>"
                con.Close()
                con.Dispose()
            End Using
        End Using
        Me.BindGridView()
    End Sub
    'This method is used To Edit the data
    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
        btnUpdate.Visible = True
        btnAddNew.Visible = False
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblDonationId.Text = gvEvent.DataKeys(gvrow.RowIndex).Value.ToString()
        If gvrow.Cells(0).Text = "&nbsp;" Then
            textFullName.Text = ""
        Else
            textFullName.Text = gvrow.Cells(0).Text
        End If
        If gvrow.Cells(1).Text = "&nbsp;" Then
            textAmount.Text = ""
        Else
            textAmount.Text = gvrow.Cells(1).Text
        End If
        textFullName.Text = gvrow.Cells(0).Text
        textAmount.Text = gvrow.Cells(1).Text
        If Not String.IsNullOrEmpty(gvrow.Cells(2).Text) AndAlso gvrow.Cells(2).Text <> "&nbsp;" Then
            textMobileNumber.Text = gvrow.Cells(2).Text
        Else
            textMobileNumber.Text = String.Empty
        End If

        If ddlModeOfPayment.Items.FindByValue(gvrow.Cells(3).Text) IsNot Nothing Then
            ddlModeOfPayment.SelectedValue = gvrow.Cells(3).Text.Trim()
        Else
            ddlModeOfPayment.ClearSelection()
        End If

        If ddlStatusOfPayment.Items.FindByValue(gvrow.Cells(5).Text) IsNot Nothing Then
            ddlStatusOfPayment.SelectedValue = gvrow.Cells(5).Text.Trim()
        Else
            ddlModeOfPayment.ClearSelection()
        End If
        If gvrow.Cells(6).Text = "&nbsp;" Then
            txtAddress.Text = ""
        Else
            txtAddress.Text = gvEvent.DataKeys(gvrow.RowIndex).Values("Address").ToString()
        End If

        If paymentType.Items.FindByValue(gvrow.Cells(10).Text) IsNot Nothing Then
            paymentType.SelectedValue = gvrow.Cells(10).Text.Trim()
        Else
            paymentType.ClearSelection()
        End If

        ' pan number
        If Not String.IsNullOrEmpty(gvrow.Cells(4).Text) AndAlso gvrow.Cells(4).Text <> "&nbsp;" Then
            txtPanNum.Text = gvrow.Cells(4).Text
        Else
            txtPanNum.Text = String.Empty
        End If
        txtEmail.Text = gvEvent.DataKeys(gvrow.RowIndex).Values("EmailId").ToString()    ' email
        If Not String.IsNullOrEmpty(gvrow.Cells(12).Text) AndAlso gvrow.Cells(12).Text <> "&nbsp;" Then
            txtdonationDate.Text = Convert.ToDateTime(gvrow.Cells(12).Text).ToString("yyyy-MM-dd")    ' reciept date
        Else
            txtdonationDate.Text = String.Empty
        End If
        txtNarration.Text = gvEvent.DataKeys(gvrow.RowIndex).Values("BankNarration").ToString()     ' Bank Narration
        Me.ModalPopupExtender1.Show()
        ' BindGridView()
    End Sub

    'This method is used To Update the data
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("UPDATE Donation SET  FullName=@FullName, Amount=@Amount,MobileNumber=@MobileNumber,ModeOfPayment=@ModeOfPayment,PaymentStatus=@StatusOfPayment,Address=@Address, 
                                               PanNuber=@Pan, PaymentType=@PaymentType, DonationDate=@DonationDate, BankNarration=@BankNarration, EmailId=@EmailId  WHERE DonationID = @DonationID", con)
                    cmd.Parameters.AddWithValue("@DonationID", Convert.ToInt32(lblDonationId.Text))
                    cmd.Parameters.AddWithValue("@FullName", textFullName.Text)
                    cmd.Parameters.AddWithValue("@Amount", textAmount.Text)
                    cmd.Parameters.AddWithValue("@MobileNumber", textMobileNumber.Text)
                    cmd.Parameters.AddWithValue("@ModeOfPayment", ddlModeOfPayment.SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@StatusOfPayment", ddlStatusOfPayment.SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                    cmd.Parameters.AddWithValue("@Pan", txtPanNum.Text.ToUpper())
                    cmd.Parameters.AddWithValue("@PaymentType", paymentType.SelectedItem.Text)
                    cmd.Parameters.AddWithValue("@DonationDate", If(String.IsNullOrEmpty(txtdonationDate.Text), DBNull.Value, txtdonationDate.Text))
                    cmd.Parameters.AddWithValue("@BankNarration", txtNarration.Text)
                    cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text)
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
        Catch ex As Exception
            lblmsg.Text = ex.Message
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub
    'This method is used for Search the data
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        'Me.SearchCustomers()
        BindGridView()
    End Sub

    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand()
                    Dim sql As String = "SELECT DonationID, FullName, Amount, MobileNumber, ModeOfPayment, PanNuber, PaymentStatus, Address, OrderId,TxnId, CreatedDate, PaymentType FROM Donation"
                    If Not String.IsNullOrEmpty(txtSearch.Text) Then
                        If ddlSearchBy.SelectedItem.Text = "Full Name" Then
                            sql += " WHERE FullName LIKE @Search"
                        ElseIf ddlSearchBy.SelectedItem.Text = "Payment Status" Then
                            sql += " WHERE PaymentStatus LIKE @Search"
                        Else ' All
                            sql += " WHERE (FullName LIKE @Search OR PaymentStatus LIKE @Search OR OrderId Like @Search)"
                        End If
                        cmd.Parameters.AddWithValue("@Search", "%" & txtSearch.Text.Trim() & "%")
                    End If
                    If sql.Contains(" WHERE") Then
                        sql += " And YEAR(CreatedDate) = @YearBy And IFNULL(IsDeleted, 0) = 0"
                    Else
                        sql += " WHERE YEAR(CreatedDate) = @YearBy And IFNULL(IsDeleted, 0) = 0"
                    End If
                    cmd.Parameters.AddWithValue("@YearBy", ddlYear.SelectedValue)
                    ' order by desc
                    sql += " order by DonationID desc"
                    cmd.CommandText = sql
                    cmd.Connection = con
                    Using sda As New MySqlDataAdapter(cmd)
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        con.Close()
                        lblRecords.Text = dt.Rows.Count
                        lblTotalAmount.Text = 0
                        If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                            Try
                                Dim total = dt.AsEnumerable().Where(Function(row) Not String.IsNullOrEmpty(row("Amount").ToString())).Sum(Function(row) Convert.ToDecimal(row("Amount")))
                                lblTotalAmount.Text = total.ToString()
                            Catch ex As Exception
                            End Try
                        End If
                        gvEvent.DataSource = dt
                        gvEvent.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
    Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim buttonId As ImageButton = DirectCast(e.Row.FindControl("ButtonDelete"), ImageButton)

            ' Payment Mode update like 'CC to Credit card' column index (zero-based)
            Dim paymentModeCell As TableCell = e.Row.Cells(3)
            Dim paymentMode As String = paymentModeCell.Text
            paymentModeCell.Text = PaytmPaymentResponse.GetPaymentModeName(paymentMode)
            ' End of Payment Mode update

            ' Payment Status column index (zero-based)
            Dim cell As TableCell = e.Row.Cells(5)
            Dim status As String = cell.Text.Trim().ToLower()
            cell.ForeColor = Color.White
            cell.Style("vertical-align") = "middle"
            cell.HorizontalAlign = VerticalAlign.Middle

            Select Case status
                Case "success"
                    cell.BackColor = System.Drawing.Color.FromArgb(92, 184, 92)
                Case "pending"
                    cell.BackColor = System.Drawing.Color.FromArgb(229, 172, 1)
                Case "failed"
                    cell.BackColor = System.Drawing.Color.FromArgb(235, 61, 61)
                Case "cancelled"
                    cell.BackColor = System.Drawing.Color.FromArgb(159, 159, 159)
                Case "expired"
                    cell.BackColor = System.Drawing.Color.Orange
                Case Else
                    cell.BackColor = System.Drawing.Color.White
                    cell.ForeColor = Color.Black
            End Select
            ' End of Payment Status

            ' Converting donated date to current time from UTC
            Dim donatedCell As TableCell = e.Row.Cells(8)
            If Not String.IsNullOrEmpty(donatedCell.Text) Then
                donatedCell.Text = CommonFunction.ConvertUTCTimeToIndianTimezone(donatedCell.Text).ToString("dd-MMM-yyyy hh:mm tt")
            End If
            ' formating reciept date...
            Dim recieptCell As TableCell = e.Row.Cells(12)
            If Not String.IsNullOrEmpty(recieptCell.Text) AndAlso recieptCell.Text <> "&nbsp;" Then
                recieptCell.Text = Convert.ToDateTime(recieptCell.Text).ToString("dd MMM yyyy")
            End If
            ' address hover
            Dim fullAddress As String = DataBinder.Eval(e.Row.DataItem, "Address").ToString()
            e.Row.Cells(6).Attributes("title") = fullAddress

            ' --- logic for Email button visibility ---
            Dim btnEmail As LinkButton = TryCast(e.Row.FindControl("btnEmail"), LinkButton)

            If btnEmail IsNot Nothing Then
                Dim certificateGeneratedObj = DataBinder.Eval(e.Row.DataItem, "CertificateGenerated")
                Dim certificateGenerated As Integer = If(certificateGeneratedObj IsNot DBNull.Value, Convert.ToInt32(certificateGeneratedObj), 0)

                btnEmail.Visible = (certificateGenerated = 1)
            End If
        End If
    End Sub
    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)
        Me.ModalPopupExtender1.Show()
        lblDonationId.Text = 0
        textFullName.Text = ""
        textAmount.Text = ""
        textMobileNumber.Text = ""
        ddlModeOfPayment.ClearSelection()
        ddlStatusOfPayment.ClearSelection()
        txtAddress.Text = ""
        btnUpdate.Visible = False
        btnAddNew.Visible = True
        paymentType.ClearSelection()
        txtPanNum.Text = String.Empty
        txtEmail.Text = String.Empty
        txtdonationDate.Text = String.Empty
        txtNarration.Text = String.Empty
    End Sub

    'This method is used To insert the data
    Protected Sub btnAddNew_Click1(sender As Object, e As EventArgs)
        Try
            Dim query As String = "INSERT INTO Donation (FullName,Amount,MobileNumber,ModeOfPayment,PaymentStatus,Address,CreatedDate,PaymentEnv, PaymentType, PanNuber, DonationDate, BankNarration, EmailId, CertificateGenerated)
                                    VALUES(@FullName, @Amount,@MobileNumber,@ModeOfPayment,@StatusOfPayment,@Address,@CreatedDate,@PaymentEnv, @PaymentType, @Pan, @DonationDate, @BankNarration, @EmailId,0)"
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As MySqlConnection = New MySqlConnection(constr)
                Using cmd As MySqlCommand = New MySqlCommand(query)
                    cmd.Parameters.AddWithValue("@FullName", textFullName.Text)
                    cmd.Parameters.AddWithValue("@Amount", textAmount.Text)
                    cmd.Parameters.AddWithValue("@MobileNumber", textMobileNumber.Text)
                    cmd.Parameters.AddWithValue("@ModeOfPayment", ddlModeOfPayment.SelectedItem.Text)
                    cmd.Parameters.AddWithValue("@StatusOfPayment", ddlStatusOfPayment.SelectedItem.Text)
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.UtcNow)
                    cmd.Parameters.AddWithValue("@PaymentEnv", "Offline")
                    cmd.Parameters.AddWithValue("@PaymentType", paymentType.SelectedItem.Text)
                    cmd.Parameters.AddWithValue("@Pan", txtPanNum.Text.ToUpper())
                    cmd.Parameters.AddWithValue("@DonationDate", If(String.IsNullOrEmpty(txtdonationDate.Text), DBNull.Value, txtdonationDate.Text))
                    cmd.Parameters.AddWithValue("@BankNarration", txtNarration.Text)
                    cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    MessageUpdated.Text = "<b>Insert successfull.</b>"
                    con.Close()
                    lblDonationId.Text = 0
                    textFullName.Text = ""
                    textAmount.Text = ""
                    textMobileNumber.Text = ""
                    ddlModeOfPayment.ClearSelection()
                    ddlStatusOfPayment.ClearSelection()
                    txtAddress.Text = ""
                End Using
            End Using
            Me.BindGridView()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Private Sub GenerateDonationReciept()
        'Certificate.GenerateDonationCertificate()
    End Sub

    Protected Sub generate_Certificate(sender As Object, e As EventArgs)
        Try
            Dim btn As LinkButton = CType(sender, LinkButton)
            Dim row As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            Dim donationId As String =
        gvEvent.DataKeys(row.RowIndex).Value.ToString()

            Dim paymentStatus As String =
        row.Cells(5).Text.Trim().ToLower()

            If paymentStatus <> "success" Then

                MessageUpdated.Text =
            "Only Success payment generate Receipt"

                MessageUpdated.ForeColor = Color.Red

                Return

            End If

            ' trigger javascript download
            ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "downloadReceipt",
        "downloadReceipt('" & donationId & "');",
        True)

            ' only update UI
            BindGridView()
        Catch ex As Exception
            MessageUpdated.Text = ex.Message
            MessageUpdated.ForeColor = Color.Red
        End Try
    End Sub

    Public Sub GenerateDonationReceipt(id As String)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Dim dt As New DataTable()

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount, ModeOfPayment, FullName, EmailId, CreatedDate, DonationID, SerialNo, PaymentType, BankNarration, DonationDate FROM donation WHERE DonationID = @id", con)

                    cmd.Parameters.AddWithValue("@id", id)

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

            ' ✅ Extract values safely
            Dim donorName As String = If(IsDBNull(row("FullName")), "", row("FullName").ToString())
            Dim amount As Decimal = If(IsDBNull(row("Amount")), 0, Convert.ToDecimal(row("Amount")))
            Dim paymentMode As String = If(IsDBNull(row("ModeOfPayment")), "", row("ModeOfPayment").ToString())
            Dim donationDate As String = ""
            Dim reciptDate As String = ""
            Dim paymentType As String = row("PaymentType").ToString()
            Dim financialYear = ""

            If paymentType <> "Donation" Then
                MessageUpdated.Text = "Only Donation type payment generate Receipt"
                MessageUpdated.ForeColor = Color.Red
                Return
            End If

            If Not IsDBNull(row("CreatedDate")) Then
                reciptDate = CommonFunction.ConvertUTCTimeToIndianTimezone(row("CreatedDate")).ToString("dd/MM/yyyy")
            End If
            If Not IsDBNull(row("DonationDate")) Then
                donationDate = Convert.ToDateTime(row("DonationDate")).ToString("dd/MM/yyyy")
            Else
                donationDate = reciptDate
            End If

            Dim donationNo As String = If(IsDBNull(row("DonationID")), "", row("DonationID").ToString())
            Dim serialNo As Integer = If(IsDBNull(row("SerialNo")), 0, Convert.ToInt32(row("SerialNo")))

            ' Generate serial number if not already and save in DB.
            If serialNo = 0 Then
                serialNo = PaytmCallBack.GenerateSerialNumber(donationDate)
                UpdateDonation(serialNo.ToString("D6"), id)
            End If

            Dim transactionId As String = If(IsDBNull(row("TxnId")), "", row("TxnId").ToString())
            Dim bankTransaction As String = If(IsDBNull(row("BankNarration")), "", row("BankNarration").ToString())

            Dim serialNoPre As String = serialNo.ToString("D6")

            financialYear = GetFinancialYear(donationDate)
            CreateDonationCertificate(id, donorName, amount, paymentMode, donationDate, serialNoPre, If(String.IsNullOrEmpty(transactionId), bankTransaction, transactionId), reciptDate, financialYear)

        Catch ex As Exception
            MessageUpdated.Text = "Error while generating receipt."
            MessageUpdated.ForeColor = Color.Red
        End Try
    End Sub

    Public Function CreateDonationCertificate(id As String, name As String, amount As Decimal, paymentMode As String, donationDate As String, serialNo As String, transactionId As String, reciptDate As String, financialYear As String) As String

        Try
            Dim templateFile As String = Server.MapPath("~/doc/donationTemplate.pdf")
            If Not File.Exists(templateFile) Then
                Throw New Exception("Template file not found: " & templateFile)
            End If

            Using reader As New iTextSharp.text.pdf.PdfReader(templateFile)
                Dim pageSize As iTextSharp.text.Rectangle = reader.GetPageSize(1)

                Using outputPdf As New MemoryStream()

                    Using stamper As New PdfStamper(reader, outputPdf)

                        Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, False)
                        Dim bfBold As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, False)
                        Dim cb As PdfContentByte = stamper.GetOverContent(1)

                        cb.BeginText()

                        ' 🔹 Receipt No
                        cb.SetFontAndSize(bf, 22)
                        cb.SetTextMatrix(135, 660)
                        cb.ShowText(serialNo)

                        ' 🔹 Date
                        cb.SetTextMatrix(1300, 660)
                        cb.ShowText(reciptDate)

                        ' 🔹 Donor Name
                        cb.SetFontAndSize(bf, 25)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, name.ToUpper(), 570, 590, 0)

                        ' 🔹 Amount in Words
                        cb.SetFontAndSize(bf, 22)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, PaytmPaymentResponse.NumberToWords(amount), 350, 470, 0)

                        ' 🔹 Payment Mode
                        cb.SetFontAndSize(bf, 22)
                        cb.SetTextMatrix(580, 345)
                        cb.ShowText(PaytmPaymentResponse.GetPaymentModeName(paymentMode))

                        ' 🔹 Transaction Id
                        cb.SetFontAndSize(bf, 20)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, transactionId, 310, 280, 0)

                        ' 🔹 Form Date
                        cb.SetFontAndSize(bf, 22)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, donationDate, 1100, 280, 0)

                        ' 🔹 Amount Numeric (₹ box)
                        cb.SetFontAndSize(bf, 30)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, amount, 250, 150, 0)

                        ' Financial Year bottom
                        cb.SetColorFill(New BaseColor(59, 56, 49))
                        cb.SetFontAndSize(bfBold, 27)
                        cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, financialYear, 625, 50, 0)

                        cb.EndText()

                        stamper.Close()
                    End Using

                    ' =========================
                    ' Get PDF Bytes
                    ' =========================
                    Dim pdfBytes As Byte() =
                    outputPdf.ToArray()

                    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

                    Using con As New MySqlConnection(constr)
                        Using cmd As New MySqlCommand("UPDATE donation SET CertificateGenerated = 1 WHERE DonationID = @id", con)

                            cmd.Parameters.AddWithValue("@id", id) ' pass id into function

                            con.Open()
                            cmd.ExecuteNonQuery()
                        End Using
                    End Using

                    ' =========================
                    ' Safe File Name
                    ' =========================
                    Dim safeName As String =
                    String.Concat(
                        name.Split(Path.GetInvalidFileNameChars())
                    ).Replace(" ", "")

                    Dim fileName As String =
                    serialNo & "-" &
                    safeName &
                    "-FY" & financialYear & ".pdf"

                    ' =========================
                    ' Download PDF
                    ' =========================
                    Response.Clear()
                    Response.ClearContent()
                    Response.ClearHeaders()

                    Response.Buffer = True
                    Response.ContentType = "application/pdf"

                    Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=""" & fileName & """"
                )

                    Response.Cache.SetCacheability(HttpCacheability.NoCache)

                    Response.BinaryWrite(pdfBytes)

                    Response.Flush()
                    Response.End()

                End Using
            End Using

            Return Nothing
        Catch ex As Exception
            Console.WriteLine(ex)
        End Try

    End Function

    Protected Sub btnBindGrid_Click(sender As Object, e As EventArgs)
        BindGridView()
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Sub UpdatePendingPaymentStatus()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Dim dt As New DataTable()
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT OrderId FROM donation WHERE PaymentStatus='Pending'", con)
                    Using da As New MySqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
            End Using

            If dt.Rows.Count > 0 Then
                For Each row In dt.Rows
                    AdminBIBData.GetJsonData(row("OrderId"), "Pending", "donation")
                Next
            End If
        Catch ex As Exception
            Logger.LogError($"Error in Donation:: UpdatePendingPaymentStatus :: Error :::", ex)
        End Try
    End Sub

#Region "Export to Excel"
    Private Function GetExportData() As DataTable
        Dim dt As New DataTable()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand()
                    Dim sql As String = "SELECT DonationID, FullName, Amount, MobileNumber, ModeOfPayment, PanNuber as `Pan Number`, PaymentStatus, Address, OrderId,TxnId as `Transaction Id`, CreatedDate as `Receipt Date`,
                                        EmailId, DonationDate as `Donated On`, BankNarration FROM Donation"
                    If Not String.IsNullOrEmpty(txtSearch.Text) Then
                        If ddlSearchBy.SelectedItem.Text = "Full Name" Then
                            sql += " WHERE FullName LIKE @Search"
                        ElseIf ddlSearchBy.SelectedItem.Text = "Payment Status" Then
                            sql += " WHERE PaymentStatus LIKE @Search"
                        Else ' All
                            sql += " WHERE (FullName LIKE @Search OR PaymentStatus LIKE @Search OR OrderId Like @Search)"
                        End If
                        cmd.Parameters.AddWithValue("@Search", "%" & txtSearch.Text.Trim() & "%")
                    End If
                    If sql.Contains(" WHERE") Then
                        sql += " And YEAR(CreatedDate) = @YearBy"
                    Else
                        sql += " WHERE YEAR(CreatedDate) = @YearBy"
                    End If
                    cmd.Parameters.AddWithValue("@YearBy", ddlYear.SelectedValue)
                    ' order by desc
                    sql += " order by DonationID desc"
                    cmd.CommandText = sql
                    cmd.Connection = con
                    Using sda As New MySqlDataAdapter(cmd)
                        sda.Fill(dt)
                    End Using
                End Using
            End Using
        Catch ex As Exception
            Throw
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
        Return dt
    End Function

    Protected Sub btnExport_Click(sender As Object, e As EventArgs)
        Try
            Dim dt As DataTable = GetExportData()

            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=DonationReport.xls")
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

                    ' Column index 11 = Payment Status
                    If i = 6 Then
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
                    ElseIf i = 4 Then
                        Dim paymentType = PaytmPaymentResponse.GetPaymentModeName(cellValue)
                        hw.WriteLine("<td>" & paymentType & "</td>")
                    ElseIf i = 9 Then
                        hw.WriteLine("<td style='mso-number-format:\@'>" & cellValue & "</td>")
                    ElseIf i = 10 Then
                        hw.WriteLine("<td>" & CommonFunction.ConvertUTCTimeToIndianTimezone(cellValue) & "</td>")
                    Else
                        hw.WriteLine("<td>" & cellValue & "</td>")
                    End If

                Next
                hw.WriteLine("</tr>")
            Next

            hw.WriteLine("</table>")

            Response.Write(sw.ToString())
            Response.End()

        Catch ex As Exception
            MessageUpdated.Text = "Got error while exporting excel"
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub
#End Region

    Protected Sub UpdateDonation(serialNum As String, donationId As String)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("UPDATE Donation SET  SerialNo=@SerialNo  WHERE DonationID = @DonationID", con)
                    cmd.Parameters.AddWithValue("@DonationID", Convert.ToInt32(donationId))
                    cmd.Parameters.AddWithValue("@SerialNo", serialNum)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    con.Dispose()
                End Using
            End Using

        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Function GetFinancialYear(inputDate As String) As String
        Dim startYear As Integer
        Dim endYear As Integer
        Dim inputDateConversion As DateTime

        ' Use TryParseExact to prevent crashes if the format is slightly off
        ' We also use .Trim() to remove any accidental spaces
        If DateTime.TryParseExact(inputDate.Trim(), "dd/MM/yyyy", Globalization.CultureInfo.InvariantCulture, Globalization.DateTimeStyles.None, inputDateConversion) Then

            If inputDateConversion.Month >= 4 Then
                startYear = inputDateConversion.Year
                endYear = inputDateConversion.Year + 1
            Else
                startYear = inputDateConversion.Year - 1
                endYear = inputDateConversion.Year
            End If

            Return startYear.ToString() & "-" & endYear.ToString().Substring(2)
        Else
            ' Fallback logic: If parsing fails, try a standard Parse as a last resort
            Try
                inputDateConversion = Convert.ToDateTime(inputDate)
                ' (Repeat the logic)
                startYear = If(inputDateConversion.Month >= 4, inputDateConversion.Year, inputDateConversion.Year - 1)
                endYear = startYear + 1
                Return startYear.ToString() & "-" & endYear.ToString().Substring(2)
            Catch

            End Try
        End If
    End Function

    Protected Sub btnOpenEmailPopup_Click(sender As Object, e As EventArgs)

        Try

            Dim btn As LinkButton = CType(sender, LinkButton)
            Dim row As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            Dim donationId As String =
            gvEvent.DataKeys(row.RowIndex).Value.ToString()

            Dim email As String =
            gvEvent.DataKeys(row.RowIndex).Values("EmailId").ToString()

            hfDonationId.Value = donationId

            txtSendEmail.Text = email

            EmailPopupExtender.Show()

        Catch ex As Exception

            MessageUpdated.Text = ex.Message
            MessageUpdated.ForeColor = Drawing.Color.Red

        End Try

    End Sub
    Protected Sub btnSendCertificateEmail_Click(sender As Object, e As EventArgs)

        Try

            Dim donationId As String = hfDonationId.Value
            Dim emailId As String = txtSendEmail.Text.Trim()

            If String.IsNullOrEmpty(emailId) Then

                MessageUpdated.Text = "Please enter email address."
                MessageUpdated.ForeColor = Drawing.Color.Red

                EmailPopupExtender.Show()
                Return

            End If

            ' =========================
            ' Load Donation Details
            ' =========================

            Dim fullName As String = ""
            Dim amount As String = ""
            Dim donatedDate As String = ""

            Dim constr As String =
            ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)

                Using cmd As New MySqlCommand("
                SELECT FullName, Amount, DonationDate
                FROM Donation
                WHERE DonationID=@DonationID", con)

                    cmd.Parameters.AddWithValue("@DonationID", donationId)

                    con.Open()

                    Using reader = cmd.ExecuteReader()

                        If reader.Read() Then
                            ' Full Name
                            If reader("FullName") IsNot DBNull.Value Then
                                fullName = reader("FullName").ToString()
                            End If
                            ' Amount
                            If reader("Amount") IsNot DBNull.Value Then
                                amount = reader("Amount").ToString()
                            End If
                            ' Donation Date
                            If reader("DonationDate") IsNot DBNull.Value Then
                                donatedDate =
                            Convert.ToDateTime(reader("DonationDate")).
                            ToString("dd MMM yyyy")
                            Else
                                donatedDate = ""
                            End If
                        End If
                    End Using
                End Using

                End Using

            ' =========================
            ' Email Template
            ' =========================

            Dim htmlTemplate As String =
            File.ReadAllText(Server.MapPath("~/doc/DonationTemplate.html"))

            htmlTemplate =
            htmlTemplate.Replace("{{DonorName}}", fullName)

            htmlTemplate =
            htmlTemplate.Replace("{{Amount}}", amount)

            htmlTemplate =
            htmlTemplate.Replace("{{Date}}", donatedDate)

            htmlTemplate =
            htmlTemplate.Replace("{{AuthorityName}}",
            "Ekta Navnirman Trust")

            Dim baseUrl As String =
            Request.Url.Scheme & "://" & Request.Url.Authority

            'Dim downloadUrl As String =
            'baseUrl & "/DonationDetails.aspx?id=" & donationId

            Dim downloadUrl As String =
            baseUrl & "/DonationDetails.aspx?downloadReceipt=" & donationId
            htmlTemplate =
            htmlTemplate.Replace("{{DownloadLink}}", downloadUrl)

            Dim subject As String =
            "Donation Receipt for Tax Deduction (80G)"

            ' =========================
            ' SEND EMAIL
            ' =========================
            Dim result As String = SendEmail.SendMailWithAttachment(
                emailId,
                fullName,
                subject,
                htmlTemplate,
                downloadUrl
            )

            If result.Contains("Error") Then

                MessageUpdated.Text = "Email failed to send. Please check SMTP settings."
                MessageUpdated.ForeColor = Drawing.Color.Red
                EmailPopupExtender.Show()

                Return

            Else

                ' ✔ set success flags
                Session("EmailStatus") = "SUCCESS"
                Session("EmailDonationId") = donationId

                ' optional UI message (will show after redirect)
                MessageUpdated.Text = "Email sent successfully."
                MessageUpdated.ForeColor = Drawing.Color.Green

                ' ✔ IMPORTANT: redirect to break POST request
                Response.Redirect(Request.RawUrl, False)
                Context.ApplicationInstance.CompleteRequest()
                Return

            End If

        Catch ex As Exception

            MessageUpdated.Text = ex.Message
            MessageUpdated.ForeColor = Drawing.Color.Red

            EmailPopupExtender.Show()

        End Try

    End Sub

End Class