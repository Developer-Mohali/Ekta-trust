Imports MySql.Data.MySqlClient
Imports System.IO
Imports Newtonsoft.Json

Public Class ViewProfileUser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim id As String
        id = Request.QueryString("ProfileId")

        If id = Nothing Or id = " " Then
            Response.Redirect("Profile.aspx")
        Else
            GetProfileData(id)
        End If

    End Sub

    'This function is used to get data related to view profile
    Protected Function GetProfileData(id)

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            Dim extension As String
            Dim Imageurl As String
            Dim objDataReader As MySqlDataReader
            Try
                HiddenViewUserId.Value = Session("ID").ToString()
                Using objSqlCmd As New MySqlCommand("Select * from matrimonialDetails WHERE ID = @id")
                    objSqlCmd.Parameters.AddWithValue("@id", id)
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()
                    If objDataReader.Read() Then
                        Imageurl = objDataReader(35).ToString()
                        extension = System.IO.Path.GetExtension(Imageurl)
                        If extension = ".jpg" Or extension = ".png" Or extension = ".jpeg" Then
                            If Imageurl Is "" Or Imageurl Is Nothing Then
                                imgProfilePhoto.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                            Else
                                imgProfilePhoto.ImageUrl = "ProfilePhotos/" + Imageurl
                            End If
                        Else
                            imgProfilePhoto.ImageUrl = "ProfilePhotos/NotAvailable.jpg"
                        End If
                        lblUserName.Text = objDataReader(3).ToString() + " " + objDataReader(21).ToString()
                        HiddenEmailId.Value = objDataReader(1).ToString()
                        lblName.Text = objDataReader(3).ToString()

                        lblFatherName.Text = objDataReader(4).ToString()
                        lblMotherName.Text = objDataReader(5).ToString()
                        lblAddress.Text = objDataReader(6).ToString()
                        lblDateOfBirth.Text = Convert.ToDateTime(objDataReader(7).ToString())
                        lblGender.Text = objDataReader(8).ToString()
                        lblCategory.Text = objDataReader(9).ToString()

                        lblMotherProfession.Text = objDataReader(11).ToString()
                        lblFatherProfession.Text = objDataReader(12).ToString()
                        lblEducation.Text = objDataReader(13).ToString()
                        lblfamilySocialWork.Text = objDataReader(14).ToString()
                        lblFamilyDisease.Text = objDataReader(15).ToString()
                        lblFamilyAchievement.Text = objDataReader(16).ToString()
                        lblLastName.Text = objDataReader(21).ToString()
                        lblNativePlace.Text = objDataReader(22).ToString()
                        lblFoodHabbit.Text = objDataReader(24).ToString()
                        lblLanguage.Text = objDataReader(25).ToString()

                        lblSmoke.Text = objDataReader(26).ToString()
                        lblDrink.Text = objDataReader(27).ToString()
                        lblGrandFather.Text = objDataReader(28).ToString()
                        lblGrandMother.Text = objDataReader(29).ToString()
                        lblNoOfBrothers.Text = objDataReader(30).ToString()
                        lblMarriedBrothers.Text = objDataReader(31).ToString()
                        lblNoOfSisters.Text = objDataReader(32).ToString()
                        lblMarriedSisters.Text = objDataReader(33).ToString()
                        lblFamilyFoodType.Text = objDataReader(34).ToString()
                        lblPartnerMaritalStatus.Text = objDataReader(41).ToString()
                        lblPartnerQualification.Text = objDataReader(40).ToString()
                        lblPartnerAgeRange.Text = objDataReader(38).ToString() + " To " + objDataReader(39).ToString()
                        lblPartnerHeightRange.Text = objDataReader(43).ToString() + " To " + objDataReader(44).ToString()
                        lblHeight.Text = objDataReader(42).ToString()
                        lblWeight.Text = objDataReader(45).ToString() + "KG"
                        lblQualification.Text = objDataReader(20).ToString()
                        lblMaritalStatus.Text = objDataReader(47).ToString()

                        lblOccupationType.Text = objDataReader(48).ToString()
                        lblAnnualIncome.Text = objDataReader(49).ToString()
                        lblJobDiscription.Text = objDataReader(50).ToString()
                        lblOccupation.Text = objDataReader(10).ToString()
                        lblPostingUpdate.Text = objDataReader(23).ToString()
                        lblPermanentAddress.Text = objDataReader(46).ToString()

                    End If
                End Using
            Catch ex As Exception
                Response.Redirect("MatrimonialLogin.aspx")
            End Try
        End Using
        Return Nothing
    End Function

    'This function is used to send details of user to view profile user on email id/Address

    <System.Web.Services.WebMethod()>
    Public Shared Function ContectForMatrimonialRequest(ByVal id As String, emailTo As String) As String
        Dim Statusmessages = String.Empty
        Dim messageBody As String
        Dim status As String
        Dim name As String = String.Empty
        Dim posting As String = String.Empty
        Dim work As String = String.Empty
        Dim Education As String = String.Empty
        Dim phone As String = String.Empty
        Dim email As String = String.Empty
        Dim SendEmail As SendEmail = New SendEmail()
        Dim objDataReader As MySqlDataReader
        Try

            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Using objSqlCmd As New MySqlCommand("Select * from matrimonialDetails WHERE ID = @id")
                    objSqlCmd.Parameters.AddWithValue("@id", id.ToString())
                    objSqlCmd.Connection = con
                    con.Open()
                    objDataReader = objSqlCmd.ExecuteReader()
                    If objDataReader.Read() Then

                        name = objDataReader(3).ToString()
                        work = objDataReader(10).ToString()
                        posting = objDataReader(23).ToString()
                        email = objDataReader(1).ToString()
                        phone = objDataReader(2).ToString()
                        Education = objDataReader(13).ToString()

                    End If
                End Using
            End Using

            messageBody = "<p>Dear User,</p><p>Your Profile View by " + name + "<br>Email Address : " + email + " <br>Phone No : " + phone + "<br>Eduction : " + Education + " <br>Work or Service : " + work + " <br>Posting : " + posting + " <br><br> If this is suitable for you contact that person<br></p><p>Regards,<br>Administrator<br>Ekta Navnirman Trust</p><p>www.ektatrust.org.in</p>"
            status = SendEmail.EventsendMailUser(emailTo, "Matrimonial EktaTrust Request By Your Profile Views", messageBody)
            Statusmessages = "Success"
            SendEmail.log("step1", Statusmessages, "ContectForMatrimonialRequest", "", "", "", "", "SendEmailId:" + email + ",SenderName:" + name + ",SenderEducation:" + Education + ",SenderPhoneNo:" + phone + ",SenderWorkorService:" + work + ",SenderPosting:" + posting + ",ReduestEmailId:" + emailTo + "")
            Statusmessages = "Request send successfully!"
        Catch ex As Exception

            SendEmail.log("Error", ex.Message, "ContectForMatrimonialRequest", "", "", "", "", "SendEmailId:" + email + ",SenderName:" + name + ",SenderEducation:" + Education + ",SenderPhoneNo:" + phone + ",SenderWorkorService:" + work + ",SenderPosting:" + posting + ",ReduestEmailId:" + emailTo + "")
            Statusmessages = "Request not send successfully!"
        End Try

        Return Statusmessages

    End Function
End Class