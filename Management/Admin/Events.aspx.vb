
Partial Class Management_Admin_Events
    Inherits System.Web.UI.Page

    Dim ClassEvent As New CMS_Event

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - اتفاقات لحظه ای"
    End Sub

    Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer.Tick
        lblCountUsersOnline.Text = ClassEvent.GetInformation(1)
        lblTodayRegister.Text = ClassEvent.GetInformation(6)
        lblAllRegister.Text = ClassEvent.GetInformation(2)
        lblReportUsers.Text = ClassEvent.GetInformation(4)
        lblReportDetective.Text = ClassEvent.GetInformation(3)
        lblLogined.Text = ClassEvent.GetInformation(5)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Timer.Enabled Then
            Timer.Enabled = False
            Exit Sub
        End If
        If Not Timer.Enabled Then
            Timer.Enabled = True
            Exit Sub
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Timer.Interval = txtInterval.Text
    End Sub

End Class
