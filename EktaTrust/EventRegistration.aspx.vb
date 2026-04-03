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
Imports System.Net


Public Class EventRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
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

        End If
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function Submitdata(ByVal email As String, username As String, phone As String, drpEvent As String, address As String, ddlGender As String, dob As String, tshirtSize As String) As String
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

    <System.Web.Services.WebMethod()>
    Public Shared Function SaveBibForm(amount As String, email As String, gender As String, name As String, phone As String, runCategory As String, runnerDOB As String, tshirtSize As String
    )
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim category As String = "Registration For RUN FOR EQUALITY"
        Dim bibNumber As String = GetNextBibNumber(runCategory, constr)
        Dim year As String = DateTime.Now.Year.ToString()

        ' ✅ Generate UNIQUE Order ID
        Dim orderId As String = DateTime.Now.Ticks.ToString() & "_" & bibNumber

        Try
            'InitiateTransaction("Ekta123456", "1600")
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("InsertBIBData")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New MySqlParameter("p_BankReferenceNo", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_BIBNo", bibNumber))
                        cmd.Parameters.Add(New MySqlParameter("p_MobileNumber", phone))
                        cmd.Parameters.Add(New MySqlParameter("p_RunnerName", name))
                        cmd.Parameters.Add(New MySqlParameter("p_RunCatagory", runCategory))
                        cmd.Parameters.Add(New MySqlParameter("p_TShirtSize", tshirtSize))
                        cmd.Parameters.Add(New MySqlParameter("p_Gender", gender))
                        cmd.Parameters.Add(New MySqlParameter("p_BloodGroup", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_EmailID", email))
                        cmd.Parameters.Add(New MySqlParameter("p_RoleID", 0))
                        cmd.Parameters.Add(New MySqlParameter("p_CategoryName", category))
                        cmd.Parameters.Add(New MySqlParameter("p_Year", (year)))
                        cmd.Parameters.Add(New MySqlParameter("p_UserId", 0))
                        cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactName", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_EmergencyContactNumber", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_RunnerDOB", (runnerDOB)))
                        cmd.Parameters.Add(New MySqlParameter("p_CreatedBy", 0))
                        cmd.Parameters.Add(New MySqlParameter("p_OrderId", (orderId)))
                        cmd.Parameters.Add(New MySqlParameter("p_PaymentStatus", "Pending"))
                        cmd.Parameters.Add(New MySqlParameter("p_Amount", (amount)))
                        cmd.Parameters.Add(New MySqlParameter("p_TxnId", ""))
                        cmd.Parameters.Add(New MySqlParameter("p_PaytmResponse", ""))
                        cmd.Connection = con
                        con.Open()
                        Try
                            cmd.ExecuteNonQuery()
                        Catch ex As MySqlException
                            Logger.LogError($"Error in EventRegistration->SaveBibForm from Procedure ::: Error ::: {ex.Message}", ex)
                            Return New With {
                                   .success = False,
                                   .message = ex.Message,
                                   .bibNo = bibNumber,
                                   .orderId = orderId
                               }
                        End Try
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            End Using
            Return New With {
            .success = True,
            .message = "BIB Inserted Successfully",
            .bibNo = bibNumber,
            .orderId = orderId
        }
        Catch ex As Exception
            Logger.LogError($"Error in EventRegistration->SaveBibForm ::: Error ::: {ex.Message}", ex)
            Throw
        End Try
    End Function

    Private Shared Function GetNextBibNumber(category As String, connStr As String) As String
        Try
            Dim prefix As String = category.ToLower().Replace("km", "") ' "21", "10", "5"
            If prefix.Length = 1 Then prefix = "50" ' "50"
            If prefix.Contains("21.09") Then prefix = "21"

            Dim lastBib As String = Nothing

            Using con As New MySqlConnection(connStr)
                Using cmd As New MySqlCommand("SELECT MAX(BIBNo) FROM bibdata WHERE BIBNo LIKE CONCAT(@Prefix, '%') AND CHAR_LENGTH(BIBNo) = 6", con)

                    cmd.Parameters.AddWithValue("@Prefix", prefix)

                    con.Open()
                    lastBib = Convert.ToString(cmd.ExecuteScalar())
                End Using
            End Using

            ' If first record
            If String.IsNullOrEmpty(lastBib) Then
                Return prefix & "0001"   ' 6 digits start
            End If

            ' Increment safely
            ' Extract numeric part ONLY
            Dim numericPart As Integer = Integer.Parse(lastBib.Substring(prefix.Length))

            ' Increment & pad to 4 digits
            Return prefix & (numericPart + 1).ToString("D4")

        Catch ex As Exception
            Logger.LogError($"Error in EventRegistration->GetNextBibNumber ::: Error ::: {ex.Message}", ex)
            Throw
        End Try
    End Function


    <System.Web.Services.WebMethod()>
    Public Shared Function InitiateTransaction(amount As String, orderId As String, name As String, phone As String, email As String, paymentfor As String) As Object
        Try
            Dim mid As String = ConfigurationManager.AppSettings("MID")
            Dim merchantKey As String = ConfigurationManager.AppSettings("MerchantKey")
            Dim website As String = ConfigurationManager.AppSettings("WebsiteName")
            Dim env As String = ConfigurationManager.AppSettings("Environment")
            Dim callBackUrl As String = ConfigurationManager.AppSettings("CallBackURL")
            Dim url As String = ""

            If env = "Prod" Then
                url = ConfigurationManager.AppSettings("PaytmProductionURL")
            Else
                url = ConfigurationManager.AppSettings("PaytmStageURL")
            End If

            Dim body As New Dictionary(Of String, Object)
            Dim head As New Dictionary(Of String, String)
            Dim requestBody As New Dictionary(Of String, Object)

            Dim txnAmount As New Dictionary(Of String, String) From {
            {"value", amount},
            {"currency", "INR"}
        }

            Dim userInfo As New Dictionary(Of String, String) From {
                {"custId", "CUST_" & orderId},
                {"mobile", phone},
                {"email", email},
                {"firstName", name}
            }

            body.Add("requestType", "Payment")
            body.Add("mid", mid)
            body.Add("orderId", orderId)
            body.Add("websiteName", website)
            body.Add("industryTypeId", "Retail")
            body.Add("channelId", "WEB")
            body.Add("txnAmount", txnAmount)
            body.Add("userInfo", userInfo)
            body.Add("callbackUrl", callBackUrl + "?paymentfor=" + paymentfor)

            ' ✅ Generate checksum
            Dim jsonBody As String = JsonConvert.SerializeObject(body)
            Dim signature As String = Paytm.Checksum.generateSignature(jsonBody, merchantKey)

            head.Add("signature", signature)

            requestBody.Add("body", body)
            requestBody.Add("head", head)

            Dim postData As String = JsonConvert.SerializeObject(requestBody)

            url = url & "?mid=" & mid & "&orderId=" & orderId

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

            Dim request As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
            request.Method = "POST"
            request.ContentType = "application/json"

            Dim bytes As Byte() = Encoding.UTF8.GetBytes(postData)
            request.ContentLength = bytes.Length

            Using stream = request.GetRequestStream()
                stream.Write(bytes, 0, bytes.Length)
            End Using

            Dim responseData As String = ""

            Using reader As New StreamReader(request.GetResponse().GetResponseStream())
                responseData = reader.ReadToEnd()
            End Using

            ' ✅ Parse response safely
            Dim jsonResponse = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(responseData)
            Dim bodyObj = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(jsonResponse("body").ToString())

            Dim result As New Dictionary(Of String, Object)

            If bodyObj.ContainsKey("txnToken") Then
                result("success") = True
                result("txnToken") = bodyObj("txnToken").ToString()
                result("orderId") = orderId
                result("amount") = amount
            Else
                result("success") = False
                result("message") = responseData
            End If

            Return result

        Catch ex As Exception
            Logger.LogError($"Error in EventRegistration->InitiateTransaction ::: Error ::: {ex.Message}", ex)
            Return New With {
            .success = False,
            .message = ex.Message
        }
        End Try
    End Function
End Class