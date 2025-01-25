Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports MySql.Data.MySqlClient
Public Class GenerateCaptcha
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Clear()
        Dim height As Integer = 40
        Dim width As Integer = 110
        Dim bmp As New Bitmap(width, height)
        Dim rectf As New RectangleF(12, 6, 0, 0)
        Dim g As Graphics = Graphics.FromImage(bmp)
        g.Clear(Color.White)
        g.SmoothingMode = SmoothingMode.AntiAlias
        g.InterpolationMode = InterpolationMode.HighQualityBicubic
        g.PixelOffsetMode = PixelOffsetMode.HighQuality
        g.DrawString(Session("captcha").ToString(), New Font("Cambria", 13, FontStyle.Bold), Brushes.Blue, rectf)
        g.DrawRectangle(New Pen(Color.Green), 1, 1, width - 15, height - 10)
        g.Flush()
        Response.ContentType = "image/jpeg"
        bmp.Save(Response.OutputStream, ImageFormat.Jpeg)
        g.Dispose()
        bmp.Dispose()
    End Sub

End Class