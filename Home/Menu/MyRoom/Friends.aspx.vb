
Partial Class home_Menu_MyRoom_Friends
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub UpdatePanel1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePanel1.Load
        If RB_Farsi.Checked Then
            DG.DataSource = ClassHomeSetting.SelectSearchFriends(0, Session("MY-UsErNaMe"), txtSearch.Text, txtSearch.Text)
        End If
        If RB_Engilis.Checked Then
            DG.DataSource = ClassHomeSetting.SelectSearchFriends(1, Session("MY-UsErNaMe"), txtSearch.Text, txtSearch.Text)
        End If
        DG.DataBind()
    End Sub

    Public Function SetAvatar(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=80&H=80"
    End Function

    Public Function SetName(ByVal user As Object) As String
        Return ClassProfile_Section.GetFnLn(user.ToString)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("دوستان - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    Protected Sub DG_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DG.PageIndexChanging
        DG.PageIndex = e.NewPageIndex
    End Sub

End Class

