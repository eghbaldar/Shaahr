
Partial Class Stage_Search_SearchResult
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "نتیجه جستجو - شهر"
        Select Case Request.QueryString("type")
            Case "allsearch"
                MultiView.ActiveViewIndex = 0
                If Not IsPostBack Then lblAllSearch.Text = String.Format("تعداد موارد پیدا شده: {0}", DG.Rows.Count)
            Case "subject"
                MultiView.ActiveViewIndex = 1
                If Not IsPostBack Then lblSubject.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_Subject.Rows.Count)
            Case "images"
                MultiView.ActiveViewIndex = 2
                If Not IsPostBack Then lblImage.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_Images.Rows.Count)
            Case "links"
                MultiView.ActiveViewIndex = 3
                If Not IsPostBack Then lblLink.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_Links.Rows.Count)
            Case "Citizen"
                MultiView.ActiveViewIndex = 4
                If Not IsPostBack Then lblCitizen.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_citizen.Rows.Count)
            Case "friends"
                MultiView.ActiveViewIndex = 5
                If Not IsPostBack Then lblfriends.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_friends.Rows.Count)
            Case "familys"
                MultiView.ActiveViewIndex = 6
                If Not IsPostBack Then lblFamilys.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_Familys.Rows.Count)
            Case "Shaahr"
                MultiView.ActiveViewIndex = 7
                If Not IsPostBack Then lblShaahrs.Text = String.Format("تعداد موارد پیدا شده: {0}", DL_Shaahr.Items.Count)
            Case "Mayor"
                MultiView.ActiveViewIndex = 8
                If Not IsPostBack Then lblMayor.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_Mayor.Rows.Count)
            Case "CitizenShaahrs"
                MultiView.ActiveViewIndex = 9
                If Not IsPostBack Then lblCitizenShaahrs.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_CitizenShaahrs.Rows.Count)
            Case "PostShaahrs"
                MultiView.ActiveViewIndex = 10
                If Not IsPostBack Then lblPostShaahr.Text = String.Format("تعداد موارد پیدا شده: {0}", DG_PostSHaahr.Rows.Count)
        End Select

    End Sub

    Protected Sub OSD_AllSearch_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OSD_AllSearch.Selecting
        Select Case Request.QueryString("type")
            Case "allsearch"
                e.InputParameters("index") = 1
            Case "subject"
                e.InputParameters("index") = 2
            Case "images"
                e.InputParameters("index") = 3
            Case "links"
                e.InputParameters("index") = 4
            Case "Shaahr"
                e.InputParameters("index") = 5
            Case "Mayor"
                e.InputParameters("index") = 6
            Case "CitizenShaahrs"
                e.InputParameters("index") = 7
            Case "PostShaahrs"
                e.InputParameters("index") = 8
        End Select
    End Sub

    Public Function SetAvatar(ByVal email As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=45&H=45"
    End Function

    Public Function SetTitle(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Public Function SetBirthDate(ByVal email As Object) As String
        Return String.Format("تولد: {0}", ClassProfileHome.GetBirthDateByEmail(email.ToString))
    End Function

    Public Function SetLocation(ByVal email As Object) As String
        Return ClassProfileHome.GetCountryStateByEmail(email.ToString)
    End Function

    Public Function ControlText(ByVal string_factor As Object) As String
        If string_factor.ToString().Length > 90 Then
            Return string_factor.ToString.Substring(0, 90) + "..."
        Else
            Return string_factor.ToString
        End If
    End Function

    Public Function ControlImage(ByVal Type As Object) As String
        Select Case Integer.Parse(Type)
            Case 0
                Return "~/content/images/Profile_View_Users/post_photo.png"
            Case 1
                Return "~/content/images/Profile_View_Users/post_link.png"
            Case 2
                Return "~/content/images/Profile_View_Users/post_post.png"
            Case 3
                Return "~/content/images/Profile_View_Users/post_polling.png"
        End Select
    End Function

    Public Sub DetailPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("~\user\DetailPost.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Public Function setUrl(ByVal code As Object, ByVal for_who As Object) As String
        Return "http:\\www.shaahr.com\user\DetailPost.aspx?code=" + code.ToString + "&user=" + ClassProfile.getUsernameByEmail(for_who.ToString)
    End Function

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Public Sub GotoShowThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        ClassShaahr.UpdateVisitPost(s(0))
        Response.Redirect("~/shaahr/threadShow.aspx?cdP=" + s(0) + "&Sh=Shaahr" + s(1))
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBack.Click
        Response.Redirect("~/stage/search/")
    End Sub

End Class
