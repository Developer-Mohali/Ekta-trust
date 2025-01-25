Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports MySql.Data.MySqlClient

Public Class Registration_Onhold
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    <System.Web.Services.WebMethod()>
    Public Shared Function Submitdata(ByVal email As String, username As String, phone As String, address As String, drpEvent As String, ename As String, shirt As String, emobile As String) As String

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            'If chbCondition.Checked Then
            Using result As New MySqlCommand("Select MobileNumber From registration WHERE MobileNumber = @MobileNumber")
                Using sda1 As New MySqlDataAdapter(result)


                    Dim emailId As String = String.Empty
                    Dim subject As String = String.Empty
                    Dim body As String = String.Empty
                    Dim bodyUser As String = String.Empty
                    Dim Name As String = String.Empty
                    Dim DocumentType As String = String.Empty
                    Dim Title As String = String.Empty
                    result.Parameters.AddWithValue("@MobileNumber", phone.Trim())
                    result.Connection = con
                    Dim dt As New DataTable()
                    sda1.Fill(dt)
                    If dt.Rows.Count <= 0 Then

                        Using cmd As New MySqlCommand("Insert_EventRegistration")
                            Using sda As New MySqlDataAdapter()
                                cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.AddWithValue("@Name", username.Trim())
                                cmd.Parameters.AddWithValue("@EmailID", email.Trim())
                                cmd.Parameters.AddWithValue("@MobileNumber", phone.Trim())
                                cmd.Parameters.AddWithValue("@Event", drpEvent.Trim())
                                cmd.Parameters.AddWithValue("@Address", address.Trim())
                                cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                cmd.Parameters.AddWithValue("@ShirtSize", shirt.Trim())
                                cmd.Parameters.AddWithValue("@EmergencyName", ename.Trim())
                                cmd.Parameters.AddWithValue("@EmergencyNumber", emobile.Trim())

                                Name = username
                                subject = "New Event Request-" + username + ""
                                body = "Hello Admin,<br/><br/>There is one new Event Registration Request from below member:<br/><br/><b>Name:</b> " + Name + "<br/><b>Eamil Address:</b> " + email + "<br/><b>Mobile Number:</b> " + phone + "<br/><b>Event: </b>" + address + "<br/><b>Address: </b>" + address + "<br/><br/>Please click here to <a href='http://ektatrust.org.in/Login' >signIn</a><br/><br/><br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                Dim objSendEmail As SendEmail = New SendEmail()
                                objSendEmail.sendMail(emailId, subject, body)
                                'bodyUser = "Hello " + Name + ",<br/><br/>Thanks for you Event Registration Request with Ekta Navnirman Trust.<br/>Our team will contact you very soon.<br/><br/><br/><br/><br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                ''This method Call For UserSend mail,
                                Dim getTamplate As DataSet = objSendEmail.TemplateSetMessage("For Event Registration", "EMAIL")

                                If Not IsNothing(getTamplate) Then

                                    If getTamplate.Tables.Count > 0 Then

                                        If getTamplate.Tables(0).Rows.Count > 0 Then

                                            Title = getTamplate.Tables(0).Rows(0)("Title")
                                            bodyUser = getTamplate.Tables(0).Rows(0)("Message")
                                        End If
                                    End If

                                End If

                                bodyUser = GetMergedData(bodyUser, Name).ToString()
                                'bodyUser = "Hello " + Name + ",<br/><br/>Thanks for you MIP Registration Request with Ekta Navnirman Trust.<br/>Our team will contact you very soon.<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                'This method Call For UserSend mail,
                                subject = Title
                                emailId = email
                                objSendEmail.sendMailUser(emailId, subject, bodyUser)
                                cmd.Connection = con
                                con.Open()
                                cmd.ExecuteNonQuery()
                                'textName.Text = ""
                                'textEmail.Text = ""
                                'textMobile.Text = ""
                                'drpEvent.Text = ""
                                'TextAddress.Text = ""
                                'chbCondition.Checked = False
                                con.Close()
                                con.Dispose()

                                Dim msg As Int16 = 2
                                Return msg
                                'lblErrorMsg.Text = "Submitted successfully. MIP Team will contact you shortly. Thanks !"
                            End Using
                        End Using
                    Else
                        Dim msg As Int16 = 1
                        Return msg

                    End If
                End Using
            End Using

        End Using

    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Function otpgenerate(ByVal phone As String) As String

        If phone = "" Then
            Dim msg As Int16 = 2
            Return msg
        Else

            'Dim msg As Int16 = 2
            Dim randomNumber As String
            randomNumber = Int((1000000 * Rnd()) + 1)
            Dim objSendEmail As SendEmail = New SendEmail()
            Dim messageResponse As String
            messageResponse = objSendEmail.sendSMS(phone, randomNumber)
            If messageResponse <> "OK" Then
                randomNumber = "NotValid"
            End If
            Return randomNumber
        End If


    End Function
    Private Shared Function GetMergedData(Message As String, UserName As String) As String

        Message = Replace(Message, "#UserName#", UserName)

        Return Message

    End Function
End Class