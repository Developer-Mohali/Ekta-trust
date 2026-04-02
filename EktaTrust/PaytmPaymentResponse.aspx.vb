Imports System.Data.SqlClient
Imports iTextSharp.text.pdf
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class PaytmPaymentResponse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim orderId As String = Request.QueryString("orderId")
            Dim paymentFrom As String = Request.QueryString("type")

            If String.IsNullOrEmpty(orderId) Then
                lblMessage.Text = "Invalid Request"
                Exit Sub
            End If

            Dim dt As DataTable = GetPaymentByOrderId(orderId, paymentFrom)

            If dt Is Nothing OrElse dt.Rows.Count = 0 Then
                lblMessage.Text = "Payment record not found."
                Exit Sub
            End If

            Dim row = dt.Rows(0)

            Dim status As String = row("PaymentStatus").ToString()
            Dim txnId As String = row("TxnId").ToString()

            lblOrderId.Text = orderId
            lblTxnId.Text = txnId
            lblAmount.Text = row("Amount").ToString()

            If paymentFrom.Trim() = "donation" Then
                lblpaymentType.Text = "Donation"
                lblpaymentMode.Text = GetPaymentModeName(row("ModeOfPayment").ToString())
                Panelpayment.Visible = True
                lnkReceipt.Visible = False

                If status.ToLower() = "success" Then
                    lnkReceipt.CommandArgument = row("DonationID").ToString()
                    lnkReceipt.Visible = True
                    'Send mail to donated person...
                    SendDonationMail(row("EmailId"), row("FullName"), row("Amount"), row("CreatedDate"), row("DonationID"))
                End If
            End If

            Select Case status

                Case "Success"

                    statusTitle.InnerText = "✅ Payment Successful"
                    statusTitle.Style("color") = "green"
                    lblMessage.Text = "Your payment has been successfully processed."

                Case "Failed"

                    statusTitle.InnerText = "❌ Payment Failed"
                    statusTitle.Style("color") = "red"
                    lblMessage.Text = "Payment failed. Please try again."
                    'pnlRetry.Visible = True

                Case Else

                    statusTitle.InnerText = "⏳ Payment Pending"
                    statusTitle.Style("color") = "orange"
                    lblMessage.Text = "Your payment is under processing."

            End Select

        End If
    End Sub

    Private Function GetPaymentByOrderId(orderId As String, paymentType As String) As DataTable
        Dim dt As New DataTable()
        Try
            If paymentType.Trim() = "donation" Then
                dt = GetDonationPaymentInfo(orderId)
            Else
                dt = GetBIBPaymentInfo(orderId)
            End If
            Return dt
        Catch ex As Exception
            Logger.LogError(ex.Message, ex)
            Throw
        End Try
    End Function

    Private Function GetBIBPaymentInfo(orderId As String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Dim dt As New DataTable()
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount FROM bibdata WHERE OrderId = @OrderId", con)

                cmd.Parameters.AddWithValue("@OrderId", orderId)

                Using da As New MySqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
        End Using
        Return dt
    End Function

    Private Function GetDonationPaymentInfo(orderId As String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Dim dt As New DataTable()
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount, ModeOfPayment, FullName, EmailId, CreatedDate, DonationID FROM donation WHERE OrderId = @OrderId", con)

                cmd.Parameters.AddWithValue("@OrderId", orderId)

                Using da As New MySqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
        End Using
        Return dt
    End Function

    Public Shared Function GetPaymentModeName(paytmMode As String) As String

        If String.IsNullOrEmpty(paytmMode) Then
            Return "Unknown"
        End If

        Select Case paytmMode.ToUpper()

            Case "CC", "CREDIT_CARD"
                Return "Credit Card"

            Case "DC", "DEBIT_CARD"
                Return "Debit Card"

            Case "NB"
                Return "Net Banking"

            Case "WALLET", "BALANCE"
                Return "Wallet"

            Case "PDC"
                Return "Postpaid"

            Case "EMI"
                Return "EMI"

            Case "EMI_DC"
                Return "Debit Card EMI"

            Case "BNPL"
                Return "Buy Now Pay Later"

            Case Else
                Return paytmMode ' fallback (don’t lose data)

        End Select

    End Function

    Private Sub SendDonationMail(emailID As String, fullName As String, amount As String, donatedDate As String, donationId As String)
        Try
            Dim htmlTemplate As String = System.IO.File.ReadAllText(Server.MapPath("~/doc/DonationTemplate.html"))

            htmlTemplate = htmlTemplate.Replace("{{DonorName}}", fullName)
            ' htmlTemplate = htmlTemplate.Replace("{{Amount}}", amount)
            ' htmlTemplate = htmlTemplate.Replace("{{Date}}", donatedDate)

            'finding baseUrl
            Dim baseUrl As String = Request.Url.Scheme & "://" & Request.Url.Authority
            Dim downloadUrl As String = baseUrl & "/DonationDetails.aspx?id=" & donationId

            htmlTemplate = htmlTemplate.Replace("{{DownloadLink}}", downloadUrl)

            Dim subject As String = "Donation Receipt for Tax Deduction (80G) - Receipt No " & donationId
            SendEmail.SendMailWithAttachment(emailID, fullName, subject, htmlTemplate)

        Catch ex As Exception

        End Try
    End Sub

    Public Shared Function NumberToWords(ByVal num As Decimal) As String

        If num = 0 Then Return "ZERO RUPEES ONLY"

        Dim words As String = ""

        Dim units() As String = {"", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN",
                                "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN",
                                "SEVENTEEN", "EIGHTEEN", "NINETEEN"}

        Dim tens() As String = {"", "", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"}

        Dim n As Long = CLng(Math.Floor(num))

        Dim crore As Integer = n \ 10000000
        n = n Mod 10000000

        Dim lakh As Integer = n \ 100000
        n = n Mod 100000

        Dim thousand As Integer = n \ 1000
        n = n Mod 1000

        Dim hundred As Integer = n \ 100
        n = n Mod 100

        If crore > 0 Then
            words &= ConvertBelowThousand(crore, units, tens) & " CRORE "
        End If

        If lakh > 0 Then
            words &= ConvertBelowThousand(lakh, units, tens) & " LAKH "
        End If

        If thousand > 0 Then
            words &= ConvertBelowThousand(thousand, units, tens) & " THOUSAND "
        End If

        If hundred > 0 Then
            words &= ConvertBelowThousand(hundred, units, tens) & " HUNDRED "
        End If

        If n > 0 Then
            If words <> "" Then words &= "AND "
            words &= ConvertBelowThousand(n, units, tens)
        End If

        words &= " RUPEES ONLY"

        Return words.Trim()

    End Function

    Private Shared Function ConvertBelowThousand(ByVal num As Integer, units() As String, tens() As String) As String

        Dim result As String = ""

        If num > 99 Then
            result &= units(num \ 100) & " HUNDRED "
            num = num Mod 100
        End If

        If num > 19 Then
            result &= tens(num \ 10) & " "
            num = num Mod 10
        End If

        If num > 0 Then
            result &= units(num) & " "
        End If

        Return result.Trim()

    End Function

    Protected Sub lnkReceipt_Click(sender As Object, e As EventArgs)
        Try
            Dim btn As LinkButton = CType(sender, LinkButton)
            Dim id As String = btn.CommandArgument
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Dim dt As New DataTable()

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount, ModeOfPayment, FullName, EmailId, CreatedDate, DonationID FROM donation WHERE DonationID = @id", con)

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

            CreateDonationCertificate(donorName, amount, paymentMode, donationDate, donationNo)

        Catch ex As Exception

        End Try
    End Sub

    Private Function CreateDonationCertificate(name As String, amount As Decimal, paymentMode As String, donationDate As String, donationNo As String) As String

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
                    cb.SetTextMatrix(120, 660)
                    cb.ShowText(donationNo)

                    ' 🔹 Date
                    cb.SetTextMatrix(1300, 660)
                    cb.ShowText(donationDate)

                    ' 🔹 Donor Name
                    cb.SetFontAndSize(bf, 25)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, name, 420, 590, 0)

                    ' 🔹 Amount in Words
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, PaytmPaymentResponse.NumberToWords(amount), 350, 470, 0)

                    ' 🔹 Payment Mode
                    cb.SetFontAndSize(bf, 22)
                    cb.SetTextMatrix(580, 345)
                    cb.ShowText(PaytmPaymentResponse.GetPaymentModeName(paymentMode))

                    ' 🔹 Form Date
                    cb.SetFontAndSize(bf, 22)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, donationDate, 480, 280, 0)

                    ' 🔹 Amount Numeric (₹ box)
                    cb.SetFontAndSize(bf, 30)
                    cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, amount, 250, 150, 0)

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
End Class