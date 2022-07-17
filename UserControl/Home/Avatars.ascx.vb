Imports System.IO

Partial Class UserControl_Home_Avatars
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then Avatars()
    End Sub

    Private Sub Avatars()
        imgOrgAvatar.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) + "&W=70&H=70"
    End Sub

    Public Sub SetAvatar(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfileHome.UpdateOrgAvatar(Session("MY-UsErNaMe"), e.CommandArgument)
        Dl_Avatars.DataBind()
        Avatars()
    End Sub

    Protected Sub Dl_Avatars_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles Dl_Avatars.ItemDataBound

        Dim img As New System.Web.UI.WebControls.Image
        img = CType(e.Item.FindControl("ImageButton2"), System.Web.UI.WebControls.Image)
        Dim InfoFile As New FileInfo(img.ImageUrl)
        img.ImageUrl = "~/user/Crop.aspx?P=" + InfoFile.Name + "&W=30&H=30"

    End Sub

    Protected Sub imgOrgAvatar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgOrgAvatar.Click
        Response.Redirect("~\user\?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    End Sub

End Class
