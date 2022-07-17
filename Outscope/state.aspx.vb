Imports MSCaptcha
Imports System.Data

Partial Class outscope_state
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassEnter As New EnterUsers
    Dim ClassCMS_Nazmie As New CMS_Nazmie
    Dim ClassOnline As New Online

    Dim email As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Captcha_.Width = 600
        Title = "بخش خارج از محدوده - شهر دات کام"
        Try
            email = ClassProfile.getEmailByUsername(Request.QueryString("username"))
            txtEmail.Text = email
        Catch ex As Exception
        End Try

        Select Case Request.QueryString("state")
            Case "NotRegister_OR_Entering"
                MultiView.ActiveViewIndex = 0
            Case "NCom"
                MultiView.ActiveViewIndex = 1
            Case "Band"
                MultiView.ActiveViewIndex = 2
                Try
                    Dim row As DataRow
                    If ClassCMS_Nazmie.Select_RowSuspention(ClassProfile.getEmailByUsername(Request.QueryString("username"))).Rows.Count > 0 Then
                        row = ClassCMS_Nazmie.Select_RowSuspention(ClassProfile.getEmailByUsername(Request.QueryString("username"))).Rows(0)
                    End If
                    Dim s() As String = ClassCMS_Nazmie.GetBandFromTableOrginal(ClassProfile.getEmailByUsername(Request.QueryString("username"))).Split(";")
                    Select Case s(1)
                        Case 0
                            lblBand.Text = String.Format("کاربر محترم شما به دلیل رعایت نکردن قوانین شهر دات کام و با جزییات زیر از تاریخ {0} به مدت یک هفته از ورود به شهر منع شده اید.<br/> با تشکر مدیریت نظمیه ", s(0))
                        Case 1
                            lblBand.Text = String.Format("کاربر محترم شما به دلیل رعایت نکردن قوانین شهر دات کام و با جزییات زیر از تاریخ {0} به مدت یک ماه از ورود به شهر منع شده اید.<br/> با تشکر مدیریت نظمیه ", s(0))
                        Case 2
                            lblBand.Text = String.Format("کاربر محترم شما به دلیل رعایت نکردن قوانین شهر دات کام و پس از دو تعلیق و با جزییات زیر از تاریخ {0} از عضویت شهر خارج شده و اخراج شده اید.<br/> با تشکر مدیریت نظمیه ", s(0))
                        Case -2
                            lblBand.Text = String.Format("کاربر محترم حساب شهروندی شما از تاریخ {0} بصورت تعلیق در آمده است، لطفا منتظر بمانید و یا با واحد پشتیبانی شهر تماس بگیرید..<br/> با تشکر مدیریت نظمیه ", s(0))
                    End Select
                    lblDetailBand.Text = row(6)
                Catch ex As Exception
                End Try
            Case "Password"
                MultiView.ActiveViewIndex = 3
            Case "create"
                MultiView.ActiveViewIndex = 4
            Case "Statement"
                MultiView.ActiveViewIndex = 5
            Case "NoUser"
                MultiView.ActiveViewIndex = 6
            Case "EndSe"
                MultiView.ActiveViewIndex = 7
            Case "UserNoAllow"
                MultiView.ActiveViewIndex = 8
        End Select
        MultiPassword.ActiveViewIndex = 0
        Captcha.Width = 715

    End Sub

    Public Sub CheckCorrectSecureStatement(ByVal sender As Object, ByVal e As CommandEventArgs)

        If ClassHomeSetting.GetIDStatementSecurtiy(email) = e.CommandArgument Then
            Session("CounterSecurity") = 0
            ''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''' بررسی جمله امنیتی  ''''''''''
            Dim dr As DataRow = ClassHomeSetting.Permission(email)
            If dr(2) = True Then
                Response.Redirect("~\outscope\state.aspx?state=Statement&username=" + ClassProfile.getUsernameByEmail(email))
            Else

                Session("MY-UsErNaMe") = email

                FormsAuthentication.SetAuthCookie(email, True)

                Session("CounterSecurity") = 0 'اگر کاربر دو مرتبه جمله امنیتی را اشتباه وارد کرد سیستم قفل می شود و این سیشن هم باید خالی شود که بعداز رفع قفل کاربر بتواند وارد سیستم شود
                'بروزرسانی آخرین تاریخ ورود به سیستم
                ClassOnline.UpdateLastaLogin(email)
                'فعال کردن وضعیت آنلان کاربر
                ClassOnline.UpdateOnlineOffline(1, email)
                'ورود به پنل شخصی
                Response.Redirect("~\home\")

            End If
            ''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''''''''''''''''''''''''''''''''
        Else
            Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
            DG_Secure.DataBind()
            DG_Secure2.DataBind()
        End If
        CheckTimeOut()

    End Sub

    Private Sub CheckTimeOut()
        If Val(Session("CounterSecurity")) >= 3 Then
            ClassHomeSetting.UpdateBandUser(email, False)
            HttpContext.Current.Session.Abandon()
            'Delete Cookie
            Try
                Response.Cookies("ShaahrDotCom").Expires = DateTime.Now.AddYears(-30)
            Catch ex As Exception
            End Try
            '
            Response.Redirect("~\Default.aspx")
        End If
    End Sub

    'Protected Sub btnAuth_com_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAuth_com_1.Click

    '    ccJoin.ValidateCaptcha(txtCaptcha.Text)
    '    If ccJoin.UserValidated Then
    '        Dim dr As DataRow = ClassHomeSetting.Permission(email)
    '        If dr(3) Then
    '            dr = ClassHomeSetting.Permission(email)
    '            If txtComputerName.Text <> dr(4) Then
    '                Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
    '                lblComputerName.Text = "نام سیستم وارد شده نادرست می باشد."
    '                CheckTimeOut()
    '            Else
    '                ClassHomeSetting.UpdateCitizenName(System.Net.Dns.GetHostEntry(Request.ServerVariables("remote_addr")).HostName, email)
    '                Response.Redirect("~\default.aspx")
    '            End If
    '        End If
    '    Else
    '        Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
    '        lblComputerName.Text = "کد تصویر وارد شده نادرست می باشد."
    '        CheckTimeOut()
    '    End If

    'End Sub

    Protected Sub btnAuth_com_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAuth_com_2.Click

        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''
        'Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
        'lblComputerName2.Text = "کد تصویر وارد شده نادرست می باشد."
        'CheckTimeOut()
        ''''''''''''''''''''

        If ClassEnter.CheckEmail(txtEmail.Text) Then
            'insert
            If Not ClassEnter.CheckDupReq(txtEmail.Text) Then
                If ClassEnter.InsertNotMachComputerName(txtEmail.Text, "-", txtG_Statement.Text) Then
                    txtEmail.Text = ""
                    txtG_Statement.Text = ""
                    lblComputerName2.Text = "درخواست شما با موفقیت ارسال شده است لطفا منتظر پاسخ بمانید."
                    Captcha.Clear()
                Else
                    lblComputerName2.Text = "سیستم دچار مشکل می باشد لطفا در زمان دیگری اقدام کنید."
                    Captcha.Clear()
                End If
            Else
                lblComputerName2.Text = "درخواست قبلا برای گروه پشتیبانی فرستاده شده است. لطفا منتظر پاسخ بمانید. با تشکر"
                Captcha.Clear()
            End If
        Else
            lblComputerName2.Text = "این پست الکترونیکی در سیستم وجود ندارد."
        End If

    End Sub

    Protected Sub btnSendEmail_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSendEmail.Click

        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''
        If ClassEnter.CheckEmailUsername(txtF_Email_1.Text, txtF_User.Text) Then
            ''''''''''''''''''''''''''' Sending Email '''''''''''''''''''''
            '
            '
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            txtF_Email_1.Text = ""
            txtF_Email_2.Text = ""
            txtF_User.Text = ""
            MultiPassword.ActiveViewIndex = 1
        Else
            lblPassword.Text = "نام کاربری , پست الکترونیکی ناردست می باشد."
        End If

    End Sub

    Public Sub CheckCorrectSecureStatement2(ByVal sender As Object, ByVal e As CommandEventArgs)

        If ClassHomeSetting.GetIDStatementSecurtiy(email) = e.CommandArgument Then
            Session("CounterSecurity") = 0
            Session("MY-UsErNaMe") = ClassProfile.getEmailByUsername(Request.QueryString("username"))
            FormsAuthentication.RedirectFromLoginPage(email, True)
            Response.Redirect("~\home\")
        Else
            Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
            DG_Secure.DataBind()
            DG_Secure2.DataBind()
        End If
        CheckTimeOut()

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Response.Redirect("~/outscope/CreateAccount/")
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Response.Redirect("~/outscope/authenticate/")
    End Sub

    Protected Sub ODS_StatementSecurity_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_StatementSecurity.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("username"))
    End Sub

    Protected Sub BtnGotoLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGotoLogin.Click
        Response.Redirect("~\")
    End Sub

    Protected Sub ODS_Select_CitizenPictures_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Select_CitizenPictures.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("username"))
    End Sub

    Public Sub SelectCitizenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)


        Dim dr As DataRow = ClassHomeSetting.Permission(email)
        ''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''
        If dr(4) = e.CommandArgument Then

            Session("CounterSecurity") = 0
            ''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''' بررسی جمله امنیتی  ''''''''''
            If dr(2) = True Then
                Response.Redirect("~\outscope\state.aspx?state=Statement&username=" + ClassProfile.getUsernameByEmail(txtEmail.Text))
            Else

                Session("MY-UsErNaMe") = email

                FormsAuthentication.SetAuthCookie(txtEmail.Text, True)

                Session("CounterSecurity") = 0 'اگر کاربر دو مرتبه جمله امنیتی را اشتباه وارد کرد سیستم قفل می شود و این سیشن هم باید خالی شود که بعداز رفع قفل کاربر بتواند وارد سیستم شود
                'بروزرسانی آخرین تاریخ ورود به سیستم
                ClassOnline.UpdateLastaLogin(email)
                'فعال کردن وضعیت آنلان کاربر
                ClassOnline.UpdateOnlineOffline(1, email)
                'ورود به پنل شخصی
                Response.Redirect("~\home\")

            End If
            ''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''''''''''''''''''''''''''''''''
        Else
            DL_CitizenPhoto.DataBind()
            Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
            DG_Secure.DataBind()
            DG_Secure2.DataBind()
        End If
        CheckTimeOut()

    End Sub

End Class
