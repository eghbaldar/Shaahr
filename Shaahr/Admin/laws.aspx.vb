
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
        Title = "ساختمان مدیریتی شهر دات کام - قوانین ، مقررات و جزییات"
        SetButton()
    End Sub

    Private Sub SetButton()
        btnLawPresedent.NewText = "ریاست جمهوری"
        btnLawPresedent.UrlMode = False
        btnLawPresedent.Url = "laws.aspx?L=LawP"

        btnLawOstan1.NewText = "استان اول"
        btnLawOstan1.UrlMode = False
        btnLawOstan1.Url = "laws.aspx?L=LawS1"

        btnLawOstan2.NewText = "استان دوم"
        btnLawOstan2.UrlMode = False
        btnLawOstan2.Url = "laws.aspx?L=LawS2"

        btnLawOstan3.NewText = "استان سوم"
        btnLawOstan3.UrlMode = False
        btnLawOstan3.Url = "laws.aspx?L=LawS3"

        btnLawOstan4.NewText = "استان چهارم"
        btnLawOstan4.UrlMode = False
        btnLawOstan4.Url = "laws.aspx?L=LawS4"

        btnLawOstan5.NewText = "استان پنجم"
        btnLawOstan5.UrlMode = False
        btnLawOstan5.Url = "laws.aspx?L=LawS5"

        btnLawEstablishShaahr.NewText = "تاسیس شهر"
        btnLawEstablishShaahr.UrlMode = False
        btnLawEstablishShaahr.Url = "laws.aspx?L=LawSs"

        btnLawShaahr.NewText = "شهر"
        btnLawShaahr.UrlMode = False
        btnLawShaahr.Url = "laws.aspx?L=LawS"
    End Sub

    Protected Sub ODS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS.Selecting

        Select Case Request.QueryString("L")
            Case "LawP"
                e.InputParameters("type") = "0"
            Case "LawS1"
                e.InputParameters("type") = "1"
            Case "LawS2"
                e.InputParameters("type") = "2"
            Case "LawS3"
                e.InputParameters("type") = "3"
            Case "LawS4"
                e.InputParameters("type") = "4"
            Case "LawS5"
                e.InputParameters("type") = "5"
            Case "LawSs"
                e.InputParameters("type") = "6"
            Case "LawS"
                e.InputParameters("type") = "7"
        End Select

    End Sub

End Class
