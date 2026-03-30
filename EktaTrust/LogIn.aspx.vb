Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web.Security
Imports System.Security.Principal
Imports MySql.Data.MySqlClient
Imports OtpNet
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
        Dim TwoFAEnabled As Boolean = False
        Dim rd As MySqlDataReader
        'Dim RememberMe As String = If(chkRememberMe.Checked, "Y", "N")
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Dim cmd As New MySqlCommand("select  EmailAddress, RoleId, UserId, Password, TwoFAEnabled, TwoFASecret from signup where EmailAddress =@EmailAddress and Password=@Password ", con)
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
                    Session("UserId") = rd(2).ToString()
                    TwoFAEnabled = Not IsDBNull(rd(4)) AndAlso Convert.ToBoolean(rd(4))
                    Session("TwoFASecret") = rd(5).ToString()
                    Session("TwoFAEnabled") = TwoFAEnabled
                End While

                If TwoFAEnabled Then
                    pnlLogin.Visible = True
                    Form1.Visible = False
                Else
                    Response.Redirect("DashBoard")
                End If

            ElseIf dt.Rows.Count = 0 Then
                Dim cmds As New MySqlCommand("select EmailAddress, RoleId, ID, Password, TwoFAEnabled, TwoFASecret from User where EmailAddress=@EmailAddress and Password=@Password ", con)
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
                        Session("UserId") = rd(2).ToString()
                        TwoFAEnabled = Not IsDBNull(rd(4)) AndAlso Convert.ToBoolean(rd(4))
                        Session("TwoFASecret") = rd(5).ToString()

                    End While
                    If Session("RoleId") IsNot Nothing Then
                        Dim roleId As Integer = Convert.ToInt32(Session("RoleId"))
                        If roleId = 3 Then
                            If TwoFAEnabled Then
                                pnlLogin.Visible = True
                                Form1.Visible = False
                            Else
                                Response.Redirect("AdminUserBIBNO")
                            End If
                            'Response.Redirect("AdminUserBIBNO.aspx")
                        End If

                    End If
                    If TwoFAEnabled Then
                        pnlLogin.Visible = True
                        Form1.Visible = False
                    Else
                        Response.Redirect("DashBoard")
                    End If

                Else
                    ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid EmailId and Password')</script>")

                End If

                ClientScript.RegisterStartupScript(Page.[GetType](), "validation", "<script language='javascript'>alert('Invalid EmailId and Password')</script>")

            End If
            con.Close()
            con.Dispose()

        End Using
    End Sub

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs)
        ' Get user id from session
        Dim userId As Integer = Convert.ToInt32(Session("UserID"))

        ' Get secret from DB
        Dim secret As String = Session("TwoFASecret")

        Dim keyBytes As Byte() = Base32Encoding.ToBytes(secret)
        Dim totp As New Totp(keyBytes)

        Dim isValid As Boolean =
            totp.VerifyTotp(txtOtp.Text.Trim(), Nothing, VerificationWindow.RfcSpecifiedNetworkDelay)

        If isValid Then
            Response.Redirect("DashBoard")
        Else
            lblError.Text = "Invalid OTP. Try again."
        End If

    End Sub
End Class