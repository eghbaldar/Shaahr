
Partial Class Shaahr_Default2
    Inherits System.Web.UI.Page


    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Dim ShaahrCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShaahrCode = (Request.QueryString("sh")).ToLower.ToString.Replace("shaahr", " ").Trim
        Title = ClassShaahr.GetSubjectNews(Request.QueryString("iN"))
        If Not IsPostBack Then ClassShaahr.UpdateVisitNews(Request.QueryString("iN"))
    End Sub

    Protected Sub ODS_AllNews_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_AllNews.Selecting
        e.InputParameters("CodeShaahr") = ShaahrCode
    End Sub

    Public Sub GotoNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("ShaahrNews.aspx?iN=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode) 'cdT = CoDe Thread
    End Sub

End Class
