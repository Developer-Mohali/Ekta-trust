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


Public Class EventRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    <System.Web.Services.WebMethod()>
    Public Shared Function Submitdata(ByVal email As String, username As String, phone As String, drpEvent As String, address As String) As String
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
                        Dim SendEmail As SendEmail = New SendEmail()
                        Dim status
                        result.Parameters.AddWithValue("@MobileNumber", phone.Trim())
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        'If dt.Rows.Count <= 0 Then
                        Using cmd As New MySqlCommand("EventRegistration")
                            Using sda As New MySqlDataAdapter()
                                cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.AddWithValue("@FirstName", username.Trim())
                                cmd.Parameters.AddWithValue("@EmailId", email.Trim())
                                cmd.Parameters.AddWithValue("@MobileNumber", phone.Trim())
                                cmd.Parameters.AddWithValue("@Distance", drpEvent.Trim())
                                cmd.Parameters.AddWithValue("@Address", address.Trim())
                                cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now)
                                'cmd.Parameters.AddWithValue("@ShirtSize", shirt.Trim())
                                'cmd.Parameters.AddWithValue("@EmergencyName", ename.Trim())
                                'cmd.Parameters.AddWithValue("@EmergencyNumber", emobile.Trim())
                                'cmd.Parameters.AddWithValue("@RegistrationType", registrationType)
                                'cmd.Parameters.AddWithValue("@AttachedFile", "")
                                cmd.Connection = con
                                con.Open()
                                cmd.ExecuteNonQuery()
                                Name = username
                                subject = "New Event Request-" + username + ""
                                body = "Hello Admin,<br/><br/>There is one new Event Registration Request from below member:<br/><br/><b>Name:</b> " + Name + "<br/><b>Eamil Address:</b> " + email + "<br/><b>Mobile Number:</b> " + phone + "<br/><b>Event: </b>" + address + "<br/><b>Address: </b>" + address + "<br/><br/><br/>" + " <b>Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."

                                SendEmail.EventRegistrationSendMail(emailId, subject, body)
                                If roleId = "1" Then
                                    SendEmail = SmsSent("Event Register", "SMS")
                                Else

                                    SendEmail = SmsSent("For Event Registration", "SMS")
                                End If

                                If SendEmail.TemplateType = "SMS" Then

                                    ' Split string based on spaces
                                    Dim Unames As String() = username.Trim().Split(New Char() {" "c})
                                    Dim distnace As String = drpEvent.Trim()

                                    ' Seperate the first name from the rest of the string
                                    Dim lastName As String = username.Substring(Unames(0).Length())
                                    'bodyUser = GetMergedData(SendEmail.BodyMessage, Convert.ToString(Unames(0)))

                                    bodyUser = GetMergedDistance(SendEmail.BodyMessage, Convert.ToString(Unames(0)), distnace)


                                    ' bodyUser = GetMergedDistance(SendEmail.BodyMessage, Convert.ToString(Unames(0)), distnace)
                                    'This is sent SMS for user.
                                    status = SendEmail.NewBlukSms(phone.Trim(), bodyUser)

                                    Dim tokenJson = JsonConvert.SerializeObject(status)

                                    'Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
                                    'status = jsonResult.Values(1)
                                    SendEmail.log("ErrorStep1", status, "EventRegister", phone.Trim(), SendEmail.TemplateType, bodyUser, "", "")
                                End If
                                'This  method call EMAIL.
                                SendEmail = MailSent("For Event Registration", "EMAIL")
                                If SendEmail.TemplateType = "EMAIL" Then

                                    bodyUser = GetMergedDistance(SendEmail.BodyMessage, username.Trim(), drpEvent.Trim())

                                    'This is sent mail for user.
                                    status = SendEmail.EventsendMailUser(email.Trim(), SendEmail.Subject, bodyUser)
                                    SendEmail.log("ErrorStep2", status, "EventRegister", email.Trim(), SendEmail.TemplateType, bodyUser, status, "")
                                End If

                                Statusmessages = "Success"
                                con.Close()
                                con.Dispose()
                                Dim msg As Int16 = 2
                                SendEmail.log("ErrorStep3", Statusmessages, "EventRegister", "", "", "", "", "Name:" + username + ",EamilId:" + email + ",MobileNo:" + phone + ",Event:" + drpEvent + ",Address:" + address + "")

                                Return msg

                            End Using
                        End Using
                        'Else
                        '    Dim msg As Int16 = 1
                        '    Return msg

                        'End If
                    End Using

                End Using
            Catch e As Exception
                Statusmessages = "Error"
                SendEmail.log("ErrorStep4", e.Message, "EventRegister", "", "", "", "", "Name:" + username + ",EamilId:" + email + ",MobileNo:" + phone + ",Event:" + drpEvent + ",Address:" + address + "")
            End Try
        End Using

    End Function

    'Private Shared Function Session(v As String) As Object
    '    Throw New NotImplementedException()
    'End Function
    'This method used to Generate otpNumber.
    <System.Web.Services.WebMethod()>
    Public Shared Function otpgenerate(ByVal phone As String, username As String, email As String) As String
        Dim SendEmail As SendEmail = New SendEmail()
        Dim message As String
       
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

            'randomNumber = Int((1000000 * Rnd()) + 1)


            'messageResponse = objSendEmail.sendSMS(phone, randomNumber)
            'If messageResponse <> "OK" Then
            '    randomNumber = "NotValid"
            'End If
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
            SendEmail = MailSent("For Verification OTP", "EMAIL")
            If SendEmail.TemplateType = "EMAIL" Then
                message = GetMergedOTP(SendEmail.BodyMessage, Convert.ToString(Unames(0)), otp)
                'This is sent mail for user.
            status = SendEmail.EventsendMailUser(email, SendEmail.Subject, message)

            End If
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
                    SendEmail.BodyMessage = getTamplate.Tables(0).Rows(0)("Message")
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
End Class