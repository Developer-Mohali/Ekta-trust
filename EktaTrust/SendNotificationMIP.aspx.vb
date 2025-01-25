Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Data.SqlClient

Public Class SendNotificationMIP
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            BindMessageCategorydropdown()
            BindEmailMessageCategorydropdown()
        End If
    End Sub

    'This method used to Get user list form database by Event Category.'
    <System.Web.Services.WebMethod()>
    Public Shared Function GetDataforMessage(ByVal name As String) As List(Of SendEmail)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim GetData As New List(Of SendEmail)()

            If name = "2" Then

                Using cmd As New MySqlCommand("Select * from MIPRegistration WHERE IsDeleted=false order by Id desc")
                    Using sda As New MySqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            If ds.Tables(0).Rows.Count > 0 Then

                                For Each dr As DataRow In ds.Tables(0).Rows
                                    GetData.Add(New SendEmail() With {
                                                        .Id = dr("Id").ToString(),
                                                        .Name = dr("Name").ToString(),
                                                        .EamilID = dr("Email").ToString(),
                                                        .MobileNumber = dr("Mobile").ToString()
                                                       })
                                Next


                            End If
                        End If
                    End Using
                End Using

            ElseIf name = "3" Then
                Using cmd As New MySqlCommand("Select Id, Name, EmailID, MobileNumber  from registration  WHERE EmailID='rakeshk@kasproit.com' order by Id desc")
                    Using sda As New MySqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            If ds.Tables(0).Rows.Count > 0 Then

                                For Each dr As DataRow In ds.Tables(0).Rows
                                    GetData.Add(New SendEmail() With {
                                                        .Id = dr("Id").ToString(),
                                                        .Name = dr("Name").ToString(),
                                                        .EamilID = dr("EmailID").ToString(),
                                                        .MobileNumber = dr("MobileNumber").ToString()
                                                       })
                                Next


                            End If
                        End If
                    End Using
                End Using

            ElseIf name = "4" Then
                Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration order by Id desc")

                    Using sda As New MySqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            If ds.Tables(0).Rows.Count > 0 Then

                                For Each dr As DataRow In ds.Tables(0).Rows
                                    GetData.Add(New SendEmail() With {
                                                        .Id = dr("Id").ToString(),
                                                        .Name = dr("Name").ToString(),
                                                        .EamilID = dr("Email").ToString(),
                                                        .MobileNumber = dr("Mobile").ToString()
                                                       })
                                Next


                            End If
                        End If
                    End Using
                    'cmd.Connection = con
                    'con.Open()
                    'Using sdr As MySqlDataReader = cmd.ExecuteReader()
                    '    While sdr.Read()
                    '        GetData.Add(New SendEmail() With {
                    '     .Id = sdr("Id").ToString(),
                    '     .Name = sdr("Name").ToString(),
                    '     .EamilID = sdr("Email").ToString(),
                    '     .MobileNumber = sdr("Mobile").ToString()
                    '    })
                    '    End While
                    'End Using

                End Using

            ElseIf name = "5" Then
                Using cmd As New MySqlCommand("Select ID, EmailId from SignupEmail order by Id desc")
                    Using sda As New MySqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Dim ds As New DataSet()
                        sda.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then
                            If ds.Tables(0).Rows.Count > 0 Then

                                For Each dr As DataRow In ds.Tables(0).Rows
                                    GetData.Add(New SendEmail() With {
                                                        .Id = dr("ID").ToString(),
                                                        .EamilID = dr("EmailId").ToString()
                                                       })
                                Next


                            End If
                        End If
                    End Using

                End Using
            Else

            End If
            Return GetData
            con.Close()
        End Using
    End Function


    'This method used to send notification for Register user.'
    <System.Web.Services.WebMethod()>
    Public Shared Function SendNotification(ByVal ObjSend As SendEmail) As SendEmail
        Dim subject As String = String.Empty

        Dim status = ""
        Dim body As String = String.Empty
        Dim bodyUser As String = String.Empty
        Dim emilID As String = String.Empty
        Dim returnResult As String = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Try
                ' We want to split this input string.
                Dim stringID As String = ObjSend.Id
                ' Split string based on spaces.
                Dim ID As String() = stringID.Split(New Char() {","c})

                ' Use For Each loop over words and display them.
                Dim userID As String
                For Each userID In ID
                    If ObjSend.SendMessageTo = "2" Then
                        If ObjSend.EmailType = "EmailType" And ObjSend.MobileType = "MobileType" Then
                            Using cmd As New MySqlCommand("Select * from MIPRegistration WHERE Id=" + userID + "")
                                cmd.Connection = con
                                con.Open()
                                Using sda As New MySqlDataAdapter()

                                    sda.SelectCommand = cmd
                                    Using dt As New DataTable()
                                        sda.Fill(dt)
                                        For Each row As DataRow In dt.Rows
                                            ObjSend.Name = row("Name")
                                            ObjSend.MobileNumber = row("Mobile")
                                            ObjSend.EamilID = row("Email")
                                            status = ObjSend.NewBlukSms(ObjSend.MobileNumber, ObjSend.MobileMessage)
                                            bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.MobileMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                            'This method Call For UserSend mail,
                                            subject = "MIP-MESSAGE"
                                            emilID = ObjSend.EamilID
                                            ObjSend.sendMailUser(emilID, subject, bodyUser)
                                            ObjSend.log("ErrorStep", status, "SendNotification", ObjSend.MobileNumber, ObjSend.EmailType = "EmailType", ObjSend.MobileMessage, "", "")
                                        Next row
                                    End Using
                                End Using
                                con.Close()
                            End Using

                        ElseIf ObjSend.MobileType = "MobileType" Then
                            Using cmd As New MySqlCommand("Select * from MIPRegistration WHERE Id=" + userID + "")
                                cmd.Connection = con
                                con.Open()
                                Using sda As New MySqlDataAdapter()
                                    sda.SelectCommand = cmd
                                    Using dt As New DataTable()
                                        sda.Fill(dt)
                                        For Each row As DataRow In dt.Rows
                                            ObjSend.Name = row("Name")
                                            ObjSend.MobileNumber = row("Mobile")
                                            ObjSend.EamilID = row("Email")
                                            status = ObjSend.NewBlukSms(ObjSend.MobileNumber, ObjSend.MobileMessage)
                                            ObjSend.log("ErrorStep", status, "SendNotification", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", ObjSend.MobileMessage, "", "")
                                        Next row
                                    End Using
                                End Using
                                con.Close()

                            End Using
                        ElseIf ObjSend.EmailType = "EmailType" Then
                            Using cmd As New MySqlCommand("Select * from MIPRegistration WHERE Id=" + userID + "")
                                cmd.Connection = con
                                con.Open()
                                Using sda As New MySqlDataAdapter()

                                    sda.SelectCommand = cmd
                                    Using dt As New DataTable()
                                        sda.Fill(dt)
                                        For Each row As DataRow In dt.Rows
                                            ObjSend.Name = row("Name")
                                            ObjSend.MobileNumber = row("Mobile")
                                            ObjSend.EamilID = row("Email")
                                            bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                            'This method Call For UserSend mail,
                                            subject = "MIP-MESSAGE"
                                            emilID = ObjSend.EamilID
                                            ObjSend.sendMailUser(emilID, subject, bodyUser)

                                        Next row
                                    End Using
                                End Using
                                con.Close()
                            End Using
                        Else

                        End If

                        'there check Event-Registration
                    ElseIf ObjSend.SendMessageTo = "3" Then
                        EventRegistrationSendMessage(userID, ObjSend.MobileType, ObjSend.EmailType, ObjSend.MobileMessage, ObjSend.EmailMessage)
                        'there check Event-Registration
                    ElseIf ObjSend.SendMessageTo = "4" Then
                        MIPFacultySendMessage(userID, ObjSend.MobileType, ObjSend.EmailType, ObjSend.MobileMessage, ObjSend.EmailMessage)
                    ElseIf ObjSend.SendMessageTo = "5" Then

                        Using cmd As New MySqlCommand("Select * from SignupEmail WHERE ID=" + userID + "")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()

                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.EamilID = row("EmailId")
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "Subscribe"
                                        emilID = ObjSend.EamilID
                                        ObjSend.sendMailUser(emilID, subject, bodyUser)

                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using

                    Else

                    End If

                Next
            Catch ex As Exception
                ObjSend.SuccessfullMessage = "Sever Error Try Again !"
            End Try
        End Using
        ObjSend.SuccessfullMessage = "Send successfull message"
        Return ObjSend
    End Function

    Public Shared Function SubscribeSendMessage(ByVal ID As String, ByVal MobileType As String, EmailType As String, mobileMessage As String, EamilMessage As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim status = ""
            Dim subject As String = String.Empty
            Dim body As String = String.Empty
            Dim bodyUser As String = String.Empty
            Dim emilID As String = String.Empty
            Dim returnResult As String = String.Empty
            Dim ObjSend As SendEmail = New SendEmail()
            Try
                If EmailType = "EmailType" And MobileType = "MobileType" Then

                ElseIf EmailType = "EmailType" Then
                    If ID = "0" Then
                        Using cmd As New MySqlCommand("Select * from registration")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()
                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.sendMailUser(emilID, subject, bodyUser)
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    Else
                        Using cmd As New MySqlCommand("Select * from registration WHERE Id=" + ID + "")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()

                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.sendMailUser(emilID, subject, bodyUser)
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    End If

                Else

                End If
            Catch ex As Exception
                ObjSend.SuccessfullMessage = "Sever Error Try Again !"
            End Try
        End Using

    End Function


    'This function used to send notification for EventRegistration.'
    Public Shared Function EventRegistrationSendMessage(ByVal ID As String, ByVal MobileType As String, EmailType As String, mobileMessage As String, EamilMessage As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim status = ""
            Dim subject As String = String.Empty
            Dim body As String = String.Empty
            Dim bodyUser As String = String.Empty
            Dim emilID As String = String.Empty
            Dim returnResult As String = String.Empty
            Dim ObjSend As SendEmail = New SendEmail()
            Try
                If EmailType = "EmailType" And MobileType = "MobileType" Then
                    If ID = "0" Then
                        Using cmd As New MySqlCommand("Select * from registration")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()

                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        status = ObjSend.NewBlukSms(ObjSend.MobileNumber, mobileMessage)
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.log("ErrorStep", status, "EventRegistrationSendMessage", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", ObjSend.MobileMessage, "", "")
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    Else
                        Using cmd As New MySqlCommand("Select * from registration WHERE Id=" + ID + "")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()

                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        status = ObjSend.NewBlukSms(ObjSend.MobileNumber, mobileMessage)
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.log("ErrorStep", status, "EventRegistrationSendMessage", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", ObjSend.MobileMessage, "", "")
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    End If


                ElseIf MobileType = "MobileType" Then
                    If ID = "0" Then
                        Using cmd As New MySqlCommand("Select * from registration")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()
                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        status = ObjSend.NewBlukSms(ObjSend.MobileNumber, mobileMessage)
                                        ObjSend.log("ErrorStep", status, "EventRegistrationSendMessage", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", mobileMessage, "", "")
                                    Next row
                                End Using
                            End Using
                            con.Close()

                        End Using
                    Else
                        Using cmd As New MySqlCommand("Select * from registration WHERE Id=" + ID + "")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()
                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        status = ObjSend.NewBlukSms(ObjSend.MobileNumber, mobileMessage)
                                        ObjSend.log("ErrorStep", status, "EventRegistrationSendMessage", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", mobileMessage, "", "")
                                    Next row
                                End Using
                            End Using
                            con.Close()

                        End Using
                    End If

                ElseIf EmailType = "EmailType" Then
                    If ID = "0" Then
                        Using cmd As New MySqlCommand("Select * from registration")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()
                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.sendMailUser(emilID, subject, bodyUser)
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    Else
                        Using cmd As New MySqlCommand("Select * from registration WHERE Id=" + ID + "")
                            cmd.Connection = con
                            con.Open()
                            Using sda As New MySqlDataAdapter()

                                sda.SelectCommand = cmd
                                Using dt As New DataTable()
                                    sda.Fill(dt)
                                    For Each row As DataRow In dt.Rows
                                        ObjSend.Name = row("Name")
                                        ObjSend.MobileNumber = row("MobileNumber")
                                        ObjSend.EamilID = row("EmailID")
                                        bodyUser = "Hello " + ObjSend.Name + ",<br/><br/>" + ObjSend.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                        'This method Call For UserSend mail,
                                        subject = "MIP-MESSAGE"
                                        emilID = ObjSend.EamilID
                                        ObjSend.sendMailUser(emilID, subject, bodyUser)
                                    Next row
                                End Using
                            End Using
                            con.Close()
                        End Using
                    End If

                Else

                End If
            Catch ex As Exception
                ObjSend.SuccessfullMessage = "Sever Error Try Again !"
            End Try
        End Using

    End Function

    'This function used to send notification for mipfaculty.'

    Public Shared Function MIPFacultySendMessage(ByVal ID As String, ByVal MobileType As String, EmailType As String, mobileMessage As String, EamilMessage As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim status = ""
            Dim subject As String = String.Empty
            Dim body As String = String.Empty
            Dim bodyUser As String = String.Empty
            Dim emilID As String = String.Empty
            Dim returnResult As String = String.Empty
            Dim Send As SendEmail = New SendEmail()
            Try
                If EmailType = "EmailType" And MobileType = "MobileType" Then
                    Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration WHERE Id=" + ID + "")
                        cmd.Connection = con
                        con.Open()
                        Using sda As New MySqlDataAdapter()

                            sda.SelectCommand = cmd
                            Using dt As New DataTable()
                                sda.Fill(dt)
                                For Each row As DataRow In dt.Rows
                                    Send.Name = row("Name")
                                    Send.MobileNumber = row("Mobile")
                                    Send.EamilID = row("Email")
                                    status = Send.NewBlukSms(Send.MobileNumber, mobileMessage)
                                    bodyUser = "Hello " + Send.Name + ",<br/><br/>" + Send.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                    'This method Call For UserSend mail,
                                    subject = "MIP-MESSAGE"
                                    emilID = Send.EamilID
                                    Send.sendMailUser(emilID, subject, bodyUser)
                                    Send.log("ErrorStep", status, "MIPFacultySendMessage", Send.MobileNumber, Send.MobileType = "SMS", Send.MobileMessage, "", "")
                                Next row
                            End Using
                        End Using
                        con.Close()
                    End Using

                ElseIf MobileType = "MobileType" Then
                    Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration WHERE Id=" + ID + "")
                        cmd.Connection = con
                        con.Open()
                        Using sda As New MySqlDataAdapter()
                            sda.SelectCommand = cmd
                            Using dt As New DataTable()
                                sda.Fill(dt)
                                For Each row As DataRow In dt.Rows
                                    Send.Name = row("Name")
                                    Send.MobileNumber = row("Mobile")
                                    Send.EamilID = row("Email")
                                    status = Send.NewBlukSms(Send.MobileNumber, mobileMessage)
                                    Send.log("ErrorStep", status, "MIPFacultySendMessage", Send.MobileNumber, Send.MobileType = "SMS", Send.MobileMessage, "", "")
                                Next row
                            End Using
                        End Using
                        con.Close()
                    End Using
                ElseIf EmailType = "EmailType" Then
                    Using cmd As New MySqlCommand("Select * from MIPFacultyRegistration WHERE Id=" + ID + "")
                        cmd.Connection = con
                        con.Open()
                        Using sda As New MySqlDataAdapter()

                            sda.SelectCommand = cmd
                            Using dt As New DataTable()
                                sda.Fill(dt)
                                For Each row As DataRow In dt.Rows
                                    Send.Name = row("Name")
                                    Send.MobileNumber = row("Mobile")
                                    Send.EamilID = row("Email")
                                    bodyUser = "Hello " + Send.Name + ",<br/><br/>" + Send.EmailMessage + "<br/><br/><br/>" + "Thanks</b>," + "<br/>Ekta Navnirman Trust.<br/>Site Administrator."
                                    'This method Call For UserSend mail,
                                    subject = "MIP-MESSAGE"
                                    emilID = Send.EamilID
                                    Send.sendMailUser(emilID, subject, bodyUser)

                                Next row
                            End Using
                        End Using
                        con.Close()
                    End Using
                Else
                End If
            Catch ex As Exception
                Send.SuccessfullMessage = "Sever Error Try Again !"
            End Try
        End Using

    End Function

    'This method used to send new user notification.
    <System.Web.Services.WebMethod()>
    Public Shared Function SendNewUserNotification(ByVal data As SendEmail) As SendEmail
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim ObjSend As SendEmail = New SendEmail()
            Dim GetData As New List(Of SendEmail)()
            Dim status As String = String.Empty
            Try


                If data.MobileType = "MobileType" Then
                    Using cmd As New MySqlCommand("InsertSendNewUser")


                        Using sda As New MySqlDataAdapter()
                            status = ObjSend.NewBlukSms(data.MobileNumber, data.MobileMessage)
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.AddWithValue("@EmailMessage", "")
                            cmd.Parameters.AddWithValue("@MobileMessage", data.MobileMessage)
                            cmd.Parameters.AddWithValue("@MobileNumber", data.MobileNumber)
                            cmd.Parameters.AddWithValue("@EamilAddress", "")
                            cmd.Parameters.AddWithValue("@StatusMessage", status)
                            cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)

                            cmd.Connection = con
                            con.Open()
                            cmd.ExecuteNonQuery()
                            data.SuccessfullMessage = "Send Message Successfully."
                            ObjSend.log("ErrorStep", status, "MIPFacultySendMessage", data.MobileNumber, data.MobileType = "SMS", data.MobileMessage, "", "")
                            'ObjSend.log("ErrorStep", status, "MIPFacultySendMessage", ObjSend.MobileNumber, ObjSend.MobileType = "SMS", ObjSend.MobileMessage, "", "")
                            con.Close()
                            con.Dispose()
                        End Using
                    End Using

                ElseIf data.EmailType = "EmailType" Then
                    Using cmd As New MySqlCommand("InsertSendNewUser")
                        status = ObjSend.sendMailUser(data.EamilID, "Run for Equality 2018", data.EmailMessage)
                        Using sda As New MySqlDataAdapter()
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.AddWithValue("@EmailMessage", data.EmailMessage)
                            cmd.Parameters.AddWithValue("@MobileMessage", "")
                            cmd.Parameters.AddWithValue("@MobileNumber", "")
                            cmd.Parameters.AddWithValue("@EamilAddress", data.EamilID)
                            cmd.Parameters.AddWithValue("@StatusMessage", status)
                            cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                            cmd.Connection = con
                            con.Open()
                            cmd.ExecuteNonQuery()

                            con.Close()
                            con.Dispose()
                        End Using
                    End Using
                    data.SuccessfullMessage = "Send Message Successfully."
                Else

                End If

                con.Close()
            Catch ex As Exception
                SendEmail.log("ErrorStep1", ex.Message, "SendNewUserNotification", "", "", "", "", "")

            End Try
            Return data
        End Using

    End Function


    'This function used to sms Message category get and bind dropdown.'
    Protected Sub BindMessageCategorydropdown()
        Try


            'conenction path for database
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                con.Open()
                Dim cmd As New MySqlCommand("Select Category,id from Template where TemplateType='SMS'", con)
                Dim da As New MySqlDataAdapter(cmd)
                Dim ds As New DataSet()
                da.Fill(ds)
                drpMobileMessage.DataSource = ds
                drpMobileMessage.DataTextField = "Category"
                drpMobileMessage.DataValueField = "id"
                drpMobileMessage.DataBind()
                drpMobileMessage.Items.Insert(0, New ListItem("---Select Category Message---", "0"))
                con.Close()
            End Using
        Catch ex As Exception

        End Try
    End Sub

    'This function used to Email Message category get and bind dropdown.'
    Protected Sub BindEmailMessageCategorydropdown()
        'conenction path for database
        Try


            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                con.Open()
                Dim cmd As New MySqlCommand("Select Category,id from Template where TemplateType='EMAIL'", con)
                Dim da As New MySqlDataAdapter(cmd)
                Dim ds As New DataSet()
                da.Fill(ds)
                drpEmailMessage.DataSource = ds
                drpEmailMessage.DataTextField = "Category"
                drpEmailMessage.DataValueField = "id"
                drpEmailMessage.DataBind()
                drpEmailMessage.Items.Insert(0, New ListItem("---Select Category Message---", "0"))
                con.Close()
            End Using
        Catch ex As Exception

        End Try
    End Sub


    'This method used get Message category and get sms.'

    <System.Web.Services.WebMethod()>
    Public Shared Function GetMessageCategory(ByVal data As SendEmail) As SendEmail

        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)


                Using cmd As New MySqlCommand("Select Message from Template WHERE id=" + data.Category + "")

                    cmd.Connection = con
                    con.Open()
                    Using sda As New MySqlDataAdapter()

                        sda.SelectCommand = cmd
                        Using dt As New DataTable()
                            sda.Fill(dt)
                            For Each row As DataRow In dt.Rows
                                data.Message = row("Message").ToString()
                            Next row
                        End Using
                    End Using

                End Using


                con.Close()
            End Using
        Catch ex As Exception

        End Try
        Return data
    End Function

End Class