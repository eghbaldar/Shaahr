
Partial Class Stage_Nazmie_Default
    Inherits System.Web.UI.Page

    Dim ClassStage As New Stage
    Dim Class_CMS_Nazmie As New CMS_Nazmie

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "نظمیه - شهر"
        lblCountDetective.Text = String.Format("تعداد کارگاهان شهر : {0} ", ClassStage.GetCountDetective())
        btnRegisterDetective.Style.Item("cursor") = "pointer"

        If Session("MY-UsErNaMe") = Nothing Then
            btnRegisterDetective.Text = "مهمان عزیز شما جزء شهروندان این شهر نیستید."
            btnRegisterDetective.Enabled = False
            Exit Sub
        End If

        If ClassStage.GetComplementNazmie(1) = False Then
            btnRegisterDetective.Text = "امکان ثبت نام تا اطلاع ثانویه برای کاربران وجود ندارد"
            btnRegisterDetective.Enabled = False
            Exit Sub
        End If

        If ClassStage.ChechNotAllowRegDetective(Session("MY-UsErNaMe")) Then
            btnRegisterDetective.Text = "شما هنوز تایید نشده اید، صبور باشید."
            btnRegisterDetective.Enabled = False
            Exit Sub
        End If

        If ClassStage.CheckRegDetective(Session("MY-UsErNaMe")) Then
            btnRegisterDetective.Visible = False
            btnDeleteDetective.Visible = True
            Exit Sub
        End If

    End Sub

    Protected Sub btnRegisterDetective_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegisterDetective.Click
        ClassStage.InsertRegisterDetective(Session("MY-UsErNaMe"))
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub btnDeleteDetective_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteDetective.Click
        Class_CMS_Nazmie.DeleteDetectiveByEmail(Session("MY-UsErNaMe"))
        MultiView.ActiveViewIndex = 2
    End Sub

End Class
