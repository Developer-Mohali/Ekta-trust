Imports System.IO

Public Class Logger

    Public Shared Sub LogError(message As String, Optional ex As Exception = Nothing)

        Try
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/Logs/")

            ' Create folder if not exists
            If Not Directory.Exists(logPath) Then
                Directory.CreateDirectory(logPath)
            End If

            ' File name per day
            Dim filePath As String = logPath & "PaymentErrorLog.txt"

            Dim sb As New StringBuilder()

            sb.AppendLine("--------------------------------------------------")
            sb.AppendLine("Date: " & DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            sb.AppendLine("Message: " & message)

            If ex IsNot Nothing Then
                sb.AppendLine("Exception: " & ex.Message)
                sb.AppendLine("StackTrace: " & ex.StackTrace)
                If ex.InnerException IsNot Nothing Then
                    sb.AppendLine("InnerException: " & ex.InnerException.Message)
                End If
            End If

            sb.AppendLine("--------------------------------------------------")

            File.AppendAllText(filePath, sb.ToString())

        Catch
            ' ❌ Never throw from logger
        End Try

    End Sub

End Class