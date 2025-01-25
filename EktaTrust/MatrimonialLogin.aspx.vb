Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports MySql.Data.MySqlClient

Public Class MatrimonialLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If ((Not (Request.Cookies("PhoneNo")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
                txtPhoneNo.Text = Request.Cookies("PhoneNo").Value
                TextPassword.Attributes("value") = Request.Cookies("Password").Value
            End If
        End If
    End Sub

    Protected Sub ButtonSignIn_Click(ByVal sender As Object, ByVal e As EventArgs)

        If chkRememberMe.Checked Then
            Response.Cookies("PhoneNo").Expires = DateTime.Now.AddDays(30)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
        Else
            Response.Cookies("PhoneNo").Expires = DateTime.Now.AddDays(-1)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
        End If
        Response.Cookies("PhoneNo").Value = txtPhoneNo.Text.Trim
        Response.Cookies("Password").Value = TextPassword.Text.Trim

        Dim UserId As Integer = 0
        Dim rd As MySqlDataReader
        'Dim RememberMe As String = If(chkRememberMe.Checked, "Y", "N")
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim cmd As New MySqlCommand("select  Name, ID , Password from matrimonialDetails where PhoneNo =@Phone and Password=@Password and IsDeleted=false ", con)
            cmd.Parameters.AddWithValue("@Phone", txtPhoneNo.Text)
            cmd.Parameters.AddWithValue("@Password", TextPassword.Text)
            'cmd.Parameters.AddWithValue("@RememberMe", RememberMe)
            cmd.Connection = con
            con.Open()
            cmd.ExecuteNonQuery()
            'userId = Convert.ToInt32(cmd.ExecuteScalar())
            Dim da As New MySqlDataAdapter(cmd)
            Dim dt As New DataTable()
            da.Fill(dt)

            If dt.Rows.Count > 0 Then
                rd = cmd.ExecuteReader()
                While rd.Read()
                    'gridview has 2 columns only(name, type)
                    Session("Name") = rd(0).ToString()
                    Session("ID") = rd(1).ToString()
                    Dim ss = Session("ID").ToString()
                End While
                Response.Redirect("Profile.aspx")

            ElseIf dt.Rows.Count = 0 Then
                Dim cmds As New MySqlCommand("select Name,ID,Password from matrimonialDetails where PhoneNo=@Phone and Password=@Password and IsDeleted=false", con)
                cmds.Parameters.AddWithValue("@Phone", txtPhoneNo.Text)
                cmds.Parameters.AddWithValue("@Password", TextPassword.Text)
                'cmds.Parameters.AddWithValue("@RememberMe", RememberMe)
                cmds.Connection = con

                cmds.ExecuteNonQuery()
                'userId = Convert.ToInt32(cmd.ExecuteScalar())
                Dim dataAdapter As New MySqlDataAdapter(cmds)
                Dim DataTable As New DataTable()
                dataAdapter.Fill(DataTable)

                If DataTable.Rows.Count > 0 Then
                    rd = cmds.ExecuteReader()
                    While rd.Read()
                        'gridview has 2 columns only(name, type)
                        Session("Name") = rd(0).ToString()
                        Session("ID") = rd(1).ToString()

                    End While
                    Response.Redirect("Profile.aspx")

                Else
                    ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid PhoneNo and Password')</script>")

                End If

                ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid PhoneNo and Password')</script>")

            End If
            con.Close()
            con.Dispose()

        End Using
    End Sub

End Class