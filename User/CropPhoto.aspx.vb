Imports System.Drawing

Partial Class user_CropPhoto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim W_ As Integer = Request.QueryString("W")
        Dim H_ As Integer = Request.QueryString("H")

        Dim bm As New Bitmap(MapPath("~\content\images\Profile\Photo\" + Request.QueryString("P")))

        Dim W As Integer = bm.Width
        Dim H As Integer = bm.Height

        Dim thumb As New Bitmap(W, H)

        If W > W_ And H > H_ Then 'اگر طول خود عکس از طول ارسال شده بیشر باشد به اندازه آن کراپ می شود 
            Dim bt_Ret As New Bitmap(CropBitmap(bm, 0, 0, W_, H_))
            thumb = bt_Ret
            GoTo ali
        End If

        If H > H_ Then 'اگر طول خود عکس از طول ارسال شده بیشر باشد به اندازه آن کراپ می شود 
            Dim bt_Ret As New Bitmap(CropBitmap(bm, 0, 0, W, H_))
            thumb = bt_Ret
            GoTo ali
        End If

        If W > W_ Then 'اگر طول خود عکس از طول ارسال شده بیشر باشد به اندازه آن کراپ می شود 
            Dim bt_Ret As New Bitmap(CropBitmap(bm, 0, 0, W_, H))
            thumb = bt_Ret
            GoTo ali
        End If
ali:

        Dim g As Graphics = Graphics.FromImage(thumb)
        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        g.DrawImage(bm, New Rectangle(0, 0, W, H), New Rectangle(0, 0, bm.Width, bm.Height), GraphicsUnit.Pixel)
        Response.ContentType = "image/jpeg"
        thumb.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)
        g.Dispose()

    End Sub

    Private Function CropBitmap(ByRef bmp As Bitmap, ByVal cropX As Integer, ByVal cropY As Integer, ByVal cropWidth As Integer, ByVal cropHeight As Integer) As Bitmap
        Dim rect As New Rectangle(cropX, cropY, cropWidth, cropHeight)
        Dim cropped As Bitmap = bmp.Clone(rect, bmp.PixelFormat)
        Return cropped
    End Function

End Class
