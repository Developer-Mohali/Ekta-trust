Imports System.Net
Imports System.Web.Http
Imports EktaTrust.MobClasses

Public Class MobController
    Inherits ApiController

    Dim Constr As String = ConfigurationManager.ConnectionStrings("Constr").ConnectionString
    Dim message As String

    Shared repository As ParticipantRepository = New ParticipantRepository()
    'This is used to AddNewEvent via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("AddNewEvent")>
    <Route("api/Mob/AddNewEvent")>
    Public Function AddNewEvent(ByVal Emp As RegisterEventsInformation) As String
        Dim response = repository.AddNewEvent(Emp)
        Return response
    End Function

    ''This is used to add ContactUs Details in Database

    <AllowAnonymous>
    <HttpPost>
    <ActionName("ContactUsEvent")>
    <Route("api/Mob/ContactUsEvent")>
    Public Function ContactUsEvent(ByVal contact As contacts) As String
        Dim response = repository.ContactUsEvent(contact)
        Return response
    End Function

    'This is used to SaveDeviceToken via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("SaveDeviceToken")>
    <Route("api/Mob/SaveDeviceToken")>
    Public Function SaveDeviceToken(ByVal deviceToken As DeviceTokens) As String
        Dim response = repository.SaveDeviceToken(deviceToken)
        Return response
    End Function

    'This is used to Save message via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("MessageToAdmin")>
    <Route("api/Mob/MessageToAdmin")>
    Public Function MessageToAdmin(ByVal msg As messages) As String
        Dim response = repository.MessageToAdmin(msg)
        Return response
    End Function

    'This is used to Make Payment via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("Payment")>
    <Route("api/Mob/Payment")>
    Public Function Payment(ByVal pay As Payment) As String
        Dim response = repository.Payment(pay)
        Return response
    End Function

    'This is used to Generate OTP via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("GenerateOTP")>
    <Route("api/Mob/GenerateOTP")>
    Public Function GenerateOTP(ByVal otp As OTP) As String
        Dim response = repository.GenerateOTP(otp)
        Return response
    End Function

    'This is used to Generate OTP via Mobile Application

    <AllowAnonymous>
    <HttpPost>
    <ActionName("JoinUsMessage")>
    <Route("api/Mob/JoinUsMessage")>
    Public Function JoinUsMessage(ByVal msg As Message) As String
        Dim response = repository.JoinUsMessage(msg)
        Return response
    End Function
End Class
