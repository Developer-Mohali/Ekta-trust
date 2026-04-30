Imports System.Web
Public Class CommonFunction

    Public Shared Function ConvertUTCTimeToIndianTimezone(utcDate As String) As DateTime
        Dim istZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")
        Dim istTime As DateTime = TimeZoneInfo.ConvertTimeFromUtc(Convert.ToDateTime(utcDate), istZone)
        Return istTime
    End Function

End Class
