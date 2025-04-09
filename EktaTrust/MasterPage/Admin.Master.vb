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
Public Class Admin
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            countMe()
        End If
    End Sub
    Private Sub countMe()
        Try
            Dim rd As MySqlDataReader
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New MySqlConnection(constr)
                Dim cmd As New MySqlCommand("select count(VisiterId) + 50000 as visiter from visiterdetail ", con)
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
                        lblCount.Text = rd(0).ToString()
                    End While

                End If
                con.Close()


            End Using
        Catch e As Exception

        End Try
    End Sub

End Class