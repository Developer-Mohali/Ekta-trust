Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient
Public Class EventmailRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub btnMail_Click(sender As Object, e As EventArgs)
        Dim bodyUser = String.Empty
        Dim Subject = String.Empty
        Dim FailSuccess = String.Empty
        Dim SuccessMessage = String.Empty
        Dim EmailID = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Select distinct MobileNumber from ektatrust.registration WHERE CreateDate like '%2018%' order by Id desc")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Dim ds As New DataSet()
                    sda.Fill(ds)
                    Dim Name As String = String.Empty
                    If ds.Tables(0).Rows.Count > 0 Then

                        For Each dr As DataRow In ds.Tables(0).Rows
                            Name = Name + dr("MobileNumber").ToString + ","
                            'Try
                            '    Dim Name As String = dr("Name").ToString()
                            '    EmailID = dr("EmailID").ToString()
                            '    Subject = "Run For Equality - 2018"
                            '    bodyUser = "Hello " + dr("Name").ToString() + "<br/><br/> 
                            '                Don't miss the opportunity this year's also to Run for Equality 2018. <br/> Just  3 days left 

                            '                before registration get closed.  Hurry up!<br/><br/> Your association important  to us. 
                            '                Please ignore it, if already registered.<br/>
                            '                To register <a href='https://ektatrust.org.in/EventPrize'>Click here</a>
                            '                <br/><br/><br/>Regards</b>,<br/>Team<br/>Ekta Navnirman Trust<br/> <a 

                            '                href='https://www.ektatrust.org.in/'>www.ektatrust.org.in</a>"

                            '    SendEmail.sendMailUser(EmailID, Subject, bodyUser)
                            '    SuccessMessage = SuccessMessage + ", " + EmailID
                            'Catch ex As Exception

                            '    FailSuccess = FailSuccess + ", " + EmailID
                            '    'ObjSend.SuccessfullMessage = "Sever Error Try Again !"
                            '    'MessageBox.Show(ex.Message, Me.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
                            'End Try

                        Next
                        'This method Call For UserSend mail,
                    End If
                    statusSuccess.Text = SuccessMessage
                    statusFail.Text = FailSuccess

                End Using
            End Using
        End Using

    End Sub
End Class