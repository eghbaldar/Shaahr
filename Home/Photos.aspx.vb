Imports System.IO
Imports System.Drawing

Partial Class home_PhotoAlbum
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim classProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Public Sub ShowPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Session("PhotoDefaultPage") = True
        Response.Redirect("~\user\DetailPost.aspx?code=" + s(0) + "&user=" + classProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    End Sub

    Public Function CountComment(ByVal code As Object) As String
        Return String.Format("تعداد نظر ها: {0}", ClassProfile_Section.GetCountPictureCommet(code))
    End Function

    Public Function CountLike(ByVal code As Object) As String
        Return String.Format("تعداد لایک ها: {0}", ClassProfile_Section.GetCountPictureLike(code))
    End Function

    Public Sub DownloadFile(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("~/content/images/profile/photo/" + e.CommandArgument, "_blank", "")
    End Sub

    Public Shared Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)

        Dim context As HttpContext = HttpContext.Current
        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then
            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)
            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If
            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If

    End Sub

    Public Function ControlText(ByVal detail As Object) As String
        Return detail.ToString
    End Function

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/PhotoDetail.aspx?code=" + e.CommandArgument + "&User=" + classProfile.getUsernameByEmail(Session("MY-UsErNaMe")))

    End Sub

    Public Sub DeletePhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("CodeObject") = e.CommandArgument
        MultiView.ActiveViewIndex = 0
    End Sub

    Public Sub Transfer(ByVal Sender As Object, ByVal e As CommandEventArgs)

        Dim b As ImageButton = CType(Sender, ImageButton)
        Dim s() As String = b.ClientID.ToString.Split("_")
        Dim AfterFilter = s(4).Substring(3, s(4).Length - 3)

        For i As Long = 0 To Dl_Photos.Controls.Count - 1

            Dim dl As DropDownList = Dl_Photos.Items(i).FindControl("Items")
            Dim s2() As String = dl.ClientID.ToString.Split("_")
            Dim AfterFilter2 = s2(4).Substring(3, s2(4).Length - 3)
            If AfterFilter = AfterFilter2 Then
                Session("AlbumCode") = dl.SelectedValue
            End If
        Next
        Session("CodeObject") = e.CommandArgument
        MultiView.ActiveViewIndex = 1

    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassHome.DeletePhoto(Session("CodeObject"))
        Session.Remove("CodeObject")
        Dl_Photos.DataBind()
        MultiView.ActiveViewIndex = 2
        CheckEmptyFullPhoto()
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        Session.Remove("CodeObject")
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub btnAcceptToTransfer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToTransfer.Click

        ClassHome.UpdatePhotoAlbum(Session("AlbumCode"), Session("MY-UsErNaMe"), Session("CodeObject"))
        Session.Remove("CodeObject")
        Session.Remove("AlbumCode")
        Dl_Photos.DataBind()
        MultiView.ActiveViewIndex = 2

    End Sub

    Protected Sub btnCancelToTransfer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToTransfer.Click
        Session.Remove("CodeObject")
        Session.Remove("AlbumCode")
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub btnUploadPhoto_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUploadPhoto.Click
        MultiView.ActiveViewIndex = 3
    End Sub

    Protected Sub btnCancelUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelUpload.Click
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub btnSendPhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendPhoto.Click

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If txtPhoto.Text = "" Or txtPhoto.Text = "توضیحات تصویر شما ..." Then Exit Sub
        ''
        If PhotoUpload.FileName <> "" Then
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = Session("MY-UsErNaMe") + "_" + Filename
            Dim FileInforamtion As New FileInfo(PhotoUpload.FileName)
            Try
                ''''''''''' Checking '''''''''''
                If Not AccVolume(PhotoUpload.PostedFile.ContentLength.ToString) Then
                    lblError.Text = "حجم مصرفی خانه شما توانایی گنجایش این فایل را ندارد."
                Else
                    '
                    PhotoUpload.SaveAs(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                    '--------------------- Agar error dadah yani File Aks nist
                    Dim bt_ As New Bitmap(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                    Dim c As Color = bt_.GetPixel(1, 1)

                    classProfile.InsertObject(Session("MY-UsErNaMe"), Session("MY-UsErNaMe"), 0, Filename + FileInforamtion.Extension, IIf(txtPhoto.Text = "توضیحات تصویر شما ...", "", txtPhoto.Text))
                    ClassHome.InsertPhotoAlbum(Request.QueryString("code"), Session("MY-UsErNaMe"), ClassHome.GetLastCodeObject_ForPhoto(Session("MY-UsErNaMe")))
                    Dl_Photos.DataBind()
                    MultiView.ActiveViewIndex = 2
                    txtPhoto.Text = "توضیحات تصویر شما ..."
                End If
            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                    lblError.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                End If
            End Try
        End If
        CheckEmptyFullPhoto()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Albumname As String
        Albumname = " {" + ClassProfile_Section.GetAlbumNameByCode(Request.QueryString("code")) + "} "
        Title = String.Format("آلبوم تصاویر {0} از پروفایل {1}", Albumname, ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        lblAlbumName.Text = ClassProfile_Section.GetAlbumNameByCode(Request.QueryString("code"))
        lblAlbumName_.Text = ClassProfile_Section.GetAlbumNameByCode(Request.QueryString("code"))
        CheckEmptyFullPhoto()
    End Sub

    Private Sub CheckEmptyFullPhoto()
        If Dl_Photos.Items.Count = 0 Then
            lblNotPhoto.Text = "<div style='padding:5px;'>عکسی برای نمایش وجود ندارد.</div>"
        Else
            lblNotPhoto.Text = ""
        End If
    End Sub

    Protected Sub btnDeleteAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDeleteAlbum.Click
        ClassProfile_Section.DeleteAlbum(Request.QueryString("code"))
        Response.Redirect("~\home\album.aspx")

    End Sub

    Protected Sub btnCancelDeleteAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelDeleteAlbum.Click
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub BtnAlbumDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnAlbumDelete.Click
        MultiView.ActiveViewIndex = 4
    End Sub

End Class
