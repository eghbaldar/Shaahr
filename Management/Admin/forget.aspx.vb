
Partial Class Management_forget
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeEnter As New EnterUsers
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement
    Dim ClassCMS_Nazmie As New CMS_Nazmie
    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت پرفایل های بسته شده"
    End Sub

    Public Sub Citizen(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeEnter.UpdateCitizen(0, e.CommandArgument)
        DG1.DataBind()
    End Sub

    Public Sub band(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMS_Nazmie.UpdateBand("1", ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";-1", e.CommandArgument)
        DG1.DataBind()
    End Sub

    Public Function GetBand(ByVal email As Object) As String
        Return IIf(ClassCMS_Nazmie.GetBand(email.ToString) = True, "باز است", "بسته شده")
    End Function

End Class
