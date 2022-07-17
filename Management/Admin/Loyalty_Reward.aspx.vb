
Partial Class Management_Admin_Loyalty_Reward
    Inherits System.Web.UI.Page

    Dim ClassJiring As New CMS_Jiring

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "پاداش وفاداری"

        lblTimeCur.Text = Now.TimeOfDay.ToString.Substring(0, 8)
        lblDateCur.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)

    End Sub

    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAction.Click

        ClassJiring.ActionLoyaltyReward()
        btnAction.Enabled = False
        btnAction.Text = "اعمال پاداش با موفقیت انجام شد."

    End Sub

End Class
