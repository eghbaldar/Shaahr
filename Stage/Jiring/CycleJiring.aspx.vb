
Partial Class Stage_Jiring_Default2
    Inherits System.Web.UI.Page

    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "گردش حساب کاربران - شهر"

        lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:titr;font-size:25px;' >" + ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) + "</span></b>")
        lblSumIncrease.Text = ClassStage.GetIncrease(Session("MY-UsErNaMe"))
        lblSumDecrease.Text = ClassStage.GetDecrease(Session("MY-UsErNaMe"))

        If Dl.Items.Count = 0 Then
            lbl.Text = "<div style='padding:5px;color:#646464;'>موردی ثبت نشده است.</div>"
            btnClear.Visible = False
        End If

    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnClear.Click
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassStage.DeleteFactorUsers(Session("MY-UsErNaMe"))
        Dl.DataBind()
        btnClear.Visible = False
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        MultiView.ActiveViewIndex = 0
    End Sub

End Class
