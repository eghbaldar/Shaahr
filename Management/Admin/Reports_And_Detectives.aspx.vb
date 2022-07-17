
Partial Class Management_Admin_Reports_And_Detectives
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
        Title = "مدیریت شهر دات کام - مدیریت کارگاهان و گزارشات"
    End Sub

    Public Function GetFnLn(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Sub DeleteDetective(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteDetevtive(e.CommandArgument)
        DG_Detective.DataBind()
    End Sub

    Public Function Get_Allow(ByVal allow As Object) As String
        Select Case allow
            Case True
                Return "تایید شده"
            Case False
                Return "تایید نشده"
        End Select
    End Function

    Public Function GetBG_Allow(ByVal allow As Object) As System.Drawing.Color
        Select Case allow
            Case True
                Return System.Drawing.Color.Green
            Case False
                Return System.Drawing.Color.Red
        End Select
    End Function

    Public Sub AcceptDetective(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateDetevtiveAllow(1, e.CommandArgument)
        DG_Detective.DataBind()
        'ارسال پیام برای کاربر
        ClassUserManagement.InsertSystemInbox(e.CommandArgument, "صلاحیت شما برای پست کارگاهی تایید شده است.", txtMessage.Text)
        ''
    End Sub

    Public Sub DenyDetective(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateDetevtiveAllow(0, e.CommandArgument)
        DG_Detective.DataBind()
        'ارسال پیام برای کاربر
        ClassUserManagement.InsertSystemInbox(e.CommandArgument, "صلاحیت شما برای پست کارگاهی تایید نشده است.", txtMessage.Text)
        ''
    End Sub
 
    Public Function GetBG_Checked(ByVal checked As Object) As System.Drawing.Color
        Select Case checked
            Case 2
                Return System.Drawing.Color.Yellow
            Case 1
                Return System.Drawing.Color.Green
            Case 0
                Return System.Drawing.Color.Red
        End Select
    End Function

    Public Function GetSubjectCrime(ByVal codeCrime As Long) As String
        Return Class_CMS_Nazmie.GetSubjectCrime(codeCrime.ToString)
    End Function

    Public Sub RediretToJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-Jiring.aspx?email=" + e.CommandArgument)
    End Sub

    Public Sub DeleteReportDetective(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteReportDetective(e.CommandArgument)
        DG_ReportDetective.DataBind()
    End Sub

    Public Sub RightCrime(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReportDetective(e.CommandArgument, True)
        DG_ReportDetective.DataBind()
    End Sub

    Public Sub NotRightCrime(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateCheckedReportDetective(e.CommandArgument, False)
        DG_ReportDetective.DataBind()
    End Sub

    Public Sub EnableShow(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateVisibleReportDetective(e.CommandArgument, True)
        DG_ReportDetective.DataBind()
    End Sub

    Public Sub DisableShow(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.UpdateVisibleReportDetective(e.CommandArgument, False)
        DG_ReportDetective.DataBind()
    End Sub

End Class
