
Partial Class home_AllObj
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile

    Public Sub RecirectPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString().Split("|")
        Response.Redirect("DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(s(0)) + "&code=" + s(1))
    End Sub

    Public Function PostName(ByVal email As Object, ByVal for_who As Object) As String
        If email.ToString() = for_who.ToString() Then
            Return "<b><span style='color:#000'>" + ClassProfile_Section.GetFnLn(email.ToString) + "</span></b>"
        Else
            Return String.Format("ارسال از {0} برای {1}", "<a style='color:#000;text-decoration:none;font-weight:bold;' href='../user/default.aspx?user=" + ClassProfile.getUsernameByEmail(email.ToString) + "'>" + ClassProfile_Section.GetFnLn(email.ToString) + "</a>", "<a style='color:#000;text-decoration:none;font-weight:bold;' href='../user/default.aspx?user=" + ClassProfile.getUsernameByEmail(for_who.ToString) + "'>" + ClassProfile_Section.GetFnLn(for_who.ToString) + "</a>")
        End If
    End Function

    Public Sub OpenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Session("PhotoDefaultPage") = True
        Response.Redirect("DetailPhoto.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "&from=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

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

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "کل مطالب اشتراکی "
    End Sub

End Class
