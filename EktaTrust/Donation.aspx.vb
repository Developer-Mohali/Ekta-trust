Imports MySql.Data.MySqlClient

Public Class Donation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'This method is used To insert the donation information into table...
    <System.Web.Services.WebMethod()>
    Public Shared Function AddDonation(name As String, amount As String, mobile As String, paymentMode As String, comment As String) As Object
        Dim query As String = "INSERT INTO Donation (FullName,Amount,MobileNumber,ModeOfPayment,Comments,CreatedDate)VALUES(@FullName, @Amount,@MobileNumber,@ModeOfPayment,@Comments,@CreatedDate)"
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As MySqlConnection = New MySqlConnection(constr)
                Using cmd As MySqlCommand = New MySqlCommand(query)
                    cmd.Parameters.AddWithValue("@FullName", name)
                    cmd.Parameters.AddWithValue("@Amount", amount)
                    cmd.Parameters.AddWithValue("@MobileNumber", mobile)
                    cmd.Parameters.AddWithValue("@ModeOfPayment", paymentMode)
                    cmd.Parameters.AddWithValue("@Comments", comment)
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
            Return New With {
               .success = True,
               .message = "Donated Successfully!"
           }
        Catch ex As Exception
            Return New With {
                .success = False,
                .message = ex.Message
            }
        End Try
    End Function
End Class