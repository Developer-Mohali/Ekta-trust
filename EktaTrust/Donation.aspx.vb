Imports MySql.Data.MySqlClient

Public Class Donation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' dynamic bind the paytm library Js...
        Dim env As String = ConfigurationManager.AppSettings("Environment")
        Dim paytmJsUrl As String = ConfigurationManager.AppSettings("PaytmJsURL")
        Dim mid As String = ""

        If env = "Prod" Then
            mid = ConfigurationManager.AppSettings("ProdMID")
            ltPaytmScript.Text = $"<script src='{paytmJsUrl}" & mid & ".js' crossorigin='anonymous'></script>"
        Else
            mid = ConfigurationManager.AppSettings("MID")
            ltPaytmScript.Text = $"<script src='{paytmJsUrl}" & mid & ".js' crossorigin='anonymous'></script>"
        End If
    End Sub

    'This method is used To insert the donation information into table...
    <System.Web.Services.WebMethod()>
    Public Shared Function AddDonation(name As String, amount As String, mobile As String, pan As String, address As String, email As String) As Object
        Dim query As String = "INSERT INTO Donation (FullName,Amount,MobileNumber,PanNuber,Address,CreatedDate, EmailId, OrderId, PaymentStatus, PaymentEnv, PaymentType)
                                VALUES(@FullName, @Amount,@MobileNumber,@PanNuber,@Address,@CreatedDate,@EmailId, @OrderId, @PaymentStatus, @PaymentEnv, @PaymentType)"
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim paymentEnv = If(ConfigurationManager.AppSettings("Environment") = "Prod", "Live", "Test")
        Try
            ' ✅ Generate UNIQUE Order ID for paytm payment...
            Dim orderId As String = DateTime.UtcNow.Ticks.ToString() & "_" & GenerateSixDigitNumber()

            Using con As MySqlConnection = New MySqlConnection(constr)
                Using cmd As MySqlCommand = New MySqlCommand(query)
                    cmd.Parameters.AddWithValue("@FullName", name)
                    cmd.Parameters.AddWithValue("@Amount", amount)
                    cmd.Parameters.AddWithValue("@MobileNumber", mobile.Trim())
                    cmd.Parameters.AddWithValue("@PanNuber", pan.ToUpper())
                    cmd.Parameters.AddWithValue("@Address", address)
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.UtcNow)
                    cmd.Parameters.AddWithValue("@EmailId", email)
                    cmd.Parameters.AddWithValue("@OrderId", orderId)
                    cmd.Parameters.AddWithValue("@PaymentStatus", "Pending")
                    cmd.Parameters.AddWithValue("@PaymentEnv", paymentEnv)
                    cmd.Parameters.AddWithValue("@PaymentType", "Donation")
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using

            Return New With {
               .success = True,
               .message = "Donated Successfully!",
               .orderId = orderId
           }
        Catch ex As Exception
            Logger.LogError($"Error in Donation->AddDonation ::: Error ::: {ex.Message}", ex)
            Return New With {
                .success = False,
                .message = ex.Message
            }
        End Try
    End Function

    Public Shared Function GenerateSixDigitNumber() As Integer
        Dim rnd As New Random()
        Return rnd.Next(100000, 999999) ' ensures 6 digits
    End Function
End Class