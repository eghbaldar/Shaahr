
Partial Class Stage_Jiring_J_fish
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پرداخت آنلاین بصورت فیش بانکی - شهر"
        lblFnLn.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
        lblCode.Text = ""
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        MultiView.ActiveViewIndex = 0
    End Sub


    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click

        ccJoin.ValidateCaptcha(txtCap.Text)
        If ccJoin.UserValidated Then
            ClassStage.Insert_Jiring_Fish(Session("MY-UsErNaMe"), cmbBank.Text, txtNumAcc.Text, txtName.Text, txtFamily.Text, txtPrice.Text, txtDate.Text, txtNumRed.Text)
            txtDate.Text = ""
            txtFamily.Text = ""
            txtName.Text = ""
            txtNumAcc.Text = ""
            txtNumRed.Text = ""
            txtPrice.Text = ""
            MultiView.ActiveViewIndex = 0
            lblCode.Text = String.Format("کد پیگیری را نزد خود نگهدارید <br/> کد پیگیری: {0}", "<b><span style='font-size:17px;color:red;'>" + ClassStage.GetLastCodeFish(Session("MY-UsErNaMe")) + "</span></b>")
        End If        

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        MultiView.ActiveViewIndex = 1
    End Sub

End Class
