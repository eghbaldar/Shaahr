
Partial Class UserControl_Root_TopTextLogo
    Inherits System.Web.UI.UserControl

    Dim ClassHomeProfile As New HomeProfile

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            lbl.Text = ClassHomeProfile.GeText_Logo_OfTopSite(True)
            img.ImageUrl = "~\content\images\LogoTopSite\" + ClassHomeProfile.GeText_Logo_OfTopSite(False)
        End If        

    End Sub

    Protected Sub img_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img.Click
        Response.Redirect("http://www.shaahr.com")
    End Sub

End Class
