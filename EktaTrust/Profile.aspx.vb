Imports System.IO
Imports MySql.Data.MySqlClient

Public Class Profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("ID") Is Nothing Then

            Response.Redirect("MatrimonialLogin.aspx")

        End If

        GetProfileData()

    End Sub


    '<System.Web.Services.WebMethod()>
    Protected Function GetProfileData()

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Dim extension As String
            Dim Imageurl As String
            Dim objDataReader As MySqlDataReader
            Try

                Using objSqlCmd As New MySqlCommand("Select * from matrimonialDetails WHERE ID = @id")
                    objSqlCmd.Parameters.AddWithValue("@id", Session("ID").ToString())
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()

                    If objDataReader.Read() Then
                        Imageurl = objDataReader(35).ToString()
                        extension = System.IO.Path.GetExtension(Imageurl)
                        If extension = ".jpg" Or extension = ".png" Or extension = ".jpeg" Then
                            If Imageurl Is "" Or Imageurl Is Nothing Then
                                imgProfilePhoto.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                                imgShowBig.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                            Else
                                imgProfilePhoto.ImageUrl = "ProfilePhotos/" + Imageurl
                                imgShowBig.ImageUrl = "ProfilePhotos/" + Imageurl
                            End If
                        Else
                            imgProfilePhoto.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                            imgShowBig.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                        End If

                        'imgBtnPhoto.ImageUrl = "ProfilePhotos/" + Imageurl

                        lblUserName.Text = objDataReader(3).ToString() + " " + objDataReader(21).ToString()
                        HiddenUserId.Value = objDataReader(0).ToString()
                        lblEmail.Text = objDataReader(1).ToString()
                        lblEmailId.Text = objDataReader(1).ToString()
                        txtName.Text = objDataReader(3).ToString()
                        lblName.Text = objDataReader(3).ToString()
                        lblMobileNoprofile.Text = objDataReader(2).ToString()
                        txtMobile.Text = objDataReader(2).ToString()
                        lblMobileNo.Text = objDataReader(2).ToString()
                        lblFatherName.Text = objDataReader(4).ToString()
                        txtFatherName.Text = objDataReader(4).ToString()

                        lblMotherName.Text = objDataReader(5).ToString()
                        txtMotherName.Text = objDataReader(5).ToString()
                        lblAddress.Text = objDataReader(6).ToString()
                        txtAddress.Text = objDataReader(6).ToString()
                        lblDateOfBirth.Text = Convert.ToDateTime(objDataReader(7).ToString())
                        drpGender.SelectedValue = objDataReader(8).ToString()
                        lblGender.Text = objDataReader(8).ToString()
                        drpCategory.SelectedValue = objDataReader(9).ToString()
                        lblCategory.Text = objDataReader(9).ToString()
                        lblWork.Text = objDataReader(10).ToString()
                        txtWork.Text = objDataReader(10).ToString()
                        txtOccupation.Text = objDataReader(10).ToString()

                        lblMotherProfession.Text = objDataReader(11).ToString()
                        txtMotherProfession.Text = objDataReader(11).ToString()
                        lblFatherProfession.Text = objDataReader(12).ToString()
                        txtFatherProfession.Text = objDataReader(12).ToString()
                        lblEducation.Text = objDataReader(13).ToString()
                        txtEducation.Text = objDataReader(13).ToString()
                        lblfamilySocialWork.Text = objDataReader(14).ToString()
                        txtFamilySocialWork.Text = objDataReader(14).ToString()
                        lblFamilyDisease.Text = objDataReader(15).ToString()
                        txtFamilyDisease.Text = objDataReader(15).ToString()
                        lblFamilyAchievement.Text = objDataReader(16).ToString()
                        txtAchievement.Text = objDataReader(16).ToString()

                        lblLastName.Text = objDataReader(21).ToString()
                        txtLastName.Text = objDataReader(21).ToString()
                        lblNativePlace.Text = objDataReader(22).ToString()
                        txtNativePlace.Text = objDataReader(22).ToString()
                        lblPosting.Text = objDataReader(23).ToString()
                        txtPosting.Text = objDataReader(23).ToString()
                        txtPostingUpdate.Text = objDataReader(23).ToString()
                        drpFoodHabbit.SelectedValue = objDataReader(24).ToString()
                        lblFoodHabbit.Text = objDataReader(24).ToString()
                        lblLanguage.Text = objDataReader(25).ToString()
                        drpSmoke.SelectedValue = objDataReader(26).ToString()
                        lblSmoke.Text = objDataReader(26).ToString()

                        drpDrink.SelectedValue = objDataReader(27).ToString()
                        lblDrink.Text = objDataReader(27).ToString()
                        lblGrandFather.Text = objDataReader(28).ToString()
                        txtGrandFather.Text = objDataReader(28).ToString()
                        lblGrandMother.Text = objDataReader(29).ToString()
                        txtGrandMother.Text = objDataReader(29).ToString()
                        drpNoOfBrothers.SelectedValue = objDataReader(30).ToString()
                        lblNoOfBrothers.Text = objDataReader(30).ToString()
                        drpMarriedBrother.SelectedValue = objDataReader(31).ToString()
                        lblMarriedBrothers.Text = objDataReader(31).ToString()
                        drpNoOfSisters.SelectedValue = objDataReader(32).ToString()
                        lblNoOfSisters.Text = objDataReader(32).ToString()
                        drpMarriedSisters.SelectedValue = objDataReader(33).ToString()
                        lblMarriedSisters.Text = objDataReader(33).ToString()

                        drpFamilyFoodType.SelectedValue = objDataReader(34).ToString()
                        lblFamilyFoodType.Text = objDataReader(34).ToString()
                        lblPartnerMaritalStatus.Text = objDataReader(41).ToString()
                        drpMaritalStatus.SelectedValue = objDataReader(41).ToString()
                        lblPartnerQualification.Text = objDataReader(40).ToString()
                        lblPartnerAgeRange.Text = objDataReader(38).ToString() + " To " + objDataReader(39).ToString()
                        drpAgeFrom.SelectedValue = objDataReader(38).ToString()
                        drpAgeTo.SelectedValue = objDataReader(39).ToString()
                        lblPartnerHeightRange.Text = objDataReader(43).ToString() + " To " + objDataReader(44).ToString()
                        drpHeihtFrom.SelectedValue = objDataReader(43).ToString()
                        drpHeightTo.SelectedValue = objDataReader(44).ToString()
                        lblHeight.Text = objDataReader(42).ToString()
                        lblWeight.Text = objDataReader(45).ToString() + " KG"
                        HiddenPassword.Value = objDataReader(37).ToString()
                        lblQualification.Text = objDataReader(20).ToString()
                        drpQualification.SelectedValue = objDataReader(20).ToString()
                        drpHeight.SelectedValue = objDataReader(42).ToString()
                        txtWeight.Text = objDataReader(45).ToString()
                        lblOccupationType.Text = objDataReader(48).ToString()
                        drpOccupationType.SelectedValue = objDataReader(48).ToString()
                        lblAnnualIncome.Text = objDataReader(49).ToString()
                        txtAnnualIncome.Text = objDataReader(49).ToString()
                        lblJobDiscription.Text = objDataReader(50).ToString()
                        txtJobDiscription.Text = objDataReader(50).ToString()
                        lblSelfMaritalStatus.Text = objDataReader(47).ToString()
                        lblPermanentAddress.Text = objDataReader(46).ToString()

                    End If
                End Using

            Catch ex As Exception
                Response.Redirect("MatrimonialLogin.aspx")
            End Try
        End Using

    End Function

    ' This function is used to update Bacis information of the profile

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdateBasicInformation(ByVal id As Int32, name As String, phone As String, address As String, gender As String, category As String, work As String, lastName As String, nativePlace As String, posting As String, height As String, weight As String) As String
        Dim Statusmessages = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Update_MatrimonialBasicInformation")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myName", name.Trim())
                        cmd.Parameters.AddWithValue("@myPhoneNo", phone.Trim())
                        cmd.Parameters.AddWithValue("@myAddress", address.Trim())
                        cmd.Parameters.AddWithValue("@myUpdatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myGender", gender.Trim())
                        cmd.Parameters.AddWithValue("@myCategory", category.Trim())
                        cmd.Parameters.AddWithValue("@myWork", work.Trim())
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myLastName", lastName.Trim())
                        cmd.Parameters.AddWithValue("@myNativePlace", nativePlace.Trim())
                        cmd.Parameters.AddWithValue("@myPosting", posting.Trim())
                        cmd.Parameters.AddWithValue("@myheight", height.Trim())
                        cmd.Parameters.AddWithValue("@myBodyWeight", weight.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "UpdateBasicInformation", "", "", "", "", "Name:" + name + ",BodyWeight:" + weight + ",height:" + height + ",posting:" + posting + ",nativePlace:" + nativePlace + ",lastName:" + lastName + ", Work:" + work + ", Category:" + category + ",Gender:" + gender + ",MobileNo:" + phone + ",Gender:" + gender + ",Address:" + address + "")
                        Statusmessages = "Basic information update successfully!"

                    End Using
                End Using

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdateBasicInformation", "", "", "", "", "Name:" + name + ",BodyWeight:" + weight + ",height:" + height + ",posting:" + posting + ",nativePlace:" + nativePlace + ",lastName:" + lastName + ", Work:" + work + ", Category:" + category + ",Gender:" + gender + ",MobileNo:" + phone + ",Gender:" + gender + ",Address:" + address + "")
                Statusmessages = "Basic information not update successfully!"

            End Try
        End Using

        Return Statusmessages

    End Function

    'This function is used to update family information of the profile

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdateFamilyInformation(ByVal id As Int32, fatherName As String, motherName As String, motherWork As String, fatherWork As String, socialWork As String, disease As String, achievement As String, grandMother As String, grandFather As String, brotherNo As String, brotherMarried As String, sisterNo As String, sisterMarried As String, familyFood As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Update_FamilyDetails")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myFatherName", fatherName.Trim())
                        cmd.Parameters.AddWithValue("@myUpdatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myMotherName", motherName.Trim())
                        cmd.Parameters.AddWithValue("@myMotherProfession", motherWork.Trim())
                        cmd.Parameters.AddWithValue("@myFatherProfession", fatherWork.Trim())
                        cmd.Parameters.AddWithValue("@mySocialWorkFamily", socialWork.Trim())
                        cmd.Parameters.AddWithValue("@myFamilyDisease", disease.Trim())
                        cmd.Parameters.AddWithValue("@myAchievement", achievement.Trim())
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myGrandFather", grandFather.Trim())
                        cmd.Parameters.AddWithValue("@myGrandMother", grandMother.Trim())
                        cmd.Parameters.AddWithValue("@myNoOfBrothers", brotherNo.Trim())
                        cmd.Parameters.AddWithValue("@myNoOfSisters", sisterNo.Trim())
                        cmd.Parameters.AddWithValue("@myMarriedBrothers", brotherMarried.Trim())
                        cmd.Parameters.AddWithValue("@myMarriedSisters", sisterMarried.Trim())
                        cmd.Parameters.AddWithValue("@myFoodTypeFamily", familyFood.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        'store updated information into log
                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "MatrimonialRegister", "", "", "", "", "familyFood:" + familyFood + ",sisterMarried:" + sisterMarried + ",brotherMarried:" + brotherMarried + ",sisterNo:" + sisterNo + ",brotherNo:" + brotherNo + ",grandMother:" + grandMother + ",grandFather:" + grandFather + ", Achievement:" + achievement + ", SocialWorkFamily:" + socialWork + ",FamilyDisease:" + disease + " ,FatherProfession:" + fatherWork + " , MotherProfession:" + motherWork + " ,MotherName:" + motherName + " ,FatherName:" + fatherName + "")
                        Statusmessages = "Family information update successfully!"

                    End Using
                End Using

            Catch e As Exception

                'store information if information is not save sucessfully
                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "MatrimonialRegister", "", "", "", "", "familyFood:" + familyFood + ",sisterMarried:" + sisterMarried + ",brotherMarried:" + brotherMarried + ",sisterNo:" + sisterNo + ",brotherNo:" + brotherNo + ",grandMother:" + grandMother + ",grandFather:" + grandFather + ", Achievement:" + achievement + ", SocialWorkFamily:" + socialWork + ",FamilyDisease:" + disease + " ,FatherProfession:" + fatherWork + " , MotherProfession:" + motherWork + " ,MotherName:" + motherName + " ,FatherName:" + fatherName + "")
                Statusmessages = "Family information not update successfully!"

            End Try
        End Using

        Return Statusmessages

    End Function

    'this function is used to update password or change

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdatePassword(ByVal id As Int32, oldPassword As String, newPassword As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                Using cmd As New MySqlCommand("Update matrimonialDetails set Password = @password WHERE ID = @id and Password = @Oldpassword")
                    cmd.Parameters.AddWithValue("@password", newPassword)
                    cmd.Parameters.AddWithValue("@id", id)
                    cmd.Parameters.AddWithValue("@Oldpassword", oldPassword)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()
                End Using

                SendEmail.log("step 1", "Success", "UpdatePassword", "", "", "", "", "id:" + id.ToString() + ",new password:" + newPassword + ",newPassword:" + oldPassword + "")
                Statusmessages = "Password change successfully!"

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdatePassword", "", "", "", "", "id:" + id.ToString() + ",new password:" + newPassword + ",newPassword:" + oldPassword + "")
                Statusmessages = "Password not change successfully!"

            End Try
        End Using

        Return Statusmessages

    End Function

    'This function is used to update education

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdateEducation(ByVal id As Int32, qualification As String, education As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                Using cmd As New MySqlCommand("Update matrimonialDetails set Qualification = @Qualification, Education =@Education WHERE ID = @id")
                    cmd.Parameters.AddWithValue("@Qualification", qualification)
                    cmd.Parameters.AddWithValue("@id", id)
                    cmd.Parameters.AddWithValue("@Education", education)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()

                End Using

                SendEmail.log("step 1", "Success", "UpdatePassword", "", "", "", "", "id:" + id.ToString() + ",Qualification:" + qualification + ",Education:" + education + "")
                Statusmessages = "Qualification update successfully!"

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdatePassword", "", "", "", "", "id:" + id.ToString() + ",Qualification:" + qualification + ",Education:" + education + "")
                Statusmessages = "Qualification not update successfully!"

            End Try

        End Using

        Return Statusmessages

    End Function

    ' this function is used to update lifestyle

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdateLifeStyle(ByVal id As Int32, foodHabbit As String, language As String, smoke As String, drink As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Update_LifeStyle")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myUpdatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myFoodHabbit", foodHabbit.Trim())
                        cmd.Parameters.AddWithValue("@myLanguage", language.Trim())
                        cmd.Parameters.AddWithValue("@mySmoke", smoke.Trim())
                        cmd.Parameters.AddWithValue("@myDrink", drink.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "UpdateLifeStyle", "", "", "", "", ",drink:" + drink + ",smoke:" + smoke + ",language:" + language + ",foodHabbit:" + foodHabbit + "")
                        Statusmessages = "Lifestyle update successfully!"

                    End Using
                End Using

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdateLifeStyle", "", "", "", "", ",drink:" + drink + ",smoke:" + smoke + ",language:" + language + ",foodHabbit:" + foodHabbit + "")
                Statusmessages = "Lifestyle not update successfully!"

            End Try
        End Using

        Return Statusmessages

    End Function


    ' this function is used to update Occupation Details

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdateOccupation(ByVal id As Int32, occupation As String, occupationType As String, postingUpdate As String, annualIncome As String, jobDiscription As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Update_OccupationDetails")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myUpdatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myWork", occupation.Trim())
                        cmd.Parameters.AddWithValue("@myPosting", postingUpdate.Trim())
                        cmd.Parameters.AddWithValue("@myOccupationType", occupationType.Trim())
                        cmd.Parameters.AddWithValue("@myAnnualIncome", annualIncome.Trim())
                        cmd.Parameters.AddWithValue("@myJobDiscription", jobDiscription.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "UpdateLifeStyle", "", "", "", "", ",occupation:" + occupation + ",postingUpdate:" + postingUpdate + ",occupationType:" + occupationType + ",annualIncome:" + annualIncome + "")
                        Statusmessages = "Occupation details update successfully!"

                    End Using
                End Using

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdateLifeStyle", "", "", "", "", ",occupation:" + occupation + ",postingUpdate:" + postingUpdate + ",occupationType:" + occupationType + ",annualIncome:" + annualIncome + "")
                Statusmessages = "Occupation details not update successfully!"

            End Try
        End Using

        Return Statusmessages

    End Function

    'This function is used to update Partner preference information

    <System.Web.Services.WebMethod()>
    Public Shared Function UpdatePartnerPreference(ByVal id As Int32, maritalStatus As String, PartnerQualification As String, ageFrom As String, ageTo As String, heightFrom As String, heightTo As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("Update_PartnerPreference")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@myUpdatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@myID", id)
                        cmd.Parameters.AddWithValue("@myPartnerAgeFrom", ageFrom.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerAgeTo", ageTo.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerQualification", PartnerQualification.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerMaritalStatus", maritalStatus.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerHeightFrom", heightFrom.Trim())
                        cmd.Parameters.AddWithValue("@myPartnerHeightTo", heightTo.Trim())

                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()

                        con.Close()
                        con.Dispose()

                        Statusmessages = "Success"
                        SendEmail.log("step1", Statusmessages, "UpdatePartner Preference", "", "", "", "", ",ageFrom:" + ageFrom + ",heightFrom:" + heightFrom + ",heightTo:" + heightTo + ",ageTo:" + ageTo + ",PartnerQualification:" + PartnerQualification + ",maritalStatus:" + maritalStatus + "")
                        Statusmessages = "Partner preference update successfully!"

                    End Using
                End Using

            Catch e As Exception

                Statusmessages = "Error"
                SendEmail.log("Error", e.Message, "UpdatePartner Preference", "", "", "", "", ",ageFrom:" + ageFrom + ",heightFrom:" + heightFrom + ",heightTo:" + heightTo + ",ageTo:" + ageTo + ",PartnerQualification:" + PartnerQualification + ",maritalStatus:" + maritalStatus + "")
                Statusmessages = "Partner preference not update successfully!"

            End Try

        End Using

        Return Statusmessages

    End Function

    'this function is used to upload a profile photo
    Protected Sub UploadFile(sender As Object, e As EventArgs)

        Dim extension As String = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                extension = System.IO.Path.GetExtension(ProfileImageUpload.FileName)
                If extension = ".jpg" Or extension = ".png" Or extension = ".jpeg" Then
                    Using cmd As New MySqlCommand("Update matrimonialDetails set ProfileImage = @ProfileImage WHERE ID = @id")
                        cmd.Parameters.AddWithValue("@ProfileImage", ProfileImageUpload.FileName)
                        cmd.Parameters.AddWithValue("@id", HiddenUserId.Value.Trim())
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteReader()
                    End Using

                    Dim folderPath As String = Server.MapPath("~/ProfilePhotos/")

                    'Check whether Directory (Folder) exists.
                    If Not Directory.Exists(folderPath) Then
                        'If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderPath)
                    End If

                    'Save the File to the Directory (Folder).
                    'If FileUpload1.FileName Is Nothing Then

                    If Not String.IsNullOrEmpty(ProfileImageUpload.FileName) Then
                        ProfileImageUpload.SaveAs(folderPath & Path.GetFileName(ProfileImageUpload.FileName))
                    End If
                    SendEmail.log("step1", "Success", "UploadFile", "", "", "", "", ",Filename:" + ProfileImageUpload.FileName + ",FileType:" + extension + "")
                    ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "showalert", "alert('Update profile photo successfully!');window.location ='Profile.aspx';", True)
                Else
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Please select only image format!');", True)
                End If

            Catch ex As Exception

                SendEmail.log("error", ex.Message, "UploadFile", "", "", "", "", ",Filename:" + ProfileImageUpload.FileName + ",FileType:" + extension + "")

            End Try
        End Using

    End Sub


    ' This function get matrimonial matches on given requirements

    <System.Web.Services.WebMethod()>
    Public Shared Function MatrimonialMatches(ByVal partnerQualification As String, ageFrom As Int32, ageTo As Int32, gender As String, maritalStatus As String) As String
        Dim Statusmessages = String.Empty
        Dim ds As New DataSet()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try

                Using cmd As New MySqlCommand("GetMatrimonialMatches")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ageFrom", ageFrom)
                        cmd.Parameters.AddWithValue("@ageTo", ageTo)
                        cmd.Parameters.AddWithValue("@myqualification", partnerQualification)
                        cmd.Parameters.AddWithValue("@mygender", gender)
                        cmd.Parameters.AddWithValue("@maritalstatus", maritalStatus)
                        cmd.Connection = con
                        con.Open()

                        sda.Fill(ds, "Matches")
                        con.Close()
                        con.Dispose()
                    End Using
                End Using

            Catch e As Exception
                Statusmessages = "Error"
            End Try

        End Using
        Return ds.GetXml()

    End Function


    ' This function get matrimonial other matches on given requirements

    <System.Web.Services.WebMethod()>
    Public Shared Function OtherMatches(ByVal gender As String) As String
        Dim Statusmessages = String.Empty
        Dim ds As New DataSet()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                Using cmd As New MySqlCommand("OtherMathes")
                    Using sda As New MySqlDataAdapter(cmd)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@mygender", gender)
                        cmd.Connection = con
                        con.Open()
                        sda.Fill(ds, "Matches")
                        con.Close()
                        con.Dispose()
                    End Using
                End Using
            Catch e As Exception
                Statusmessages = "Error"
            End Try
        End Using
        Return ds.GetXml()
    End Function

    ' this fuction is used to remove current imeages

    <System.Web.Services.WebMethod()>
    Public Shared Function RemoveProfileImage(ByVal id As Int32) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Try
                Using cmd As New MySqlCommand("Update matrimonialDetails set ProfileImage = @ProfileImage WHERE ID = @id")
                    cmd.Parameters.AddWithValue("@ProfileImage", "NotAvailable.jpg")
                    cmd.Parameters.AddWithValue("@id", id)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteReader()

                End Using
                Statusmessages = "Profile image remove successfully!"

            Catch e As Exception
                Statusmessages = e.Message
                Statusmessages = "Profile image not remove successfully!"
            End Try

        End Using
        Return Statusmessages
    End Function

    'this function is used to logout of user
    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs)
        Session("ID") = ""
        Session.Abandon()
        Response.Redirect("MatrimonialLogin.aspx")
    End Sub

    ' this function and method used to send request to delete account

    <System.Web.Services.WebMethod()>
    Public Shared Function DeleteAccount(ByVal id As String) As String
        Dim Statusmessages = String.Empty

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim objDataReader As MySqlDataReader

            Try
                Using objSqlCmd As New MySqlCommand("Select name from matrimonialDetails WHERE DeleteAccountRequest = @request and ID = @id")
                    objSqlCmd.Parameters.AddWithValue("@request", True)
                    objSqlCmd.Parameters.AddWithValue("@id", id)
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()

                    If objDataReader.Read() Then
                        Statusmessages = "Your request already in progress!"
                        con.Close()
                        con.Dispose()
                    Else
                        con.Close()
                        con.Dispose()
                        Using cmd As New MySqlCommand("Update matrimonialDetails set DeleteAccountRequest = @request, RequestDateForAccountDelete =@requestDate WHERE ID = @id")
                            cmd.Parameters.AddWithValue("@request", True)
                            cmd.Parameters.AddWithValue("@id", id)
                            cmd.Parameters.AddWithValue("@requestDate", DateTime.Now)
                            cmd.Connection = con
                            con.Open()
                            cmd.ExecuteReader()
                            con.Close()
                            con.Dispose()
                            Statusmessages = "Delete account request accept successfully!"

                        End Using

                    End If
                End Using

            Catch e As Exception

                Statusmessages = "Error"
                Statusmessages = "Delete account request not accept successfully!!"

            End Try
        End Using
        Return Statusmessages
    End Function

End Class