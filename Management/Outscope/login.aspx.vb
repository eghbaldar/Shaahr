
Partial Class Management_Outscope_login
    Inherits System.Web.UI.Page

    Private Shared r As Integer
    Dim ClassLogin As New CMS_Login

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CreateCode()
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        ccJoi.ValidateCaptcha(txtCaptcha.Text)
        If Not ccJoi.UserValidated Then
            lblWrong.Text = "دوست بی حوصله من عبارت امنیتی را بدرستی وارد کن."
            CreateCode()
            Exit Sub
        End If
        '''''''''''''''''''''''''''
        If r + 1 = Val(txtRnd.Text) Then
            If ClassLogin.CheckUsernamePassword(txtUsername.Text, txtPass.Text) Then
                Response.Redirect("~\Management\admin\")
            Else
                lblWrong.Text = "نام کاربری و یا کلمه عبور اشتباه می باشد."
                CreateCode()
            End If
        Else
            lblWrong.Text = "عدد مورد نظر صحیح نمی باشد."
            CreateCode()
        End If

    End Sub

    Private Sub CreateCode()
        Dim rn As New Random
        r = rn.Next(1, 99)
        lblRnd.Text = r
    End Sub

End Class
