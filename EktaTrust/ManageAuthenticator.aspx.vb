Imports System.Drawing
Imports System.IO
Imports MySql.Data.MySqlClient
Imports OtpNet
Imports QRCoder

Public Class ManageAuthenticator
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If (Session("TwoFAEnabled") IsNot Nothing AndAlso Convert.ToBoolean(Session("TwoFAEnabled"))) Then
                chkEnable2FA.Checked = True
                btnVerify.Enabled = False
            End If

            GenerateSecretAndQR()
        End If
    End Sub

    Private Property Base32Secret As String
        Get
            Return If(ViewState("TwoFASecret"), "")
        End Get
        Set(value As String)
            ViewState("TwoFASecret") = value
        End Set
    End Property

    Private Sub GenerateSecretAndQR()
        ' Generate secret
        Dim secret As String = ""
        If String.IsNullOrEmpty(Session("TwoFASecret")) = False Then
            secret = Session("TwoFASecret")
        Else
            secret = Base32Encoding.ToString(KeyGeneration.GenerateRandomKey())
        End If

        Base32Secret = secret
        lblSecret.Text = secret

        ' Replace with actual logged-in user email
        Dim userEmail As String = Session("EmailAddress")
        Dim issuer As String = "EktaTrust"

        Dim otpauthUrl As String =
                $"otpauth://totp/{issuer}:{userEmail}?secret={secret}&issuer={issuer}"

        ' Generate QR
        Dim qrGenerator As New QRCodeGenerator()
        Dim qrData = qrGenerator.CreateQrCode(otpauthUrl, QRCodeGenerator.ECCLevel.Q)
        Dim qrCode As New QRCode(qrData)
        Dim bitmap As Bitmap = qrCode.GetGraphic(20)

        ' Convert to Base64
        Using ms As New MemoryStream()
            bitmap.Save(ms, Imaging.ImageFormat.Png)
            Dim base64String As String = Convert.ToBase64String(ms.ToArray())
            imgQR.ImageUrl = "data:image/png;base64," & base64String
        End Using
    End Sub

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs)
        Try
            Dim userCode As String = txtOtp.Text.Trim()
            Dim keyBytes As Byte() = Base32Encoding.ToBytes(Base32Secret)
            Dim totp As New Totp(keyBytes)

            Dim isValid As Boolean =
                    totp.VerifyTotp(userCode, Nothing, VerificationWindow.RfcSpecifiedNetworkDelay)

            If isValid Then
                ' Save Base32Secret to database (ENCRYPTED)
                UpdateSecretKeyInDB(True)
                chkEnable2FA.Checked = True
                btnVerify.Enabled = False
                lblMessage.ForeColor = Drawing.Color.Green
                lblMessage.Text = "2FA Enabled Successfully!"
            Else
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "Invalid code. Try again."
            End If
        Catch ex As Exception
            Throw
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideLoader", "$('#loader').hide();", True)
        End Try
    End Sub

    Private Sub UpdateSecretKeyInDB(twoEnable As Boolean)
        Dim RoleId As String = Session("RoleId")
        Dim userId As Integer = Session("UserId")

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim query As String = "update signup set TwoFASecret = @TwoFASecret, TwoFAEnabled = @TwoFAEnabled where UserId = @userId"

        ' if role is admin, update from signup table...
        If RoleId = "1" Then
            query = "update signup set TwoFASecret = @TwoFASecret, TwoFAEnabled = @TwoFAEnabled where UserId = @userId"
        Else
            query = "update user set TwoFASecret = @TwoFASecret, TwoFAEnabled = @TwoFAEnabled where UserId = @userId"
        End If

        Using con As New MySqlConnection(constr)
            Using cmd As MySqlCommand = New MySqlCommand(query, con)
                cmd.Parameters.AddWithValue("@TwoFASecret", Base32Secret)
                cmd.Parameters.AddWithValue("@TwoFAEnabled", twoEnable)
                cmd.Parameters.AddWithValue("@userId", userId)
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Protected Sub chkEnable2FA_CheckedChanged(sender As Object, e As EventArgs)
        Try
            If Not String.IsNullOrEmpty(Session("TwoFASecret")) Then
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "loader", "showLoader();", True)
                UpdateSecretKeyInDB(chkEnable2FA.Checked)

                If chkEnable2FA.Checked Then
                    btnVerify.Enabled = False
                    lblMessage.ForeColor = Drawing.Color.Green
                    lblMessage.Text = "Two-Factor Authentication has been enabled successfully."
                Else
                    btnVerify.Enabled = True
                    lblMessage.ForeColor = Drawing.Color.Red
                    lblMessage.Text = "Two-Factor Authentication has been disabled."
                End If

            Else
                chkEnable2FA.Checked = False
                lblMessage.ForeColor = Drawing.Color.Red
                lblMessage.Text = "Please set up and verify 2FA using the authenticator app before enabling or disabling it."
            End If
        Catch ex As Exception
            Throw
        Finally
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "hideLoader", "hideLoader();", True)
        End Try
    End Sub

End Class