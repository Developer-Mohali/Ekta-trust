Public Class AdminSideMenuControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("RoleId") IsNot Nothing Then
                Dim roleId As Integer = Convert.ToInt32(Session("RoleId"))
                divShowHideMenu.Visible = (roleId <> 3)
            Else
                divShowHideMenu.Visible = True
            End If
        End If
    End Sub

End Class