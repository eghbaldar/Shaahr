
Partial Class Management_Admin_Post
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassPost As New CMS_Post

    Protected Sub OSD_POST_TODAY_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OSD_POST_TODAY.Selecting
        e.InputParameters("_date") = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - پست های گذاشته شده"
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles dgPost.RowDataBound
        lblPost.Text = dgPost.Rows.Count
    End Sub

    Public Function getFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function
    '
    Protected Sub DetailPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("Detail-post.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Protected Sub DeletePost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassPost.Delete_Post(e.CommandArgument)
        dgPost.DataBind()
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        dgPostDate.DataBind()
    End Sub
End Class
