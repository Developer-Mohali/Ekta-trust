Imports System.Net.Mail
Imports EktaTrust.MobClasses
Imports MySql.Data.MySqlClient
Public Class ParticipantRepository
    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim message As String
    Dim transactionData As SortedList
    Dim duplicate As SortedList
    Public encryptdata As String
    Public Url As String

    'This event is used to add new event.
    Public Function AddNewEvent(ByVal Emp As RegisterEventsInformation) As String
        Using con As New MySqlConnection(constr)
            Try
                'Here, Checking Existing number.
                Using result As New MySqlCommand("Select MobileNumber From eventsregistration WHERE MobileNumber = @MobileNumber")
                    Using sda1 As New MySqlDataAdapter(result)
                        result.Parameters.AddWithValue("@MobileNumber", Emp.mobilenumber.Trim())
                        result.Connection = con
                        Dim dt As New DataTable()
                        sda1.Fill(dt)
                        If dt.Rows.Count <= 0 Then
                            Using cmd As New MySqlCommand("EventRegister")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.AddWithValue("@FirstName", Emp.firstname)
                                    cmd.Parameters.AddWithValue("@LastName", Emp.firstname)
                                    cmd.Parameters.AddWithValue("@MobileNumber", Emp.mobilenumber)
                                    cmd.Parameters.AddWithValue("@EmailId", Emp.emailId)
                                    cmd.Parameters.AddWithValue("@Distance", Emp.distance)
                                    cmd.Parameters.AddWithValue("@Tshirt", Emp.tshirt)
                                    cmd.Parameters.AddWithValue("@CreateDate", System.DateTime.Now)
                                    cmd.Parameters.AddWithValue("@PaymentStatus", False)
                                    cmd.Parameters.AddWithValue("@Amount", 500)
                                    cmd.Parameters.AddWithValue("@PaymentDetails", "")
                                    cmd.Connection = con
                                    con.Open()
                                    cmd.ExecuteNonQuery()
                                    message = "Saved Successfully!"
                                End Using
                            End Using
                        Else
                            message = "Mobile Number is already exist."
                        End If
                    End Using
                End Using
            Catch ex As Exception
                message = "Something went wrong!"
            End Try
            Return message
        End Using
    End Function

    'This event is used to save the ContactUs query.
    Public Function ContactUsEvent(ByVal contact As contacts) As String
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Contact_Us")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@EmailID", contact.EmailId)
                    cmd.Parameters.AddWithValue("@MobileNumber", contact.MobileNumber)
                    cmd.Parameters.AddWithValue("@Message", contact.Message)
                    cmd.Parameters.AddWithValue("@CreateDate", System.DateTime.Now)

                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()

                    'message = "Saved Successfully!"
                    Try
                        Dim Msg As New MailMessage()
                        Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()

                        ' Sender e-mail address.
                        Msg.From = New MailAddress(contact.EmailId)
                        ' Recipient e-mail address.
                        Msg.Body = contact.Message
                        ' your remote SMTP server IP.
                        Dim smtp As New SmtpClient()
                        smtp.Host = "gmail.com"
                        smtp.Port = 587
                        'smtp.Credentials = New System.Net.NetworkCredential("yourgmailemail@gmail.com", "yourgmailpassword")
                        smtp.EnableSsl = True
                        smtp.Send(Msg)
                        message = "Message send successfully."
                    Catch ex As Exception
                        Console.WriteLine("{0} Exception caught.", ex)
                        message = "Something went wrong!"
                    End Try

                    Return message
                End Using
            End Using


        End Using
        Return message
    End Function

    'This is used to save device token
    Public Function SaveDeviceToken(ByVal deviceToken As DeviceTokens) As String
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("Select * from applicationusers where DeviceToken = @DeviceToken")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.Parameters.AddWithValue("@DeviceToken", deviceToken.DeviceToken)
                        cmd.Connection = con
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        If dt.Rows.Count <= 0 Then
                            Using cmd1 As New MySqlCommand("SaveDevice_Token")
                                Using sda1 As New MySqlDataAdapter()
                                    cmd1.CommandType = CommandType.StoredProcedure
                                    cmd1.Parameters.AddWithValue("@DeviceToken", deviceToken.DeviceToken)
                                    cmd1.Parameters.AddWithValue("@CreateDate", System.DateTime.Now())
                                    cmd1.Connection = con
                                    con.Open()
                                    cmd1.ExecuteNonQuery()
                                    message = "Saved Successfully!"
                                    con.Close()
                                End Using
                            End Using
                        Else
                            message = "Already Saved!"
                        End If
                    End Using
                End Using
            Catch ex As Exception
                message = "Something went wrong!"
            End Try
            Return message
        End Using
    End Function

    'This is used to save Join us details. #Message send to admin
    Public Function MessageToAdmin(ByVal objMessage As messages) As String
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("Send_Message")
                Using sda As New MySqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Name", objMessage.Name)
                    cmd.Parameters.AddWithValue("@Email", objMessage.Email)
                    cmd.Parameters.AddWithValue("@Address", objMessage.Address)
                    cmd.Parameters.AddWithValue("@Occupation", objMessage.Occupation)
                    cmd.Parameters.AddWithValue("@Mobile", objMessage.Mobile)
                    cmd.Parameters.AddWithValue("@Message", objMessage.Message)
                    cmd.Parameters.AddWithValue("@CreateDate", System.DateTime.Now)

                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()

                    'message = "Saved Successfully!"
                    Try
                        Dim Msg As New MailMessage()
                        Dim ToEmailID As String = ConfigurationManager.AppSettings("ToEmailID").ToString()

                        ' Sender e-mail address.
                        Msg.From = New MailAddress(objMessage.Email)
                        ' Recipient e-mail address.
                        Msg.Body = objMessage.Message
                        ' your remote SMTP server IP.
                        Dim smtp As New SmtpClient()
                        smtp.Host = "gmail.com"
                        smtp.Port = 587
                        'smtp.Credentials = New System.Net.NetworkCredential("yourgmailemail@gmail.com", "yourgmailpassword")
                        smtp.EnableSsl = True
                        smtp.Send(Msg)
                        message = "Message send successfully."
                    Catch ex As Exception
                        Console.WriteLine("{0} Exception caught.", ex)
                        message = "Something went wrong!"
                    End Try

                    Return message
                End Using
            End Using


        End Using
        Return message
    End Function

    Public Function Payment(ByVal pay As Payment) As String
        Dim SECURE_SECRET As String = ConfigurationManager.AppSettings("SECURE_SECRET")
        Dim message As String = "No Messages"
        Dim txnResponseCode As String = ""

        Dim errorExists As Boolean = False
        Try
            transactionData = New System.Collections.SortedList(New EMAStringComparer())
            Dim queryString As String = ""
            Url = ConfigurationManager.AppSettings("Url")

            Dim paiseamount As String = ConfigurationManager.AppSettings("Amount")
            Dim paise As String = Convert.ToInt32(paiseamount) * 100

            transactionData.Add("Version", ConfigurationManager.AppSettings("Version"))
            transactionData.Add("TxnRefNo", ConfigurationManager.AppSettings("TxnRefNo"))
            transactionData.Add("Amount", paise)
            transactionData.Add("PassCode", ConfigurationManager.AppSettings("PassCode"))
            transactionData.Add("BankId", ConfigurationManager.AppSettings("BankId"))
            transactionData.Add("TerminalId", ConfigurationManager.AppSettings("TerminalId"))
            transactionData.Add("MerchantId", ConfigurationManager.AppSettings("MerchantId"))
            transactionData.Add("MCC", ConfigurationManager.AppSettings("MCC"))
            transactionData.Add("Currency", ConfigurationManager.AppSettings("Currency"))
            transactionData.Add("TxnType", ConfigurationManager.AppSettings("TxnType"))
            transactionData.Add("ReturnURL", ConfigurationManager.AppSettings("RedirectUrl"))
            transactionData.Add("CardHolder", pay.NameofCardHolder)
            transactionData.Add("CardNumber", pay.CardNumber)
            transactionData.Add("CardSecurityCode", pay.CVV)
            transactionData.Add("ExpiryDate", pay.ExpiryDate)

            Dim rawHashData As String = SECURE_SECRET
            Dim seperator As String = "::"

            For Each item As DictionaryEntry In transactionData
                queryString += item.Key.ToString() & "=" & item.Value.ToString() & seperator

                If SECURE_SECRET.Length > 0 Then
                    rawHashData += item.Value.ToString()
                End If
            Next

            Dim signature As String = ""

            If (SECURE_SECRET.Length > 0) Then
                signature = CreateSHA256Signature(rawHashData)
                queryString += "SecureHash=" + signature
            End If

            transactionData.Remove("Version")
            transactionData.Remove("TxnRefNo")
            transactionData.Remove("Amount")
            transactionData.Remove("PassCode")
            transactionData.Remove("BankId")
            transactionData.Remove("TerminalId")
            transactionData.Remove("MerchantId")
            transactionData.Remove("MCC")
            transactionData.Remove("Currency")
            transactionData.Remove("TxnType")
            transactionData.Remove("ReturnURL")
            transactionData.Remove("CardHolder")
            transactionData.Remove("CardNumber")
            transactionData.Remove("ExpiryDate")
            transactionData.Remove("CardSecurityCode")
            'Try
            '    duplicate.Add("BankId", ConfigurationManager.AppSettings("BankId"))
            '    duplicate.Add("Currency", ConfigurationManager.AppSettings("Currency"))
            '    duplicate.Add("MCC", ConfigurationManager.AppSettings("MCC"))
            '    duplicate.Add("PassCode", ConfigurationManager.AppSettings("PassCode"))
            '    duplicate.Add("RedirectUrl", ConfigurationManager.AppSettings("RedirectUrl"))
            '    duplicate.Add("TxnRefNo", ConfigurationManager.AppSettings("TxnRefNo"))
            '    duplicate.Add("TxnType", ConfigurationManager.AppSettings("TxnType"))
            '    duplicate.Add("MerchantId", ConfigurationManager.AppSettings("MerchantId"))
            '    duplicate.Add("TerminalId", ConfigurationManager.AppSettings("TerminalId"))
            '    duplicate.Add("Version", ConfigurationManager.AppSettings("Version"))
            '    duplicate.Add("CardHolder", pay.NameofCardHolder)
            '    duplicate.Add("CardNumber", pay.CardNumber)
            '    duplicate.Add("CardSecurityCode", pay.CVV)
            '    duplicate.Add("ExpiryDate", pay.ExpiryDate)
            '    For Each item As DictionaryEntry In duplicate
            '        queryString += item.Key.ToString() & "=" & item.Value.ToString() & seperator
            '    Next
            'Catch ex As Exception
            '    Return ""
            'End Try
            Dim encValue As String = Encrypt(queryString)

            encryptdata = encValue

            Return encryptdata
        Catch ex As Exception
            Return "Somethimg went wrong"
        End Try
        Return "Nothing"

    End Function
    Public Class EMAStringComparer
        Implements IComparer
        Public Function Compare(ByVal a As Object, ByVal b As Object) As Integer Implements IComparer.Compare
            If a = b Then Return 0
            If a Is Nothing Then Return -1
            If b Is Nothing Then Return 1
            Dim sa As String = TryCast(a, String)
            Dim sb As String = TryCast(b, String)
            Dim myComparer As System.Globalization.CompareInfo = System.Globalization.CompareInfo.GetCompareInfo("en-US")

            If sa IsNot Nothing AndAlso sb IsNot Nothing Then
                Return myComparer.Compare(sa, sb, System.Globalization.CompareOptions.Ordinal)
            End If

            Throw New ArgumentException("a and b should be strings.")
        End Function
    End Class
    Private Function CreateSHA256Signature(ByVal RawData As String) As String
        Dim hasher As System.Security.Cryptography.SHA256 = Security.Cryptography.SHA256.Create()
        Dim HashValue As Byte() = hasher.ComputeHash(Encoding.ASCII.GetBytes(RawData))
        Dim strHex As String = ""
        For Each b As Byte In HashValue
            strHex += b.ToString("x2")
        Next
        Return strHex.ToUpper()
    End Function
    Private Function Encrypt(ByVal plainText As String) As String

        'Dim EncryptionKey As String = "89AAB829D5A74AF1A1450894F3C3C1A8"
        'Dim EncryptionKey As String = "5EC4A697141C8CE45509EF485EE7D4B1"
        Dim EncryptionKey As String = ConfigurationManager.AppSettings("EncryptionKey")
        Dim tdes As System.Security.Cryptography.Rijndael = System.Security.Cryptography.Rijndael.Create()
        tdes.Key = Encoding.UTF8.GetBytes(EncryptionKey)
        tdes.Mode = System.Security.Cryptography.CipherMode.ECB
        tdes.Padding = System.Security.Cryptography.PaddingMode.PKCS7
        Dim crypt As System.Security.Cryptography.ICryptoTransform = tdes.CreateEncryptor()
        Dim plain As Byte() = Encoding.UTF8.GetBytes(plainText)
        Dim cipher As Byte() = crypt.TransformFinalBlock(plain, 0, plain.Length)
        plainText = Convert.ToBase64String(cipher)
        Return plainText
    End Function
    Public Function GenerateOTP(ByVal otpData As OTP) As String
        Dim otp As String = String.Empty
        Dim messageBody As String
        Dim status As String
        Dim mobile As String = otpData.Mobile
        Dim SendEmail As SendEmail = New SendEmail()
        Try
            Dim alphabets As String = "1234567890"
            alphabets += Convert.ToString(alphabets)
            For i As Integer = 0 To 6 - 1
                Dim character As String = String.Empty
                Do
                    Dim index As Integer = New Random().Next(0, alphabets.Length)
                    character = alphabets.ToCharArray()(index).ToString()
                Loop While otp.IndexOf(character) <> -1
                otp += character
            Next
            messageBody = "Dear User, Your activation code is " + otp + " for Join Us on Ekta Navnirman Trust.Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
            status = SendEmail.NewBlukSms(mobile, messageBody)
            SendEmail.log("SendOTP", "Success", "Join Us", mobile, otpData.OTPtype, status, "", messageBody)
        Catch ex As Exception
            SendEmail.log("otpgenerateError", ex.ToString, "Join Us", "", "", "", "", "")
        End Try
        Return otp
    End Function
    Public Function JoinUsMessage(ByVal msg As Message) As String
        Dim JoinId As Integer = 0

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("Insert_JoinUs")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Name", msg.Name)
                        cmd.Parameters.AddWithValue("@Email", msg.Email)
                        cmd.Parameters.AddWithValue("@Address", msg.Address)
                        cmd.Parameters.AddWithValue("@Designation", msg.Designation)
                        cmd.Parameters.AddWithValue("@Mobile", msg.Mobile)
                        cmd.Parameters.AddWithValue("@Message", msg.Msg)
                        cmd.Parameters.AddWithValue("@Date", DateTime.Now)

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        Dim messageBody = "<p>Dear " + msg.Name + ",</p><p>Thank you for showing your interest to join ekta trust.</p><p>Regards,</p><p>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
                        Dim statusEmail = SendEmail.EventsendMailUser(msg.Email, "Matrimonial Registration", messageBody)
                        con.Close()
                        Return "Message send successfully."
                    End Using
                End Using
            Catch ex As Exception
                Return "Something went wrong!"
            End Try
        End Using
    End Function
End Class
