Imports EktaTrust.PaymentRequest
Public Class PaymentResponse
    Inherits System.Web.UI.Page
    Private debugData As String = ""
    Public vbpc_SecureHash As String = ""

    Dim transactionData As System.Collections.SortedList
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SECURE_SECRET As String = ConfigurationManager.AppSettings("SECURE_SECRET")
        'Dim SECURE_SECRET As String = "E59CD2BF6F4D86B5FB3897A680E0DD3E"
        transactionData = New System.Collections.SortedList(New EMAStringComparer())
        Panel_Debug.Visible = False
        Panel_Receipt.Visible = False
        Panel_StackTrace.Visible = False
        Dim message As String = ""
        Dim errorExists As Boolean = False
        Dim txnResponseCode As String = ""
        Dim rawHashData As String = SECURE_SECRET
        Label_HashValidation.Text = "<font color='orange'><b>NOT CALCULATED</b></font>"
        Dim hashValidated As Boolean = True

        Try
            debugData += "<br/><u>Start of Debug Data</u><br/><br/>"

            If Page.Request.Form("EncData").Length > 0 Then
                debugData += "<u>Data from Payment Server</u><br/>"
                Dim merchantId As String = Page.Request.Form("MerchantId")
                Dim encReq As String = Page.Request.Form("EncData")
                Dim encData As String = Decrypt(encReq)
                Dim pipeSplit As String() = Regex.Split(encData, "::")

                For i As Integer = 0 To pipeSplit.Length - 1
                    Dim pareValues As String() = Regex.Split(pipeSplit(i), System.Text.RegularExpressions.Regex.Escape("="))

                    If pareValues(0) <> String.Empty Then

                        If Not transactionData.ContainsKey(pareValues(0)) AndAlso Not pareValues(0).Equals("SecureHash") Then
                            transactionData.Add(pareValues(0), HttpUtility.UrlDecode(pareValues(1)))
                        ElseIf pareValues(0).Equals("SecureHash") Then
                            vbpc_SecureHash = pareValues(1)
                        End If
                    End If
                Next

                For Each item As System.Collections.DictionaryEntry In transactionData
                    debugData += item.Key.ToString() & "=" & item.Value.ToString() & "<br/>"

                    If SECURE_SECRET.Length > 0 Then
                        rawHashData += item.Value.ToString()
                    End If
                Next

                Dim signature As String = ""

                If SECURE_SECRET.Length > 0 Then
                    signature = CreateSHA256Signature(rawHashData)
                    debugData += "<br/><u>Hash Data Input</u>: " & rawHashData & "<br/><br/><u>Signature Created</u>: " & signature & "<br/>"

                    If vbpc_SecureHash.ToUpper().Equals(signature) Then
                        Label_HashValidation.Text = "<font color='#00AA00'><b>CORRECT</b></font>"
                    Else
                        Label_HashValidation.Text = "<font color='#FF0066'><b>INVALID HASH</b></font>"
                        hashValidated = False
                    End If
                End If

                txnResponseCode = null2unknown(If(transactionData("ResponseCode") Is Nothing, "", transactionData("ResponseCode").ToString()))
                Label_TxnResponseCode.Text = txnResponseCode
                Label_Amount.Text = null2unknown(If(transactionData("Amount") Is Nothing, "", transactionData("Amount").ToString()))
                Label_TerminalId.Text = null2unknown(If(transactionData("TerminalId") Is Nothing, "", transactionData("TerminalId").ToString()))
                Label_RetRefNo.Text = null2unknown(If(transactionData("RetRefNo") Is Nothing, "", transactionData("RetRefNo").ToString()))
                Label_MerchantID.Text = null2unknown(If(transactionData("MerchantId") Is Nothing, "", transactionData("MerchantId").ToString()))
                Label_BatchNo.Text = null2unknown(If(transactionData("BatchNo") Is Nothing, "", transactionData("BatchNo").ToString()))
                Label_CardType.Text = null2unknown(If(transactionData("CardType") Is Nothing, "", transactionData("CardType").ToString()))
                Label_AuthorizeID.Text = null2unknown(If(transactionData("AuthCode") Is Nothing, "", transactionData("AuthCode").ToString()))
                Label_AuthStatus.Text = null2unknown(If(transactionData("AuthStatus") Is Nothing, "", transactionData("AuthStatus").ToString()))
                Label_MerchTxnRef.Text = null2unknown(If(transactionData("TxnRefNo") Is Nothing, "", transactionData("TxnRefNo").ToString()))
                Label_CAVV.Text = null2unknown(If(transactionData("CAVV") Is Nothing, "", transactionData("CAVV").ToString()))
                Label_UCAP.Text = null2unknown(If(transactionData("UCAP") Is Nothing, "", transactionData("UCAP").ToString()))
                Label_ENROLLED.Text = null2unknown(If(transactionData("ENROLLED") Is Nothing, "", transactionData("ENROLLED").ToString()))
                Label_OrderInfo.Text = null2unknown(If(transactionData("OrderInfo") Is Nothing, "", transactionData("OrderInfo").ToString()))
                Label_CardNo.Text = null2unknown(If(transactionData("MaskedCardNo") Is Nothing, "", transactionData("MaskedCardNo").ToString()))
                Panel_Receipt.Visible = True

                If message.Length = 0 Then
                    message = null2unknown(If(transactionData("Message") Is Nothing, "", transactionData("Message").ToString()))
                End If
            End If

        Catch ex As Exception
            message = "(51) Exception encountered. " & ex.Message

            If ex.StackTrace.Length > 0 Then
                Label_StackTrace.Text = ex.ToString()
                Panel_StackTrace.Visible = True
            End If

            errorExists = True
        End Try

        Label_Message.Text = message
        debugData += "<br/><u>End of debug information</u><br/>"
        Label_Debug.Text = debugData
        Panel_Debug.Visible = True
    End Sub
    Private Function getResponseDescription(ByVal vResponseCode As String) As String
        Dim result As String = "Unknown"

        If vResponseCode.Length > 0 Then

            Select Case vResponseCode
                Case "0"
                    result = "Transaction Successful"
                Case "1"
                    result = "Transaction Declined"
                Case "2"
                    result = "Bank Declined Transaction"
                Case "3"
                    result = "No Reply from Bank"
                Case "4"
                    result = "Expired Card"
                Case "5"
                    result = "Insufficient Funds"
                Case "6"
                    result = "Error Communicating with Bank"
                Case "7"
                    result = "Payment Server detected an error"
                Case "8"
                    result = "Transaction Type Not Supported"
                Case "9"
                    result = "Bank declined transaction (Do not contact Bank)"
                Case "A"
                    result = "Transaction Aborted"
                Case "B"
                    result = "Transaction Declined - Contact the Bank"
                Case "C"
                    result = "Transaction Cancelled"
                Case "D"
                    result = "Deferred transaction has been received and is awaiting processing"
                Case "F"
                    result = "3-D Secure Authentication failed"
                Case "I"
                    result = "Card Security Code verification failed"
                Case "L"
                    result = "Shopping Transaction Locked (Please try the transaction again later)"
                Case "N"
                    result = "Cardholder is not enrolled in Authentication scheme"
                Case "P"
                    result = "Transaction has been received by the Payment Adaptor and is being processed"
                Case "R"
                    result = "Transaction was not processed - Reached limit of retry attempts allowed"
                Case "S"
                    result = "Duplicate SessionID"
                Case "T"
                    result = "Address Verification Failed"
                Case "U"
                    result = "Card Security Code Failed"
                Case "V"
                    result = "Address Verification and Card Security Code Failed"
                Case Else
                    result = "Unable to be determined"
            End Select
        End If

        Return result
    End Function
    Private Function displayAVSResponse(ByVal vAVSResultCode As String) As String
        Dim result As String = "Unknown"

        If vAVSResultCode.Length > 0 Then

            If vAVSResultCode.Equals("Unsupported") Then
                result = "AVS not supported or there was no AVS data provided"
            Else

                Select Case vAVSResultCode
                    Case "X"
                        result = "Exact match - address and 9 digit ZIP/postal code"
                    Case "Y"
                        result = "Exact match - address and 5 digit ZIP/postal code"
                    Case "S"
                        result = "Service not supported or address not verified (international transaction)"
                    Case "G"
                        result = "Issuer does not participate in AVS (international transaction)"
                    Case "A"
                        result = "Address match only"
                    Case "W"
                        result = "9 digit ZIP/postal code matched, Address not Matched"
                    Case "Z"
                        result = "5 digit ZIP/postal code matched, Address not Matched"
                    Case "R"
                        result = "Issuer system is unavailable"
                    Case "U"
                        result = "Address unavailable or not verified"
                    Case "E"
                        result = "Address and ZIP/postal code not provided"
                    Case "N"
                        result = "Address and ZIP/postal code not matched"
                    Case "0"
                        result = "AVS not requested"
                    Case Else
                        result = "Unable to be determined"
                End Select
            End If
        End If

        Return result
    End Function
    Private Function displayCSCResponse(ByVal vCSCResultCode As String) As String
        Dim result As String = "Unknown"

        If vCSCResultCode.Length > 0 Then

            If vCSCResultCode.Equals("Unsupported") Then
                result = "CSC not supported or there was no CSC data provided"
            Else

                Select Case vCSCResultCode
                    Case "M"
                        result = "Exact code match"
                    Case "S"
                        result = "Merchant has indicated that CSC is not present on the card (MOTO situation)"
                    Case "P"
                        result = "Code not processed"
                    Case "U"
                        result = "Card issuer is not registered and/or certified"
                    Case "N"
                        result = "Code invalid or not matched"
                    Case Else
                        result = "Unable to be determined"
                End Select
            End If
        End If

        Return result
    End Function
    Private Function splitResponse(ByVal rawData As String) As System.Collections.Hashtable
        Dim responseData As System.Collections.Hashtable = New System.Collections.Hashtable()

        Try

            If rawData.IndexOf("=") > 0 Then

                For Each pair As String In rawData.Split("&"c)
                    Dim equalsIndex As Integer = pair.IndexOf("=")

                    If equalsIndex > 1 AndAlso pair.Length > equalsIndex Then
                        Dim paramKey As String = System.Web.HttpUtility.UrlDecode(pair.Substring(0, equalsIndex))
                        Dim paramValue As String = System.Web.HttpUtility.UrlDecode(pair.Substring(equalsIndex + 1))
                        responseData.Add(paramKey, paramValue)
                    End If
                Next
            Else
                responseData.Add("vpc_Message", "The data contained in the response was not a valid receipt.<br/>" & vbLf & "The data was: <pre>" & rawData & "</pre><br/>" & vbLf)
            End If

            Return responseData
        Catch ex As Exception
            responseData.Add("vpc_Message", vbLf & "The was an exception parsing the response data.<br/>" & vbLf & "The data was: <pre>" & rawData & "</pre><br/>" & vbLf & "<br/>" & vbLf & "Exception: " & ex.ToString() & "<br/>" & vbLf)
            Return responseData
        End Try
    End Function
    Private Shared Function null2unknown(ByVal data As String) As String
        If data Is Nothing OrElse data.Length = 0 Then
            Return "No Value Returned"
        Else
            Return data
        End If
    End Function
    Private Function CreateSHA256Signature(ByVal RawData As String) As String
        Dim hasher As System.Security.Cryptography.SHA256 = System.Security.Cryptography.SHA256Managed.Create()
        Dim HashValue As Byte() = hasher.ComputeHash(Encoding.ASCII.GetBytes(RawData))
        Dim strHex As String = ""

        For Each b As Byte In HashValue
            strHex += b.ToString("x2")
        Next

        Return strHex.ToUpper()
    End Function
    Private Shared Function Decrypt(ByVal encrypttext As String) As String

        Dim EncryptionKey As String = ConfigurationManager.AppSettings("EncryptionKey")
        Dim tdes As System.Security.Cryptography.Rijndael = System.Security.Cryptography.Rijndael.Create()
        tdes.Key = Encoding.UTF8.GetBytes(EncryptionKey)
        tdes.Mode = System.Security.Cryptography.CipherMode.ECB
        tdes.Padding = System.Security.Cryptography.PaddingMode.PKCS7
        Dim crypt As System.Security.Cryptography.ICryptoTransform = tdes.CreateDecryptor()
        Dim decryptedByteValue As Byte() = Convert.FromBase64String(encrypttext)
        Dim cipher As Byte() = crypt.TransformFinalBlock(decryptedByteValue, 0, decryptedByteValue.Length)
        Dim clearText As String = System.Text.Encoding.UTF8.GetString(cipher)
        Return clearText
    End Function

End Class