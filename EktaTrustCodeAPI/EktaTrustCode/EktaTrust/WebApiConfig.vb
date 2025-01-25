Imports System.Web.Http

Public Class WebApiConfig
    Public Shared Sub Register(ByVal config As HttpConfiguration)
        config.Routes.MapHttpRoute(name:="DefaultApi", routeTemplate:="api/{controller}/{action}/{id}", defaults:=New With {Key .id = RouteParameter.[Optional]
    })
    End Sub

End Class
