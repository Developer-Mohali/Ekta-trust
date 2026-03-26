Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class PaytmPaymentResponse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim orderId As String = Request.QueryString("orderId")
            Dim paymentType As String = Request.QueryString("type")

            If String.IsNullOrEmpty(orderId) Then
                lblMessage.Text = "Invalid Request"
                Exit Sub
            End If

            Dim dt As DataTable = GetPaymentByOrderId(orderId)

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

            If paymentType.Trim() = "donation" Then
                lblpaymentType.Text = "Donation"
                lblpaymentMode.Text = GetPaymentModeName(row("ModeOfPayment").ToString())
                Panelpayment.Visible = True
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

    Private Function GetPaymentByOrderId(orderId As String) As DataTable
        Dim dt As New DataTable()
        Try
            Dim paymentType As String = Request.QueryString("type")
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
            Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount, ModeOfPayment FROM donation WHERE OrderId = @OrderId", con)

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
End Class