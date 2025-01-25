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

Public Class Atrocities_Reporting
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    'This method is used to generate opt and send to the user's phone number

    <System.Web.Services.WebMethod()>
    Public Shared Function otpGenerate(ByVal phone As String) As String

        Dim SendEmail As SendEmail = New SendEmail()
        'Dim message As String
        Dim alphabets As String = "1234567890"
        alphabets += Convert.ToString(alphabets)
        Dim otp As String = String.Empty
        Try
            For i As Integer = 0 To 6 - 1
                Dim character As String = String.Empty
                Do
                    Dim index As Integer = New Random().Next(0, alphabets.Length)
                    character = alphabets.ToCharArray()(index).ToString()
                Loop While otp.IndexOf(character) <> -1
                otp += character
            Next
            Dim smsMessage = "Dear user your activation code is " + otp + "  for atrocities reporting on Ekta Navnirman Trust Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
            'message = GetMergedOTP(message, otp)
            Dim status = SendEmail.NewBlukSms(phone.Trim(), smsMessage)
            'Dim tokenJson = JsonConvert.SerializeObject(status)
            'Dim jsonResult = JsonConvert.DeserializeObject(Of Dictionary(Of String, Object))(status)
            'Dim firstItem = jsonResult.Values(1)
            SendEmail.log("Step1", "success", "AtrocitiesReporting", phone.Trim(), otp, "", "", smsMessage)
        Catch ex As Exception
            otp = "NotValid"
        End Try
        Return otp
    End Function
    'This method is used to save the Atrocities Report
    Protected Sub Atrocity_Submit(sender As Object, e As EventArgs) Handles ButtonSubmitMessage.Click
        Dim SendEmail As SendEmail = New SendEmail()
        Dim smsMessage As String = String.Empty
        Dim status As String = String.Empty
        Dim subject As String = String.Empty
        Dim fullName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            'Dim extension = Path.GetExtension(fileName)
            'Dim currentDate = DateTime.Now
            'Dim fullName = fileName + extension
            If fullName IsNot Nothing And fullName IsNot "" Then
                FileUpload1.PostedFile.SaveAs((Server.MapPath("~/UploadFile/") + fullName))
            End If

            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("Insert_AtrocitiesReporting")
                    Using sda As New MySqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ReporterName", reporterName.Text)
                        cmd.Parameters.AddWithValue("@ReporterEmail", reporterEmail.Text)
                        cmd.Parameters.AddWithValue("@ReporterPhone", reporterPhone.Text)
                        cmd.Parameters.AddWithValue("@Place", place.Text)
                        cmd.Parameters.AddWithValue("@FileName", fullName)
                        cmd.Parameters.AddWithValue("@VictimsName", victimsName.Text)
                        cmd.Parameters.AddWithValue("@VictimsMobile", victimsMobile.Text)
                        cmd.Parameters.AddWithValue("@Details", details.Text)
                        cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@CreatedStatus", True)
                        cmd.Parameters.AddWithValue("@DeletedDate", String.Empty)
                        cmd.Parameters.AddWithValue("@DeletedStatus", String.Empty)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()

                        'Send message to reporter on reporting save in database successfully 
                        smsMessage = "Dear " + reporterName.Text + " thank you for atrocities reporting. We will received your report. Thanks for Atrocity reporting on Ekta Navnirman Trust Regards, Administrator Ekta Navnirman Trust www.ektatrust.org.in"
                        status = SendEmail.NewBlukSms(reporterPhone.Text, smsMessage)

                        'Send email to reporter on reporting save in database successfully
                        smsMessage = "Dear " + reporterName.Text + ",<br/><br/> thank you For atrocities reporting. We will received your report.Thanks for Atrocity reporting on Ekta Navnirman Trust<br/><br/><br/>Regards</b>,<br/>Administrator<br/>Ekta Navnirman Trust<br/> www.ektatrust.org.In"

                        subject = "Atrocity reporting"
                        SendEmail.EventRegistrationSendMail(reporterEmail.Text, subject, smsMessage)

                        lblConfirmation.Text = "Record saved successfully!"
                    End Using
                End Using
            End Using
            SendEmail.log("step1", "success", "AtrocitiesReporting", "", "", "", "", "ReporterName:" + reporterName.Text + ",ReporterEmail :" + reporterEmail.Text + ", ReporterPhone:" + reporterPhone.Text + ", Place:" + place.Text + ",FileName:" + fullName + ", VictimsName:" + victimsName.Text + " ,VictimsMobile:" + victimsMobile.Text + ",Details:" + details.Text + "")
            reporterName.Text = ""
            reporterEmail.Text = ""
            reporterPhone.Text = ""
            place.Text = ""
            victimsName.Text = ""
            victimsMobile.Text = ""
            details.Text = ""
        Catch ex As Exception
            lblConfirmation.Text = "Record not saved!"
            SendEmail.log("step1", "error", "AtrocitiesReporting", "", "", "", "", "ReporterName:" + reporterName.Text + ",ReporterEmail :" + reporterEmail.Text + ", ReporterPhone:" + reporterPhone.Text + ", Place:" + place.Text + ",FileName:" + fullName + ", VictimsName:" + victimsName.Text + " ,VictimsMobile:" + victimsMobile.Text + ",Details:" + details.Text + "")
        End Try
    End Sub

End Class




