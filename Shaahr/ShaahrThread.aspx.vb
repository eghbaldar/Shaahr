
Partial Class Shaahr_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Dim ShaahrCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ShaahrCode = (Request.QueryString("sh")).ToLower.ToString.Replace("shaahr", " ").Trim
        Title = String.Format("طبقه ""{0}"" - شهرداری {1}", ClassShaahr.GetSubjectCategory(Request.QueryString("cdT")), ClassCMSShaahr.GetNameShaahr(ShaahrCode))

        If Not ClassShaahr.GetLuckCategory(Request.QueryString("cdT")) Then btnNewThread.Visible = False
        If DL_Post.Items.Count = 0 Then lblNotPost.Text = "در حال حاضر پستی در این طبقه وجود ندارد."

        'NotUser

        If ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Or _
         ClassShaahr.CheckMayor(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist1(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist2(Session("MY-UsErNaMe"), ShaahrCode) Then

            NotUser.Visible = False
            btnNewThread.Visible = True
        Else
            NotUser.Visible = True
            btnNewThread.Visible = False
        End If

    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Public Sub GotoShowThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.UpdateVisitPost(e.CommandArgument)
        Response.Redirect("threadShow.aspx?cdP=" + e.CommandArgument + "&Sh=Shaahr" + ShaahrCode)
    End Sub

    Public Function GetCat(ByVal code As String) As String
        Return ClassShaahr.GetSubjectCategory(code)
    End Function

    Protected Sub btnNewThread_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewThread.Click
        Response.Redirect("newThread.aspx?cdT=" + Request.QueryString("cdT") + "&Sh=Shaahr" + ShaahrCode)
    End Sub

    Public Function CheckLuckPost(ByVal Code As String) As String
        Return Not ClassShaahr.GetLuckPost(Code)
    End Function

    Public Function GetVisit(ByVal code As String) As String
        Return ClassShaahr.GetVisitPost(code)
    End Function

    Public Function GetCountAnswer(ByVal code As String) As String
        Return ClassShaahr.GetCountAnswer(code)
    End Function

End Class
