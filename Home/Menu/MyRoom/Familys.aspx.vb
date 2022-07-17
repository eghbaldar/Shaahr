
Partial Class home_Menu_MyRoom_Familys
    Inherits System.Web.UI.Page

    Dim ClassProfileHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub UpdatePanel1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePanel1.Load
        If RB_Farsi.Checked Then
            DG.DataSource = ClassHomeSetting.SelectSearchFamily(0, Session("MY-UsErNaMe"), txtSearch.Text, txtSearch.Text)
        End If
        If RB_Engilis.Checked Then
            DG.DataSource = ClassHomeSetting.SelectSearchFamily(1, Session("MY-UsErNaMe"), txtSearch.Text, txtSearch.Text)
        End If
        DG.DataBind()
    End Sub

    Public Function SetAvatar(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=80&H=80"
    End Function

    Public Function SetName(ByVal user As Object) As String
        Return ClassProfile_Section.GetFnLn(user.ToString)
    End Function

    Public Function GteType(ByVal user As Object) As String
        Dim s As String = "( " + ClassProfileHome.WhichFamily(ClassHomeSetting.GetTypeFamily(user.ToString, Session("MY-UsErNaMe"))) + " )"
        Return "<span style='font-size:10px;color:#435e78;'>" + s + "</span>"
    End Function
    '
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("بستگان - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    Protected Sub DG_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DG.PageIndexChanging
        DG.PageIndex = e.NewPageIndex
    End Sub
End Class
