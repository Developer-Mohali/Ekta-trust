Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Drawing
Imports System.IO
Imports Newtonsoft.Json

Public Class DonationDetails
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("select DonationID,FullName,Amount,MobileNumber,ModeOfPayment,PanNuber,PaymentStatus,Address, OrderId, CreatedDate" + " from Donation order by DonationID desc")
                cmd.Connection = con
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
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand()
                Dim sql As String = "select DonationID,FullName,Amount,MobileNumber,ModeOfPayment,PanNuber,PaymentStatus,Address, OrderId, CreatedDate" + " from Donation order by DonationID desc"
                If Not String.IsNullOrEmpty(txtSearch.Text.Trim()) Then
                    sql += " where FullName=@FullName OR PaymentStatus=@status"
                    cmd.Parameters.AddWithValue("@FullName", txtSearch.Text.Trim())
                    cmd.Parameters.AddWithValue("@status", txtSearch.Text.Trim())
                End If
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
            paymentModeCell.Text = GetPaymentModeName(paymentMode)
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

    Private Function GetPaymentModeName(paytmMode As String) As String

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