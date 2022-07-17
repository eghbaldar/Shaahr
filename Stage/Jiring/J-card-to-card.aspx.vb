
Partial Class Stage_Jiring_J_kart_to_kart
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پرداخت آنلاین بصورت کارت به کارت - شهر"
        lblFnLn.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
        lblCode.Text = ""
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsert.Click
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click

        ccJoin.ValidateCaptcha(txtCap.Text)
        If ccJoin.UserValidated Then
            ClassStage.Insert_Jiring_Card(Session("MY-UsErNaMe"), txtDate.Text, txtTime.Text, cmbBank.Text, txtCodePeygiri.Text, txtCardNum.Text, txtName.Text, txtDetail.Text)
            txtCap.Text = ""
            txtCardNum.Text = ""
            txtCodePeygiri.Text = ""
            txtDate.Text = ""
            txtDetail.Text = ""
            txtName.Text = ""
            txtTime.Text = ""
            lblCode.Text = String.Format("کد پیگیری را نزد خود نگهدارید <br/> کد پیگیری: {0}", "<b><span style='font-size:17px;color:red;'>" + ClassStage.GetLastCodeCard(Session("MY-UsErNaMe")) + "</span></b>")
            MultiView.ActiveViewIndex = 0
        End If

    End Sub

End Class
