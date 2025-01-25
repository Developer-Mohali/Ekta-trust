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
Imports System.Web.Script.Serialization
Imports System.Security.Principal
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Imports System.IO

Public Class NewEventRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTC.Visible = False
        lblMessage.Visible = False

    End Sub

    'This method used to Generate otpNumber.
    <System.Web.Services.WebMethod()>
    Public Shared Function otpgenerate(ByVal phone As String, username As String) As String
        Dim SendEmail As SendEmail = New SendEmail()
        Dim message As String = String.Empty

        Dim alphabets As String = "1234567890"
        alphabets += Convert.ToString(alphabets)
        'Dim length As Integer = Integer.Parse("2")
        Dim otp As String = String.Empty
        For i As Integer = 0 To 6 - 1
            Dim character As String = String.Empty
            Do
                Dim index As Integer = New Random().Next(0, alphabets.Length)
                character = alphabets.ToCharArray()(index).ToString()
            Loop While otp.IndexOf(character) <> -1
            otp += character
        Next

        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage("For Verification OTP", "SMS")
        Try
            If Not IsNothing(getTamplate) Then

                If getTamplate.Tables.Count > 0 Then

                    If getTamplate.Tables(0).Rows.Count > 0 Then
                        message = getTamplate.Tables(0).Rows(0)("Message")
                    End If
                End If

            End If
        Catch ex As Exception

        End Try


        ' Split string based on spaces
        Dim Unames As String() = username.Split(New Char() {" "c})

        ' Seperate the first name from the rest of the string
        Dim lastName As String = username.Substring(Unames(0).Length())

        message = GetMergedOTP(message, Convert.ToString(Unames(0)), otp)
        Dim status = SendEmail.sendSMS(phone, message)
        Dim tokenJson = JsonConvert.SerializeObject(status)

        Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
        Dim firstItem = jsonResult.Values(1)

        Return otp
    End Function
    'This method used to  Merge Template mail and sms.
    Private Shared Function GetMergedData(Message As String, UserName As String) As String

        Message = Replace(Message, "#UserName#", UserName)

        Return Message

    End Function

    Private Shared Function GetMergedDistance(Message As String, UserName As String, drpEvent As String) As String

        Message = Replace(Message, "#UserName#", UserName)
        Message = Replace(Message, "#Distance#", drpEvent)
        Return Message

    End Function
    'This method used to Merge Otp number.
    Private Shared Function GetMergedOTP(Message As String, UserName As String, OTP As String) As String

        Message = Replace(Message, "#UserName#", UserName)
        Message = Replace(Message, "#OTPCode#", OTP)
        Return Message

    End Function

    'This method use to get data from Template for SMS.
    Private Shared Function SmsSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then

            If getTamplate.Tables.Count > 0 Then

                If getTamplate.Tables(0).Rows.Count > 0 Then

                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(1)("Message")
                End If
            End If

        End If
        Return SendEmail

    End Function
    'This method use to get data from Template for EMAIL.
    Private Shared Function MailSent(category As String, mailType As String) As SendEmail
        Dim SendEmail As SendEmail = New SendEmail()
        Dim getTamplate As DataSet = SendEmail.TemplateSetMessage(category, mailType)
        If Not IsNothing(getTamplate) Then

            If getTamplate.Tables.Count > 0 Then

                If getTamplate.Tables(0).Rows.Count > 0 Then

                    SendEmail.TemplateType = getTamplate.Tables(0).Rows(0)("TemplateType")
                    SendEmail.Subject = getTamplate.Tables(0).Rows(0)("Title")
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
                End If
            End If

        End If
        Return SendEmail

    End Function

    'This method used to Merge Otp number.
    Private Shared Function SplitName(UserName As String) As String


        Return UserName

    End Function

    'This Method is used to save recodes.
     Protected Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext.Click
        Dim dob As Date = Date.Parse(Request.Form(TextBox1.UniqueID))
        'Dim dob As Date = Request.Form(TextBox1.UniqueID)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Selected Date: " & dob & "');", True)
        Dim Statusmessages = String.Empty

        Dim registrationType As [Boolean] = False
        Dim roleId As String = DirectCast(HttpContext.Current.Session("RoleId"), String)

        If roleId = "1" Then
            registrationType = False
        Else
            registrationType = True

        End If
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Dim myguid As String = Guid.NewGuid().ToString("N").Substring(0, 12)
                'If chbCondition.Checked Then
                Using result As New MySqlCommand("Select MobileNumber,TransactionID From registration WHERE MobileNumber = @MobileNumber")
                    Using sda1 As New MySqlDataAdapter(result)
                        Dim fileName As String = String.Empty
                        Dim emailId As String = String.Empty
                        Dim subject As String = String.Empty
                        Dim body As String = String.Empty
                        Dim bodyUser As String = String.Empty
                        Dim Name As String = String.Empty
                        Dim DocumentType As String = String.Empty
                        Dim Title As String = String.Empty
                        Dim SendEmail As SendEmail = New SendEmail()

                        Dim status
                        result.Parameters.AddWithValue("@MobileNumber", txtMobile.Text())
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)

                        fileName = ""

                        Using cmd As New MySqlCommand("Insert_EventRegistration")
                            Using sda As New MySqlDataAdapter()

                                cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.AddWithValue("@Name", txtName.Text)
                                cmd.Parameters.AddWithValue("@EmailID", txtEmail.Text)
                                cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text)
                                cmd.Parameters.AddWithValue("@Event", drpEvent.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@Address", txtAddress.Text)
                                cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                cmd.Parameters.AddWithValue("@ShirtSize", ddlTShrt.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@Gender", drpGender.SelectedItem.Text)
                                cmd.Parameters.AddWithValue("@EmergencyName", String.Empty)
                                cmd.Parameters.AddWithValue("@EmergencyNumber", txtCntNo.Text)
                                cmd.Parameters.AddWithValue("@DOB", dob)
                                cmd.Parameters.AddWithValue("@RegistrationType", registrationType)
                                cmd.Parameters.AddWithValue("@AttachedFile", fileName)
                                cmd.Parameters.AddWithValue("@PaymentStatus", "Pending")
                                cmd.Parameters.AddWithValue("@PaymentType", String.Empty)
                                cmd.Parameters.AddWithValue("@TransactionID", myguid)
                                cmd.Parameters.AddWithValue("@Message", String.Empty)
                                cmd.Connection = con
                                con.Open()
                                cmd.ExecuteNonQuery()

                                'Session("Email") = txtEmail.Text
                                'Session("Name") = txtName.Text
                                'Session("ShirtSize") = ddlTShrt.SelectedItem.Text
                                'Session("TransactionID") = myguid
                                Name = txtName.Text
                                subject = "New Event Request-" + txtName.Text + ""
                                body = "Hello Admin,<br/><br/>There is one new Event Registration Request from below member:<br/><br/><b>Name:</b> " + txtName.Text + "<br/><b>Mobile Number:</b> " + txtMobile.Text + "<br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                'commented 22 nov 2018
                                If roleId = "1" Then
                                    SendEmail = SmsSent("Event Register", "SMS")
                                Else
                                    SendEmail = SmsSent("For Event Registration", "SMS")
                                End If
                                If SendEmail.TemplateType = "SMS" Then
                                    'end
                                    ' Split string based on spaces
                                    'commented 22 nov 2018
                                    Dim Unames As String() = txtName.Text.Split(New Char() {" "c})
                                    Dim distnace As String = drpEvent.SelectedItem.Text
                                    'end
                                    ' Seperate the first name from the rest of the string
                                    'commented 22 nov 2018
                                    Dim lastName As String = txtName.Text.Substring(Unames(0).Length())
                                    ' bodyUser = GetMergedDistance(SendEmail.BodyMessage, Convert.ToString(Unames(0)), distnace)
                                    'end
                                    'This is sent SMS for user.
                                    status = SendEmail.NewBlukSms(txtMobile.Text, bodyUser)
                                    'commented 22 nov 2018
                                    status = "testPayment"
                                    Dim tokenJson = JsonConvert.SerializeObject(status)
                                    ' End
                                    SendEmail.log("ErrorStep1", status, "EventRegister", txtMobile.Text, SendEmail.TemplateType, bodyUser, "", "")
                                End If
                                Statusmessages = "Success"
                                con.Close()
                                con.Dispose()
                                Dim msg As Int16 = 2
                                '  SendEmail.log("ErrorStep3", Statusmessages, "EventRegister", "", "", "", "", "Name" + txtName.Text + ",MobileNo:" + txtMobile.Text + ",Event:" + drpEvent.SelectedItem.Text + "")
                                'Response.Redirect("https://in.explara.com/e/run-for-equality")
                                'Response.Redirect("https://in.explara.com/e/run-for-equality/checkout", False)
                                '  Response.Redirect("")
                                Response.Redirect("/PaymentRequest.aspx?TransactionID=" & myguid)


                            End Using
                        End Using
                        'Else
                        'lblMessage.Visible = True
                        'lblMessage.Text = "This number allready exists!"
                        'End If
                    End Using
                End Using
            Catch ex As Exception
                Statusmessages = "Error"
                SendEmail.log("ErrorStep4", ex.Message, "EventRegister", "", "", "", "", "Name:" + txtName.Text + "MobileNo:" + txtMobile.Text + ",Event:" + drpEvent.SelectedItem.Text + "")
            End Try
        End Using
    End Sub
End Class