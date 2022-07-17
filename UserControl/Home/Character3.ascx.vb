
Partial Class UserControl_Home_Character3
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassCharacter3 As New Character3
    Dim ClassCMS_Character3 As New CMS_Character3
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then Fill()
    End Sub

    Private Sub Fill()

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'کار اجباری خوش آمد گویی مهمترین و اولین کاری است که نمایش داده شود
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If ClassCharacter3.Count_Character3_Users(Session("MY-UsErNaMe")) > 0 Then
            Mv_Ejbari.Visible = True ' visibily compsulsory multiview
            'کارهای اجباری
            If Not Convert.ToBoolean(ClassCharacter3.Get_Type_Character3_Users(Session("MY-UsErNaMe"))) Then
                Select Case ClassCharacter3.Get_WhichOne(Session("MY-UsErNaMe")).Trim
                    Case "M1" 'خوش آمد گویی
                        Mv_Ejbari.ActiveViewIndex = 0
                        lblWelcome.Text = String.Format("کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک" + _
                                    "عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم .<br /> در ادامه" + _
                                    "با معرفی بخش های مختلف سایت آشنا خواهی شد.", "<b>" + ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")) + "</b>")
                        Exit Sub
                    Case Else
                        Mv_Ejbari.Visible = False
                End Select
            End If
        End If
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'اگر در جدول (آ) کدی وجود داشت که در جدول (ب) وجود نداشت باید کارهای فوق اجباری انجام شود و به نمایش در بیاید
        ' آ ---> tbl_Profile_Character3_Compulsory
        ' ب ---> tbl_Profile_Character3_Users_Compulsory
        Dim GetTypeCodeObj() As String = ClassCharacter3.GetType_and_CodeObj(Session("MY-UsErNaMe"))

        If GetTypeCodeObj(0) <> "-1" And GetTypeCodeObj(1) <> "-1" Then

            Mv_FogheEjbari.Visible = True
            'اگر این دو مقدار مخالف -1 بود یعنی کار فوق اجباری وجود دارد که کاربر آن را ندیده است
            Select Case GetTypeCodeObj(0)
                Case "0" 'نظر سنجی
                    lblCodePoll.Text = GetTypeCodeObj(2)
                    Mv_FogheEjbari.ActiveViewIndex = 0
                    M_Polling.ActiveViewIndex = 0
                    Polling(GetTypeCodeObj(1))
                Case "1" 'اخبار ، اطلاعیه ، اعیاد و ...
                    Mv_FogheEjbari.ActiveViewIndex = 1
                    lblcodenews.Text = GetTypeCodeObj(2)
                    News(GetTypeCodeObj(1))
            End Select

            Exit Sub
        Else
            Mv_FogheEjbari.Visible = False
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'اگر در جدول {آ} رکوردی وجود داشت یا کارهای اجباری یا کارهای اتفاقی انجام می شود 
        ' آ ---> tbl_Profile_Character3_Users
        ' Yani 2ta If darim
        If ClassCharacter3.Count_Character3_Users(Session("MY-UsErNaMe")) > 0 Then

            Mv_Ejbari.Visible = True ' visibily compsulsory multiview
            'کارهای اجباری
            If Not Convert.ToBoolean(ClassCharacter3.Get_Type_Character3_Users(Session("MY-UsErNaMe"))) Then

                Select Case ClassCharacter3.Get_WhichOne(Session("MY-UsErNaMe")).Trim
                    Case "M1" 'خوش آمد گویی
                        Mv_Ejbari.ActiveViewIndex = 0
                        lblWelcome.Text = String.Format("کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک" + _
                                    "عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم .<br /> در ادامه" + _
                                    "با معرفی بخش های مختلف سایت آشنا خواهی شد.", "<b>" + ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")) + "</b>")
                    Case "M2" 'جیرینگ
                        Mv_Ejbari.ActiveViewIndex = 1
                    Case "M3" 'افراد آنلاین
                        Mv_Ejbari.ActiveViewIndex = 2
                    Case "M4" 'وضعیت  کاربر
                        Mv_Ejbari.ActiveViewIndex = 3
                    Case "M5" 'جستجو
                        Mv_Ejbari.ActiveViewIndex = 4
                    Case "M6" 'در ذهن من
                        Mv_Ejbari.ActiveViewIndex = 5
                    Case "M7" ' آواتار
                        Mv_Ejbari.ActiveViewIndex = 6
                    Case "M8" ' درجه شهروندی
                        Mv_Ejbari.ActiveViewIndex = 7
                    Case "M9" 'بازدیدکنندگان خانه شما
                        Mv_Ejbari.ActiveViewIndex = 8
                    Case "M10" '  منوی وسط صفحه
                        Mv_Ejbari.ActiveViewIndex = 9
                    Case "M11" '  بروزرسانی لحظه ای
                        Mv_Ejbari.ActiveViewIndex = 10
                    Case "M12" '  بروزرسانی اصلی
                        Mv_Ejbari.ActiveViewIndex = 11
                    Case "M13" '  رویدادهای کشور
                        Mv_Ejbari.ActiveViewIndex = 12
                    Case "M14" '  افراد آشنا
                        Mv_Ejbari.ActiveViewIndex = 13
                    Case "M15" '  شهرها
                        Mv_Ejbari.ActiveViewIndex = 14
                    Case "M16" '  لیست کارها
                        Mv_Ejbari.ActiveViewIndex = 15
                    Case "M17" '  منوس یمت چپ
                        Mv_Ejbari.ActiveViewIndex = 16
                    Case "M18" '  آیا می خواهید که کل بخش های سایت آشنا شوید؟
                        Mv_Ejbari.ActiveViewIndex = 17
                End Select

            End If
            'کارهای اتفاقی
            If Convert.ToBoolean(ClassCharacter3.Get_Type_Character3_Users(Session("MY-UsErNaMe"))) Then

                Select Case ClassCharacter3.Get_WhichOne(Session("MY-UsErNaMe")).Trim
                    Case "F" 'تبریک ایجاد دوستی
                        lbl_AcceptFriend.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "F")
                        Mv_Ejbari.ActiveViewIndex = 18
                    Case "S" 'پیوستن به شهری
                        lblJoinToShaahr.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "S")
                        Mv_Ejbari.ActiveViewIndex = 19
                    Case "CS" 'ایجاد شهری
                        lblMayor.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "CS")
                        Mv_Ejbari.ActiveViewIndex = 20
                    Case "CF" 'ناراحت شدن بابت قطع رابطه با شخصی
                        lbl_DeleteFreind.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "CF")
                        Mv_Ejbari.ActiveViewIndex = 21
                    Case "NT" 'توبیخ شدن توسط نظمیه
                        lbl_RailUser.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "NT")
                        Mv_Ejbari.ActiveViewIndex = 22
                    Case "IJ" 'خوشحل شدن بابت افزایش جیرینگ
                        Mv_Ejbari.ActiveViewIndex = 23
                        lbl_IncreaseJiring.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "IJ")
                    Case "DJ" ' ناراحت شدن باعث کاهش جیرینگ
                        lblDecreaseJiring.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "DJ")
                        Mv_Ejbari.ActiveViewIndex = 24
                    Case "FF" ' اعلام پرشدن صندوق پستی
                        lbl_FullFund.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "FF")
                        Mv_Ejbari.ActiveViewIndex = 25
                    Case "LV" 'اگر بعد از مدت طولانی به سایت سر نزد
                        lbl_OverMonth.Text = ClassCharacter3.Get_Detail(Session("MY-UsErNaMe"), "LV")
                        Mv_Ejbari.ActiveViewIndex = 26
                End Select

            End If
        Else
            Mv_Ejbari.Visible = False
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'اگر در جدول {آ} رکوردی وجود نداشت کارهای بیکاری انجام شود
        ' آ ---> tbl_Profile_Character3_Users
        If ClassCharacter3.Count_Character3_Users(Session("MY-UsErNaMe")) = 0 Then
            Dim rn As New Random()
            Select Case rn.Next(1, 8)
                Case 2 'morefi karbaran
                    If ClassStage.CheckServiceExsistUsersByType(6, Session("MY-UsErNaMe")) And ClassCharacter3.Get_CountRelate(Session("MY-UsErNaMe")) Then
                        Mv_Bikari.ActiveViewIndex = 0
                    End If
                Case 4 'morefi shaahr
                    If ClassCharacter3.Get_CountFavoritsUsers(Session("MY-UsErNaMe")) And ClassCharacter3.Get_AnyShaahr(Session("MY-UsErNaMe")) And ClassCharacter3.Get_CountShaahrsUsers(Session("MY-UsErNaMe")) Then
                        Mv_Bikari.ActiveViewIndex = 1
                    End If
                Case 5
                    Mv_Bikari.ActiveViewIndex = 2
                Case 6
                    Mv_Bikari.ActiveViewIndex = 2
            End Select
        End If
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    End Sub

    Private Sub Polling(ByVal CodeObj As Long)

        Dim sPoll() As String = ClassCharacter3.Polling(CodeObj)
        lblTitle.Text = sPoll(0)
        lblQuestion.Text = sPoll(1)

        lblDateTimeCountVotePoll.Text = String.Format("تاریخ: {0} ، زمان: {1} و تعداد رای دهندگان: {2}", sPoll(2), sPoll(3), ClassCharacter3.GetCountVoting(CodeObj))

        Dim lstOptionText As New List(Of String)
        lstOptionText = Nothing
        lstOptionText = ClassCharacter3.lstOptionText(CodeObj)

        Dim lstOptionValue As New List(Of String)
        lstOptionValue = Nothing
        lstOptionValue = ClassCharacter3.lstOptionValue(CodeObj)

        Dim lstItem As New ListItem
        For i As Byte = 0 To lstOptionText.Count - 1
            lstItem = New ListItem
            lstItem.Text = lstOptionText(i)
            lstItem.Value = lstOptionValue(i)
            rbOptionPoll.Items.Add(lstItem)
        Next
        Session("CodeEjbari") = ClassCharacter3.GetCodeEjbari(CodeObj)
        Session("CodePoll") = CodeObj


    End Sub

    Protected Sub rbOptionPoll_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbOptionPoll.SelectedIndexChanged
        ClassCMS_Character3.Insert_UsersCompulsory(Session("MY-UsErNaMe"), Session("CodeEjbari"))
        ClassCharacter3.InsertUserPoll(Session("CodePoll"), rbOptionPoll.SelectedValue, Session("MY-UsErNaMe"))
        lblCodePollForDG.Text = Session("CodePoll")

        lblCountAllVoter.Text = String.Format("تعداد شرکت کنندگان: {0}", ClassCharacter3.GetCountVoting(Session("CodePoll")))
        DG_Vote.DataBind()

        Session.Remove("CodeEjbari")
        Session.Remove("CodePoll")
        M_Polling.ActiveViewIndex = 1
    End Sub

    Public Function Perect(ByVal Column1 As Object, ByVal Option_ As String) As String

        Dim perect_ As Integer = Val(Column1.ToString.Substring(0, Column1.ToString.Length - 1))
        Dim ret As String = ""
        If perect_.ToString <> "0" Then
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;width:" & Val(perect_ * 2) & "px;background-color:#ACD7F2;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", Option_.ToString, "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        Else
            'صفر درصد
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", Option_.ToString, "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        End If
        Return ret

    End Function

    Private Sub News(ByVal CodeObj As Long)
        Dim sNews() As String = ClassCharacter3.News(CodeObj)
        lblTitleNews.Text = sNews(1)
        lblLidDetailNews.Text = sNews(2)
        PnlPicNews.BackImageUrl = "~\Content\images\Character3\Compulsory\News\" + sNews(3)
        lblDateTimeNews.Text = String.Format("تاریخ: {0} و زمان: {1}", sNews(4), sNews(5))
    End Sub

    Public Function MaleOrFamale(ByVal sex As Object) As String
        Select Case sex
            Case False
                Return "مرد"
            Case True
                Return "زن"
        End Select
    End Function
    Public Function MarridOrSingle(ByVal MS As Object) As String
        Select Case MS
            Case False
                Return "مجرد"
            Case True
                Return "متاهل"
        End Select
    End Function
    Public Function DateBirth(ByVal DB As Object) As String
        Return String.Format("تاریخ تولد: {0}", DB)
    End Function
    Public Function Favorit(ByVal Title As Object) As String
        Return "<span style='color:#587E8B;'>" + String.Format("علاقمندی مشترک: {0}", Title) + "</span>"
    End Function
    Public Sub GotoProfile(ByVal sender As Object, ByVal e As CommandEventArgs)
        'Response.Write(e.CommandArgument)
        Response.Redirect("~/user/default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub
    Public Function GetCategory(ByVal Code As String) As String
        Return ClassShaahr.GetFavorit(Code)
    End Function
    Public Function GetVisit(ByVal Visit As Long) As String
        Return String.Format("بازدیدها: {0}", "<b>" + Visit.ToString + "</b>")
    End Function


    Public Function PnlBirthDay(ByVal _date As Object) As Boolean
        Dim Check As String = ClassHome.BirthDay(_date.ToString)
        If Check = "00" Then
            Return False
        Else
            Return True
        End If
    End Function
    Public Function TextBirth(ByVal _date As Object, ByVal email As Object) As String

        Dim Check As String = ClassHome.BirthDay(_date.ToString)
        If Check = 0 Then
            Return "<div style='float:right;'></div><div style='float:right;margin-right:2px;color:green;'>" + String.Format("تولدش امروزه دوست من، حواست هست؟", "") + "</div>"
        End If
        If Check < 0 Then
            Return "<div style='float:right;color:#366879;'>" + String.Format("<div style='padding-right:2px;float:right;padding-left:2px; -moz-border-radius: 2px;background-color:#587e8b;color:white;'>{0}</div>" + "<div style='margin-right:2px;float:right;'>روز به تولدش مونده</div>", Math.Abs(Val(Check)), "") + "</span>"
        End If
        '
        If Check > 0 Then
            Return "<div style='float:right;color:#000;'>" + String.Format("<div style='padding-right:2px;float:right;padding-left:2px; -moz-border-radius: 2px;background-color:#000;color:white;'>{0}</div>" + "<div style='margin-right:2px;float:right;'>روز از تولدش گذشته </div>", Math.Abs(Val(Check)), "") + "</span>"
        End If

    End Function
    Public Function SetAvatar(ByVal email As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=100&H=100"
    End Function
    Public Function GetFnLn(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

#Region "عملیات رد کردن شخصیت سوم که معمولا با دگمه ای بنام بعدی انجام می شود"

    '------------------------------------- Button Skip or Response (کارهای اجباری )
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M1")
        Fill()
    End Sub
    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton2.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M2")
        Fill()
    End Sub
    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton3.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M3")
        Fill()
    End Sub
    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton4.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M4")
        Fill()
    End Sub
    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton5.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M5")
        Fill()
    End Sub
    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton6.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M6")
        Fill()
    End Sub
    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton7.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M7")
        Fill()
    End Sub
    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton8.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M8")
        Fill()
    End Sub
    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton9.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M9")
        Fill()
    End Sub
    Protected Sub ImageButton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton10.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M10")
        Fill()
    End Sub
    Protected Sub ImageButton11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton11.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M11")
        Fill()
    End Sub
    Protected Sub ImageButton12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton12.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M12")
        Fill()
    End Sub
    Protected Sub ImageButton13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton13.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M13")
        Fill()
    End Sub
    Protected Sub ImageButton14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton14.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M14")
        Fill()
    End Sub
    Protected Sub ImageButton31_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton31.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M15")
        Fill()
    End Sub
    Protected Sub ImageButton15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton15.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M16")
        Fill()
    End Sub
    Protected Sub ImageButton16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton16.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M17")
        Fill()
    End Sub
    Protected Sub ImageButton17_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton17.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "M18")
        'Response.Redirect("~\MyShaahr\help\ShaahrGeneral.aspx")
        'Fill()
        Mv_Ejbari.ActiveViewIndex = -1
    End Sub

    '------------------------------------- Button Skip or Response (کارهای ختیاری )
    Protected Sub ImageButton18_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton18.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "F")
        Fill()
    End Sub
    Protected Sub ImageButton32_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton32.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "S")
        Fill()
    End Sub
    Protected Sub ImageButton33_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton33.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "CS")
        Fill()
    End Sub

    Protected Sub ImageButton19_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton19.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "CF")
        Fill()
    End Sub
    Protected Sub ImageButton20_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton20.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "NT")
        Fill()
    End Sub
    Protected Sub ImageButton22_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton22.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "IJ")
        Fill()
    End Sub
    Protected Sub ImageButton21_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton21.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "DJ")
        Fill()
    End Sub
    Protected Sub ImageButton23_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton23.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "FF")
        Fill()
    End Sub
    Protected Sub ImageButton24_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton24.Click
        ClassCharacter3.Delete_Charaacter3_Users(Session("MY-UsErNaMe"), "LV")
        Fill()
    End Sub
    '------------------------------------- Button Skip or Response (کارهای فوق اجباری)
    Protected Sub ImageButton26_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton26.Click
        ClassCharacter3.Insert_Character3_Users_Compulsory(Session("MY-UsErNaMe"), lblCodePoll.Text)
        rbOptionPoll.Items.Clear()
        Fill()
    End Sub
    Protected Sub ImageButton25_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton25.Click
        Session.Remove("CodeEjbari")
        Session.Remove("CodePoll")
        rbOptionPoll.Items.Clear()
        Fill()
    End Sub
    Protected Sub ImageButton27_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton27.Click
        ClassCharacter3.Insert_Character3_Users_Compulsory(Session("MY-UsErNaMe"), lblcodenews.Text)
        Fill()
    End Sub
    '------------------------------------- Button Skip or Response (کارهای اختیاری)
    Public Sub Thanks(ByVal sender As Object, ByVal e As CommandEventArgs)
        Mv_Bikari.ActiveViewIndex = -1
    End Sub
#End Region

End Class

