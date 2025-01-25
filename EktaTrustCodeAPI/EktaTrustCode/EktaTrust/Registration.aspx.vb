Imports System.Data
Imports MySql.Data.MySqlClient


Public Class Registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
        End If
    End Sub



    Protected Sub Insert_Registration(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            If chbCondition.Checked Then
                Using result As New MySqlCommand("Select MobileNumber From registration WHERE MobileNumber = @MobileNumber")
                    Using sda1 As New MySqlDataAdapter(result)

                        Dim emailId As String = String.Empty
                        Dim subject As String = String.Empty
                        Dim body As String = String.Empty
                        Dim bodyUser As String = String.Empty
                        Dim Name As String = String.Empty
                        Dim DocumentType As String = String.Empty

                        result.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        If dt.Rows.Count <= 0 Then

                            Using cmd As New MySqlCommand("Insert_Registration")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                                    cmd.Parameters.AddWithValue("@EmailID", textEmail.Text.Trim())
                                    cmd.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                                    cmd.Parameters.AddWithValue("@Event", drpEvent.SelectedItem.Text.Trim())
                                    cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim())
                                    cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                    Name = textName.Text
                                    subject = "New Event Request-" + textName.Text + ""
                                    body = "Hello Admin,<br/><br/>There is one new Event Registration Request from below member:<br/><br/><b>Name:</b> " + Name + "<br/><b>Eamil Address:</b> " + textEmail.Text + "<br/><b>Mobile Number:</b> " + textMobile.Text + "<br/><b>Event: </b>" + drpEvent.SelectedItem.Text + "<br/><b>Address: </b>" + TextAddress.Text + "<br/><br/>Please click here to <a href='http://ektatrust.org.in/Login' >signIn</a><br/><br/><br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                    Dim objSendEmail As SendEmail = New SendEmail()
                                    objSendEmail.sendMail(emailId, subject, body)
                                    bodyUser = "Hello " + Name + ",<br/><br/>Thanks for you Event Registration Request with Ekta Navnirman Trust.<br/>Our team will contact you very soon.<br/><br/><br/><br/><br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                    'This method Call For UserSend mail,
                                    emailId = textEmail.Text
                                    objSendEmail.sendMailUser(emailId, subject, bodyUser)
                                    cmd.Connection = con
                                    con.Open()
                                    cmd.ExecuteNonQuery()
                                    textName.Text = ""
                                    textEmail.Text = ""
                                    textMobile.Text = ""
                                    drpEvent.Text = ""
                                    TextAddress.Text = ""
                                    chbCondition.Checked = False
                                    con.Close()
                                    con.Dispose()
                                    lblConditionMessage.Visible = False
                                    lblErrorMsg.Visible = True
                                    lblErrorMsgMobile.Visible = False
                                    Response.Redirect("Faculties.aspx")
                                    'lblErrorMsg.Text = "Submitted successfully. MIP Team will contact you shortly. Thanks !"
                                End Using
                            End Using
                        Else
                            lblErrorMsg.Visible = False
                            lblConditionMessage.Visible = False
                            lblErrorMsgMobile.Visible = True
                            lblErrorMsgMobile.Text = "You are already registered with this number. Thanks !"
                        End If
                    End Using
                End Using
            Else
                lblErrorMsgMobile.Visible = False
                lblConditionMessage.Visible = True
                lblErrorMsg.Visible = False
                lblConditionMessage.Text = "Please Check Terms and conditions"
            End If
        End Using
    End Sub


End Class