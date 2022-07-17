
Partial Class Shaahr_Admin_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "ساختمان مدیریتی شهر - مسئولیت من"
        If Session("MY-UsErNaMe") <> "" Then
            lblFnLn.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
            lblLastLogin.Text = ClassHome.GetLastLogin(Session("MY-UsErNaMe"))
        End If
        SetAuth()

    End Sub

    Private Sub SetAuth()
        If ClassShaahr.AuthenticationAuth(Session("MY-UsErNaMe")) Or _
                        ClassShaahr.CheckEnter_Mayor(Session("MY-UsErNaMe")) Or _
                        ClassShaahr.CheckEnter_MayorAssist1(Session("MY-UsErNaMe")) Or _
                        ClassShaahr.CheckEnter_MayorAssist2(Session("MY-UsErNaMe")) Then
            MultiView.ActiveViewIndex = 1
            ImgAvatar.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) + "&W=110&H=100"
        Else
            MultiView.ActiveViewIndex = 0
        End If
    End Sub

    Public Function GetFN(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Function GetType_(ByVal type As String) As String
        Select Case type.ToString.Trim
            Case "0"
                Return "رئیس جمهور"
            Case "01"
                Return "معاون اول رئیس جمهور"
            Case "02"
                Return "معاون دوم رئیس جمهور"
            Case "1"
                Return "استاندار استان اول"
            Case "11"
                Return "معاون اول استاندار استان اول"
            Case "12"
                Return "معاون دوم استاندار استان اول"
            Case "2"
                Return "استاندار استان دوم"
            Case "21"
                Return "معاون اول استاندار استان دوم"
            Case "22"
                Return "معاون دوم استاندار استان دوم"
            Case "3"
                Return "استاندار استان سوم"
            Case "31"
                Return "معاون اول استاندار استان سوم"
            Case "32"
                Return "معاون دوم استاندار استان سوم"
            Case "4"
                Return "استاندار استان چهار"
            Case "41"
                Return "معاون اول استاندار استان چهار"
            Case "42"
                Return "معاون دوم استاندار استان چهار"
            Case "5"
                Return "استاندار استان پنجم"
            Case "51"
                Return "معاون اول استاندار استان پنجم"
            Case "52"
                Return "معاون دوم استاندار استان پنجم"
        End Select
    End Function

    Public Sub GotoJob(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString().Split("|")
        Response.Redirect("jobs.aspx?job=" + s(0).Trim + "&user=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Public Function GetGovernorPresedent(ByVal type As String) As String
        Select Case type
            Case 0
                Return "<span style='font-weight:bold;color:red;'>" + "تایید نشده" + "</span>"
            Case 1
                Return "<span style='font-weight:bold;color:green;'>" + "تایید شده" + "</span>"
            Case 2
                Return "<span style='font-weight:bold;color:gray;'>" + "در حال بررسی" + "</span>"
        End Select

    End Function

    Public Function GetFav(ByVal code As String) As String
        Return ClassShaahr.GetFavorit(code)
    End Function

    Public Function VisibleSuspention(ByVal EnableGovernor As Object, ByVal EnablePresedentNazmie As Object) As String
        If EnableGovernor.ToString = "1" And EnablePresedentNazmie.ToString = "1" Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetState(ByVal codestate As String) As String
        Select Case codestate
            Case 1
                Return "استان اول"
            Case 2
                Return "استان دوم"
            Case 3
                Return "استان سوم"
            Case 4
                Return "استان چهارم"
            Case 5
                Return "استان پنجم"
        End Select
    End Function

    Public Sub GotoGovernor(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("Mayor") = e.CommandArgument
        Response.Redirect("mayorpanel.aspx")
    End Sub


End Class
