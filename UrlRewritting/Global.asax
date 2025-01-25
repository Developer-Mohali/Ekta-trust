<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">
    Private Sub Application_Start(sender As Object, e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
    End Sub

    Private Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute("asd", "Home", "~/Home.aspx")
        routes.MapPageRoute("Contact", "Contact", "~/Contact.aspx")
    End Sub
</script>
