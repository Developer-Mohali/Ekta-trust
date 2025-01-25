Imports System.IO
Imports MySql.Data.MySqlClient

Public Class MatrimonialRegistration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    'This function is used to Generate OTP Number and varify Email and Mobile no By OTP Number

    <System.Web.Services.WebMethod()>
    Public Shared Function OtpGenerate(ByVal OTPtype As String, EmailOrMobile As String) As String

        Dim otp As String = String.Empty
        Dim messageBody As String
        'Dim result As String
        Dim status As String
        Dim SendEmail As SendEmail = New SendEmail()

        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Using objCmd As New MySqlCommand("Select * from matrimonialDetails WHERE PhoneNo = @PhoneNo")
                    Using sda1 As New MySqlDataAdapter(objCmd)
                        Dim dt As New DataTable()
                        objCmd.Parameters.AddWithValue("@PhoneNo", EmailOrMobile.Trim())
                        objCmd.Connection = con
                        sda1.Fill(dt)

                        If dt.Rows.Count > 0 Then
                            otp = "Phone no is already exist!"
                            Return otp

                        End If
                    End Using
                End Using
            End Using


            Dim alphabets As String = "1234567890"
            alphabets += Convert.ToString(alphabets)
            'Dim length As Integer = Integer.Parse("2")

            For i As Integer = 0 To 6 - 1
                Dim character As String = String.Empty
                Do
                    Dim index As Integer = New Random().Next(0, alphabets.Length)
                    character = alphabets.ToCharArray()(index).ToString()
                Loop While otp.IndexOf(character) <> -1
                otp += character
            Next

            If "Email" = OTPtype Then

                ' Check Email Id is Exits or Not in database.

                Using con As New MySqlConnection(constr)

                    Using objCmd As New MySqlCommand("Select * from matrimonialDetails WHERE EmailId = @email")
                        Using sda1 As New MySqlDataAdapter(objCmd)
                            Dim dt As New DataTable()
                            objCmd.Parameters.AddWithValue("@email", EmailOrMobile.Trim())
                            objCmd.Connection = con
                            sda1.Fill(dt)

                            If dt.Rows.Count > 0 Then
                                otp = "NotValid"
                                Return otp
                            End If
                        End Using
                    End Using
                End Using
            End If

            If "Email" = OTPtype Then
                messageBody = "<p>Dear User,</p><p>Your activation code is " + otp + " for Matrimonial</p><p>on Ekta Navnirman Trust.</p><p>&nbsp;</p><p>Regards,</p><p>Administrator</p><p>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
                status = SendEmail.EventsendMailUser(EmailOrMobile, "OTP for Matrimonial EktaTrust", messageBody)
            Else
                messageBody = "Dear User, Your activation code is " + otp + " for Matrimonial on Ekta Navnirman Trust.Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
                status = SendEmail.NewBlukSms(EmailOrMobile, messageBody)
            End If
            SendEmail.log("SendOTP", "Success", "MatrimonialRegistration", EmailOrMobile, OTPtype, status, "", "")

        Catch ex As Exception
            SendEmail.log("otpgenerate", ex.ToString, "MatrimonialRegister", "", "", "", "", "")
        End Try
        Return otp

    End Function

    'this function is used to Merge OTP with Template massage
    Private Shared Function GetMergedOTP(Message As String, OTP As String) As String

        Message = Replace(Message, "#OTPCode#", OTP)
        Return Message

    End Function

    'This function is used to save email id and get new generated user ID

    <System.Web.Services.WebMethod()>
    Public Shared Function SaveEmailID(ByVal email As String, userid As String) As String

        Dim ID As String = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                If userid = "" Then

                    Dim result As String = String.Empty
                    Dim i As Int32
                    Dim MatrimonialRegistrationNo As String
                    Dim objDataReader As MySqlDataReader

                    Using objCmd As New MySqlCommand("Select MatrimonialRegNo from matrimonialDetails WHERE ID in(SELECT Max(ID) from matrimonialDetails)", con)
                        con.Open()
                        Using objMySqlReader As MySqlDataReader = objCmd.ExecuteReader
                            'This will loop through all returned records 
                            While objMySqlReader.Read
                                result = objMySqlReader("MatrimonialRegNo").ToString
                            End While
                        End Using
                        con.Close()

                        'this is used to generate matrimonial registration no
                        MatrimonialRegistrationNo = result.Substring(result.Length - Math.Min(5, result.Length))
                        i = Convert.ToInt32(MatrimonialRegistrationNo)
                        MatrimonialRegistrationNo = ""
                        i = i + 1
                        MatrimonialRegistrationNo += "EKTA" + i.ToString("00000")

                    End Using

                    Using cmd As New MySqlCommand("insert into matrimonialDetails (EmailId,MatrimonialRegNo) values(@email,@MatrimonialRegistrationNo)")
                        cmd.Parameters.AddWithValue("@email", email)
                        cmd.Parameters.AddWithValue("@MatrimonialRegistrationNo", MatrimonialRegistrationNo)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteReader()
                        con.Close()
                        con.Dispose()
                    End Using

                    Using objSqlCmd As New MySqlCommand("Select ID from matrimonialDetails WHERE EmailId = @email")
                        objSqlCmd.Parameters.AddWithValue("@email", email)
                        objSqlCmd.Connection = con
                        con.Open()
                        objDataReader = objSqlCmd.ExecuteReader()

                        If objDataReader.Read() Then
                            ID = objDataReader(0).ToString()
                        End If

                        con.Close()
                        con.Dispose()

                    End Using
                Else
                    ID = userid
                End If
            Catch ex As Exception

            End Try
        End Using
        Return ID
    End Function

    ' this function is used to save phone no and update phone no

    <System.Web.Services.WebMethod()>
    Public Shared Function SavePhoneNo(ByVal phone As String, id As String) As String

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try

                Using cmd As New MySqlCommand("Update matrimonialDetails set PhoneNo = @phone WHERE ID = @id")
                    cmd.Parameters.AddWithValue("@phone", phone)
                    cmd.Parameters.AddWithValue("@id", id)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()

                    con.Close()
                    con.Dispose()
                End Using
            Catch ex As Exception

            End Try
        End Using
        Return Nothing
    End Function

    ' This function is used to save information for the matrimonail 

    <System.Web.Services.WebMethod()>
    Public Shared Function saveBasicInformation(ByVal AadharCard As String, Occupation As String, FatherName As String, FatherOccupation As String, MotherName As String, MotherOccupation As String, Education As String, Phone As String, address As String, name As String, DOB As String, gender As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Dim messageBody As String
                Dim result As String = String.Empty
                Dim SendEmail As SendEmail = New SendEmail()
                Dim i As Int32
                Dim MatrimonialRegistrationNo As String

                'Using con As New MySqlConnection(constr)

                Using objCmd As New MySqlCommand("Select MatrimonialRegNo from matrimonialDetails WHERE ID in(SELECT Max(ID) from matrimonialDetails)", con)
                    con.Open()
                    Using objMySqlReader As MySqlDataReader = objCmd.ExecuteReader
                        'This will loop through all returned records 
                        While objMySqlReader.Read
                            result = objMySqlReader("MatrimonialRegNo").ToString
                        End While
                    End Using
                    con.Close()

                    'this is used to generate matrimonial registration no
                    MatrimonialRegistrationNo = result.Substring(result.Length - Math.Min(5, result.Length))
                    i = Convert.ToInt32(MatrimonialRegistrationNo)
                    MatrimonialRegistrationNo = ""
                    i = i + 1
                    MatrimonialRegistrationNo += "EKTA" + i.ToString("00000")

                End Using



                ' this is used to generate a unique password
                Dim alphabets As String = "1234567890QWERTYUIOPasdfghjklZXCVbnm@#$"
                alphabets += Convert.ToString(alphabets)
                Dim Password As String = String.Empty
                For j As Integer = 0 To 6 - 1
                    Dim character As String = String.Empty
                    Do
                        Dim index As Integer = New Random().Next(0, alphabets.Length)
                        character = alphabets.ToCharArray()(index).ToString()
                    Loop While Password.IndexOf(character) <> -1
                    Password += character
                Next

                'extension = System.IO.Path.GetExtension(profilePhoto)
                Using cmd As New MySqlCommand("Insert_BasicInformationNew")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        'cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myName", name.Trim())
                        cmd.Parameters.AddWithValue("@myAddress", address.Trim())
                        cmd.Parameters.AddWithValue("@myCreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myDateOfBirth", DOB.Trim())
                        cmd.Parameters.AddWithValue("@myGender", gender.Trim())
                        'cmd.Parameters.AddWithValue("@myCategory", category.Trim())
                        cmd.Parameters.AddWithValue("@myIsDeleted", False)
                        cmd.Parameters.AddWithValue("@myPassword", Password)

                        cmd.Parameters.AddWithValue("@myMRNo", MatrimonialRegistrationNo)
                        cmd.Parameters.AddWithValue("@myPhone", Phone.Trim())
                        cmd.Parameters.AddWithValue("@myAadharCard", AadharCard.Trim())
                        cmd.Parameters.AddWithValue("@myOccupation", Occupation.Trim())
                        cmd.Parameters.AddWithValue("@myFatherName", FatherName.Trim())
                        cmd.Parameters.AddWithValue("@myFatherOccupation", FatherOccupation.Trim())
                        cmd.Parameters.AddWithValue("@myMotherName", MotherName.Trim())
                        cmd.Parameters.AddWithValue("@myMotherOccupation", MotherOccupation.Trim())
                        cmd.Parameters.AddWithValue("@myEducation", Education.Trim())

                        'cmd.Parameters.AddWithValue("@myLastName", lastName.Trim())
                        'cmd.Parameters.AddWithValue("@myNativePlace", nativePlace.Trim())
                        'cmd.Parameters.AddWithValue("@myHeight", height.Trim())
                        'cmd.Parameters.AddWithValue("@myBodyWeight", weight.Trim())
                        'cmd.Parameters.AddWithValue("@myPermanentAddress", parmanentAddress.Trim())
                        'cmd.Parameters.AddWithValue("@mySelfMaritalStatus", maritalStatus.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        'messageBody = "<p>Dear User,</p><p>Your registration has been successfully done in Ekta Matrimonial.</p><p> Your account details are : </p><br>UserID: " + email + "<br>Password: " + Password + "<br><br><a href='https://ektatrust.org.in/MatrimonialLogin' target='blank'>Click here for login</a> <br><br>Regards,<br>Administrator<br>Ekta Navnirman Trust"
                        'Dim status = SendEmail.EventsendMailUser(email, "Matrimonial Registration", messageBody)
                        messageBody = "Dear User, Your registration has been successfully done in Ekta Matrimonial. Your account details are : UserID: " + Phone + " Password: " + Password + " Regards, Administrator Ekta Navnirman Trust"
                        Dim status = SendEmail.NewBlukSms(Phone, messageBody)
                        Statusmessages = "Success"

                        SendEmail.log("step1", Statusmessages, "MatrimonialRegister", "", "", "", "", "Name:" + name + ",Password :" + Password + ", AadharCard:" + AadharCard + ", Education:" + Education + ",Gender:" + gender + ", DateOfBirth:" + DOB + " ,Occupation:" + Occupation + ",MobileNo:" + Phone + ",Gender:" + gender + ",Address:" + address + "" + ",FatherName:" + FatherName + "" + ",FatherOccupation:" + FatherOccupation + "" + ",MotherName:" + MotherName + "" + ",MotherOccupation:" + MotherOccupation + "")
                    End Using
                End Using

            Catch e As Exception
                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "MatrimonialRegister", "", "", "", "", "Name:" + name + ", AadharCard:" + AadharCard + ", Education:" + Education + ",Gender:" + gender + ", DateOfBirth:" + DOB + " ,Occupation:" + Occupation + ",MobileNo:" + Phone + ",Gender:" + gender + ",Address:" + address + "" + ",FatherName:" + FatherName + "" + ",FatherOccupation:" + FatherOccupation + "" + ",MotherName:" + MotherName + "" + ",MotherOccupation:" + MotherOccupation + "")
            End Try
        End Using
        Return Statusmessages
    End Function



End Class

