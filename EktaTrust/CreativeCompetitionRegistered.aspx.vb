Imports System.Drawing
Imports System.IO
Imports MySql.Data.MySqlClient
Imports ExcelDataReaderImportFromExcel
Imports System.Text

Public Class CreativeCompetitionRegistered
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection(ConfigurationManager.ConnectionStrings("constr").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        If Not IsPostBack Then
            MessageUpdated.Text = ""
            drpContest.SelectedValue = "0"
            gvEvent.AllowPaging = True
            gvEvent.PageSize = 15
            BindGridView()
        End If
    End Sub

    Private Sub BindGridView()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Using con As New MySqlConnection(constr)
            Dim query As String = "
        SELECT 
            r.Id,
            r.Name,
            r.EmailID,
            r.MobileNumber,
            r.Contest,
            r.Address,
            r.CreateDate,
            GROUP_CONCAT(u.FileName SEPARATOR ',') AS Files
        FROM RegistrationCreativeCompetition r
        LEFT JOIN CreativeCompetitionUploads u ON r.Id = u.RegistrationId
        WHERE 
            (@SearchText IS NULL OR r.Name LIKE @SearchText OR r.EmailID LIKE @SearchText OR r.MobileNumber LIKE @SearchText)
            AND (@ContestName IS NULL OR r.Contest = @ContestName)
        GROUP BY r.Id, r.Name, r.EmailID, r.MobileNumber, r.Contest, r.Address, r.CreateDate
        ORDER BY r.CreateDate DESC;
        "

            Using cmd As New MySqlCommand(query, con)
                ' Search text
                If String.IsNullOrWhiteSpace(txtSearch.Text) Then
                    cmd.Parameters.AddWithValue("@SearchText", DBNull.Value)
                Else
                    cmd.Parameters.AddWithValue("@SearchText", "%" & txtSearch.Text.Trim() & "%")
                End If

                ' Contest filter
                If drpContest.SelectedValue = "0" Then
                    cmd.Parameters.AddWithValue("@ContestName", DBNull.Value)
                Else
                    cmd.Parameters.AddWithValue("@ContestName", drpContest.SelectedItem.Text)
                End If

                Using sda As New MySqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)

                    lblRecords.Text = dt.Rows.Count
                    gvEvent.DataSource = dt
                    gvEvent.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Function GetFileLinks(files As Object) As String
        If files Is Nothing OrElse String.IsNullOrWhiteSpace(files.ToString()) Then
            Return "<span style='color: #999;'>No files</span>"
        End If

        Dim uploadFolderVirtual As String = "~/Uploads/CreativeCompetition/"
        Dim fileList As String() = files.ToString().Split(","c)
        Dim sb As New StringBuilder()

        For Each fileName In fileList
            Dim trimmedName As String = fileName.Trim()
            If Not String.IsNullOrEmpty(trimmedName) Then
                'Dim filePath As String = ResolveUrl(uploadFolderVirtual & trimmedName)
                'Dim ext As String = IO.Path.GetExtension(trimmedName).ToLower()
                Dim encodedName As String = HttpUtility.UrlPathEncode(trimmedName)
                Dim filePath As String = ResolveUrl(uploadFolderVirtual & encodedName)
                Dim ext As String = IO.Path.GetExtension(trimmedName).ToLower
                ' sb.Append($"<span style='color: #999;'>{fileName}</span></br>")
                sb.Append($"<span style='color: #999;'>{trimmedName}</span><br/>")
                ' Download button
                '  sb.Append($"<a href='{filePath}' download='{trimmedName}' style='display:inline-block; margin:2px; padding:6px 10px; border:1px solid #007bff; border-radius:5px; color:#007bff; text-decoration:none; font-size:13px;'><i class='fa fa-download'></i> Download</a>")

                ' Preview button
                ' sb.Append($"<a href='javascript:void(0)' onclick=""showPreview('{filePath}','{ext}');"" style='display:inline-block; margin:2px; padding:6px 10px; border:1px solid #28a745; border-radius:5px; color:#28a745; text-decoration:none; font-size:13px;'><i class='fa fa-eye'></i> Preview</a>")

                ' Download button
                sb.Append($"<a href='{filePath}' download='{trimmedName}' style='display:inline-block; margin:2px; padding:6px 10px; border:1px solid #007bff; border-radius:5px; color:#007bff; text-decoration:none; font-size:13px;'>
                     <i class='fa fa-download'></i> Download</a>")

                ' Preview button
                sb.Append($"<a href='javascript:void(0)' onclick=""showPreview('{filePath}','{ext}');"" style='display:inline-block; margin:2px; padding:6px 10px; border:1px solid #28a745; border-radius:5px; color:#28a745; text-decoration:none; font-size:13px;'>
                    <i class='fa fa-eye'></i> Preview</a>")
            End If
        Next

        ' Modal (only once)
        sb.Append("<div id='filePreviewModal' style='display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); justify-content:center; align-items:center; z-index:9999;'>
                <div style='background:#000; color:#fff; padding:20px; border-radius:8px; max-width:90%; max-height:90%; overflow:auto; position:relative;'>
                    <span style='position:absolute; top:5px; right:10px; cursor:pointer; font-size:20px;' onclick='closePreview()'>&times;</span>
                    <div id='previewContent'></div>
                </div>
               </div>")

        Return sb.ToString()
    End Function



    Shared csvSplit As Regex = New Regex("(?:^|,)(""(?:[^""]+|"""")*""|[^,]*)", RegexOptions.Compiled)

    Public Shared Function SplitCSV(ByVal input As String) As String()
        Dim list As List(Of String) = New List(Of String)()
        Dim curr As String = Nothing
        If input <> Nothing Then
            For Each match As Match In csvSplit.Matches(input)
                curr = match.Value

                If 0 = curr.Length Then
                    list.Add("")
                End If

                list.Add(curr.TrimStart(","c))
            Next
        Else
            list.Add("")
        End If

        Return list.ToArray()
    End Function

    Private Function CleanTime(value As String) As String
        If DateTime.TryParse(value, Nothing) Then
            Return DateTime.Parse(value).ToString("HH:mm:ss")
        End If
        Return value
    End Function

    Protected Sub gvEvent_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim registrationId As Integer = Convert.ToInt32(gvEvent.DataKeys(e.RowIndex).Value)
            Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

            Using con As New MySqlConnection(constr)
                con.Open()

                Using cmdSelect As New MySqlCommand("SELECT FileName FROM CreativeCompetitionUploads WHERE RegistrationId = @RegId", con)
                    cmdSelect.Parameters.AddWithValue("@RegId", registrationId)
                    Using dr As MySqlDataReader = cmdSelect.ExecuteReader()
                        While dr.Read()
                            Dim filePath As String = Server.MapPath("~/Uploads/CreativeCompetition/" & dr("FileName").ToString())
                            If File.Exists(filePath) Then
                                File.Delete(filePath)
                            End If
                        End While
                    End Using
                End Using

                Using cmdDeleteUploads As New MySqlCommand("DELETE FROM CreativeCompetitionUploads WHERE RegistrationId = @RegId", con)
                    cmdDeleteUploads.Parameters.AddWithValue("@RegId", registrationId)
                    cmdDeleteUploads.ExecuteNonQuery()
                End Using

                Using cmdDeleteReg As New MySqlCommand("DELETE FROM RegistrationCreativeCompetition WHERE Id = @RegId", con)
                    cmdDeleteReg.Parameters.AddWithValue("@RegId", registrationId)
                    cmdDeleteReg.ExecuteNonQuery()
                End Using
            End Using

            MessageUpdated.Text = "<b>Participant and all their uploads have been deleted successfully.</b>"
            MessageUpdated.ForeColor = Drawing.Color.Green

            BindGridView()
        Catch ex As Exception
            MessageUpdated.Text = "<b>Error deleting record: </b>" & ex.Message
            MessageUpdated.ForeColor = Drawing.Color.Red
        End Try
    End Sub


    Protected Sub gvEvent_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvEvent.PageIndex = e.NewPageIndex
        Me.BindGridView()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.BindGridView()
    End Sub

    Protected Sub gvEvent_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = Regex.Replace(e.Row.Cells(0).Text, txtSearch.Text.Trim(),
            Function(match As Match) String.Format("<span style='background-color:#D9EDF7'>{0}</span>", match.Value),
                        RegexOptions.IgnoreCase)
        End If

    End Sub

    Protected Sub AddButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/RegistrationCreativeCompetition.aspx")
    End Sub

    Protected Sub gvEvent_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "EditRecord" Then
            Dim participantId As Integer = Convert.ToInt32(e.CommandArgument)
            Response.Redirect("~/UpdateUserCreativeCompetition.aspx?UserId=" & participantId)
        End If
    End Sub


End Class