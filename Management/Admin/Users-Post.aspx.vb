
Partial Class Management_Admin_Users_Post
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim Class_CMS_Jiring As New CMS_Jiring
    Dim ClassPost As New CMS_Post

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مدیریت شهر دات کام - مدیریت پست {0}", ClassProfile_Section.GetFnLn(Request.QueryString("email")))
    End Sub

    Public Function getFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Protected Sub DetailPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("Detail-post.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Protected Sub DeletePost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassPost.Delete_Post(e.CommandArgument)
        dgPost.DataBind()
    End Sub

    Protected Sub RedirectUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("UserAttrib.aspx?email=" + e.CommandArgument)
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

End Class
