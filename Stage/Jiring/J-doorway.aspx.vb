
Partial Class Stage_Jiring_J_doorway
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr
    Dim ClassEnter As New EnterUsers

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "پرداخت آنلاین بصورت درگاه - شهر"
        lblName.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
        lblEmail.Text = Session("MY-UsErNaMe")
        lblCurJiring.Text = ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))
        lblUsername.Text = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe"))
        Dim r As New Random
        lblCode.Text = r.Next(100000, 999999)

        lblName_.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
        lblEmail_.Text = Session("MY-UsErNaMe")
        lblCurJiring_.Text = ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))
        lblUsername_.Text = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe"))
        lblCode_.Text = lblCode.Text
        lblPrice_.Text = txtPrice.Text

    End Sub

    Protected Sub btnSaman_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSaman.Click
        MultiView.ActiveViewIndex = 1
        lblBank_.Text = "سامان"
    End Sub
    Protected Sub btnTejarat_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnTejarat.Click
        MultiView.ActiveViewIndex = 1
        lblBank_.Text = "تجارت"
    End Sub
    Protected Sub btnParsian_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnParsian.Click
        MultiView.ActiveViewIndex = 1
        lblBank_.Text = "پارسان"
    End Sub
    Protected Sub btnPsargad_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPsargad.Click
        MultiView.ActiveViewIndex = 1
        lblBank_.Text = "پاسارگاد"
    End Sub

End Class
