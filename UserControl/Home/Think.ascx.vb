
Partial Class UserControl_Home_Think
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfileHome As New HomeProfile

    Protected Sub btnNewThink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewThink.Click
        txtThink.Enabled = True
        txtThink.Text = ""
    End Sub

    Protected Sub btnEditThink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditThink.Click
        txtThink.Enabled = True
    End Sub

    Protected Sub btnUpdateThink_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateThink.Click
        If txtThink.Enabled Then
            ClassProfileHome.UpdateThink(Session("MY-UsErNaMe"), txtThink.Text)
            txtThink.Text = ClassProfile.Get_Think(Session("MY-UsErNaMe"))
            txtThink.Enabled = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtThink.Text = ClassProfile.Get_Think(Session("MY-UsErNaMe"))
        End If
    End Sub

End Class
