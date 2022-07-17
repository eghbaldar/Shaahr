Imports System.IO
Imports SD = System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports System.Drawing

Partial Class home_Menu_Setting_Avatars
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCharacter3 As New Character3

    Public Function BorderColorPanel(ByVal flag As Object) As System.Drawing.Color
        If flag = 1 Then
            Return System.Drawing.ColorTranslator.FromHtml("#396e83")
        ElseIf flag = 0 Then
            Return System.Drawing.ColorTranslator.FromHtml("#ccc")
        End If
    End Function

    Public Sub UpdateFlag(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.UpdateFlagAvatars(e.CommandArgument, Session("MY-UsErNaMe"))
        DL_Avatars.DataBind()
    End Sub

    Public Sub DeleteAvatar(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Session("AvatarID") = e.CommandArgument
        M_ShowAvatars.ActiveViewIndex = 1
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        Session.Remove("AvatarID")
        M_ShowAvatars.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassHomeSetting.DeleteAvatar(Session("AvatarID"))
        Session.Remove("AvatarID")
        M_ShowAvatars.ActiveViewIndex = 0
        DL_Avatars.DataBind()
    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpload.Click

        If Upload.FileName = Nothing Then Exit Sub
        '-----------------
        Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")

        Dim r As New Random
        Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Filename = Session("MY-UsErNaMe") + "_" + Filename
        Dim FileInforamtion As New FileInfo(Upload.FileName)
        Try
            If Not AccVolume(Upload.PostedFile.ContentLength.ToString) Then
                lblError.Text = "حجم مصرفی خانه شما توانایی گنجایش این فایل را ندارد."
            Else
                Upload.SaveAs(MapPath("~\content\images\Profile\TempAvatars\" + Filename + FileInforamtion.Extension))
                '--------------------- معتبر نبودن پسوند فایل برای جلوگیری از هک شدن 
                Dim bt As New Bitmap(MapPath("~\content\images\Profile\TempAvatars\" + Filename + FileInforamtion.Extension))
                Dim c As Color = bt.GetPixel(1, 1)
                '---------------------
                pnlUpload.Visible = False
                pnlCrop.Visible = True
                Session("ImageName") = Filename + FileInforamtion.Extension
                imgCrop.ImageUrl = "~\content\images\Profile\TempAvatars\" + Filename + FileInforamtion.Extension
                bt.Dispose()
            End If
        Catch ex As Exception
            If Err.Number = 5 Then
                File.Delete(MapPath("~\content\images\Profile\TempAvatars\" + Filename + FileInforamtion.Extension))
                lblError.Text = ".فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                pnlCrop.Visible = False
                Session.Remove("ImageName")
            End If
        End Try

    End Sub

    Private Function AccVolume(ByVal FileLentgh As Integer) As Boolean

        Dim count As Long
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Photo\"), Session("MY-UsErNaMe"), "tbl_Profile_Objects", "string_factor")
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Avatars\"), Session("MY-UsErNaMe"), "tbl_Profile_Avatars", "PicPath")
        If (52428800 - count) >= FileLentgh Then
            Return True 'allow to upload
        Else
            Return False 'reject to upload
        End If

    End Function

    Protected Sub btnCrop_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCrop.Click

        If W.Value = Nothing Or H.Value = Nothing Or X.Value = Nothing Or Y.Value = Nothing Then Exit Sub

        If CheckSize() Then
            lblError2.Text = "در برش آواتار خود به حد مجاز برش توجه کنید (از اندازه متغیر بالای تصویر استفاده کنید)"
            Exit Sub
        End If
        '
        Dim w__1 As Integer = Convert.ToInt32(W.Value)
        Dim h__2 As Integer = Convert.ToInt32(H.Value)
        Dim x__3 As Integer = Convert.ToInt32(X.Value)
        Dim y__4 As Integer = Convert.ToInt32(Y.Value)

        Dim CropImage As Byte() = Crop(MapPath("~\content\images\Profile\TempAvatars\" + Session("ImageName")), w__1, h__2, x__3, y__4)

        Using ms As New MemoryStream(CropImage, 0, CropImage.Length)
            ms.Write(CropImage, 0, CropImage.Length)
            Using CroppedImage As SD.Image = SD.Image.FromStream(ms, True)
                Dim SaveTo As String = MapPath("~\content\images\Profile\Avatars\" + Session("ImageName"))
                CroppedImage.Save(SaveTo, CroppedImage.RawFormat)
                pnlCrop.Visible = False
                pnlCropped.Visible = True
                pnlUpload.Visible = True
            End Using
        End Using
        ClassHomeSetting.InsertAvatar(Session("MY-UsErNaMe"), Session("ImageName"))
        File.Delete(MapPath("~\content\images\Profile\TempAvatars\" + Session("ImageName")))
        Session.Remove("ImageName")
        DL_Avatars.DataBind()
        lblError.Text = ""

    End Sub

    Private Function CheckSize() As Boolean

        Dim w__1 As Integer = Convert.ToInt32(W.Value)
        'If Not (w__1.ToString() > 294 And w__1.ToString() < 331) Then
        If Not (w__1.ToString() > 294) Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Shared Function Crop(ByVal Img As String, ByVal Width As Integer, ByVal Height As Integer, ByVal X As Integer, ByVal Y As Integer) As Byte()

        Try
            Using OriginalImage As SD.Image = SD.Image.FromFile(Img)
                Using bmp As New SD.Bitmap(Width, Height)
                    bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution)
                    Using Graphic As SD.Graphics = SD.Graphics.FromImage(bmp)
                        Graphic.SmoothingMode = SmoothingMode.AntiAlias
                        Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic
                        Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality
                        Graphic.DrawImage(OriginalImage, New SD.Rectangle(0, 0, Width, Height), X, Y, Width, Height, _
                         SD.GraphicsUnit.Pixel)
                        Dim ms As New MemoryStream()
                        bmp.Save(ms, OriginalImage.RawFormat)
                        Return ms.GetBuffer()
                    End Using
                End Using
            End Using
        Catch Ex As Exception
            Throw (Ex)
        End Try

    End Function

    Protected Sub btnCancelCrop_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelCrop.Click

        File.Delete(MapPath("~\content\images\Profile\TempAvatars\" + Session("ImageName")))
        Session.Remove("ImageName")
        pnlCrop.Visible = False
        pnlCropped.Visible = True
        pnlUpload.Visible = True
        lblError.Text = ""

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("آواتار - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    Public Function VisibleDelete(ByVal email As String) As Boolean
        If ClassHomeSetting.GetCountAvatars(Session("MY-UsErNaMe")) <= 1 Then
            Return False
        Else
            Return True
        End If
    End Function

End Class
