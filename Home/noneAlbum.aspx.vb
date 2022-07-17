
Partial Class home_noneAlbum
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Sections As New View_Users_Sections

    Public Sub ShowPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/noneAlbum.aspx?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    End Sub

    Public Function CountComment(ByVal code As Object) As String
        Return String.Format("تعداد نظر ها: {0}", ClassProfile_Sections.GetCountPictureCommet(code))
    End Function

    Public Function CountLike(ByVal code As Object) As String
        Return String.Format("تعداد لایک ها: {0}", ClassProfile_Sections.GetCountPictureLike(code))
    End Function

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\PhotoDetail.aspx?code=" + e.CommandArgument + "&user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    End Sub

    Public Sub DownloadFile(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("~/content/images/profile/photo/" + e.CommandArgument, "_blank", "")
    End Sub

    Public Function ControlText(ByVal detail As Object) As String
        Return detail.ToString
    End Function

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

    Protected Sub btnCancelToTransfer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToTransfer.Click
        Session.Remove("CodeObject")
        Session.Remove("AlbumCode")
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub btnAcceptToTransfer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToTransfer.Click
        If Session("CodeObject") <> "" And Session("AlbumCode") <> "" Then
            ClassHome.InsertPhotoAlbum(Session("AlbumCode"), Session("MY-UsErNaMe"), Session("CodeObject"))
            Dl_Photos.DataBind()
            Session.Remove("CodeObject")
            Session.Remove("AlbumCode")
            Response.Redirect("~\home\Photos.aspx?code=" + Session("AlbumCode"))
        Else
            MultiView.ActiveViewIndex = 2
        End If
    End Sub

    Public Sub DeletePhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("CodeObject") = e.CommandArgument
        If Dl_Photos.Items.Count = 0 Then
            Response.Redirect("~/home/album.aspx")
        End If
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassHome.DeletePhoto(Session("CodeObject"))
        Session.Remove("CodeObject")
        Dl_Photos.DataBind()
        Response.Redirect("~\home\Album.aspx")
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        Session.Remove("CodeObject")
        MultiView.ActiveViewIndex = 2
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("عکس های آلبوم نشده - {0}", ClassProfile_Sections.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    '------------------------- Redirect -----------------------------

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

End Class

