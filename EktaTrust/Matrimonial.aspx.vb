Imports MySql.Data.MySqlClient
Imports System.IO
Imports Newtonsoft.Json

Public Class Matrimonial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'This function is used to Generate OTP Number and varify Email and Mobile no By OTP Number

    <System.Web.Services.WebMethod()>
    Public Shared Function OtpGenerate(ByVal OTPtype As String, EmailOrMobile As String) As String

        Dim otp As String = String.Empty
        Dim messageBody As String
        Dim status As String
        Dim SendEmail As SendEmail = New SendEmail()

        Try

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
                Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
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
    Public Shared Function saveBasicInformation(ByVal maritalStatus As String, email As String, id As Int32, phone As String, parmanentAddress As String, weight As String, height As String, name As String, address As String, DOB As String, gender As String, category As String, lastName As String, nativePlace As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Dim messageBody As String
                Dim result As String = String.Empty
                Dim SendEmail As SendEmail = New SendEmail()

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
                Using cmd As New MySqlCommand("Insert_BasicInformation")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myName", name.Trim())
                        cmd.Parameters.AddWithValue("@myAddress", address.Trim())
                        cmd.Parameters.AddWithValue("@myCreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myDateOfBirth", DOB.Trim())
                        cmd.Parameters.AddWithValue("@myGender", gender.Trim())
                        cmd.Parameters.AddWithValue("@myCategory", category.Trim())
                        cmd.Parameters.AddWithValue("@myIsDeleted", False)
                        cmd.Parameters.AddWithValue("@myPassword", Password)

                        cmd.Parameters.AddWithValue("@myLastName", lastName.Trim())
                        cmd.Parameters.AddWithValue("@myNativePlace", nativePlace.Trim())
                        cmd.Parameters.AddWithValue("@myHeight", height.Trim())
                        cmd.Parameters.AddWithValue("@myBodyWeight", weight.Trim())
                        cmd.Parameters.AddWithValue("@myPermanentAddress", parmanentAddress.Trim())
                        cmd.Parameters.AddWithValue("@mySelfMaritalStatus", maritalStatus.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        messageBody = "<p>Dear User,</p><p>Your registration has been successfully done in Ekta Matrimonial.</p><p> Your account details are : </p><br>UserID: " + email + "<br>Password: " + Password + "<br><br><a href='https://ektatrust.org.in/MatrimonialLogin' target='blank'>Click here for login</a> <br><br>Regards,<br>Administrator<br>Ekta Navnirman Trust"
                        Dim status = SendEmail.EventsendMailUser(email, "Matrimonial Registration", messageBody)
                        messageBody = "Dear User, Your registration has been successfully done in Ekta Matrimonial. Your account details are : UserID: " + email + " Password: " + Password + " Regards, Administrator Ekta Navnirman Trust"
                        status = SendEmail.NewBlukSms(phone, messageBody)
                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "MatrimonialRegister", "", "", "", "", "Name:" + name + ",Password :" + Password + ", lastName:" + lastName + ", Category:" + category + ",Gender:" + gender + ", DateOfBirth:" + DOB + " ,EamilId:" + email + ",MobileNo:" + phone + ",Gender:" + gender + ",Address:" + address + "")
                    End Using
                End Using

            Catch e As Exception
                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "MatrimonialRegister", "", "", "", "", "Name:" + name + ", lastName:" + lastName + ", Category:" + category + ",Gender:" + gender + ", DateOfBirth:" + DOB + " ,EamilId:" + email + ",MobileNo:" + phone + ",Gender:" + gender + ",Address:" + address + "")
            End Try
        End Using
        Return Nothing
    End Function

    ' This function is used to save other information for the matrimonail 

    <System.Web.Services.WebMethod()>
    Public Shared Function SaveOtherInformation(ByVal id As String, education As String, jobDiscription As String, annualIncome As String, occupationType As String, partnerHeightfrom As String, partnerAgeTo As String, partnerAgeFrom As String, partnerMarriedStatus As String, partnerQualification As String, partnerHeightTo As String, work As String, qualification As String, posting As String, foodHabbit As String, language As String, smoke As String, drink As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("Insert_OtherInformation")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure

                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myWork", work.Trim())
                        cmd.Parameters.AddWithValue("@myQualification", qualification.Trim())
                        cmd.Parameters.AddWithValue("@myPosting", posting.Trim())
                        cmd.Parameters.AddWithValue("@myFoodHabbit", foodHabbit.Trim())
                        cmd.Parameters.AddWithValue("@myLanguage", language.Trim())
                        cmd.Parameters.AddWithValue("@mySmoke", smoke.Trim())
                        cmd.Parameters.AddWithValue("@myDrink", drink.Trim())
                        cmd.Parameters.AddWithValue("@myEducation", education.Trim())

                        cmd.Parameters.AddWithValue("@myPartnerAgeFrom", partnerAgeFrom.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerAgeTo", partnerAgeTo.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerQualification", partnerQualification.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerMaritalStatus", partnerMarriedStatus.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerHeightFrom", partnerHeightfrom.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerHeightTo", partnerHeightTo.Trim())
                        cmd.Parameters.AddWithValue("@myOccupationType", occupationType.Trim())
                        cmd.Parameters.AddWithValue("@myAnnualIncome", annualIncome.Trim())
                        cmd.Parameters.AddWithValue("@myJobDiscription", jobDiscription.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                    End Using
                End Using

            Catch e As Exception
                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "MatrimonialRegister", "", "", "", "", "ID:" + id + ", drink:" + drink + ",smoke:" + smoke + ",language:" + language + ",foodHabbit:" + foodHabbit + ",posting:" + posting + ",qualification:" + qualification + ",education:" + education + ", Work:" + work + "")
            End Try
        End Using

        Return Statusmessages

    End Function

    ' This function is used to save information for the matrimonail 

    <System.Web.Services.WebMethod()>
    Public Shared Function SaveFamilyInformation(ByVal id As String, fatherName As String, motherName As String, motherWork As String, fatherWork As String, socialWork As String, disease As String, achievement As String, grandMother As String, grandFather As String, brotherNo As String, brotherMarried As String, sisterNo As String, sisterMarried As String, familyFood As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Insert_FamilyInformation")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myFatherName", fatherName.Trim())
                        cmd.Parameters.AddWithValue("@myMotherName", motherName.Trim())
                        cmd.Parameters.AddWithValue("@myMotherProfession", motherWork.Trim())
                        cmd.Parameters.AddWithValue("@myFatherProfession", fatherWork.Trim())
                        cmd.Parameters.AddWithValue("@mySocialWorkFamily", socialWork.Trim())
                        cmd.Parameters.AddWithValue("@myFamilyDisease", disease.Trim())
                        cmd.Parameters.AddWithValue("@myAchievement", achievement.Trim())

                        cmd.Parameters.AddWithValue("@myGrandFather", grandFather.Trim())
                        cmd.Parameters.AddWithValue("@myGrandMother", grandMother.Trim())
                        cmd.Parameters.AddWithValue("@myNoOfBrothers", brotherNo.Trim())
                        cmd.Parameters.AddWithValue("@myNoOfSisters", sisterNo.Trim())
                        cmd.Parameters.AddWithValue("@myMarriedBrothers", brotherMarried.Trim())
                        cmd.Parameters.AddWithValue("@myMarriedSisters", sisterMarried.Trim())
                        cmd.Parameters.AddWithValue("@myFoodTypeFamily", familyFood.Trim())
                        cmd.Parameters.AddWithValue("@myID", id)

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "MatrimonialRegister", "", "", "", "", "ID:" + id + ", familyFood:" + familyFood + ",sisterMarried:" + sisterMarried + ",brotherMarried:" + brotherMarried + ",sisterNo:" + sisterNo + ",brotherNo:" + brotherNo + ",grandMother:" + grandMother + ",grandFather:" + grandFather + ", Achievement:" + achievement + ", SocialWorkFamily:" + socialWork + ",FamilyDisease:" + disease + " , FatherProfession:" + fatherWork + " , MotherProfession:" + motherWork + " ,MotherName:" + motherName + " ,FatherName:" + fatherName + "")
                        Statusmessages = "Record save successfully!"
                    End Using
                End Using

            Catch e As Exception
                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "MatrimonialRegister", "", "", "", "", "ID:" + id + ", familyFood:" + familyFood + ",sisterMarried:" + sisterMarried + ",brotherMarried:" + brotherMarried + ",sisterNo:" + sisterNo + ",brotherNo:" + brotherNo + ",grandMother:" + grandMother + ",grandFather:" + grandFather + ", Achievement:" + achievement + ", SocialWorkFamily:" + socialWork + ",FamilyDisease:" + disease + " , FatherProfession:" + fatherWork + " , MotherProfession:" + motherWork + " ,MotherName:" + motherName + " ,FatherName:" + fatherName + "")
                Statusmessages = "Record not save successfully!"
            End Try
        End Using

        Return Statusmessages

    End Function

    'this function is used to upload a profile photo
    Protected Sub UploadFile(sender As Object, e As EventArgs)

        Dim extension As String = String.Empty
        Try

            ' extension = System.IO.Path.GetExtension(uploadProfilePhoto.FileName)
            If extension = ".jpg" Or extension = ".png" Or extension = ".jpeg" Then
                Dim folderPath As String = Server.MapPath("~/ProfilePhotos/")
                'Check whether Directory (Folder) exists.
                If Not Directory.Exists(folderPath) Then
                    'If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath)
                End If

                'Save the File to the Directory (Folder).
                'If FileUpload1.FileName Is Nothing Then

                'If Not String.IsNullOrEmpty(uploadProfilePhoto.FileName) Then
                'uploadProfilePhoto.SaveAs(folderPath & Path.GetFileName(uploadProfilePhoto.FileName))
                'End If

                'SendEmail.log("step1", "Success", "UploadFile", "", "", "", "", ",Filename:" + uploadProfilePhoto.FileName + ",FileType:" + extension + "")
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "showalert", "alert('Save profile photo successfully!');window.location ='MatrimonialLogin.aspx';", True)
            Else
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "showalert", "alert('Select file not a image, so it is not saved!');window.location ='MatrimonialLogin.aspx';", True)
            End If

        Catch ex As Exception
            'SendEmail.log("error", ex.Message, "UploadFile", "", "", "", "", ",Filename:" + uploadProfilePhoto.FileName + ",FileType:" + extension + "")
            Response.Redirect("Home.aspx")
        End Try
    End Sub

End Class