
Partial Class UserControl_Shaahr_BilboardOstan
    Inherits System.Web.UI.UserControl

    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        lblCount_State1.Text = String.Format("شهرها: {0} &nbsp; بازدید: {1}", "<b><span style='color:black'>" + ClassShaahr.GetCountShaahrOfState(1) + "</span></b>", "<b><span style='color:black'>" + IIf(ClassShaahr.GetVisitState(1) <> "", ClassShaahr.GetVisitState(1), "0") + "</span></b>")
        lblCount_State2.Text = String.Format("شهرها: {0} &nbsp; بازدید: {1}", "<b><span style='color:black'>" + ClassShaahr.GetCountShaahrOfState(2) + "</span></b>", "<b><span style='color:black'>" + IIf(ClassShaahr.GetVisitState(2) <> "", ClassShaahr.GetVisitState(2), "0") + "</span></b>")
        lblCount_State3.Text = String.Format("شهرها: {0} &nbsp; بازدید: {1}", "<b><span style='color:black'>" + ClassShaahr.GetCountShaahrOfState(3) + "</span></b>", "<b><span style='color:black'>" + IIf(ClassShaahr.GetVisitState(3) <> "", ClassShaahr.GetVisitState(3), "0") + "</span></b>")
        lblCount_State4.Text = String.Format("شهرها: {0} &nbsp; بازدید: {1}", "<b><span style='color:black'>" + ClassShaahr.GetCountShaahrOfState(4) + "</span></b>", "<b><span style='color:black'>" + IIf(ClassShaahr.GetVisitState(4) <> "", ClassShaahr.GetVisitState(4), "0") + "</span></b>")
        lblCount_State5.Text = String.Format("شهرها: {0} &nbsp; بازدید: {1}", "<b><span style='color:black'>" + ClassShaahr.GetCountShaahrOfState(5) + "</span></b>", "<b><span style='color:black'>" + IIf(ClassShaahr.GetVisitState(5) <> "", ClassShaahr.GetVisitState(5), "0") + "</span></b>")
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        lblRankState_1.Text = "1"
        lblRankState_2.Text = "2"
        lblRankState_3.Text = "3"
        lblRankState_4.Text = "4"
        lblRankState_5.Text = "5"

    End Sub

End Class
