
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
        Title = String.Format(" طبقه بندی پست های شهرداری - | {0}", ClassShaahr.GetSubjectCategory(ShaahrCode))
        lblSearch.Text = String.Format("عبارت جستجو شده: {0}", "<b>" + Server.HtmlDecode(Request.QueryString("tS")) + "</b>")
    End Sub

    Protected Sub ODS_Search_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Search.Selecting
        e.InputParameters("text") = Server.HtmlDecode(Request.QueryString("tS"))
        e.InputParameters("codeshaahr") = ShaahrCode
    End Sub

    Public Sub GotoShowThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.UpdateVisitPost(e.CommandArgument)
        Response.Redirect("threadShow.aspx?cdP=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode)
    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

End Class
