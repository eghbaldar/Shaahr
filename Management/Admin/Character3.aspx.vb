
Partial Class Management_Admin_Character3
    Inherits System.Web.UI.Page

    Dim ClassCharacter3 As New CMS_Character3
    Dim ClassCharacter3_ As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت شخصیت سوم"
    End Sub

    Protected Sub AddOption_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddOption.Click
        lstOption.Items.Add(txtOption.Text)
        txtOption.Text = ""
    End Sub

    Protected Sub btnInsertPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertPolling.Click

        ClassCharacter3.InsertPoll(txtTitle.Text, txtDetail.Text)
        For i As Byte = 0 To lstOption.Items.Count - 1
            ClassCharacter3.InsertPollOption(ClassCharacter3.GetLastCodePolling, lstOption.Items(i).Value.ToString)
        Next
        txtDetail.Text = ""
        txtTitle.Text = ""
        txtOption.Text = ""
        lstOption.Items.Clear()
        DG_Polling.DataBind()

    End Sub

    Protected Sub btnClearList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearList.Click
        lstOption.Items.Clear()
    End Sub

    Public Sub DeleteOption(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.DeletePollOption(e.CommandArgument)
        DG_Option.DataBind()
    End Sub

    Public Sub DeletePoll(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.DeletePoll(e.CommandArgument)
        DG_Polling.DataBind()
    End Sub

    Protected Sub btnInsertComplusory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertComplusory.Click
        Dim bFlag As Boolean
        If rbEnable.Items(0).Selected Then bFlag = True
        If rbEnable.Items(1).Selected Then bFlag = False
        Dim bType As Byte
        If rbType.Items(0).Selected Then bType = 0 'نظرسنجی
        If rbType.Items(1).Selected Then bType = 1 'اخبار
        ClassCharacter3.InsertCharacter3_Compulsory(bFlag, bType, txtCodeObj.Text)
        txtCodeObj.Text = ""
        DG_Complusory.DataBind()
    End Sub

    Public Sub DeleteCharacter3_Complusory(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.DeleteCompulsory(e.CommandArgument)
        DG_Complusory.DataBind()
    End Sub

    Public Function EnableDisibleCompulsory(ByVal flag As Object) As String
        Select Case flag
            Case "1"
                Return "<div style='background-color:green;color:white;padding:3px;'>فعال</div>"
            Case "0"
                Return "<div style='background-color:red;color:white;padding:3px;'>غیر فعال</div>"
        End Select
    End Function

    Public Sub Enable_Complusory(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.UpdateEnableDisible(1, e.CommandArgument)
        DG_Complusory.DataBind()
    End Sub

    Public Sub Disible_Complusory(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.UpdateEnableDisible(0, e.CommandArgument)
        DG_Complusory.DataBind()
    End Sub

    Public Function TypeNameService(ByVal type As Object) As String
        Select Case type
            Case "0"
                Return "نظرسنجی"
            Case "1"
                Return "مطالب متنی"
        End Select
    End Function

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertNews.Click

        Dim rn As String = Guid.NewGuid.ToString + IO.Path.GetExtension(FileUploadNews.FileName)
        ClassCharacter3.Insert_Character3_News(txtTitleNews.Text, txtLidDetailNews.Text, txtDetailNews.Value, rn)
        FileUploadNews.SaveAs(MapPath("~\Content\images\Character3\Compulsory\News\" + rn))
        DG_News.DataBind()

    End Sub

    Public Sub DeleteNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCharacter3.Delete_Character3_News(e.CommandArgument)
        DG_News.DataBind()
    End Sub

    Public Sub GotoToDetailPolling(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("DetailPolling.aspx?CodePolling=" + e.CommandArgument, "_Blank", "")
    End Sub

    Public Sub GotoToDetailNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("DetailTexture.aspx?CodeNews=" + e.CommandArgument, "_Blank", "")
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

    Public Function GetCountVoter(ByVal code As Object) As String
        Return ClassCharacter3_.GetCountVoting(code.ToString)
    End Function

End Class
