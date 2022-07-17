
Partial Class Management_Admin_Relationship
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت ارتباطات کاربران"

        lblCountAll.Text = dg_All.Rows.Count
        lblCountFamily.Text = dg_Family.Rows.Count
        lblCountFriends.Text = dg_Friends.Rows.Count

    End Sub

    Public Function getFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Protected Sub ShowAttrib(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("UserAttrib.aspx?email=" + e.CommandArgument.ToString, "_blank", "")
    End Sub

    Public Shared Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)

        Dim context As HttpContext = HttpContext.Current
        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then
            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)
            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If
            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If

    End Sub

    Protected Sub DeleteRelation(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassUserManagement.DeleteRelation(Request.QueryString("email"), e.CommandArgument.ToString)
        dg_All.DataBind()
        dg_Family.DataBind()
        dg_Friends.DataBind()
        dg_Wife.DataBind()
    End Sub

End Class
