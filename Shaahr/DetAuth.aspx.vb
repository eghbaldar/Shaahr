
Partial Class Shaahr_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub DetailPersonal_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles DetailPersonal.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("user"))
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

    Public Function GetAge(ByVal email As String) As String
        Return ClassHome.GetBirthDateByEmail(email)
    End Function

    Public Function GetTime(ByVal email As String) As String
        Return ClassHomeSetting.diffDate(ClassHomeSetting.GetDiffrentDateReg(email), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مشخصات مسئولین شهر - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
    End Sub

    Protected Sub ODS_Resume_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Resume.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("user"))
    End Sub

End Class
