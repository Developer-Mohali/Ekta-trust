Public Class Literature
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub LinkButtonDownloadPdf_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.ContentType = "Application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=The Chamcha Age.pdf")
        Response.TransmitFile(Server.MapPath("~/Kanshi Ram book/The Chamcha Age.pdf"))
        Response.[End]()
    End Sub
End Class