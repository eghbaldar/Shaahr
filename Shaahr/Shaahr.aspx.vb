Imports System.Data

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

        FillAuth()

        If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(5).ToString = "" Then
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Root\adsShaahr.png"
        Else
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Ads\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(5).ToString
        End If
        If Session("MY-UsErNaMe") = "" Or (Not ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode)) Then
            M_Users.ActiveViewIndex = 1
        End If

    End Sub

    Public Sub GotoThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("ShaahrThread.aspx?cdT=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode) 'cdT = CoDe Thread
    End Sub

    Protected Sub ODS_Cat_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Cat.Selecting
        e.InputParameters("CodeShaahr") = ShaahrCode
    End Sub

    Protected Sub ODS_News_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_News.Selecting
        e.InputParameters("CodeShaahr") = ShaahrCode
    End Sub

    Protected Sub ODS_Users_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Users.Selecting
        e.InputParameters("Code_Shaahr") = ShaahrCode
    End Sub

    Public Function CheckLuckPost(ByVal Code As String) As String
        Return Not ClassShaahr.GetLuckCategory(Code)
    End Function

    Public Function GetVisit(ByVal code As String) As String
        Try
            Return ClassShaahr.GetSumVisitPost(code)
        Catch ex As Exception
            If Err.Number = 5 Then Return "0"
        End Try
    End Function

    Public Function GetCountPost(ByVal code As String) As String
        Return ClassShaahr.GetCountPost(code)
    End Function

    Public Function GetLastUpdate(ByVal code As String) As String
        If ClassShaahr.GetlastUpdatePost(code) = "" Then
            Return "[ پستی وجود ندارد ]"
        Else
            Return ClassShaahr.GetlastUpdatePost(code)
        End If
    End Function

    Public Sub GotoNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("ShaahrNews.aspx?iN=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode) 'cdT = CoDe Thread
    End Sub

    Private Sub FillAuth()

        Dim rw As DataRow = ClassShaahr.MayorAssists(ShaahrCode).Rows(0)
        'Mayor
        imgMayor.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(ClassShaahr.GetMayor(ShaahrCode)) + "&W=110&H=110"
        lblNameMayor.Text = ClassProfile_Section.GetFnLn(ClassShaahr.GetMayor(ShaahrCode))
        'Assist 1
        If rw(0).ToString.Trim = String.Empty Then
            imgAssist_1.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
            lblNameAs1.Text = "کاربری تعیین نشده است."
        ElseIf rw(0).ToString.Trim <> String.Empty Then
            imgAssist_1.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(0).ToString) + "&W=110&H=110"
            lblNameAs1.Text = ClassProfile_Section.GetFnLn(rw(0))
        End If
        'Assist 2
        If rw(1).ToString.Trim = String.Empty Then
            imgAssist_2.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
            lblNameAs2.Text = "کاربری تعیین نشده است."
        ElseIf rw(1).ToString.Trim <> String.Empty Then
            imgAssist_2.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(1).ToString) + "&W=110&H=110"
            lblNameAs2.Text = ClassProfile_Section.GetFnLn(rw(1))
        End If

    End Sub

    Protected Sub ODS_LastPost_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_LastPost.Selecting
        e.InputParameters("code") = ShaahrCode
    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Public Sub GotoShowThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.UpdateVisitPost(e.CommandArgument)
        Response.Redirect("threadShow.aspx?cdP=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode)
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click
        If txtSearch.Text <> "" Then Response.Redirect("threadSearch.aspx?tS=" + Server.HtmlEncode(txtSearch.Text) + "&sh=shaahr" + ShaahrCode)
    End Sub

    Protected Sub RedirectUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

End Class
