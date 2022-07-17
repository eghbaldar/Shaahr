
Partial Class UserControl_Home_NavRightTop
    Inherits System.Web.UI.UserControl

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Sections As New View_Users_Sections

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("MY-UsErNaMe") = Nothing Then
            btnPermission.ForeColor = Drawing.Color.Gray
            btnPermission.Enabled = False
            btnGotoHome.ForeColor = Drawing.Color.Gray
            btnGotoHome.Enabled = False
            btnSetting.ForeColor = Drawing.Color.Gray
            btnSetting.Enabled = False
            imgAvatar.ImageUrl = "~\content\images\Home\noAvatar.png"
        Else
            btnPermission.ForeColor = Drawing.Color.Black
            btnGotoHome.ForeColor = Drawing.Color.Black
            btnSetting.ForeColor = Drawing.Color.Black
            imgAvatar.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) + "&W=55&H=55"
        End If

    End Sub

    Protected Sub imgAvatar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgAvatar.Click

        If Session("MY-UsErNaMe") = Nothing Then
            Response.Redirect("~\outscope\CreateAccount\")
        Else
            Response.Redirect("~\home\")
        End If

    End Sub

End Class
