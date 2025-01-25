Public Class MIPTeam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim masterlbl As String = Request.QueryString("ExamType")
        If masterlbl = "RPSC" Then
            DivRPSC.Visible = True
            DivUPSC.Visible = False
        Else
            DivUPSC.Visible = True
            DivRPSC.Visible = False
        End If
    End Sub

End Class