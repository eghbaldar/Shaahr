
Partial Class Stage_Nazmie_exclusionUsers
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassOnline As New Online
    Dim ClassHomeProfile As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "کاربران اخراج شده - شهر"
    End Sub

    Public Function GetUserName(ByVal email As Object) As String
        Return ClassProfile.getUsernameByEmail(email.ToString)
    End Function

End Class
