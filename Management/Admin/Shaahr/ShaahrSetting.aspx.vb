
Partial Class Management_Admin_Shaahr_Default
    Inherits System.Web.UI.Page

    Dim ClassShaahr As New CMS_Shaahr_Management

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - تنطیمات شهر"
        If Not IsPostBack Then txtFundationJiring.Text = ClassShaahr.GetShaahr_FundationJiring
    End Sub

    Protected Sub btnFundationJiring_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFundationJiring.Click
        ClassShaahr.UpdateShaahr_FundationJiring(txtFundationJiring.Text)
    End Sub

End Class
