Imports System.Data

Partial Class user_info
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    '--------------پاک شدنی ها
    'Dim em_me As String = "ali@y.y" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String  'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        Title = String.Format("اطلاعات فردی {0}", ClassProfile_Section.GetFnLn(em_owner))
        '----Fill information fields
        FillInformation()
        FillOutWard()
        Permission()

    End Sub

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Personal Informaion'''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(10)
            Case 0 'نمایش برای همه
                Div_InfoPersonal.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoPersonal.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoPersonal.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoPersonal.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_InfoPersonal.Visible = False
                End If
            Case 5 'هیچکس
                Div_InfoPersonal.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Personal Informaion'''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(11)
            Case 0 'نمایش برای همه
                Div_InfoOutWard.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoOutWard.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoOutWard.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoOutWard.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_InfoOutWard.Visible = False
                End If
            Case 5 'هیچکس
                Div_InfoOutWard.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Favorit Informaion'''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(12)
            Case 0 'نمایش برای همه
                Div_InfoFavorit.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoFavorit.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoFavorit.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_InfoFavorit.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_InfoFavorit.Visible = False
                End If
            Case 5 'هیچکس
                Div_InfoFavorit.Visible = False
        End Select
        ''
    End Sub

    Private Sub FillInformation()

        'Try
        Dim dr As DataRow = ClassProfile_Section.InformationUser(em_owner)
        lblFn_f.Text = IIf(dr(1).ToString().Trim = String.Empty, "-", dr(1))
        lblLn_f.Text = IIf(dr(2).ToString().Trim = String.Empty, "-", dr(2))
        lblFn_E.Text = IIf(dr(3).ToString().Trim = String.Empty, "-", dr(3))
        lblLn_E.Text = IIf(dr(4).ToString().Trim = String.Empty, "-", dr(4))
        lblAlias.Text = IIf(dr(5).ToString().Trim = String.Empty, "-", dr(5))
        lblSex.Text = IIf(dr(17) = 0, "مرد", "زن")

        Select Case dr(18).ToString
            Case "0"
                lblMarrid.Text = "مجرد"
            Case "1"
                lblMarrid.Text = "متاهل"
            Case "2"
                lblMarrid.Text = "طلاق گرفته"
        End Select
        'lblMarrid.Text = dr(18)

        Dim sDateMonth As String
        Select Case dr(8).ToString
            Case 1
                sDateMonth = "فروردین"
            Case 2
                sDateMonth = "اردیبهشت"
            Case 3
                sDateMonth = "خرداد"
            Case 4
                sDateMonth = "تیر"
            Case 5
                sDateMonth = "مرداد"
            Case 6
                sDateMonth = "شهریور"
            Case 7
                sDateMonth = "مهر"
            Case 8
                sDateMonth = "آبان"
            Case 9
                sDateMonth = "آذر"
            Case 10
                sDateMonth = "دی"
            Case 11
                sDateMonth = "بهمن"
            Case 12
                sDateMonth = "اسفند"
        End Select

        lblDateBirth.Text = dr(9).ToString + " / " + sDateMonth + " / " + dr(7).ToString

        lblTimeBirth.Text = IIf(dr(10).ToString().Trim = "0", "-", dr(10))


        Select Case dr(20)
            Case 1
                lblReligion.Text = "-"
            Case 2
                lblReligion.Text = "اسلام"
            Case 3
                lblReligion.Text = "مسیحی"
            Case 4
                lblReligion.Text = "زرتشتی"
            Case 5
                lblReligion.Text = "یهودی"
        End Select
        'lblReligion.Text = IIf(dr(20).ToString().Trim = String.Empty, "{ نامشخص }", dr(20))

        Select Case dr(21)
            Case 0
                lblMazhab.Text = "-"
            Case 1
                lblMazhab.Text = "شیعی"
            Case 2
                lblMazhab.Text = "سنی"
        End Select
        'lblMazhab.Text = IIf(dr(21).ToString().Trim = String.Empty, "{ نامشخص }", dr(21))

        lblEcuation.Text = ClassHomeSetting.GetEducation(dr(6))

        Dim slocation() As String = ClassProfile_Section.GetCountryStateCity(dr(11), dr(12), dr(13))
        lblCountry.Text = slocation(0)
        lblState.Text = slocation(1)
        lblCity.Text = slocation(2)

        'lblNoneLocation.Text = IIf((IIf(dr(14).ToString().Trim = String.Empty, "0", dr(14))) = 0, "{ نامشخص }", dr(15))
        lblNoneLocation.Text = IIf((IIf(dr(14).ToString().Trim = String.Empty, "0", dr(14))) = 0, "-", dr(15))

        lblAddress.Text = IIf(dr(16).ToString().Trim = String.Empty, "-", dr(16))

        Select Case dr(22)
            Case 0
                lblForeignLanguage.Text = "-"
            Case 1
                lblForeignLanguage.Text = "انگلیسی"
            Case 2
                lblForeignLanguage.Text = "فرانسه"
            Case 3
                lblForeignLanguage.Text = "آلمانی"
            Case 4
                lblForeignLanguage.Text = "ایتالیایی"
            Case 5
                lblForeignLanguage.Text = "عربی"
            Case 6
                lblForeignLanguage.Text = "اسپانیایی"
            Case 7
                lblForeignLanguage.Text = "پرتقالی"
            Case 8
                lblForeignLanguage.Text = "اردو"
            Case 9
                lblForeignLanguage.Text = "مالایی"
        End Select
        'lblForeignLanguage.Text = IIf(dr(22).ToString().Trim = String.Empty, "{ نامشخص }", dr(22))

        Select Case dr(23)
            Case 0
                lblPolctic.Text = "-"
            Case 1
                lblPolctic.Text = "سیاست بی سیاست"
            Case 2
                lblPolctic.Text = "راستی"
            Case 3
                lblPolctic.Text = "چپی"
            Case 4
                lblPolctic.Text = "نه راست نه چپ"
        End Select

        Select Case dr(19)
            Case 0
                lblDodi.Text = "-"
            Case 1
                lblDodi.Text = "سیگاری"
            Case 2
                lblDodi.Text = "قلیونی"
            Case 3
                lblDodi.Text = "متنفرم .. !!"
        End Select

        lblWebPage.Text = dr(24).ToString
        lblWebPage.NavigateUrl = EditLink(dr(24).ToString)

        lblBlogPage.Text = dr(25).ToString
        lblBlogPage.NavigateUrl = EditLink(dr(25).ToString)

        'Catch ex As Exception

        'End Try
        
    End Sub

    Private Function EditLink(ByVal link As String) As String

        Dim s As String
        s = IIf(link.Trim = String.Empty, "-", link.Replace("www.", Nothing).Replace("http:\\", "").Replace("http://", ""))
        Return "http://" + s

    End Function

    Private Sub FillOutWard()

        'Try
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(em_owner)
        lblHeight.Text = IIf(dr(2).ToString().Trim = String.Empty, "{ نامشخص }", dr(2))
        lblWieght.Text = IIf(dr(3).ToString().Trim = String.Empty, "{ نامشخص }", dr(3))
        'Morality
        Select Case dr(4)
            Case 0 : lblMorality.Text = "-"
            Case 1 : lblMorality.Text = "جدی"
            Case 2 : lblMorality.Text = "شوخ طبع"
            Case 3 : lblMorality.Text = "دوستانه"
            Case 4 : lblMorality.Text = "شلوغ"
            Case 5 : lblMorality.Text = "تیز هوش"
            Case 6 : lblMorality.Text = "گوشه گیر"
            Case 7 : lblMorality.Text = "خشک"
            Case 8 : lblMorality.Text = "بداخلاق"
            Case 9 : lblMorality.Text = "سایر"
        End Select
        'lblMorality.Text = IIf(dr(4).ToString().Trim = String.Empty, "{ نامشخص }", dr(4))

        'Behaviour
        Select Case dr(9)
            Case 0 : lblBehaviour.Text = "-"
            Case 1 : lblBehaviour.Text = "مهربان"
            Case 2 : lblBehaviour.Text = "آرام"
            Case 3 : lblBehaviour.Text = "خونسرد"
            Case 4 : lblBehaviour.Text = "قاطع"
            Case 5 : lblBehaviour.Text = "مدعی"
            Case 6 : lblBehaviour.Text = "عصبانی"
            Case 7 : lblBehaviour.Text = "پرخاشگرانه"
            Case 8 : lblBehaviour.Text = "تهاجمی"
            Case 9 : lblBehaviour.Text = "پرجنب و جوش"
            Case 10 : lblBehaviour.Text = "سایر"
        End Select
        'lblBehaviour.Text = IIf(dr(9).ToString().Trim = String.Empty, "{ نامشخص }", dr(9))

        'Cover
        Select Case dr(5)
            Case 0 : lblCover.Text = "-"
            Case 1 : lblCover.Text = "سنگین"
            Case 2 : lblCover.Text = "راحت"
            Case 3 : lblCover.Text = "معمولی"
            Case 4 : lblCover.Text = "کت و شلوار (مجلسی)"
            Case 5 : lblCover.Text = "چادری (حجاب برتر)"
            Case 6 : lblCover.Text = "اسپرت"
            Case 7 : lblCover.Text = "مد روز (متغیر)"
            Case 8 : lblCover.Text = "مارکدار"
            Case 9 : lblCover.Text = "جین"
            Case 10 : lblCover.Text = "سایر"
        End Select
        'lblCover.Text = IIf(dr(5).ToString().Trim = String.Empty, "{ نامشخص }", dr(5))

        'ColorSkin
        Select Case dr(1)
            Case 0 : lblColorSkin.Text = "-"
            Case 1 : lblColorSkin.Text = "بسیار روشن (سفید)"
            Case 2 : lblColorSkin.Text = "زیتون پوستی یا مدیترانه ای یا آُسیایی (مایل به زرد)"
            Case 3 : lblColorSkin.Text = "سبزه (برنزه روشن)"
            Case 4 : lblColorSkin.Text = "قهوه ای روشن (برنزه تیره)"
            Case 5 : lblColorSkin.Text = "قهوه ای تیره (سیاه – تیره)"
        End Select
        'lblColorSkin.Text = IIf(dr(1).ToString().Trim = String.Empty, "{ نامشخص }", dr(1))

        'Organ
        Select Case dr(8)
            Case 0 : lblOrgan.Text = "-"
            Case 1 : lblOrgan.Text = "چاق"
            Case 2 : lblOrgan.Text = "لاغر"
            Case 3 : lblOrgan.Text = "معمولی"
            Case 4 : lblOrgan.Text = "ورزشکاری"
            Case 5 : lblOrgan.Text = "سایر"
        End Select
        'lblOrgan.Text = IIf(dr(8).ToString().Trim = String.Empty, "{ نامشخص }", dr(8))

        Select Case dr(10)
            Case 0 : lblStatusHeair.Text = "-"
            Case 1 : lblStatusHeair.Text = "صاف"
            Case 2 : lblStatusHeair.Text = "فر"
            Case 3 : lblStatusHeair.Text = "بی مو"
            Case 4 : lblStatusHeair.Text = "کم مو"
            Case 5 : lblStatusHeair.Text = "پر پشت"
            Case 6 : lblStatusHeair.Text = "سایر"
        End Select
        'lblStatusHeair.Text = IIf(dr(10).ToString().Trim = String.Empty, "{ نامشخص }", dr(10))

        Select Case dr(7)
            Case 0 : lblColorHeair.Text = "-"
            Case 1 : lblColorHeair.Text = "مشکی"
            Case 2 : lblColorHeair.Text = "قهوه ای"
            Case 3 : lblColorHeair.Text = "بور"
            Case 4 : lblColorHeair.Text = "طلایی"
            Case 5 : lblColorHeair.Text = "جو گندمی"
            Case 6 : lblColorHeair.Text = "سفید"
            Case 7 : lblColorHeair.Text = "سایر"
        End Select
        'lblColorHeair.Text = IIf(dr(7).ToString().Trim = String.Empty, "{ نامشخص }", dr(7))

        Select Case dr(6)
            Case 0 : lblColorEyes.Text = "-"
            Case 1 : lblColorEyes.Text = "مشکی"
            Case 2 : lblColorEyes.Text = "قهوه ای"
            Case 3 : lblColorEyes.Text = "آبی"
            Case 4 : lblColorEyes.Text = "سبز"
            Case 5 : lblColorEyes.Text = "خاکستری"
            Case 6 : lblColorEyes.Text = "سایر"
        End Select
        'lblColorEyes.Text = IIf(dr(6).ToString().Trim = String.Empty, "{ نامشخص }", dr(6))
        'Catch ex As Exception
        'End Try

    End Sub

    Protected Sub ODS_FavortisCat_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_FavortisCat.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_Favorits_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = em_owner
    End Sub

    Public Function CountFavoritsUsers(ByVal code As Object) As String
        Return String.Format("علاقه مندان:{0}", "<b>" + ClassProfile_Section.getCountFavoritUser(code.ToString) + "</b>")
    End Function

End Class
