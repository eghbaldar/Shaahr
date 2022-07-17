
Partial Class Shaahr_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "ساختمان مدیریتی شهر دات کام"

        lblPresedent.Text = ""
        If DL_Presedent.Items.Count <= 0 Then lblPresedent.Text = "دپارتمان ریاست جمهوری تعیین نشده است"

        lblGroup1.Text = ""
        If DL_Group1.Items.Count <= 0 Then lblGroup1.Text = "دپارتمان استان اول تعیین نشده است"

        lblGroup2.Text = ""
        If DL_Group2.Items.Count <= 0 Then lblGroup2.Text = "دپارتمان استان دوم تعیین نشده است"

        lblGroup3.Text = ""
        If DL_Group3.Items.Count <= 0 Then lblGroup3.Text = "دپارتمان استان سوم تعیین نشده است"

        lblGroup4.Text = ""
        If DL_Group4.Items.Count <= 0 Then lblGroup4.Text = "دپارتمان استان چهارم تعیین نشده است"

        lblGroup5.Text = ""
        If DL_Group5.Items.Count <= 0 Then lblGroup5.Text = "دپارتمان استان پنجم تعیین نشده است"


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

    Public Sub GotoDetailAuth(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("DetAuth.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Public Function GetShaahrLogo(ByVal code_shaahr As String) As String
        If ClassShaahr.GetShaahrLogo(code_shaahr) = "" Then
            Return "~\Content\images\Shaahrs\Root\LogoShaahr.png"
        Else
            Return "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.GetShaahrLogo(code_shaahr)
        End If
    End Function



End Class
