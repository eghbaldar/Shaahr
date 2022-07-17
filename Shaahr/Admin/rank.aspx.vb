
Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "ساختمان مدیریتی شهر دات کام - رتبه بندی شهرها"
        SetButton()
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Private Sub SetButton()
        btnLawOstan1.NewText = "استان اول"
        btnLawOstan1.UrlMode = False
        btnLawOstan1.Url = "rank.aspx?cs=1"

        btnLawOstan2.NewText = "استان دوم"
        btnLawOstan2.UrlMode = False
        btnLawOstan2.Url = "rank.aspx?cs=2"

        btnLawOstan3.NewText = "استان سوم"
        btnLawOstan3.UrlMode = False
        btnLawOstan3.Url = "rank.aspx?cs=3"

        btnLawOstan4.NewText = "استان چهارم"
        btnLawOstan4.UrlMode = False
        btnLawOstan4.Url = "rank.aspx?cs=4"

        btnLawOstan5.NewText = "استان پنجم"
        btnLawOstan5.UrlMode = False
        btnLawOstan5.Url = "rank.aspx?cs=5"
    End Sub

End Class
