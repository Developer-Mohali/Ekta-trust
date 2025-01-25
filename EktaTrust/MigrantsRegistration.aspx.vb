Imports MySql.Data.MySqlClient

Public Class MigrantsRegistration
    Inherits System.Web.UI.Page
    Public Function Reset()
        textName.Text = ""
        TextAddress.Text = ""
        textMobile.Text = ""
        TextPresentAddress.Text = ""
        AdharcardNumber.Text = ""
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSubmitMessage_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim Statusmessages = String.Empty
        Using con As New MySqlConnection(constr)

            Using result As New MySqlCommand("Select MobileNumber From labourregistration WHERE MobileNumber = @MobileNumber and IsDeleted=0  and MobileNumber <>''")
                Using sda1 As New MySqlDataAdapter(result)
                    result.Connection = con
                    result.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                    Dim dt As New DataTable()
                    sda1.Fill(dt)
                    Dim number = textMobile.Text.Trim()
                    If (Regex.IsMatch(textMobile.Text.Trim(), "[1-9]{1}[0-9]{9}")) Then

                        If dt.Rows.Count <= 0 Then

                            Using cmd As New MySqlCommand("LabourRegistrationDetail")
                                Using sda As New MySqlDataAdapter()
                                    cmd.CommandType = CommandType.StoredProcedure
                                    cmd.Parameters.AddWithValue("@MigrantsId", 0)
                                    cmd.Parameters.AddWithValue("@Name", textName.Text.Trim())
                                    cmd.Parameters.AddWithValue("@AdharCardNumber", AdharcardNumber.Text.Trim())
                                    cmd.Parameters.AddWithValue("@MobileNumber", textMobile.Text.Trim())
                                    cmd.Parameters.AddWithValue("@PresentAddress", TextAddress.Text.Trim())
                                    cmd.Parameters.AddWithValue("@NativeAddress", TextPresentAddress.Text.Trim())
                                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                                    cmd.Parameters.AddWithValue("@IsDeleted", False)
                                    cmd.Connection = con
                                    con.Open()
                                    cmd.ExecuteNonQuery()
                                    con.Close()
                                    con.Dispose()
                                    lblErrorMsg.Visible = True
                                    lblErrorMsgMobile.Visible = False
                                    Statusmessages = "Success"
                                    lblErrorMsg.Text = "Submitted successfully. Thanks !"
                                    'SendEmail.log("ErrorStep11", Statusmessages, "MIPFacultyRegistration", "", "", "", "", "")
                                    Reset()


                                End Using
                            End Using



                        Else
                            lblErrorMsg.Visible = False
                            lblErrorMsgMobile.Visible = True
                            lblErrorMsgMobile.Text = "You are already registered with this number. Thanks !"
                        End If
                    Else

                        lblErrorMsgMobile.Text = "please enter valid number."
                        lblErrorMsgMobile.Visible = True
                    End If

                End Using



            End Using

        End Using
    End Sub
End Class