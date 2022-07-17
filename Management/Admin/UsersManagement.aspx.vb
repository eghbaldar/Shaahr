
Partial Class Management_Admin_UsersManagement
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim Class_CMS_UserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت کاربران"
        lblCountUsers.Text = Class_CMS_UserManagement.GetCountUsers
    End Sub

    Public fn_f As String
    Public Ln_f As String
    Public fn_e As String
    Public Ln_e As String
    Public email As String

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

    Protected Sub ODS_Users_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Users.Selecting
        e.InputParameters("fn_f") = IIf(fn_f = Nothing, "", fn_f)
        e.InputParameters("Ln_f") = IIf(Ln_f = Nothing, "", Ln_f)
        e.InputParameters("fn_e") = IIf(fn_e = Nothing, "", fn_e)
        e.InputParameters("Ln_e") = IIf(Ln_e = Nothing, "", Ln_e)
        e.InputParameters("email") = IIf(email = Nothing, "", email)
    End Sub

    Protected Sub btnSearchUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchUser.Click
        fn_f = txtFnF.Text
        Ln_f = txtLnF.Text
        fn_e = txtFnE.Text
        Ln_e = txtLnE.Text
        email = txtEmail.Text
        DG_Users.DataBind()
    End Sub

    Public Function CheckOnilneImage(ByVal email As Object) As String
        Select Case ClassOnline.GetStatusCode(email)
            Case 1
                Return "~\content\images\stage\chat\online_avaliable.gif"
            Case 2
                Return "~\content\images\stage\chat\online_NotHere.gif"
            Case 3
                Return "~\content\images\stage\chat\online_busy.gif"
            Case 5
                Return "~\content\images\stage\chat\online_NotNow.gif"
            Case Else
                Return "~\content\images\stage\chat\Gray.png"
        End Select
    End Function

    Protected Sub RedirectAttrib(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("UserAttrib.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub
    '
    Protected Sub RedirectRelationship(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("Relationship.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Protected Sub SendMSG(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Redirect("SendMsg.aspx?email=" + e.CommandArgument, "_blank", "")
    End Sub

    Protected Sub RedirectJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("Users-Jiring.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Protected Sub RedirectPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("Users-Post.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Protected Sub RedirectAlbum(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("Users-Albums-Pictures.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Protected Sub RailUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("RailUser.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Protected Sub GotoPremission(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Redirect("Users-Premission.aspx?email=" + e.CommandArgument, "_blank", "")
    End Sub

End Class
