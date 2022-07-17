Imports System.Data

Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مدیریت خبرهای شهرداری - {0}", ClassCMSShaahr.GetNameShaahr(Session("Mayor")))
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

    Public Function GetFN(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertNews.Click
        Dim flag As Boolean
        If rbInsert.Items(0).Selected Then flag = True
        If rbInsert.Items(1).Selected Then flag = False
        ClassShaahr.InsertShaahrNews(Session("Mayor"), txtSubjectInser.Text, txtTextInsert.Value, Session("MY-UsErNaMe"), flag)
        txtSubjectInser.Text = ""
        txtTextInsert.Value = ""
        DgNews.DataBind()
    End Sub

    Public Sub DeleteNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("NewsShaahr") = e.CommandArgument
        Pnl_DeleteNews.Visible = True
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        Pnl_DeleteNews.Visible = False
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassShaahr.Delete_ShaahrNews(Session("NewsShaahr"))
        Session.Remove("NewsShaahr")
        DgNews.DataBind()
        Pnl_DeleteNews.Visible = False
    End Sub

    Public Sub EditNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("NewsShaahr") = e.CommandArgument
        MultiView.ActiveViewIndex = 1

        Dim dr As DataRow = ClassShaahr.ShaahrNewsById(Session("Mayor"), e.CommandArgument).Rows(0)
        txtSubjectEdit.Text = dr(2)
        txtTextEdit.Value = Server.HtmlDecode(dr(3))
    End Sub

    Protected Sub btnEditNews_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEditNews.Click
        Dim flag As Boolean
        If rbEdit.Items(0).Selected Then flag = True
        If rbEdit.Items(1).Selected Then flag = False

        ClassShaahr.UpdateNews(txtSubjectEdit.Text, txtTextEdit.Value, flag, Session("NewsShaahr"))
        Session.Remove("NewsShaahr")
        MultiView.ActiveViewIndex = 0
        DgNews.DataBind()
    End Sub

    Protected Sub btnCancelEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelEdit.Click
        MultiView.ActiveViewIndex = 0
    End Sub



End Class