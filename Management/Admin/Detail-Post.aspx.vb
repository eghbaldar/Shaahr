Imports System.Data

Partial Class Management_Admin_Detail_Post
    Inherits System.Web.UI.Page


    Dim ClassProfile As New View_Users
    Dim ClassProfile_Sections As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassPost As New CMS_Post

    Dim em_owner As String 'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        Title = String.Format("جزییات پست پروفایل {0}", ClassProfile_Sections.GetFnLn(em_owner))

        If Not IsPostBack Then
            txtSubject.Text = ClassPost.getSubject_Detail(Request.QueryString("code"), False)
            txtDetail.Text = ClassPost.getSubject_Detail(Request.QueryString("code"), True)
        End If

    End Sub

    Public Function CountComment(ByVal code As Object) As String
        Return String.Format("<span style='color:#1a5267;'>{0}</span> &nbsp;نظر", ClassProfile.GetCountComment(Convert.ToInt64(code)))
    End Function

    Public Sub DeleteObject(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteObject(e.CommandArgument)
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub SendCommand(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim Comment As String = String.Empty
        For i As Integer = 0 To Dl_UpdateNews.Controls.Count - 1
            Dim txt As TextBox = CType(Dl_UpdateNews.Controls(i).FindControl("txtPutComment"), TextBox)
            If txt.Text <> "نظر شما..." Then
                Comment = txt.Text
                txt.Text = "نظر شما..."
            End If
        Next
        If Comment <> "" Then
            ClassProfile.InsertNotification(1, Session("MY-UsErNaMe"), e.CommandArgument, 0)
            ClassProfile.InsertComment(e.CommandArgument, Session("MY-UsErNaMe"), em_owner, Comment, 0)
        End If
        Dl_UpdateNews.DataBind()
        '''''''''''''''  درجه شهروندی
        If Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) < 722 Then
            ClassHome.UpdateStarNum(Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) + 3, Session("MY-UsErNaMe"))
        End If
        '''''''''''''''
    End Sub

    Protected Sub DeleteCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteComment(e.CommandArgument)
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub SetLikeUnlikePost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.InsertNotification(2, Session("MY-UsErNaMe"), e.CommandArgument, 1)
        ClassProfile.CheckLikeUnlikePost(e.CommandArgument, Session("MY-UsErNaMe"), em_owner)
        Dl_UpdateNews.DataBind()
        '''''''''''''''  درجه شهروندی
        If Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) < 722 Then
            ClassHome.UpdateStarNum(Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) + 2, Session("MY-UsErNaMe"))
        End If
        '''''''''''''''
    End Sub

    Public Function ChangeIconLikePost(ByVal code As Object) As String

        Dim Check As Boolean = ClassProfile.CheckDuplicateLike(code, Session("MY-UsErNaMe"), em_owner)
        If Check Then Return "~/content/images/Profile_View_Users/accept.png"
        If Not Check Then Return "~/content/images/Profile_View_Users/deny.png"

    End Function

    Protected Sub SetLikeUnlikeComment(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.InsertNotification(3, Session("MY-UsErNaMe"), 0, e.CommandArgument)
        ClassProfile.CheckLikeUnlikeComment(e.CommandArgument, Session("MY-UsErNaMe"), em_owner)
        Dl_UpdateNews.DataBind()
        '''''''''''''''  درجه شهروندی
        If Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) < 722 Then
            ClassHome.UpdateStarNum(Val(ClassHome.GetStarNum(Session("MY-UsErNaMe"))) + 2, Session("MY-UsErNaMe"))
        End If
        '''''''''''''''
    End Sub

    Public Function ChangeIconLikeComment(ByVal code As Object) As String

        Dim Check As Boolean = ClassProfile.CheckDuplicateComment(code, Session("MY-UsErNaMe"), em_owner)
        If Check Then Return "~/content/images/Profile_View_Users/accept.png"
        If Not Check Then Return "~/content/images/Profile_View_Users/deny.png"

    End Function

    Public Function UserLikeComment(ByVal code As Object) As String

        Try
            Dim Data As DataTable = ClassProfile.UserLikeComment(code)
            Dim Html As String
            For i = 0 To Data.Rows.Count - 1
                Html += "<a style='font-weight:bold;color:#25515d;text-decoration:none;' href='../user/default.aspx?user=" + Data.Rows(i)(1).ToString + "'>" + _
                    Data.Rows(i)(0).ToString + "</a>" + " , "
            Next
            Return Html.Substring(0, Html.Length - 2)
        Catch ex As Exception
        End Try

    End Function

    Protected Sub ODS_Comments_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = em_owner
    End Sub

    Public Function ShowAllComment(ByVal code As Object) As String
        Return "../user/default.aspx?code=" + code.ToString + ",user=" + em_owner
    End Function

    Protected Sub ODS_ProfileUpdateNews_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileUpdateNews.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        e.InputParameters("code") = Request.QueryString("code")
    End Sub

    Public Function VisibleCloseObject(ByVal email As Object) As Boolean
        Return IIf(email.ToString() = Session("MY-UsErNaMe"), True, False)
    End Function

    Public Sub OpenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("PhotoDefaultPage") = True
        Response.Redirect("DetailPhoto.aspx?code=" + e.CommandArgument + "&user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    'Plliong
    Public Function SetPercent(ByVal codeoption As Object, ByVal code_polling As Object) As String
        Dim Percent As Long = ClassProfile_Sections.GetPercentPolling(code_polling.ToString, codeoption.ToString)
        Return "<span><em style='left: " + (Val(Percent) * 2).ToString + "px'>10%</em></span>"
    End Function

    Public Function SetOption(ByVal [option] As Object, ByVal codeoption As Object, ByVal code_polling As Object) As String
        Dim Percent As Long = ClassProfile_Sections.GetPercentPolling(code_polling.ToString, codeoption.ToString)
        Return "<div style='float:right;background-color:#000;color:#fff;-moz-border-radius: 3px;padding:2px;'>" + Percent.ToString + "%" + "</div>" + "<div style='float:right;margin-right:4px;font-size:12px;background-color:#d4dfe5;color:#000;border:1px solid #c3c3c3;height:20px;-moz-border-radius: 3px;padding:2px;'>" + [option].ToString + "</div>"
    End Function

    Protected Sub ODS_ParticipatePolling_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = Session("MY-UsErNaMe")
    End Sub

    Public Sub SetOption(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim args() As String = e.CommandArgument.ToString.Split("|")
        ClassProfile_Sections.InsertPolling(Session("MY-UsErNaMe"), args(1), args(0))
        Dl_UpdateNews.DataBind()

    End Sub

    Protected Sub btnShowAllPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/user/AllPolling.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub ODS_Polling_Selecting1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = em_owner
    End Sub

    '----------------------------------------------------------------------------------------------

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

    Protected Sub btnEditPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditPost.Click
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click
        Redirect("~\user\DetailPost.aspx?code=" + Request.QueryString("code") + "&user=" + Request.QueryString("user"), "_Blank", "")
    End Sub

    Protected Sub btnDelComments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelComments.Click
        ClassPost.Delete_AllCommentPost(Request.QueryString("code"))
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub btnDelAllLikePost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelAllLikePost.Click
        ClassPost.Delete_AllLikePost(Request.QueryString("code"))
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub btnDelAllLikeCommetns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelAllLikeCommetns.Click
        ClassPost.Delete_AllLikeComment(Request.QueryString("code"))
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub btnDelPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelPost.Click
        ClassPost.Delete_Post(Request.QueryString("code"))
        Response.Redirect("Post.aspx")
    End Sub

    Protected Sub btnPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPost.Click
        ClassPost.UpdateObject(Request.QueryString("code"), txtDetail.Text, txtSubject.Text)
        Dl_UpdateNews.DataBind()
        MultiView.ActiveViewIndex = 0
    End Sub

End Class
