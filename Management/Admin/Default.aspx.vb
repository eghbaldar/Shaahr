
Partial Class Management_Admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
        Title = "پنل مدیریتی شهر دات کام"
    End Sub

    Protected Sub btnContact_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnContact.Click
        Redirect("~\Management\admin\contact.aspx", "_Blank", "")
    End Sub

    Protected Sub btnNews_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNews.Click
        Redirect("~\Management\admin\news.aspx", "_Blank", "")
    End Sub

    Protected Sub btnAmar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAmar.Click
        Redirect("~\Management\admin\Statistical.aspx", "_Blank", "")
    End Sub

    Protected Sub btnPost_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPost.Click
        Redirect("~\Management\admin\post.aspx", "_Blank", "")
    End Sub

    Protected Sub btnLocation_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLocation.Click
        Redirect("~\Management\admin\Country-State-Citys.aspx", "_Blank", "")
    End Sub

    Protected Sub btnFavorits_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFavorits.Click
        Redirect("~\Management\admin\favorits.aspx", "_Blank", "")
    End Sub

    Protected Sub btnUniversity_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUniversity.Click
        Redirect("~\Management\admin\University.aspx", "_Blank", "")
    End Sub

    Protected Sub btnSystemControl_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSystemControl.Click
        Redirect("~\Management\admin\Management.aspx", "_Blank", "")
    End Sub

    Protected Sub btnUsers_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUsers.Click
        Redirect("~\Management\admin\UsersManagement.aspx", "_Blank", "")
    End Sub

    Protected Sub btnGroupMsg_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGroupMsg.Click
        Redirect("~\Management\admin\GroupMsg.aspx", "_Blank", "")
    End Sub

    Protected Sub btnFile_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFile.Click
        Redirect("~\Management\admin\FileManagement.aspx", "_Blank", "")
    End Sub

    Protected Sub btnJiring_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnJiring.Click
        Redirect("~\Management\admin\Jiring.aspx", "_Blank", "")
    End Sub

    Protected Sub btnNazmie_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNazmie.Click
        Redirect("~\Management\admin\nazmie.aspx", "_Blank", "")
    End Sub

    Protected Sub btnCharacter3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCharacter3.Click
        Redirect("~\Management\admin\Character3.aspx", "_Blank", "")
    End Sub

    Protected Sub btnEvents_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEvents.Click
        Redirect("~\Management\admin\events.aspx", "_Blank", "")
    End Sub

    Protected Sub btnTodayBirth_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnTodayBirth.Click
        Redirect("~\Management\admin\TodayBirthday.aspx", "_Blank", "")
    End Sub

    Protected Sub btnIP_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIP.Click
        Redirect("~\Management\admin\ip.aspx", "_Blank", "")
    End Sub

    Protected Sub btnForget_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnForget.Click
        Redirect("~\Management\admin\forget.aspx", "_Blank", "")
    End Sub

    Protected Sub btnStatementSecure_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnStatementSecure.Click
        Redirect("~\Management\admin\StatementSecurity.aspx", "_Blank", "")
    End Sub

    Protected Sub btnHazfVisit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHazfVisit.Click
        Redirect("~\Management\admin\RemoveVisited.aspx", "_Blank", "")
    End Sub

    Protected Sub btnLoyaltyReward_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLoyaltyReward.Click
        Redirect("~\Management\admin\Loyalty_Reward.aspx", "_Blank", "")
    End Sub

    '--------- Shaahr ------------

    Protected Sub btnSettingShaahr_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSettingShaahr.Click
        Redirect("~\Management\admin\shaahr\ShaahrSetting.aspx", "_Blank", "")
    End Sub

    Protected Sub btnReqFundationShaahr_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnReqFundationShaahr.Click
        Redirect("~\Management\admin\shaahr\Shaahrs.aspx", "_Blank", "")
    End Sub

    Protected Sub btnMasolinShaahr_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMasolinShaahr.Click
        Redirect("~\Management\admin\shaahr\MasolinShaahr.aspx", "_Blank", "")
    End Sub

    Protected Sub btnShaahrLaw_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnShaahrLaw.Click
        Redirect("~\Management\admin\shaahr\ShaahrLaw.aspx", "_Blank", "")
    End Sub

    Protected Sub btnCaptcha_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCaptcha.Click
        Redirect("~\Management\admin\Captcha.aspx", "_Blank", "")
    End Sub

    Protected Sub btnOnlineUser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnOnlineUser.Click
        Redirect("~\Management\admin\OnlineUsers.aspx", "_Blank", "")
    End Sub

    '------------------------------------------------------

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




