
Partial Class UserControl_Panel_Visit
    Inherits System.Web.UI.UserControl

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    Private OtherEmail_ As String

    Property OtherEmail() As String
        Get
            Return OtherEmail_
        End Get
        Set(ByVal value As String)
            OtherEmail_ = value
        End Set
    End Property

    Protected Sub ODS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS.Selecting
        e.InputParameters("other_email") = OtherEmail_
        e.InputParameters("_date") = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
    End Sub

    Public Function Href(ByVal email As Object) As String
        Return "http://shaahr.com/" + ClassProfile.getUsernameByEmail(email.ToString())
    End Function

    Public Function Text(ByVal email As Object, ByVal count As Object, ByVal time As Object) As String

        Return "<b>" + ClassProfile_Section.GetFnLn(email.ToString) + "</b>" + "<br/>" + _
            String.Format(" تعداد ملاقات {0}", "<b>" + count.ToString + "</b>") + "<br/>" + _
            String.Format(" زمان آخرین بازدید {0}", time.ToString.Substring(0, 5))

    End Function

    Public Function Redirect(ByVal email As Object) As String
        Return "../user/default.aspx?user=" + ClassProfile.getUsernameByEmail(email.ToString)
        'Response.Redirect("~/user/default.aspx?user=" + ClassProfile.getUsernameByEmail(email.ToString))
    End Function

    Public Function Convert(ByVal email As String) As String
        Return ClassProfile.getUsernameByEmail(email.ToString)
    End Function

    Public Sub Redirect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

End Class

