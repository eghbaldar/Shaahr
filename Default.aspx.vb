Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Dim ClassEnter As New EnterUsers
    Dim ClassProfile As New View_Users
    Dim ClassOnline As New Online
    Dim ClassHomeProfile As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage
    Dim ClassCMS_Nazmie As New CMS_Nazmie
    Dim ClassCharacter3 As New Character3
    Dim ClassEvent As New CMS_Event

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Online
        OnlineUsers()
        'Other Setting 
        lblDateTime.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate) + " ساعت: " + DateTime.Now.TimeOfDay.ToString.Substring(0, 8)
        If Not IsPostBack Then
            Session("LimitWrongLogin") = 0
        End If
        'Check Cookie
        Try
            If Request.Cookies("ShaahrDotCom").Value.ToString() <> "" Then
                '
                Dim LastDate() As String = ClassEnter.GetLastLognDate(Request.Cookies("ShaahrDotCom").Value.ToString()).Split(";")
                lblLastDate.Text = String.Format("تاریخ آخرین ورود: {0}", LastDate(0))
                '
                mvLogin.ActiveViewIndex = 1
                lblFnSignutre.Text = ClassEnter.Get_FnLn_PicUser(Request.Cookies("ShaahrDotCom").Value.ToString(), True).ToString
                imgSignture.ImageUrl = "~/user/Crop.aspx?P=" + ClassEnter.Get_FnLn_PicUser(Request.Cookies("ShaahrDotCom").Value.ToString(), False).ToString + "&W=100&H=100"

            End If
        Catch ex As Exception
        End Try
        '----------------------- Check Dont Enter (login)
        If ClassEnter.Get_DontEnter() = True Then
            mvLogin.ActiveViewIndex = 2
            lblDontEnter.Text = ClassEnter.Get_TextDontEnter
        End If
        '----------------------- check Dont show Ads
        If ClassEnter.Get_DontAds() = True Then
            'PnlAds.Visible = False
        End If
        'Fill Ads
        Dim Ads() As String = ClassEnter.Get_Ads
        'lblAds_1.Text = Ads(0)
        'lblAds_2.Text = Ads(1)
        'lblAds_3.Text = Ads(2)
        'lblAds_4.Text = Ads(3)
        'lblAds_5.Text = Ads(4)
        'lblAds_6.Text = Ads(5)
        '-------------------------------
        '[Header] nad [PicTextLinkDay] and [Consideration Allow-Register]
        imgHeader.ImageUrl = "~\content\images\header\" + ClassEnter.Get_Header
        imgPicDay.ImageUrl = "~\Content\images\Day_Picture\" + ClassEnter.Get_PicDay(0)
        lblDayText.Text = ClassEnter.Get_PicDay(1)
        lblText.Text = ClassHomeProfile.GeText_Logo_OfTopSite(True)
        imgRegister.Visible = ClassEnter.Get_DontRegister
        'درج آمار صفحه اول
        If Not IsPostBack And Session("Default") = Nothing Then
            ClassEnter.InsertCMSStatistical(Request.UserHostAddress.ToString, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), 1)
            Session("Default") = "Shaahr"
        End If
        '''''''''''''''
        Dim ClassManagement As New CMS_Management
        Dim dr As DataRow = ClassManagement.GetCompelemnt.Rows(0)
        If dr(14) = True Then
            'btnRegister.Text = "ثبت نام در حال حاضر انجام نخواهد شد."
            'btnRegister.NavigateUrl = ""
            'btnRegister.ForeColor = Drawing.Color.Red
        Else
            'btnRegister.ForeColor = Drawing.Color.Green
        End If
        ''''''''''''''
        txtEmail.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnEnter.ClientID & "')")
        txtPassword.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnEnter.ClientID & "')")

    End Sub

    Private Sub OnlineUsers()
        lblOnline.Text = Str(Val(ClassOnline.GetCountOnlineUsers) + Val(Application("OnlineGuest")))
        lblUsers.Text = ClassEvent.GetInformation(2)
        'lblUsersOnline.Text = String.Format("تعداد کاربران آنلاین: {0}", ClassOnline.GetCountOnlineUsers)
        'lblUsersGuest.Text = String.Format("تعداد کاربران مهمان: {0}", Application("OnlineGuest"))
    End Sub

    Protected Sub btnEnter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnter.Click

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

    Protected Sub btnDeleteCookie_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDeleteCookie.Click
        Try
            Response.Cookies("ShaahrDotCom").Expires = DateTime.Now.AddYears(-30)
            Response.Redirect("~\default.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnGotoHome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGotoHome.Click

        Try
            Dim Email As String = Request.Cookies("ShaahrDotCom").Value.ToString()
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            '''''''''''''' چک کردن درجه شهروندی
            ClassEnter.CheckDecreaseDegreeUser(Email)
            '''''''''''''''  بررسی اخراجی
            Dim s() As String = ClassCMS_Nazmie.GetBandFromTableOrginal(Email).Split(";")
            If s(1) = 2 Then Response.Redirect("~\outscope\state.aspx?state=Band&username=" + ClassProfile.getUsernameByEmail(Email))
            ''''''''''''''  چک کردن تعلق بودن کاربر که اگر بود بررسی شود که اگر از تاریخش گذشته رفع تعلیق شود 
            If Not ClassEnter.Get_BandStatus(Email) And ClassCMS_Nazmie.Select_RowSuspention(Email).Rows.Count > 0 Then
                Dim ClassStage As New Stage
                Dim row As DataRow = ClassCMS_Nazmie.Select_RowSuspention(Email).Rows(0)
                If ClassStage.Bozorgtar_kochiktar(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), row(5)) = 1 Then
                    'یک کردن فیلد بند جدول اورجینال
                    ClassCMS_Nazmie.UpdateBand(1, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";-1", Email)
                End If
            End If
            ''''''''''''''چک کردن قفل بودن یا نبود کاربر فیلدی بنام بند در جدول اوریجینال''''''''''
            If Not ClassEnter.Get_BandStatus(Email) Then
                Response.Redirect("~\outscope\state.aspx?state=Band&username=" + ClassProfile.getUsernameByEmail(Email))
                Exit Sub
            End If
            ''''''''''''''' بررسی تایید همشهری  ''''''''''
            Dim dr As DataRow = ClassHomeSetting.Permission(Email)
            If dr(3) Then
                Response.Redirect("~\outscope\state.aspx?state=NCom&username=" + ClassProfile.getUsernameByEmail(Email))
            End If
            '''''''''''''''چک کردن فیلد جمله امنیتی از فیلد حق دسترسی ها که اگر درست بود باید جمله امنیتی چک شود''''''''''
            If dr(2) = True Then
                Response.Redirect("~\outscope\state.aspx?state=Statement&username=" + ClassProfile.getUsernameByEmail(Email))
            End If
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'درج اطلاعات ورودی کاربر 
            ClassEnter.UpdateFlag_EnterStatistical(Email)
            ClassEnter.InsertEnterStatistical(Email, Request.UserHostAddress.ToString)
            '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'درجه شهروندی
            ClassHomeProfile.UpdateStarNum(Val(ClassHomeProfile.GetStarNum(Email)) + 1, txtEmail.Text)
            ' چک کردن فیلد های چت
            Session.Clear()
            ''''''''''' amaliate sabte cookie
            If chkRemember.Checked Then
                Dim c As New HttpCookie("ShaahrDotCom", Email)
                c.Expires = DateTime.Now.AddYears(1)
                Context.Response.Cookies.Add(c)
            End If
            'Status
            ClassOnline.UpdateStatusCodeByEmail(1, Email) 'moghe khoroj karbar Na-Marie mishavad Code=4
            'اگر کاربر مدت زیادی نیامده بود توسط شخصیت سوم پیامی صادر شود
            If ClassCharacter3.Get_Character3_OverMonthNoEnter(Email) Then
                ClassCharacter3.Insert_Charaacter3_Users(Email, "ســـــــــــــــــلام کجایی شما؟ بیشتر از یک ماه که نیومدی !! انشالله بیشتر سر بزنی به خونه ی خودت دوست من", "LV", True)
            End If

            Session("MY-UsErNaMe") = Email

            FormsAuthentication.SetAuthCookie(Email, True)

            Session("CounterSecurity") = 0 'اگر کاربر دو مرتبه جمله امنیتی را اشتباه وارد کرد سیستم قفل می شود و این سیشن هم باید خالی شود که بعداز رفع قفل کاربر بتواند وارد سیستم شود
            'بروزرسانی آخرین تاریخ ورود به سیستم
            ClassOnline.UpdateLastaLogin(Email)
            'فعال کردن وضعیت آنلان کاربر
            ClassOnline.UpdateOnlineOffline(1, Email)
            'ورود به پنل شخصی
            Response.Redirect("~\home\")
            imgErr.Visible = False

        Catch ex As Exception
        End Try

    End Sub

    Protected Sub imgPicDay_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgPicDay.Click
        If ClassEnter.Get_PicDay(2) <> "" Then
            Redirect(ClassEnter.Get_PicDay(2), "_blank", "")
        End If
    End Sub

    Public Shared Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)

        Dim context As HttpContext = HttpContext.Current
        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then
            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)
            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If
            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If

    End Sub

End Class
