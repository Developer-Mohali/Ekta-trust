Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports MySql.Data.MySqlClient
Public Class LogIn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If ((Not (Request.Cookies("EmailId")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
                textEmailAdd.Text = Request.Cookies("EmailId").Value
                TextPassword.Attributes("value") = Request.Cookies("Password").Value
            End If
        End If
    End Sub
    Protected Sub ButtonSignIn_Click(ByVal sender As Object, ByVal e As EventArgs)

        If chkRememberMe.Checked Then
            Response.Cookies("EmailId").Expires = DateTime.Now.AddDays(30)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
        Else
            Response.Cookies("EmailId").Expires = DateTime.Now.AddDays(-1)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
        End If
        Response.Cookies("EmailId").Value = textEmailAdd.Text.Trim
        Response.Cookies("Password").Value = TextPassword.Text.Trim

        Dim UserId As Integer = 0
        Dim rd As MySqlDataReader
        'Dim RememberMe As String = If(chkRememberMe.Checked, "Y", "N")
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim cmd As New MySqlCommand("select  EmailAddress,RoleId, Password from signup where EmailAddress =@EmailAddress and Password=@Password ", con)
                cmd.Parameters.AddWithValue("@EmailAddress", textEmailAdd.Text)
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
                    Session("EmailAddress") = rd(0).ToString()
                    Session("RoleId") = rd(1).ToString()
                    Dim ss = Session("RoleId").ToString()
                    End While
                    Response.Redirect("DashBoard")

            ElseIf dt.Rows.Count = 0 Then
                Dim cmds As New MySqlCommand("select EmailAddress,RoleId,Password from User where EmailAddress=@EmailAddress and Password=@Password ", con)
                cmds.Parameters.AddWithValue("@EmailAddress", textEmailAdd.Text)
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
                        Session("EmailAddress") = rd(0).ToString()
                        Session("RoleId") = rd(1).ToString()

                    End While
                    Response.Redirect("DashBoard")

                Else
                    ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid EmailId and Password')</script>")

                End If

                ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid EmailId and Password')</script>")

                End If
                con.Close()
                con.Dispose()
           
        End Using
    End Sub
End Class