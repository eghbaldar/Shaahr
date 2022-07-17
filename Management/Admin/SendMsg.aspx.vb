
Partial Class Management_Admin_SendMsg
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "مدیریت شهر دات کام - ارسال پیام سیستمی به کاربر"
        lblTo.Text = ClassProfile_Section.GetFnLn(Request.QueryString("email"))
        imgAvatar.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Request.QueryString("email")) + "&W=60&H=60"

    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        If ClassUserManagement.InsertSystemInbox(Request.QueryString("email"), txtSubject.Text, txtMSG.Text) = True Then
            txtMSG.Text = ""
            txtSubject.Text = ""
            lbl.Text = "با موفقیت پیام شما ارسال گردید."
            DG.DataBind()
        Else
            lbl.Text = "مشکلی پیش آمده است دوباره اقدام کنید."
        End If

    End Sub

    Public Sub DeleteMSG(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassUserManagement.DeleteSystemInbox(e.CommandArgument)
        DG.DataBind()
    End Sub

End Class

