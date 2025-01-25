Imports System.Web.UI.WebControls
Imports MySql.Data.MySqlClient

Public Class PaymentProcess

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim expiryMonth As String = Page.Request.Form("ddlExpiryMonth")
        'Dim expiryYear As String = Page.Request.Form("ddlExpiryYear")

    End Sub

    'Protected Sub inprocess_Click(sender As Object, e As EventArgs) Handles inprocess.Click

    '    Dim query As String = "INSERT INTO PaymentInformation(CardHolderName,CardNumber,CVV,ExpiryDate,PaymentStatus,CreatedDate)VALUES(@CardHolderName, @CardNumber,@CVV,@ExpiryDate,@PaymentStatus,@CreatedDate)"
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Dim maskedNumber As String = "XXXXXXXXXXXX" & CardNumber.Value.Remove(0, 12)
    '    Dim cvv As String = "XXX" & CardSecurityCode.Value.Remove(0, 3)
    '    Using con As MySqlConnection = New MySqlConnection(constr)

    '        Using cmd As MySqlCommand = New MySqlCommand(query)

    '            cmd.Parameters.AddWithValue("@CardHolderName", CardHolder.Value)
    '            cmd.Parameters.AddWithValue("@CardNumber", maskedNumber)
    '            cmd.Parameters.AddWithValue("@CVV", cvv)
    '            cmd.Parameters.AddWithValue("@ExpiryDate", ddlExpiryMonth.Value & "/" & ddlExpiryYear.Value)
    '            cmd.Parameters.AddWithValue("@PaymentStatus", False)
    '            cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
    '            cmd.Connection = con
    '            con.Open()

    '            cmd.ExecuteNonQuery()

    '            con.Close()
    '            CardHolder.Value = ""
    '            CardNumber.Value = ""
    '            CardSecurityCode.Value = ""

    '            Response.Redirect("PaymentRequest.aspx")
    '        End Using
    '    End Using
    'End Sub
End Class