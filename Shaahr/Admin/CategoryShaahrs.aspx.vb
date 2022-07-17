
Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    '
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "ساختمان مدیریتی شهر دات کام - طبقه بندی های شهرها"
    End Sub

    Public Function GetCount(ByVal code As String) As String
        Return "(<b>" + ClassShaahr.GetCountFavoritsByCodeCategory(code) + "</b>)"
    End Function

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

End Class
