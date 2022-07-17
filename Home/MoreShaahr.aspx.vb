
Partial Class Home_MoreShaahr
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim classProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("شهرهای اقامت گرفته - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

End Class
