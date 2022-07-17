
Partial Class Stage_Jiring_UsersServices
    Inherits System.Web.UI.Page

    Dim ClassStage As New Stage

    Public Sub DeleteService(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("ID_Service") = e.CommandArgument
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal();", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal();", True)
    End Sub

    Protected Sub BtnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnDelete.Click

        'اگر سرویس کی در حال پاک شدن است سرویس ارتقای صندوق پستی بود بجز 20 پیام آخر بیقه پبام ها حذف شود
        If ClassStage.GetTypeServiceJiringByCodeService(ClassStage.GetCodeServiceByIdUserService(Val(Session("ID_Service")))).ToString = "2" Then
            ClassStage.DeleteInboxAfterExpireExtraInboxService(Session("MY-UsErNaMe"))
        End If
        'حذف سرویس
        ClassStage.DeleteUsersService(Session("ID_Service"))
        '
        DG.DataBind()
        Session.Remove("ID_Service")
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Close();", True)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "سرویس های فعال - شهر"
    End Sub

End Class
