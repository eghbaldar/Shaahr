
Partial Class Management_Admin_Users_Favorits
    Inherits System.Web.UI.Page

    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassFav As New CMS_Favorits

    Public Function getFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("type")
            Case "cat"
                Title = "کاربران- گروه های علاقه مندی ها"
                MultiView.ActiveViewIndex = 0
            Case "fav"
                Title = "کاربران- علاقه مندی ها"
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub

    Protected Sub DeleteUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassFav.DeleteUserOfFavorit(e.CommandArgument)
        DG_U1.DataBind()
        DG_U2.DataBind()
    End Sub

End Class
