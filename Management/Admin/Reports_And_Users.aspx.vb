
Partial Class Management_Admin_Reports_And_Users
    Inherits System.Web.UI.Page

    Dim Class_CMS_Nazmie As New CMS_Nazmie
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت گزارشات کاربران و مهمانان"
    End Sub

    Public Function GetSubjectCrime(ByVal codeCrime As Long) As String
        Return Class_CMS_Nazmie.GetSubjectCrime(codeCrime.ToString)
    End Function

    Public Function GetBG_Checked(ByVal flag As Object) As System.Drawing.Color
        Select Case flag
            Case True
                Return System.Drawing.Color.Green
            Case False
                Return System.Drawing.Color.Red
        End Select
    End Function

    Public Sub Accept_Users(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReport(e.CommandArgument, True)
        DG_Users.DataBind()
    End Sub

    Public Sub Deny_Users(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReport(e.CommandArgument, False)
        DG_Users.DataBind()
    End Sub

    Public Sub Accept_Guest(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReport(e.CommandArgument, True)
        DG_Guest.DataBind()
    End Sub

    Public Sub Deny_Guest(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReport(e.CommandArgument, False)
        DG_Guest.DataBind()
    End Sub

    Public Function GetFnLn(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Sub DeleteReport(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteReport(e.CommandArgument)
        DG_Users.DataBind()
        DG_Guest.DataBind()
    End Sub

End Class
