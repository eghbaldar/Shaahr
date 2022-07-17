
Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مدیریت طبقه بندی پست های شهرداری - {0}", ClassCMSShaahr.GetNameShaahr(Session("Mayor")))
        lblNameSHaahr.Text = ClassCMSShaahr.GetNameShaahr(Session("Mayor"))
        SetButton()
    End Sub

    Private Sub SetButton()
        btnMnu_ShowShaahr.NewText = "نمایش شهر"
        btnMnu_ShowShaahr.UrlMode = False
        btnMnu_ShowShaahr.Url = "~\Shaahr\Shaahr.aspx?sh=shaahr" + Session("Mayor")

        btnMnu_News.NewText = "اخبار شهرداری"
        btnMnu_News.UrlMode = False
        btnMnu_News.Url = "mayorpanel_news.aspx"

        btnMnu_assist.NewText = "معاونین شهردار"
        btnMnu_assist.UrlMode = False
        btnMnu_assist.Url = "mayorpanel_MayorAssist.aspx"

        btnMnu_Cate.NewText = "طبقه بندی ها و پست ها"
        btnMnu_Cate.UrlMode = False
        btnMnu_Cate.Url = "mayorpanel_CatPost.aspx"

        btnMnu_FristPage.NewText = "صفحه اصلی مدیریتی"
        btnMnu_FristPage.UrlMode = False
        btnMnu_FristPage.Url = "mayorpanel.aspx"

    End Sub

    Protected Sub btnInsertCat_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertCat.Click
        Dim flag As Boolean
        If rbOpenLuck.Items(0).Selected Then flag = True
        If rbOpenLuck.Items(1).Selected Then flag = False
        ClassShaahr.InsertShaahrCategory(Session("Mayor"), txtSubject.Text, txtDetail.Text, flag)
        txtDetail.Text = ""
        txtSubject.Text = ""
        DgCategory.DataBind()
    End Sub

    Public Sub DeleteCateogry(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(0, e.CommandArgument)
        DgCategory.DataBind()
    End Sub

    Public Sub DeletePost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(1, e.CommandArgument)
        Dg_Post.DataBind()
    End Sub

    Public Sub ShowPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\threadShow.aspx?cdP=" + e.CommandArgument + "&Sh=Shaahr" + Session("Mayor"))
    End Sub

End Class
