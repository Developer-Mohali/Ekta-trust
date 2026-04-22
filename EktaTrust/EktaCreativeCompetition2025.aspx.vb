Imports System.Web.Services
Imports MySql.Data.MySqlClient

Public Class EktaCreativeCompetition2025
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <System.Web.Services.WebMethod()>
    Public Shared Function CheckMobile(ByVal mobileNumber As String) As Object
        Dim result As New Dictionary(Of String, Object)

        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim query As String = "SELECT Id, Name, EmailID, MobileNumber, Contest, Address, CreateDate 
                                   FROM RegistrationCreativeCompetition 
                                   WHERE MobileNumber = @MobileNumber 
                                   ORDER BY CreateDate DESC 
                                   LIMIT 1"
                Using cmd As New MySqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber)
                    con.Open()

                    Using rdr As MySqlDataReader = cmd.ExecuteReader()
                        If rdr.Read() Then
                            result("Exists") = True
                            result("Id") = rdr("Id").ToString()
                            result("Name") = rdr("Name").ToString()
                            result("EmailID") = rdr("EmailID").ToString()
                            result("MobileNumber") = rdr("MobileNumber").ToString()
                            result("Contest") = rdr("Contest").ToString()
                            result("Address") = rdr("Address").ToString()
                            result("CreateDate") = Convert.ToDateTime(rdr("CreateDate")).ToString("dd-MMM-yyyy")
                        Else
                            result("Exists") = False
                        End If
                    End Using
                End Using
            End Using

        Catch ex As Exception
            ' Return the error details in the HTTP response (for debugging only)
            HttpContext.Current.Response.StatusCode = 500
            HttpContext.Current.Response.StatusDescription = ex.Message
            result("Error") = ex.Message
        End Try

        Return result
    End Function





    '<System.Web.Services.WebMethod()>
    'Public Shared Function CheckMobile(mobileNumber As String) As Dictionary(Of String, Object)
    '    Dim result As New Dictionary(Of String, Object)()
    '    result("Exists") = False
    '    result("AllRecords") = New List(Of Dictionary(Of String, Object))()

    '    Try
    '        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '        Using con As New MySqlConnection(constr)
    '            ' 1️⃣ Search by Mobile
    '            Dim query As String = "SELECT Id, Name, EmailID, MobileNumber, Contest, Address, CreateDate 
    '                               FROM RegistrationCreativeCompetition 
    '                               WHERE MobileNumber = @MobileNumber 
    '                               LIMIT 1"
    '            Using cmd As New MySqlCommand(query, con)
    '                cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber)
    '                con.Open()
    '                Using rdr As MySqlDataReader = cmd.ExecuteReader()
    '                    If rdr.Read() Then
    '                        result("Exists") = True
    '                        result("Id") = rdr("Id").ToString()
    '                        result("Name") = rdr("Name").ToString()
    '                        result("EmailID") = rdr("EmailID").ToString()
    '                        result("MobileNumber") = rdr("MobileNumber").ToString()
    '                        result("Contest") = rdr("Contest").ToString()
    '                        result("Address") = rdr("Address").ToString()
    '                        result("CreateDate") = Convert.ToDateTime(rdr("CreateDate")).ToString("dd-MMM-yyyy")
    '                    End If
    '                End Using
    '            End Using

    '            ' 2️⃣ Get All Records
    '            Dim allQuery As String = "SELECT Id, Name, EmailID, MobileNumber, Contest, Address, CreateDate FROM RegistrationCreativeCompetition"
    '            Using cmdAll As New MySqlCommand(allQuery, con)
    '                Using rdrAll As MySqlDataReader = cmdAll.ExecuteReader()
    '                    Dim allList As New List(Of Dictionary(Of String, Object))()
    '                    While rdrAll.Read()
    '                        Dim rec As New Dictionary(Of String, Object)()
    '                        rec("Id") = rdrAll("Id").ToString()
    '                        rec("Name") = rdrAll("Name").ToString()
    '                        rec("EmailID") = rdrAll("EmailID").ToString()
    '                        rec("MobileNumber") = rdrAll("MobileNumber").ToString()
    '                        rec("Contest") = rdrAll("Contest").ToString()
    '                        rec("Address") = rdrAll("Address").ToString()
    '                        rec("CreateDate") = Convert.ToDateTime(rdrAll("CreateDate")).ToString("dd-MMM-yyyy")
    '                        allList.Add(rec)
    '                    End While
    '                    result("AllRecords") = allList
    '                End Using
    '            End Using
    '        End Using
    '    Catch ex As Exception
    '        result("Error") = ex.Message
    '    End Try

    '    Return result
    'End Function

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim mobileNumber As String = Request.Form("txtMobile")

        'If FileUpload.HasFile Then
        '    Dim extension As String = System.IO.Path.GetExtension(FileUpload.FileName).ToLower()
        '    Dim savePath As String = Server.MapPath("~/uploads/") & FileUpload.FileName

        '    ' Save file
        '    FileUpload.SaveAs(savePath)

        '    ' Save to DB
        '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        '    Using con As New MySqlConnection(constr)
        '        Dim query As String = "INSERT INTO ContestApplicants (MobileNumber, FilePath, CreateDate) 
        '                           VALUES (@MobileNumber, @FilePath, NOW())"
        '        Using cmd As New MySqlCommand(query, con)
        '            cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber)
        '            cmd.Parameters.AddWithValue("@FilePath", savePath)
        '            con.Open()
        '            cmd.ExecuteNonQuery()
        '        End Using
        '    End Using
        'End If
    End Sub


End Class