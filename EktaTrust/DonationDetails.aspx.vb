Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Drawing
Imports System.IO
Imports Newtonsoft.Json
Imports iTextSharp.text.pdf
Imports Mysqlx.Crud
Imports System

Public Class DonationDetails
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim donationId As String = Request.QueryString("id")
        If Not String.IsNullOrEmpty(donationId) Then
            GenerateDonationReceipt(donationId)
        End If

        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
            SearchCustomers()
        End If
    End Sub

    'This method use To bind Gridview.
    Private Sub BindGridView()
        Dim query As String = "select DonationID,FullName,Amount,MobileNumber,ModeOfPayment,PanNuber,PaymentStatus,Address, OrderId,TxnId, CreatedDate" + " from Donation order by DonationID desc"
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand(query)
                cmd.Connection = con
                query += " WHERE YEAR(CreatedDate) = @YearBy"
                cmd.Parameters.AddWithValue("@YearBy", ddlYear.SelectedValue)
                Using sda As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    con.Open()
                    sda.Fill(dt)
                    con.Close()

                    lblRecords.Text = dt.Rows.Count
                    gvEvent.DataSource = dt
                    gvEvent.DataBind()
                End Using
                con.Close()
                con.Dispose()
            End Using
        End Using
    End Sub
    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        BindGridView()
        Me.SearchCustomers()
    End Sub

    'This method is used To Delete the data
    Protected Sub gvEvent_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM Donation WHERE DonationID = @DonationID", con)
                cmd.Parameters.AddWithValue("@DonationID", Id)
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
    'This method is used To Edit the data
    Protected Sub imgbtn_Click(sender As Object, e As ImageClickEventArgs)
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
        textMobileNumber.Text = gvrow.Cells(2).Text
        ddlModeOfPayment.SelectedItem.Value = gvrow.Cells(3).Text
        textComments.Text = gvrow.Cells(4).Text
        Me.ModalPopupExtender1.Show()
        BindGridView()
    End Sub

    'This method is used To Update the data
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE Donation SET  FullName=@FullName, Amount=@Amount,MobileNumber=@MobileNumber,ModeOfPayment=@ModeOfPayment,Comments=@Comments  WHERE DonationID = @DonationID", con)
                cmd.Parameters.AddWithValue("@DonationID", Convert.ToInt32(lblDonationId.Text))
                cmd.Parameters.AddWithValue("@FullName", textFullName.Text)
                cmd.Parameters.AddWithValue("@Amount", textAmount.Text)
                cmd.Parameters.AddWithValue("@MobileNumber", textMobileNumber.Text)
                cmd.Parameters.AddWithValue("@ModeOfPayment", ddlModeOfPayment.SelectedItem.Value)
                cmd.Parameters.AddWithValue("@Comments", textComments.Text)
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
    'This method is used for Search the data
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.SearchCustomers()
    End Sub

    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand()
                    Dim sql As String = "SELECT DonationID, FullName, Amount, MobileNumber, ModeOfPayment, PanNuber, PaymentStatus, Address, OrderId,TxnId, CreatedDate FROM Donation"
                    If Not String.IsNullOrEmpty(txtSearch.Text) Then
                        If ddlSearchBy.SelectedItem.Text = "Full Name" Then
                            sql += " WHERE FullName LIKE @Search"
                        ElseIf ddlSearchBy.SelectedItem.Text = "Payment Status" Then
                            sql += " WHERE PaymentStatus LIKE @Search"
                        Else ' All
                            sql += " WHERE FullName LIKE @Search OR PaymentStatus LIKE @Search"
                        End If
                        cmd.Parameters.AddWithValue("@Search", "%" & txtSearch.Text.Trim() & "%")
                    End If
                    ' order by desc
                    sql += " order by DonationID desc"
                    cmd.CommandText = sql
                    cmd.Connection = con
                    Using sda As New MySqlDataAdapter(cmd)
                        Dim dt As New DataTable()
                        sda.Fill(dt)
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
            ' End of Payment Status
        End If
    End Sub
    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs)
        Me.ModalPopupExtender1.Show()
    End Sub

    'This method is used To insert the data
    Protected Sub btnAddNew_Click1(sender As Object, e As EventArgs)
        Dim query As String = "INSERT INTO Donation (FullName,Amount,MobileNumber,ModeOfPayment,Comments,CreatedDate)VALUES(@FullName, @Amount,@MobileNumber,@ModeOfPayment,@Comments,@CreatedDate)"
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As MySqlConnection = New MySqlConnection(constr)
            Using cmd As MySqlCommand = New MySqlCommand(query)
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text)
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text)
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text)
                cmd.Parameters.AddWithValue("@ModeOfPayment", ddlModeOfPayment1.SelectedItem.Text)
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text)
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                MessageUpdated.Text = "<b>Insert successfull.</b>"
                con.Close()
                txtFullName.Text = ""
                txtAmount.Text = ""
                txtMobileNumber.Text = ""
                ddlModeOfPayment1.SelectedItem.Text = ""
                txtComments.Text = ""
            End Using
        End Using
        Me.BindGridView()
    End Sub

    Private Sub GenerateDonationReciept()
        'Certificate.GenerateDonationCertificate()
    End Sub

    Protected Sub generate_Certificate(sender As Object, e As EventArgs)
        Try
            Dim btn As LinkButton = CType(sender, LinkButton)
            Dim row As GridViewRow = CType(btn.NamingContainer, GridViewRow)

            ' ✅ Correct way to get ID
            Dim donationId As String = gvEvent.DataKeys(row.RowIndex).Value.ToString()

            Dim paymentStatus As String = row.Cells(5).Text.Trim().ToLower()

            If paymentStatus = "success" Then
                Dim donorName As String = row.Cells(0).Text
                Dim amount As Decimal = Convert.ToDecimal(row.Cells(1).Text)
                Dim paymentMode As String = row.Cells(3).Text
                Dim donationDate As String = Convert.ToDateTime(row.Cells(8).Text).ToString("dd/MM/yyyy")
                Dim transactionId As String = row.Cells(9).Text

                ' 👉 Call your PDF function
                'CreateDonationCertificate(donorName, amount, paymentMode, donationDate, donationId, transactionId)
                GenerateDonationReceipt(donationId)
            Else
                MessageUpdated.Text = "Only Success payment generate Receipt"
                MessageUpdated.ForeColor = Color.Red
            End If
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
                Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount, ModeOfPayment, FullName, EmailId, CreatedDate, DonationID, SerialNo FROM donation WHERE DonationID = @id", con)

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

            If Not IsDBNull(row("CreatedDate")) Then
                donationDate = Convert.ToDateTime(row("CreatedDate")).ToString("dd/MM/yyyy")
            End If

            Dim donationNo As String = If(IsDBNull(row("DonationID")), "", row("DonationID").ToString())
            Dim serialNo As Integer = If(IsDBNull(row("SerialNo")), 0, Convert.ToInt32(row("SerialNo")))

            Dim transactionId As String = If(IsDBNull(row("TxnId")), "", row("TxnId").ToString())

            Dim serialNoPre As String = serialNo.ToString("D6")

            CreateDonationCertificate(donorName, amount, paymentMode, donationDate, serialNoPre, transactionId)

        Catch ex As Exception

        End Try
    End Sub

    Public Function CreateDonationCertificate(name As String, amount As Decimal, paymentMode As String, donationDate As String, serialNo As String, transactionId As String) As String

        Try
            Dim templateFile As String = Server.MapPath("~/doc/donationTemplate.pdf")

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
                    cb.ShowText(serialNo)

                    ' 🔹 Date
                    cb.SetTextMatrix(1300, 660)
                    cb.ShowText(donationDate)

                    ' 🔹 Donor Name
                    cb.SetFontAndSize(bf, 25)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, name.ToUpper(), 420, 590, 0)

                    ' 🔹 Amount in Words
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, PaytmPaymentResponse.NumberToWords(amount), 350, 470, 0)

                    ' 🔹 Payment Mode
                    cb.SetFontAndSize(bf, 22)
                    cb.SetTextMatrix(580, 345)
                    cb.ShowText(PaytmPaymentResponse.GetPaymentModeName(paymentMode))

                    ' 🔹 Transaction Id
                    cb.SetFontAndSize(bf, 20)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, transactionId, 110, 280, 0)

                    ' 🔹 Form Date
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, donationDate, 680, 280, 0)

                    ' 🔹 Amount Numeric (₹ box)
                    cb.SetFontAndSize(bf, 30)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, amount, 250, 150, 0)

                    cb.EndText()

                    stamper.Close()
                End Using

                Dim pdfBytes As Byte() = outputPdf.ToArray()

                Response.Clear()
                Response.ContentType = "application/pdf"
                Response.AddHeader("Content-Disposition", "attachment; filename=Donation_" & serialNo & ".pdf")
                Response.BinaryWrite(pdfBytes)
                Response.Flush()

                HttpContext.Current.ApplicationInstance.CompleteRequest()

            End Using
        Catch ex As Exception
            Console.WriteLine(ex)
        End Try

    End Function
End Class