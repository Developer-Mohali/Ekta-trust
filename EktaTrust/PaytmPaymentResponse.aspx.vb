Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class PaytmPaymentResponse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim orderId As String = Request.QueryString("orderId")

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
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("SELECT PaymentStatus, TxnId, Amount FROM bibdata WHERE OrderId = @OrderId", con)

                    cmd.Parameters.AddWithValue("@OrderId", orderId)

                    Using da As New MySqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
            End Using

            Return dt
        Catch ex As Exception
            Logger.LogError(ex.Message, ex)
            Throw
        End Try
    End Function

End Class