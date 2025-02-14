Imports System.Web.SessionState
Imports System.Web.Routing
Imports MySql.Data.MySqlClient

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Dim IsPostBack As Boolean

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
        RegisterRoutes(RouteTable.Routes)
    End Sub
    Private Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute("", "", "~/Home.aspx")
        routes.MapPageRoute("Home", "Home", "~/Home.aspx")
        routes.MapPageRoute("Contact", "Contact", "~/Contact.aspx")
        routes.MapPageRoute("Donate", "Donate", "~/Donate.aspx")
        routes.MapPageRoute("Manoharpur", "Manoharpur", "~/Manoharpur.aspx")
        routes.MapPageRoute("Dhodsar", "Dhodsar", "~/Dhodsar.aspx")
        routes.MapPageRoute("Alwar", "Alwar", "~/Alwar.aspx")
        routes.MapPageRoute("AmbedkarWSJ", "AmbedkarWSJ", "~/AmbedkarWSJ.aspx")
        routes.MapPageRoute("ViratNagar", "ViratNagar", "~/ViratNagar.aspx")
        routes.MapPageRoute("MachediManpura", "MachediManpura", "~/MachediManpura.aspx")
        routes.MapPageRoute("Nagour", "Nagour", "~/Nagour.aspx")
        routes.MapPageRoute("Events", "Events", "~/Events.aspx")
        routes.MapPageRoute("CareerCounselling", "CareerCounselling", "~/CareerCounselling.aspx")
        routes.MapPageRoute("AtrocitiesReporting", "AtrocitiesReporting", "~/AtrocitiesReporting.aspx")
        routes.MapPageRoute("Cooking", "Cooking", "~/Cooking.aspx")
        routes.MapPageRoute("Dairying", "Dairying", "~/Dairying.aspx")
        routes.MapPageRoute("Donation", "Donation", "~/Donation.aspx")
        routes.MapPageRoute("Driving", "Driving", "~/Driving.aspx")
        routes.MapPageRoute("Education", "Education", "~/Education.aspx")
        routes.MapPageRoute("Enroll", "Enroll", "~/Enroll.aspx")
        routes.MapPageRoute("Girl Schemes", "Girl Schemes", "~/Girl Schemes.aspx")
        routes.MapPageRoute("History", "History", "~/History.aspx")
        routes.MapPageRoute("Insurance", "Insurance", "~/Insurance.aspx")
        routes.MapPageRoute("Introduction", "Introduction", "~/Introduction.aspx")
        routes.MapPageRoute("JoinUs", "JoinUs", "~/JoinUs.aspx")
        routes.MapPageRoute("Loans", "Loans", "~/Loans.aspx")
        routes.MapPageRoute("Motto", "Motto", "~/Motto.aspx")
        routes.MapPageRoute("News", "News", "~/News.aspx")
        routes.MapPageRoute("Objectives", "Objectives", "~/Objectives.aspx")
        routes.MapPageRoute("Premable", "Premable", "~/Premable.aspx")
        routes.MapPageRoute("Tailoring", "Tailoring", "~/Tailoring.aspx")
        routes.MapPageRoute("Training", "Training", "~/Training.aspx")
        routes.MapPageRoute("Trust Activities", "Trust Activities", "~/Trust Activities.aspx")
        routes.MapPageRoute("Trustee", "Trustee", "~/Trustee.aspx")
        routes.MapPageRoute("Vision", "Vision", "~/Vision.aspx")
        routes.MapPageRoute("Yoga_Training", "Yoga_Training", "~/Yoga_Training.aspx")
        routes.MapPageRoute("Contributors", "Contributors", "~/Contributors.aspx")
        routes.MapPageRoute("Anual ReportDetail", "Anual ReportDetail", "~/Anual ReportDetail.aspx")
        routes.MapPageRoute("EvenMoreNewsDetail", "EvenMoreNewsDetail", "~/EvenMoreNewsDetail.aspx")
        routes.MapPageRoute("New Career OportunitiesDetail", "New Career OportunitiesDetail", "~/New Career OportunitiesDetail.aspx")
        routes.MapPageRoute("DangawasVictimsDetail", "DangawasVictimsDetail", "~/DangawasVictimsDetail.aspx")
        routes.MapPageRoute("TrainingActivity", "TrainingActivity", "~/TrainingActivity.aspx")
        routes.MapPageRoute("Joining", "Joining", "~/Joining.aspx")
        routes.MapPageRoute("ContactDetails", "ContactDetails", "~/ContactDetails.aspx")
        routes.MapPageRoute("SUGGESTIONTRUSTACTIVITIES", "SUGGESTIONTRUSTACTIVITIES", "~/SUGGESTIONTRUSTACTIVITIES.aspx")
        routes.MapPageRoute("DashBoard", "DashBoard", "~/DashBoard.aspx")
        routes.MapPageRoute("ChangePassword", "ChangePassword", "~/ChangePassword.aspx")
        routes.MapPageRoute("ForgotPassword", "ForgotPassword", "~/ForgotPassword.aspx")
        routes.MapPageRoute("LogIn", "LogIn", "~/LogIn.aspx")
        routes.MapPageRoute("DangawasVictims", "DangawasVictims", "~/DangawasVictims.aspx")
        routes.MapPageRoute("HelpingNews", "HelpingNews", "~/HelpingNews.aspx")
        routes.MapPageRoute("ScheduleMeeting", "ScheduleMeeting", "~/ScheduleMeeting.aspx")
        routes.MapPageRoute("Literature", "Literature", "~/Literature.aspx")
        routes.MapPageRoute("Registration", "Registration", "~/Registration.aspx")
        routes.MapPageRoute("WorkDone", "WorkDone", "~/WorkDone.aspx")
        routes.MapPageRoute("Gallery", "Gallery", "~/Gallerys.aspx")
        routes.MapPageRoute("MIPRegistration", "MIPRegistration", "~/MIPRegistration.aspx")
        routes.MapPageRoute("MIPTeam", "MIPTeam", "~/MIPTeam.aspx")
        routes.MapPageRoute("Faculties", "Faculties", "~/Faculties.aspx")
        routes.MapPageRoute("TermsAndCondition", "TermsAndCondition", "~/TermsAndCondition.aspx")
        routes.MapPageRoute("MIPFacultyRegistration", "MIPFacultyRegistration", "~/MIPFacultyRegistration.aspx")
        routes.MapPageRoute("EventRegistration", "EventRegistration", "~/EventRegistration.aspx")
        routes.MapPageRoute("PaymetConfirmation", "PaymetConfirmation", "~/PaymetConfirmation.aspx")
        routes.MapPageRoute("Registration-Onhold", "Registration-Onhold", "~/Registration-Onhold.aspx")
        routes.MapPageRoute("LogDetails", "LogDetails", "~/LogDetails.aspx")
        routes.MapPageRoute("Dandawas", "Dandawas", "~/DandawasGallery.aspx")
        routes.MapPageRoute("Una", "Una", "~/UnaGallery.aspx")
        routes.MapPageRoute("EventRegistrationDetails", "EventRegistrationDetails", "~/EventRegistrationDetails.aspx")
        routes.MapPageRoute("ChangePasswords", "ChangePasswords", "~/AddNewUser.aspx")
        routes.MapPageRoute("MIP", "MIP", "~/MIPRegisterGallery.aspx")
        routes.MapPageRoute("MIPUPSC", "MIPUPSC", "~/UpscMipGallery.aspx")
        routes.MapPageRoute("RegistrationClosed", "RegistrationClosed", "~/EventRegistsrationClosed.aspx")
        routes.MapPageRoute("Matrimonial", "Matrimonial", "~/Matrimonial.aspx")
        routes.MapPageRoute("MatrimonialDelails", "MatrimonialDelails", "~/MatrimonialDelails.aspx")
        routes.MapPageRoute("UserChangePassword", "UserChangePassword", "~/UserChangePassword.aspx")
        routes.MapPageRoute("Profile", "Profile", "~/Profile.aspx")
        routes.MapPageRoute("MatrimonialInformation", "MatrimonialInformation", "~/MatrimonialInformation.aspx")
        routes.MapPageRoute("MatrimonialLogin", "MatrimonialLogin", "~/MatrimonialLogin.aspx")
        routes.MapPageRoute("ViewProfileUser", "ViewProfileUser", "~/ViewProfileUser.aspx")
        routes.MapPageRoute("MatrimonialDetails", "MatrimonialDetails", "~/MatrimonialDetails.aspx")
        routes.MapPageRoute("UserPassword", "UserPassword", "~/UserPassword.aspx")
        routes.MapPageRoute("ForgetUserPassword", "ForgetUserPassword", "~/ForgetUserPassword.aspx")
        routes.MapPageRoute("NewEventRegistration", "NewEventRegistration", "~/NewEventRegistration.aspx")
        routes.MapPageRoute("CareerCounsellingDetails", "CareerCounsellingDetails", "~/CareerCounsellingDetails.aspx")
        routes.MapPageRoute("Gallery2020", "Gallery2020", "~/Gallery_2020.aspx")
        routes.MapPageRoute("Gallery2019", "Gallery2019", "~/Gallery_2019.aspx")
        routes.MapPageRoute("Gallery2018", "Gallery2018", "~/Gallery_2018.aspx")
        routes.MapPageRoute("Gallery2017", "Gallery2017", "~/Gallery_2017.aspx")
        routes.MapPageRoute("Miscellaneous", "Miscellaneous", "~/Miscellaneous.aspx")
        routes.MapPageRoute("AtrocityReportingDetails", "AtrocityReportingDetails", "~/AtrocityReportingDetails.aspx")
        routes.MapPageRoute("EventPrize", "EventPrize", "~/EventPrize.aspx")
        routes.MapPageRoute("VolleyBall", "VolleyBall", "~/VolleyBall.aspx")
        routes.MapPageRoute("UPSC2018", "UPSC2018", "~/Gallery_UPSC2018.aspx")
        routes.MapPageRoute("Books", "Books", "~/Books.aspx")
        routes.MapPageRoute("Books1", "Books1", "~/Books1.aspx")
        routes.MapPageRoute("RunForEquality", "RunForEquality", "~/RunForEqualityGallery.aspx")
        routes.MapPageRoute("RunForEquality_2018", "RunForEquality_2018", "~/RunForEquality2018.aspx")
        routes.MapPageRoute("RunForEquality2019", "RunForEquality2019", "~/RunForEquality2019.aspx")

        routes.MapPageRoute("RunForEquality2023", "RunForEquality2023", "~/RunForEquality2023.aspx")
        routes.MapPageRoute("RunForEquality2020", "RunForEquality2020", "~/RunForEquality2020.aspx")
        routes.MapPageRoute("RunForEquality2022", "RunForEquality2022", "~/RunForEquality2022.aspx")
        routes.MapPageRoute("Covid-19", "Covid-19", "~/Covid19.aspx")
        routes.MapPageRoute("RPSC2020", "RPSC2020", "~/RPSC2020.aspx")
        routes.MapPageRoute("RunCertificate", "RunCertificate", "~/Certificate.aspx")
        routes.MapPageRoute("RunForEquality2025", "RunForEquality2025", "~/RunForEquality2025.aspx")

    End Sub
    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
        Dim ipaddress As String
        ipaddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If ipaddress = "" Or ipaddress Is Nothing Then
            ipaddress = Request.ServerVariables("REMOTE_ADDR")
        End If
        If Not IsPostBack Then
            Save(ipaddress)
        End If
    End Sub
    Private Function Save(IPaddress As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("Get_VisiterDetail")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ipaddress", IPaddress)
                        cmd.Parameters.AddWithValue("@VisiterOn", System.DateTime.Now)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        'userId = Convert.ToInt32(cmd.ExecuteScalar())
                        con.Close()
                    End Using
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Function
    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request

    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub


End Class