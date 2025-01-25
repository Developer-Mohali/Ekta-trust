Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Web.Script.Serialization
Imports MySql.Data.MySqlClient

Public Class AddNotification
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim message As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    ' This function is used to bind the grid and show the value on page load
    Private Sub BindGrid()
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT NotificationID,Message,CreatedBy, DATE_FORMAT(StartDate,'%m/%d/%Y')as StartDate, DATE_FORMAT(EndDate, '%m/%d/%Y')as EndDate FROM addnewnotification")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        gridViewNotification.DataSource = dt
                        gridViewNotification.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    'This Event is used to save the notification
    Protected Sub btnSaveNotification_Click(sender As Object, e As EventArgs) Handles btnSaveNotification.Click
        Dim dt As New DataTable
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT DeviceToken FROM applicationusers")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    ' Using dt As New DataTable()
                    sda.Fill(dt)
                    'End Using
                End Using
            End Using

        End Using
        ' Here, Sending Notification to all saved device tokens

        Try
            Dim applicationID = "AAAAaaQnVDs:APA91bEJ3XFwoMrphM23Vemm6YADudQwEeiLOUo9vAcUc2GUo9AoCM-VmNQ4kzwkZUVw8BGHuAvEBMP_t__i2_APqsOZ7X--ux27Q1q2nNZ4DJN-K84ZYzIKerr1Ped0AaoZCOTBl-RO"
            Dim senderId = "453725606971"
            Dim deviceId As String
            If dt.Rows.Count > 0 Then
                If Not IsDBNull(dt.Rows(0)("DeviceToken")) Then
                    For Each devID In dt.Rows
                        deviceId = devID("DeviceToken")
                        Dim tRequest As WebRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send")
                        tRequest.Method = "post"
                        tRequest.ContentType = "application/json"
                        Dim data = New With {Key .[to] = deviceId, Key .notification = New With {Key .body = NewMessage.Text, Key .title = "New Notification", Key .icon = "myicon"}}
                        Dim serializer = New JavaScriptSerializer()
                        Dim json = serializer.Serialize(data)
                        Dim byteArray As Byte() = Encoding.UTF8.GetBytes(json)
                        tRequest.Headers.Add(String.Format("Authorization: key={0}", applicationID))
                        tRequest.Headers.Add(String.Format("Sender: id={0}", senderId))
                        tRequest.ContentLength = byteArray.Length

                        Using dataStream As Stream = tRequest.GetRequestStream()
                            dataStream.Write(byteArray, 0, byteArray.Length)

                            Using tResponse As WebResponse = tRequest.GetResponse()

                                Using dataStreamResponse As Stream = tResponse.GetResponseStream()

                                    Using tReader As StreamReader = New StreamReader(dataStreamResponse)
                                        Dim sResponseFromServer As String = tReader.ReadToEnd()
                                        Dim str As String = sResponseFromServer
                                        Label1.Text = str
                                    End Using
                                End Using
                            End Using
                        End Using
                    Next
                    ' deviceId = dt.Rows(0)("DeviceToken")
                    'Dim deviceId As String = "cpOSsiGw9U8:APA91bEReXjMiP8dhMJglNnMTq1Fr6m_nVftl35mcWUom_nFU7oAEAnHyw2AaP8cOAhVehEDIRnka9imNMy_TTZfxTrxCUfJWJr8lF59WPBXscJYnqjIMUgUhgCi7ZKIOcVVwa-CqFQ4"
                    'Dim tRequest As WebRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send")
                    'tRequest.Method = "post"
                    'tRequest.ContentType = "application/json"
                    'Dim data = New With {Key .[to] = deviceId, Key .notification = New With {Key .body = NewMessage.Text, Key .title = "New Notification", Key .icon = "myicon"}}
                    'Dim serializer = New JavaScriptSerializer()
                    'Dim json = serializer.Serialize(data)
                    'Dim byteArray As Byte() = Encoding.UTF8.GetBytes(json)
                    'tRequest.Headers.Add(String.Format("Authorization: key={0}", applicationID))
                    'tRequest.Headers.Add(String.Format("Sender: id={0}", senderId))
                    'tRequest.ContentLength = byteArray.Length

                    'Using dataStream As Stream = tRequest.GetRequestStream()
                    '    dataStream.Write(byteArray, 0, byteArray.Length)

                    '    Using tResponse As WebResponse = tRequest.GetResponse()

                    '        Using dataStreamResponse As Stream = tResponse.GetResponseStream()

                    '            Using tReader As StreamReader = New StreamReader(dataStreamResponse)
                    '                Dim sResponseFromServer As String = tReader.ReadToEnd()
                    '                Dim str As String = sResponseFromServer
                    '                Label1.Text = str
                    '            End Using
                    '        End Using
                    '    End Using
                    'End Using
                End If

            End If


        Catch ex As Exception
            Dim str As String = ex.Message
        End Try
    End Sub
    'This is used to Delete the selected row.
    Protected Sub gridViewNotification_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> gridViewNotification.EditIndex Then
            TryCast(e.Row.Cells(0).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        End If
    End Sub
    Protected Sub gridViewNotification_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gridViewNotification.EditIndex = e.NewEditIndex
        Me.BindGrid()
    End Sub
    Protected Sub gridViewNotification_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gridViewNotification.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub gridViewNotification_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = gridViewNotification.Rows(e.RowIndex)
        Dim NotificationID As Integer = Convert.ToInt32(gridViewNotification.DataKeys(e.RowIndex).Values(0))
        Dim Message As String = TryCast(row.Cells(2).Controls(1), TextBox).Text
        Dim StartDate As String = TryCast(row.Cells(2).Controls(1), TextBox).Text
        Dim EndDate As String = TryCast(row.Cells(3).Controls(1), TextBox).Text
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE addnewnotification SET Message = @Message, StartDate = @StartDate, EndDate=@EndDate WHERE NotificationID = @NotificationID")
                cmd.Parameters.AddWithValue("@NotificationID", NotificationID)
                cmd.Parameters.AddWithValue("@Message", Message)
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        gridViewNotification.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub gridViewNotification_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim NotificationID As Integer = Convert.ToInt32(gridViewNotification.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM addnewnotification WHERE NotificationID = @NotificationID")
                cmd.Parameters.AddWithValue("@NotificationID", NotificationID)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindGrid()
    End Sub

    '<System.Web.Services.WebMethod()>
    'Public Function webApi() As String
    '    Dim res As String = String.Empty
    '    res = "value"
    '    Return res
    'End Function
End Class