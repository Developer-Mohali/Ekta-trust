Imports System.Collections

Imports MySql.Data.MySqlClient

Public Class PaymentRequest
    Inherits System.Web.UI.Page
    Private debugData As String = ""
    Public merchant_id, encryptdata As String
    Public Url As String
    Dim TransactionID As String = ""
    Dim transactionData As System.Collections.SortedList = Nothing
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim SECURE_SECRET As String = "E59CD2BF6F4D86B5FB3897A680E0DD3E"
        'Dim SECURE_SECRET As String = "ECCC984B521AE5C13261B0510AAC33CF"
        Dim SECURE_SECRET As String = ConfigurationManager.AppSettings("SECURE_SECRET")
        Panel_Debug.Visible = False

        If Not String.IsNullOrEmpty(Request.QueryString("TransactionID")) Then
            TransactionID = Request.QueryString("TransactionID")
        End If

        Panel_StackTrace.Visible = False
        'Dim BankID As String = System.Configuration.ConfigurationManager.AppSettings("BankId")
        'define message string for errors
        Dim message As String = "No Messages"
        Dim txnResponseCode As String = ""
        ' error exists flag
        Dim errorExists As Boolean = False

        ' transaction response code
        Try
            transactionData = New System.Collections.SortedList(New EMAStringComparer())
            Dim queryString As String = ""
            Url = ConfigurationManager.AppSettings("Url")
            'Url = "https://sandbox.isgpay.com:8443/ISGPay/request.action"
            'Collect debug information
            debugData += "<u>Data from Order Page</u><br/>"
            'lblFirstName.Text = Page.Request.Form("txtFirstName")
            'lblLastName.Text = Page.Request.Form("txtLastName")
            'lblAddress.Text = Page.Request.Form("txtAddress")
            'lblCity.Text = Page.Request.Form("txtCity")
            'lblState.Text = Page.Request.Form("txtState")
            'lblPhone.Text = Page.Request.Form("txtPhone")
            'lblEmail.Text = Page.Request.Form("txtEmail")
            'lblZip.Text = Page.Request.Form("txtZip")
            'lblPaymentOption.Text = Page.Request.Form("ddlPaymentOption")
            'If (lblPaymentOption.Text = "cc") Then
            '    lblPaymentOption.Text = "Credit Card"
            'ElseIf (lblPaymentOption.Text = "dc") Then
            '    lblPaymentOption.Text = "Debit Card"
            'ElseIf (lblPaymentOption.Text = "nb") Then
            '    lblPaymentOption.Text = "NetBanking"
            'Else
            '    lblPaymentOption.Text = "Wallet"
            'End If
            'lblVersion.Text = System.Configuration.ConfigurationManager.AppSettings("Version")
            'lblTxnRefNo.Text = System.Configuration.ConfigurationManager.AppSettings("TxnRefNo")
            'lblAmount.Text = System.Configuration.ConfigurationManager.AppSettings("Amount")
            'lblPassCode.Text = System.Configuration.ConfigurationManager.AppSettings("PassCode")
            'lblBankId.Text = System.Configuration.ConfigurationManager.AppSettings("BankId")
            'lblTerminalId.Text = System.Configuration.ConfigurationManager.AppSettings("TerminalId")
            'lblMerchantId.Text = System.Configuration.ConfigurationManager.AppSettings("MerchantId")
            'lblMCC.Text = System.Configuration.ConfigurationManager.AppSettings("MCC")
            'lblCurrency.Text = System.Configuration.ConfigurationManager.AppSettings("Currency")
            'lblTxnType.Text = System.Configuration.ConfigurationManager.AppSettings("TxnType")
            'lblRedirectUrl.Text = System.Configuration.ConfigurationManager.AppSettings("RedirectUrl")
            'To
            'lblCardHolder.Text = Page.Request.Form("CardHolder")
            'lblCardNumber.Text = Page.Request.Form("CardNumber")
            'Dim expiryMonth As String = Page.Request.Form("ddlExpiryMonth")
            'Dim expiryYear As String = Page.Request.Form("ddlExpiryYear")
            'lblExpiryDate.Text = (expiryMonth + (expiryYear).Trim())
            'End
            'lblCardSecurityCode.Text = Page.Request.Form("CardSecurityCode")

            'lblExpiryMonth.Text = Page.Request.Form("ddlExpiryMonth")
            'lblExpiryYear.Text = Page.Request.Form("ddlExpiryYear")

            'lblTshirt.Text = Page.Request.Form("ddlTShrt")
            'lblQuantity.Text = Page.Request.Form("ddlQuantity")

            'For Each item As String In Page.Request.Form
            '    debugData += item & "=" & Page.Request.Form(item) & "<br/>"

            '    If (Page.Request.Form(item) <> "") AndAlso (item <> "inprocess") Then
            '        transactionData.Add(item, Page.Request.Form(item))
            '    End If
            'Next

            Dim paiseamount As String = System.Configuration.ConfigurationManager.AppSettings("Amount")
            Dim paise As String = Convert.ToInt32(paiseamount) * 100
            transactionData.Add("Version", System.Configuration.ConfigurationManager.AppSettings("Version"))
            transactionData.Add("TxnRefNo", TransactionID)
            transactionData.Add("Amount", paise)
            transactionData.Add("PassCode", System.Configuration.ConfigurationManager.AppSettings("PassCode"))
            transactionData.Add("BankId", System.Configuration.ConfigurationManager.AppSettings("BankId"))
            transactionData.Add("TerminalId", System.Configuration.ConfigurationManager.AppSettings("TerminalId"))
            transactionData.Add("MerchantId", System.Configuration.ConfigurationManager.AppSettings("MerchantId"))
            transactionData.Add("MCC", System.Configuration.ConfigurationManager.AppSettings("MCC"))
            transactionData.Add("Currency", System.Configuration.ConfigurationManager.AppSettings("Currency"))
            transactionData.Add("TxnType", System.Configuration.ConfigurationManager.AppSettings("TxnType"))
            transactionData.Add("ReturnURL", System.Configuration.ConfigurationManager.AppSettings("RedirectUrl"))
            'To
            'transactionData.Add("CardHolder", Page.Request.Form("CardHolder"))
            'transactionData.Add("CardNumber", Page.Request.Form("CardNumber"))
            'transactionData.Add("CardSecurityCode", Page.Request.Form("CardSecurityCode"))
            'transactionData.Add("ExpiryDate", (expiryMonth + (expiryYear).Trim()))
            'End
            debugData += "<br/><u>Data from Transaction Sorted List</u><br/>"

            Dim rawHashData As String = SECURE_SECRET
            Dim seperator As String = "::"
            'Loop through all the data in the SortedList transaction data
            For Each item As System.Collections.DictionaryEntry In transactionData
                'debugData += item.Key.ToString() & "=" & item.Value.ToString() & "<br/>"
                queryString += item.Key.ToString() + "||" + item.Value.ToString() + seperator

                If SECURE_SECRET.Length > 0 Then
                    rawHashData += item.Value.ToString()
                End If
            Next
            ' Create the SHA256 signature if required
            Dim signature As String = ""
            ' create the signature and add it to the query string
            If (SECURE_SECRET.Length > 0) Then
                signature = CreateSHA256Signature(rawHashData)
                queryString += "SecureHash||" + signature
                'debugData += "<br/><u>Hash Data Input</u>: " + rawHashData + "<br/><br/><u>Signature Created</u>: " + signature + "<br/>"
            End If
            'debugData += "<br/><u>Final QueryString Data String</u>: " + queryString + "<br/><br/>" + Url + " " + queryString + "<br/>"
            'debugData += "<br/><u>Final QueryString Data String</u>: " + queryString + "<br/><br/><a href='https://sandbox.isgpay.com:8443/ISGPay/request.action'" + queryString + "'>Click here to proceed.</a><br/>"

            transactionData.Remove("Version")
            transactionData.Remove("TxnRefNo")
            transactionData.Remove("Amount")
            transactionData.Remove("PassCode")
            transactionData.Remove("BankId")
            transactionData.Remove("TerminalId")
            transactionData.Remove("MerchantId")
            transactionData.Remove("MCC")
            transactionData.Remove("Currency")
            transactionData.Remove("TxnType")
            transactionData.Remove("ReturnURL")
            'To
            'transactionData.Remove("CardHolder")
            'transactionData.Remove("CardNumber")
            'transactionData.Remove("ExpiryDate")
            'transactionData.Remove("CardSecurityCode")
            'End
            Amount.Value = paise
            BankId.Value = System.Configuration.ConfigurationManager.AppSettings("BankId")
            Currency.Value = System.Configuration.ConfigurationManager.AppSettings("Currency")
            MCC.Value = System.Configuration.ConfigurationManager.AppSettings("MCC")
            PassCode.Value = System.Configuration.ConfigurationManager.AppSettings("PassCode")
            ReturnURL.Value = System.Configuration.ConfigurationManager.AppSettings("RedirectUrl")
            TxnRefNo.Value = System.Configuration.ConfigurationManager.AppSettings("TxnRefNo")
            TxnType.Value = System.Configuration.ConfigurationManager.AppSettings("TxnType")
            MerchantId.Value = System.Configuration.ConfigurationManager.AppSettings("MerchantId")
            TerminalId.Value = System.Configuration.ConfigurationManager.AppSettings("TerminalId")
            Version.Value = System.Configuration.ConfigurationManager.AppSettings("Version")
            'To
            'CardHolder.Value = Page.Request.Form("CardHolder")
            'CardNumber.Value = Page.Request.Form("CardNumber")
            'CardSecurityCode.Value = Page.Request.Form("CardSecurityCode")
            'ExpiryDate.Value = (expiryMonth + (expiryYear).Trim())
            'End
            Dim encValue As String = Encrypt(queryString)
            merchant_id = Page.Request.Form("vpc_MerchantId")
            encryptdata = encValue
            'EncData.Value = encryptdata
        Catch ex As Exception
            message = "(51) Exception encountered. " & ex.Message
            If ex.StackTrace.Length > 0 Then
                Label_StackTrace.Text = ex.ToString()
                Panel_StackTrace.Visible = True
            End If
            errorExists = True
        End Try
        debugData += "<br/><br/>End of debug information<br/>"
        Label_Debug.Text = debugData
        Panel_Debug.Visible = True
        LoadUser()
        'PaymentUser()
    End Sub

    Private Sub LoadUser()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            con.Open()


            Using cmd As New MySqlCommand("select * from registration where TransactionID='" + TransactionID + "' ", con)
                Using sda As New MySqlDataAdapter()
                    sda.SelectCommand = cmd
                    Dim ds As DataSet = New DataSet()
                    sda.Fill(ds)
                    lblName.Text = ds.Tables(0).Rows(0)("Name").ToString()
                    lblEmail.Text = ds.Tables(0).Rows(0)("EmailID").ToString()
                    lblTshirt.Text = ds.Tables(0).Rows(0)("ShirtSize").ToString()
                End Using
                con.Close()
            End Using
        End Using
    End Sub
    '    Private Sub PaymentUser()
    '        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '          Using con As New MySqlConnection(constr)
    '        Dim dt As DataTable = New DataTable()
    '            con.Open()

    '            'Dim expirydate As String = "ddlExpiryMonth.Value + " / " + ddlExpiryYear.Value"
    '            Dim myReader As MySqlDataReader = Nothing
    '            Dim MySqlCommand As MySqlCommand = New MySqlCommand("select * from PaymentInformation where PaymentID=@PaymentID", con)
    '            myReader = MySqlCommand .ExecuteReader()

    '            While myReader.Read()
    '                lblPaymentId.Text = (myReader("@PaymentID").ToString())
    '                lblCardHolder.Text = (myReader("@CardHolder").ToString())
    '                lblCardNumber.Text = (myReader("@CardNumber").ToString())
    '                lblExpiryDate.Text = (myReader("@expirydate").ToString())
    '                lblCardSecurityCode.Text = (myReader("@CVV").ToString())
    '            End While
    '            con.Close()
    'End Using
    '    End Sub
    Private Function CreateSHA256Signature(ByVal RawData As String) As String
        Dim hasher As System.Security.Cryptography.SHA256 = System.Security.Cryptography.SHA256Managed.Create()
        Dim HashValue As Byte() = hasher.ComputeHash(Encoding.ASCII.GetBytes(RawData))
        Dim strHex As String = ""
        For Each b As Byte In HashValue
            strHex += b.ToString("x2")
        Next
        Return strHex.ToUpper()
    End Function

    Private Function Encrypt(ByVal plainText As String) As String

        'Dim EncryptionKey As String = "89AAB829D5A74AF1A1450894F3C3C1A8"
        'Dim EncryptionKey As String = "5EC4A697141C8CE45509EF485EE7D4B1"
        Dim EncryptionKey As String = ConfigurationManager.AppSettings("EncryptionKey")
        Dim tdes As System.Security.Cryptography.Rijndael = System.Security.Cryptography.Rijndael.Create()
        tdes.Key = Encoding.UTF8.GetBytes(EncryptionKey)
        tdes.Mode = System.Security.Cryptography.CipherMode.ECB
        tdes.Padding = System.Security.Cryptography.PaddingMode.PKCS7
        Dim crypt As System.Security.Cryptography.ICryptoTransform = tdes.CreateEncryptor()
        Dim plain As Byte() = Encoding.UTF8.GetBytes(plainText)
        Dim cipher As Byte() = crypt.TransformFinalBlock(plain, 0, plain.Length)
        plainText = Convert.ToBase64String(cipher)
        Return plainText
    End Function

    Public Class EMAStringComparer
        Implements IComparer
        Public Function Compare(ByVal a As Object, ByVal b As Object) As Integer Implements IComparer.Compare
            If a = b Then Return 0
            If a Is Nothing Then Return -1
            If b Is Nothing Then Return 1
            Dim sa As String = TryCast(a, String)
            Dim sb As String = TryCast(b, String)
            Dim myComparer As System.Globalization.CompareInfo = System.Globalization.CompareInfo.GetCompareInfo("en-US")

            If sa IsNot Nothing AndAlso sb IsNot Nothing Then
                Return myComparer.Compare(sa, sb, System.Globalization.CompareOptions.Ordinal)
            End If

            Throw New ArgumentException("a and b should be strings.")
        End Function
    End Class

End Class