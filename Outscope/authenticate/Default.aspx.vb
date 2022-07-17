Imports System.Data

Partial Class outscope_authenticate_Default
    Inherits System.Web.UI.Page

    Dim ClassEnter As New EnterUsers
    Dim ClassProfile As New View_Users
    Dim ClassOnline As New Online
    Dim ClassHomeProfile As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCharacter3 As New Character3
    Dim ClassCMS_Nazmie As New CMS_Nazmie

    Protected Sub btnEnter_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEnter.Click

 
        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If

        Dim bCheck As Boolean = ClassEnter.CheckAuth(Server.HtmlDecode(txtEmail.Text), Server.HtmlDecode(txtPassword.Text))
        If bCheck Then
            '''''''''''''' چک کردن درجه شهروندی
            ClassEnter.CheckDecreaseDegreeUser(txtEmail.Text)
            '''''''''''''''  بررسی اخراجی
            Dim s() As String = ClassCMS_Nazmie.GetBandFromTableOrginal(txtEmail.Text).Split(";")
            If s(1) = 2 Then Response.Redirect("~\outscope\state.aspx?state=Band&username=" + ClassProfile.getUsernameByEmail(txtEmail.Text))
            ''''''''''''''  چک کردن تعلق بودن کاربر که اگر بود بررسی شود که اگر از تاریخش گذشته رفع تعلیق شود 
            If Not ClassEnter.Get_BandStatus(txtEmail.Text) And ClassCMS_Nazmie.Select_RowSuspention(txtEmail.Text).Rows.Count > 0 Then
                Dim ClassStage As New Stage
                Dim row As DataRow = ClassCMS_Nazmie.Select_RowSuspention(txtEmail.Text).Rows(0)
                If ClassStage.Bozorgtar_kochiktar(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), row(5)) = 1 Then
                    'یک کردن فیلد بند جدول اورجینال
                    ClassCMS_Nazmie.UpdateBand(1, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";-1", txtEmail.Text)
                End If
            End If
            ''''''''''''''چک کردن قفل بودن یا نبود کاربر فیلدی بنام بند در جدول اوریجینال''''''''''
            If Not ClassEnter.Get_BandStatus(txtEmail.Text) Then
                Response.Redirect("~\outscope\state.aspx?state=Band&username=" + ClassProfile.getUsernameByEmail(txtEmail.Text))
                Exit Sub
            End If
            ''''''''''''''' بررسی تایید همشهری  ''''''''''
            Dim dr As DataRow = ClassHomeSetting.Permission(txtEmail.Text)
            If dr(3) Then
                Response.Redirect("~\outscope\state.aspx?state=NCom&username=" + ClassProfile.getUsernameByEmail(txtEmail.Text))
            End If
            '''''''''''''''چک کردن فیلد جمله امنیتی از فیلد حق دسترسی ها که اگر درست بود باید جمله امنیتی چک شود''''''''''
            If dr(2) = True Then
                Response.Redirect("~\outscope\state.aspx?state=Statement&username=" + ClassProfile.getUsernameByEmail(txtEmail.Text))
            End If
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'درج اطلاعات ورودی کاربر 
            ClassEnter.UpdateFlag_EnterStatistical(txtEmail.Text)
            ClassEnter.InsertEnterStatistical(txtEmail.Text, Request.UserHostAddress.ToString)
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'درجه شهروندی
            If Val(ClassHomeProfile.GetStarNum(txtEmail.Text)) < 722 Then
                ClassHomeProfile.UpdateStarNum(Val(ClassHomeProfile.GetStarNum(txtEmail.Text)) + 1, txtEmail.Text)
            End If
            ' چک کردن فیلد های چت
            Session.Clear()
            ''''''''''' amaliate sabte cookie
            If chkRemember.Checked Then
                Dim c As New HttpCookie("ShaahrDotCom", txtEmail.Text)
                c.Expires = DateTime.Now.AddYears(1)
                Context.Response.Cookies.Add(c)
            End If
            'Status
            ClassOnline.UpdateStatusCodeByEmail(1, txtEmail.Text) 'moghe khoroj karbar Na-Marie mishavad Code=4
            'اگر کاربر مدت زیادی نیامده بود توسط شخصیت سوم پیامی صادر شود
            If ClassCharacter3.Get_Character3_OverMonthNoEnter(txtEmail.Text) Then
                ClassCharacter3.Insert_Charaacter3_Users(txtEmail.Text, "ســـــــــــــــــلام کجایی شما؟ بیشتر از یک ماه که نیومدی !! انشالله بیشتر سر بزنی به خونه ی خودت دوست من", "LV", True)
            End If

            Session("MY-UsErNaMe") = txtEmail.Text

            FormsAuthentication.SetAuthCookie(txtEmail.Text, True)

            Session("CounterSecurity") = 0 'اگر کاربر دو مرتبه جمله امنیتی را اشتباه وارد کرد سیستم قفل می شود و این سیشن هم باید خالی شود که بعداز رفع قفل کاربر بتواند وارد سیستم شود
            'بروزرسانی آخرین تاریخ ورود به سیستم
            ClassOnline.UpdateLastaLogin(txtEmail.Text)
            'فعال کردن وضعیت آنلان کاربر
            ClassOnline.UpdateOnlineOffline(1, txtEmail.Text)
            'ورود به پنل شخصی
            Response.Redirect("~\home\")
            imgErr.Visible = False
        Else
            Session("LimitWrongLogin") += 1
            imgErr.Visible = True
        End If
        '---------------- Enter 3 Wrong Username or Password
        If Session("LimitWrongLogin") = 3 Then
            HttpContext.Current.Session.Remove("LimitWrongLogin")
            Response.Redirect("~\outscope\state.aspx?state=Password")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("MY-UsErNaMe") <> String.Empty Then Response.Redirect("~\home\")
        If ClassEnter.Get_DontEnter() = True Then Response.Redirect("~/Outscope/state.aspx?state=NotRegister_OR_Entering")
        Captcha.Width = 727
        txtEmail.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnEnter.ClientID & "')")
        txtPassword.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnEnter.ClientID & "')")

    End Sub

End Class
