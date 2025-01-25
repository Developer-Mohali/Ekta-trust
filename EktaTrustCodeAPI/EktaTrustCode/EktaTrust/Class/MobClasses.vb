Public Class MobClasses


    Public Class contacts

        Public Property MobileNumber As String
        Public Property EmailId As String
        Public Property Message As String
    End Class
    Public Class messages
        Public Property Name As String
        Public Property Email As String
        Public Property Address As String
        Public Property Occupation As String

        Public Property Mobile As String
        Public Property Message As String
        Public Property CreateDate As DateTime


    End Class

    Public Class RegisterEventsInformation
        Public Property firstname As String
        Public Property distance As String
        Public Property tshirt As String
        Public Property gender As String
        Public Property mobilenumber As String
        Public Property emergencynumber As String
        Public Property emailId As String
        Public Property dob As String
        Public Property address As String
        Public Property PaymentStatus As Boolean
        Public Property amount As String
        Public Property paymentDetails As String
        'Public Property Firstname As String
        'Public Property Lastname As String
        'Public Property MobileNumber As String
        'Public Property EmailId As String
        'Public Property Distance As String
        'Public Property Tshirt As String

        'Public Property Amount As String

        'Public Property PaymentDetails As String

        'Public Property PaymentStatus As Boolean
        'Public Property CreateDate As DateTime

    End Class


    Public Class DeviceTokens
        Public Property DeviceToken As String
        Public Property CreateDate As DateTime
    End Class

End Class

Public Class Payment
    Public Property FirstName As String
    Public Property Email As String
    Public Property TShirt As String
    Public Property CardNumber As String
    Public Property NameofCardHolder As String
    Public Property CVV As String
    Public Property ExpiryDate As String

End Class

Public Class OTP
    Public Property OTPtype As String
    Public Property Mobile As String
End Class
Public Class Message
    Public Property Name As String
    Public Property Email As String
    Public Property Address As String
    Public Property Designation As String
    Public Property Mobile As String
    Public Property Msg As String

End Class
