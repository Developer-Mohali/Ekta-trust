Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient
Public Class Inner
    Inherits System.Web.UI.MasterPage

    Private Property Str As String

    Private Property sqlda As MySqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lb1.Text = "<b><font color=Brown>" + "</font>" + "<b><font color=gray>" + Session("EmailAddress") + "</font>"
        If Session("Authorize") = False Or Session("EmailAddress") Is Nothing Then

            ' This variable not exists, so it is new session or expired session
            Response.Redirect("/login")
            ' Session variable exists, so it is active visitor
        End If
        Dim pageNameWithoutExt As String = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath)
        If Session("Authorize") = False Or Session("RoleId") IsNot Nothing Then
            Dim roleId As Integer = Convert.ToInt32(Session("RoleId"))
            If roleId = 3 Then
                If pageNameWithoutExt <> "AdminUserBIBNO" Then
                    Response.Redirect("/login")
                End If
            End If
        End If
        If Not IsPostBack Then

            bindgrid()
        End If
    End Sub
    Private Sub bindgrid()
        Dim dt As New DataTable()
        Dim EmailAddress As String = DirectCast(Session("EmailAddress"), String)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)

            con.Open()
            Str = (Convert.ToString("select EmailAddress from signup where EmailAddress='") & EmailAddress) + "'"
            sqlda = New MySqlDataAdapter(Str, con)
            dt = New DataTable()
            sqlda.Fill(dt)
            sqlda.Dispose()
            GridView1.DataSource = dt
            GridView1.DataBind()
            con.Close()
        End Using
    End Sub

    Protected Sub ButtonLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session("EmailAddress") = ""
        Session.Abandon()
        Session("Authorize") = False
        Response.Redirect("Login.aspx")


    End Sub

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)
        If Session("EmailAddress") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

End Class