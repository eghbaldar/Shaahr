Imports System.Drawing

Partial Class user_RandomAvatar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '------------- Resize and Crop
        Dim FilePath As String = Request.QueryString("name")
        Dim bm As New Bitmap(FilePath)

        Dim thumb As New Bitmap(100, 75)

        Dim g As Graphics = Graphics.FromImage(thumb)

        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic

        g.DrawImage(bm, New Rectangle(0, 0, 100, 75), New Rectangle(0, 0, bm.Width, bm.Height), GraphicsUnit.Pixel)

        Dim bt_Ret As New Bitmap(CropBitmap(thumb, 0, 0, 97, 72))

        Response.ContentType = "image/jpeg"
        bt_Ret.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)

        g.Dispose()

    End Sub

    Private Function CropBitmap(ByRef bmp As Bitmap, ByVal cropX As Integer, ByVal cropY As Integer, ByVal cropWidth As Integer, ByVal cropHeight As Integer) As Bitmap
        Dim rect As New Rectangle(cropX, cropY, cropWidth, cropHeight)
        Dim cropped As Bitmap = bmp.Clone(rect, bmp.PixelFormat)
        Return cropped
    End Function

End Class
