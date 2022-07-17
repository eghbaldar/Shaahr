
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
        Title = String.Format("شهر: {0}", ClassCMSShaahr.GetNameShaahr(ShaahrCode))

        If Session("MY-UsErNaMe") = "" Or (Not ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode)) Then
            Div.Visible = False
        End If

    End Sub

    Protected Sub RedirectUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Protected Sub ODS_Users_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Users.Selecting
        e.InputParameters("Code_Shaahr") = ShaahrCode
    End Sub

End Class
