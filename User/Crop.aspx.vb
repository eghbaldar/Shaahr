Imports System.Drawing

Partial Class user_Crop
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ''------------ Resize (GoooD :D)
        Dim W As Integer = Request.QueryString("W")
        Dim H As Integer = Request.QueryString("H")
        Dim bm As New Bitmap(MapPath("~/content/images/profile/avatars/" + Request.QueryString("P")))
        Dim thumb As New Bitmap(W, H)
        Dim g As Graphics = Graphics.FromImage(thumb)
        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        g.DrawImage(bm, New Rectangle(0, 0, W, H), New Rectangle(0, 0, bm.Width, bm.Height), GraphicsUnit.Pixel)
        Response.ContentType = "image/jpeg"
        thumb.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)
        g.Dispose()
        ''------------- Crop
        'Dim FilePath As String = MapPath("~/content/images/profile/avatars/" + Request.QueryString("P"))
        'Dim bt As New Bitmap(FilePath)
        'Dim bt_Ret As New Bitmap(CropBitmap(bt, 0, 0, Request.QueryString("W"), Request.QueryString("H")))

        'Response.ContentType = "image/jpeg"
        'bt_Ret.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)

    End Sub

    'Private Function CropBitmap(ByRef bmp As Bitmap, ByVal cropX As Integer, ByVal cropY As Integer, ByVal cropWidth As Integer, ByVal cropHeight As Integer) As Bitmap
    '    Dim rect As New Rectangle(cropX, cropY, cropWidth, cropHeight)
    '    Dim cropped As Bitmap = bmp.Clone(rect, bmp.PixelFormat)
    '    Return cropped
    'End Function

End Class
