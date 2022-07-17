Imports System.Data

Partial Class user_photos
    Inherits System.Web.UI.Page

    Dim classProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile

    Dim em_owner As String   'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = classProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Dim Albumname As String
        Albumname = " ( " + ClassProfile_Section.GetAlbumNameByCode(Request.QueryString("code")) + " ) "

        Title = String.Format("آلبوم تصاویر {0} از پروفایل {1}", Albumname, ClassProfile_Section.GetFnLn(em_owner))
        lblTitleInformation.Text = String.Format("آلبوم تصاویر {0}", Albumname)

    End Sub

    Public Function CountComment(ByVal code As Object) As String
        Return String.Format("تعداد نظر ها: {0}", ClassProfile_Section.GetCountPictureCommet(code))
    End Function

    Public Function CountLike(ByVal code As Object) As String
        Return String.Format("تعداد لایک ها: {0}", ClassProfile_Section.GetCountPictureLike(code))
    End Function

    Public Sub ShowPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/DetailPost.aspx?user=" + Request.QueryString("user") + "&code=" + e.CommandArgument.ToString)
    End Sub

    Public Function ControlText(ByVal detail As Object) As String
        If detail.ToString().Length > 50 Then
            Return detail.ToString().Substring(0, 50)
        Else
            Return detail.ToString
        End If
    End Function

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + classProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    Public Sub GotoToNazmie(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Dim S As String() = e.CommandArgument.ToString.Split("|")
        Response.Redirect(("~/Stage/Nazmie/report.aspx?link=shaahr.com/user/DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(S(1)) + "&code=" + S(0)).Replace("&", "|"))
    End Sub

    '-----------------------

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

End Class
