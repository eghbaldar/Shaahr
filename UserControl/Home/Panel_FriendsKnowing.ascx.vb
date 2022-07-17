
Partial Class UserControl_Home_Panel_FriendsKnowing
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile

    Public Function SetAvatar(ByVal email As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=45&H=45"
    End Function

    Public Function SetFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Public Function SetCount(ByVal email As Object) As String
        Return String.Format("تعداد دوستان آشنا: {0}", ClassProfileHome.CountFriendsKnowing(Session("MY-UsErNaMe"), email.ToString))
    End Function

    Public Function Visible(ByVal email As Object) As Boolean
        If ClassProfileHome.CountFriendsKnowing(Session("MY-UsErNaMe"), email.ToString) = 0 Then
            Return False
        Else
            Return True
        End If
    End Function

    Public Function SetUser(ByVal email As Object) As String
        Return ClassProfileHome.UsersFriendsKnowing(Session("MY-UsErNaMe"), email.ToString)
    End Function

    Public Sub Redirect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

End Class
