Imports System.Data

Partial Class Management_Admin_UserAttrib
    Inherits System.Web.UI.Page

    Dim ClassUserM As New CMS_UserManagement
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassProfileHome As New HomeProfile

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("صفحه مدیریت:{0}", ClassProfile_Section.GetFnLn(Request.QueryString("email")))
        If Not IsPostBack Then

            Degree()
            FillInformation()
            FillContact()
            FillOutward()
            'Orginal Setting
            lblDateReg.Text = ClassHomeSetting.diffDate(ClassHomeSetting.GetDiffrentDateReg(Request.QueryString("email")), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            Dim ORG() As String = ClassHomeSetting.getUser_Email_RegDate(Request.QueryString("email"))
            Username_org.Text = ORG(0)
            lblEmail_org.Text = ORG(1)
            lblRegDate_org.Text = ORG(2)

            Dim DS_Query As New DS_SettingTableAdapters.Query
            Dim Decrypt As New Encryptor
            lblPassword.Text = Decrypt.DecryptText(DS_Query.getPassByEmail(Request.QueryString("email")), "GOD_mohammad_60592110128")

            lblCountFriend.Text = ClassUserM.GetCountRelationship(Request.QueryString("email"), 0)
            lblCountBastegan.Text = ClassUserM.GetCountRelationship(Request.QueryString("email"), 1)

            txtCurrentStart.Text = ClassUserM.GetStarNum(Request.QueryString("email"))
            Select Case ClassUserM.GetWife(Request.QueryString("email"))
                Case 1
                    lblWife.Text = "دارد"
                Case 0
                    lblWife.Text = "ندارد"
            End Select

        End If

    End Sub

    Private Sub FillOutward()

        Try
            Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
            'txtHeight.Text = IIf(dr(2).ToString().Trim = String.Empty, "{ نامشخص }", dr(2))
            'txtWeight.Text = IIf(dr(3).ToString().Trim = String.Empty, "{ نامشخص }", dr(3))
            'cmbMorality.Text = IIf(dr(4).ToString().Trim = String.Empty, "-", dr(4))
            'cmbBehaviour.Text = IIf(dr(9).ToString().Trim = String.Empty, "-", dr(9))
            'cmbCover.Text = IIf(dr(5).ToString().Trim = String.Empty, "-", dr(5))
            'FillColorSkin()
            'cmbOrgan.Text = IIf(dr(8).ToString().Trim = String.Empty, "-", dr(8))
            'cmbStatusH.Text = IIf(dr(10).ToString().Trim = String.Empty, "-", dr(10))
            'cmbHcolor.Text = IIf(dr(7).ToString().Trim = String.Empty, "-", dr(7))
            'cmbEyesColor.Text = IIf(dr(6).ToString().Trim = String.Empty, "-", dr(6))
            txtHeight.Text = IIf(dr(2).ToString().Trim = String.Empty, "{ نامشخص }", dr(2))
            txtWeight.Text = IIf(dr(3).ToString().Trim = String.Empty, "{ نامشخص }", dr(3))
            cmbMorality.Text = IIf(dr(4).ToString().Trim = String.Empty, "-", dr(4))
            cmbBehaviour.Text = IIf(dr(9).ToString().Trim = String.Empty, "-", dr(9))
            cmbCover.Text = IIf(dr(5).ToString().Trim = String.Empty, "-", dr(5))
            FillColorSkin()
            cmbOrgan.Text = IIf(dr(8).ToString().Trim = String.Empty, "-", dr(8))
            cmbStatusH.Text = IIf(dr(10).ToString().Trim = String.Empty, "-", dr(10))
            cmbHcolor.Text = IIf(dr(7).ToString().Trim = String.Empty, "-", dr(7))
            cmbEyesColor.Text = IIf(dr(6).ToString().Trim = String.Empty, "-", dr(6))
        Catch ex As Exception

        End Try

    End Sub

    Private Sub FillColorSkin()
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        Select Case dr(1)
            Case 0
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_skin_1.gif"
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_skin_2.gif"
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_skin_3.gif"
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_skin_4.gif"
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_skin_5.gif"
            Case 1
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_hightlight_skin_1.gif"
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_skin_2.gif"
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_skin_3.gif"
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_skin_4.gif"
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_skin_5.gif"
            Case 2
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_hightlight_skin_2.gif"
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_skin_1.gif"
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_skin_3.gif"
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_skin_4.gif"
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_skin_5.gif"
            Case 3
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_hightlight_skin_3.gif"
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_skin_2.gif"
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_skin_1.gif"
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_skin_4.gif"
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_skin_5.gif"
            Case 4
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_hightlight_skin_4.gif"
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_skin_2.gif"
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_skin_3.gif"
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_skin_1.gif"
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_skin_5.gif"
            Case 5
                img_color_skin_5.ImageUrl = "~\Content\images\Home\color_hightlight_skin_5.gif"
                img_color_skin_2.ImageUrl = "~\Content\images\Home\color_skin_2.gif"
                img_color_skin_3.ImageUrl = "~\Content\images\Home\color_skin_3.gif"
                img_color_skin_4.ImageUrl = "~\Content\images\Home\color_skin_4.gif"
                img_color_skin_1.ImageUrl = "~\Content\images\Home\color_skin_1.gif"
        End Select
    End Sub

    Protected Sub img_color_skin_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_1.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        If dr(1) = 1 Then
            ClassHomeSetting.UpdateOutWard(0, Request.QueryString("email"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(1, Request.QueryString("email"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_2.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        If dr(1) = 2 Then
            ClassHomeSetting.UpdateOutWard(0, Request.QueryString("email"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(2, Request.QueryString("email"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_3.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        If dr(1) = 3 Then
            ClassHomeSetting.UpdateOutWard(0, Request.QueryString("email"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(3, Request.QueryString("email"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_4.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        If dr(1) = 4 Then
            ClassHomeSetting.UpdateOutWard(0, Request.QueryString("email"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(4, Request.QueryString("email"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_5.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Request.QueryString("email"))
        If dr(1) = 5 Then
            ClassHomeSetting.UpdateOutWard(0, Request.QueryString("email"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(5, Request.QueryString("email"))
        FillColorSkin()
    End Sub

    Protected Sub btnUpdateOutward_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateOutward.Click
        'ClassHomeSetting.UpdateOutWard(cmbSkinColor.Text, IIf(txtHeight.Text.Trim = "", 0, txtHeight.Text), IIf(txtWeight.Text.Trim = "", 0, txtWeight.Text), cmbMorality.Text, _
        '                       cmbCover.Text, cmbEyesColor.Text, cmbHcolor.Text, _
        '                        cmbOrgan.Text, cmbBehaviour.Text, cmbStatusH.Text, Request.QueryString("email"))
        'FillOutward()
        ClassHomeSetting.UpdateOutWard(IIf(txtHeight.Text.Trim = "", 0, txtHeight.Text), IIf(txtWeight.Text.Trim = "", 0, txtWeight.Text), _
                               cmbMorality.SelectedValue, _
                               cmbCover.SelectedValue, cmbEyesColor.SelectedValue, cmbHcolor.SelectedValue, _
                               cmbOrgan.SelectedValue, cmbBehaviour.SelectedValue, cmbStatusH.SelectedValue, Request.QueryString("email"))
        FillOutward()
    End Sub

    Private Sub FillInformation()

        Dim dr As DataRow = ClassProfile_Section.InformationUser(Request.QueryString("email"))
        Title = String.Format("مدیریت شهر دات کام - مدیریت {0}", dr(1) + " " + dr(2))

        txtNameFN.Text = IIf(dr(1).ToString().Trim = String.Empty, "{ نامشخص }", dr(1)).Replace("ي", "ی")
        txtFamilyFN.Text = IIf(dr(2).ToString().Trim = String.Empty, "{ نامشخص }", dr(2)).Replace("ي", "ی")
        txtNameEN.Text = IIf(dr(3).ToString().Trim = String.Empty, "Unknow", dr(3))
        txtFamilyEn.Text = IIf(dr(4).ToString().Trim = String.Empty, "Unknow", dr(4))
        txtAlias.Text = IIf(dr(5).ToString().Trim = String.Empty, "{ نامشخص }", dr(5))
        cmbSex.SelectedValue = IIf(dr(17) = False, 0, 1)
        cmbMarrid.SelectedValue = IIf(dr(18) = False, 0, 1)

        Select Case dr(8).ToString
            Case 1
                cmbMonth.SelectedValue = 1
            Case 2
                cmbMonth.SelectedValue = 2
            Case 3
                cmbMonth.SelectedValue = 3
            Case 4
                cmbMonth.SelectedValue = 4
            Case 5
                cmbMonth.SelectedValue = 5
            Case 6
                cmbMonth.SelectedValue = 6
            Case 7
                cmbMonth.SelectedValue = 7
            Case 8
                cmbMonth.SelectedValue = 8
            Case 9
                cmbMonth.SelectedValue = 9
            Case 10
                cmbMonth.SelectedValue = 10
            Case 11
                cmbMonth.SelectedValue = 11
            Case 12
                cmbMonth.SelectedValue = 12
        End Select
        'cmbDay.Text = dr(9).ToString
        'cmbYears.Text = dr(7).ToString
        'txtTimeBirth.Text = IIf(dr(10).ToString().Trim = String.Empty, "{ نامشخص }", dr(10))

        ''lblDin.Text = dr(20).ToString()
        'cmbDin.SelectedValue = dr(20)

        'cmbMazhab.SelectedValue = dr(21)
        ''lblMazhab.Text = dr(21).ToString()

        ''cmbTahsilat.Text = IIf(dr(6).ToString().Trim = String.Empty, "{ نامشخص }", dr(6).ToString.Trim).Replace("ي", "ی")
        'cmbTahsilat.SelectedValue = dr(6)

        'cmbCountry.SelectedValue = dr(11)
        'cmbState.SelectedValue = dr(12)
        'cmbCity.SelectedValue = dr(13)
        'txtNoneAddress.Text = IIf(dr(15).ToString().Trim = String.Empty, "{ نامشخص }", dr(15).ToString.Trim).Replace("ي", "ی")
        'txtAddress.Text = IIf(dr(16).ToString().Trim = String.Empty, "{ نامشخص }", dr(16).ToString.Trim)

        'cmbLanguage.SelectedValue = dr(22)
        ''cmbLanguage.SelectedValue = IIf(dr(22).ToString().Trim = String.Empty, "{ نامشخص }", dr(22)).Replace("ي", "ی")

        'cmbPoletic.SelectedValue = dr(23)
        ''cmbPoletic.Text = IIf(dr(23).ToString().Trim = String.Empty, "{ نامشخص }", dr(23)).Replace("ي", "ی")

        'cmbDodi.SelectedIndex = dr(19)

        'txtWebsite.Text = IIf(dr(24).ToString().Trim = String.Empty, "{ نامشخص }", dr(24))
        'txtWeblog.Text = IIf(dr(25).ToString().Trim = String.Empty, "{ نامشخص }", dr(25))

        'lblError.Text = ""
        cmbDay.Text = dr(9).ToString
        cmbYears.Text = dr(7).ToString
        txtTimeBirth.Text = IIf(dr(10).ToString().Trim = String.Empty, "{ نامشخص }", dr(10))

        cmbDin.SelectedValue = IIf(dr(20).ToString <> "", dr(20), 1)

        cmbMazhab.SelectedValue = IIf(dr(21).ToString <> "", dr(21), 0)

        cmbTahsilat.SelectedValue = dr(6)

        cmbCountry.DataBind()
        cmbCountry.Items.FindByValue(dr(11)).Selected = True

        cmbState.DataBind()
        cmbState.Items.FindByValue(dr(12)).Selected = True

        cmbCity.DataBind()
        cmbCity.Items.FindByValue(dr(13)).Selected = True

        txtNoneAddress.Text = IIf(dr(15).ToString().Trim = String.Empty, "{ نامشخص }", dr(15).ToString.Trim).Replace("ي", "ی")
        txtAddress.Text = IIf(dr(16).ToString().Trim = String.Empty, "{ نامشخص }", dr(16).ToString.Trim)

        cmbLanguage.SelectedIndex = dr(22)

        cmbPoletic.SelectedIndex = dr(23)

        cmbDodi.SelectedIndex = dr(19)

        txtWebsite.Text = IIf(dr(24).ToString().Trim = String.Empty, "{ نامشخص }", dr(24))
        txtWeblog.Text = IIf(dr(25).ToString().Trim = String.Empty, "{ نامشخص }", dr(25))

        lblError.Text = ""
    End Sub

    Protected Sub btnUpdateInfo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateInfo.Click

        'Try
        'If txtFamilyEn.Text = "" Or txtFamilyFN.Text = "" Or txtNameEN.Text = "" Or txtNameFN.Text = "" Then
        '    lblError.Text = "چهار قسمت نام فارسی , نام خانوادگی فارسی , نام انگلیسی و نام خانوادگی انگلیسی باید پر شوند"
        '    Exit Sub
        'End If
        ''If ClassHomeSetting.CheckFarsi(txtNameFN.Text) = 1 Then
        ''    lblError.Text = "در نوشتن نام فارسی فقط از حروف فارسی استفاده شود"
        ''    Exit Sub
        ''Else
        ''    lblError.Text = ""
        ''End If
        ''
        ''If ClassHomeSetting.CheckFarsi(txtFamilyFN.Text) = 1 Then
        ''    lblError.Text = "در نوشتن نام خانوادگی فارسی فقط از حروف فارسی استفاده شود"
        ''    Exit Sub
        ''Else
        ''    lblError.Text = ""
        ''End If
        ''
        'If ClassHomeSetting.CheckEngilisi(txtNameEN.Text) = 1 Then
        '    lblError.Text = "در نوشتن نام انگلیسی فقط از حروف انگلیسی استفاده شود"
        '    Exit Sub
        'Else
        '    lblError.Text = ""
        'End If
        ''
        'If ClassHomeSetting.CheckEngilisi(txtFamilyEn.Text) = 1 Then
        '    lblError.Text = "در نوشتن نام خانوادگی انگلیسی فقط از حروف انگلیسی استفاده شود"
        '    Exit Sub
        'Else
        '    lblError.Text = ""
        'End If
        '
        ClassHomeSetting.UpdateInformation(txtNameFN.Text, txtFamilyFN.Text, _
                                           txtNameEN.Text, txtFamilyEn.Text, txtAlias.Text, cmbTahsilat.SelectedValue, _
                                           cmbYears.Text, cmbMonth.Text, cmbDay.Text, txtTimeBirth.Text, cmbCountry.SelectedValue, _
                                           cmbState.SelectedValue, cmbCity.SelectedValue, True, txtNoneAddress.Text, txtAddress.Text, _
                                           cmbSex.SelectedValue, cmbMarrid.SelectedValue, cmbDodi.SelectedValue, cmbDin.SelectedValue, _
                                           cmbMazhab.SelectedValue, cmbLanguage.SelectedValue, cmbPoletic.SelectedValue, txtWebsite.Text, txtWeblog.Text, _
                                            Request.QueryString("email"))
        lblError.Text = ""
        'Catch ex As Exception

        'End Try

    End Sub

    Public Function BC_Panel(ByVal code As Object) As System.Drawing.Color
        If Not ClassHomeSetting.CheckFavorit(code.ToString, Request.QueryString("email")) Then
            Return System.Drawing.ColorTranslator.FromHtml("#e0ebef")
        End If
    End Function

    Public Sub setSubSet(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("FavoritCode") = e.CommandArgument
        DL_Favorits.DataBind()
    End Sub

    Public Function CountFavorits(ByVal code As Object) As String
        Return "<span style='color:gray;'>" + String.Format("زیر مجموعه: {0}", "<b>" + ClassHomeSetting.CountFavoritsByCategoryCode(code.ToString) + "</b>") + "</span>"
    End Function

    Public Sub InsertOrDeleteFavorit(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.InsertOrUpdateFavorit(e.CommandArgument, Request.QueryString("email"))
        DL_Favorits.DataBind()
    End Sub

    Public Function CountFavoritsUsers(ByVal code As Object) As String
        Return String.Format("علاقه مندان:{0}", "<b>" + ClassProfile_Section.getCountFavoritUser(code.ToString) + "</b>")
    End Function

    Dim CodeCat As Long
    Protected Sub University(ByVal Sender As Object, ByVal e As CommandEventArgs)
        CodeCat = e.CommandArgument
        DG_Uni.DataBind()
    End Sub

    Protected Sub ODS_Uni_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Uni.Selecting
        e.InputParameters("CodeCategory") = CodeCat
    End Sub

    Protected Sub SetUniversity(ByVal Sender As Object, ByVal e As CommandEventArgs)

        ClassHomeSetting.UpdateUniversity(e.CommandArgument, Request.QueryString("email"))
        ChkUni.Checked = False
        CodeCat = Nothing
        PnlUni.Visible = False

        Dim dr As DataRow = ClassProfile_Section.ContactUser(Request.QueryString("email"))
        lblUniversity.Text = ClassHomeSetting.UniversityName(dr(5)).ToString

    End Sub

    Private Sub FillContact()


        Dim dr As DataRow = ClassProfile_Section.ContactUser(Request.QueryString("email"))
        txtSchool.Text = IIf(dr(1).ToString().Trim = String.Empty, "{ نا مشخص }", dr(1))
        txtMiddle_school.Text = IIf(dr(2).ToString().Trim = String.Empty, "{ نا مشخص }", dr(2))
        txtHighShcool.Text = IIf(dr(3).ToString().Trim = String.Empty, "{ نا مشخص }", dr(3))
        txtPreUniversity.Text = IIf(dr(4).ToString().Trim = String.Empty, "{ نا مشخص }", dr(4))

        If ClassHomeSetting.UniversityName(dr(5)).ToString <> "" And ClassHomeSetting.UniversityName(dr(5)).ToString <> "0" Then
            lblUniversity.Text = ClassHomeSetting.UniversityName(dr(5)).ToString
        Else
            lblUniversity.Text = "دانشگاهی تعیین نشده است"
        End If

        'txtJob.Text = IIf(dr(6).ToString().Trim = String.Empty, "{ نا مشخص }", dr(6))
        'txtAddressJob.Text = IIf(dr(7).ToString().Trim = String.Empty, "{ نا مشخص }", dr(7))
        'txtTellJob.Text = IIf(dr(8).ToString().Trim = String.Empty, "{ نا مشخص }", dr(8))
        'txtTellEmergncy.Text = IIf(dr(9).ToString().Trim = String.Empty, "{ نا مشخص }", dr(9))
        'txtCompany.Text = IIf(dr(10).ToString().Trim = String.Empty, "{ نا مشخص }", dr(10))
        'txtAddressCompany.Text = IIf(dr(11).ToString().Trim = String.Empty, "{ نا مشخص }", dr(11))
        'txtAboutCompany.Text = IIf(dr(12).ToString().Trim = String.Empty, "{ نا مشخص }", dr(12))
        'txtWebsiteJob.Text = IIf(dr(13).ToString().Trim = String.Empty, "{ نا مشخص }", dr(13))

        'txtYahoo.Text = IIf(dr(15).ToString().Trim = String.Empty, "{ نا مشخص }", dr(15))
        'txtGmail.Text = IIf(dr(16).ToString().Trim = String.Empty, "{ نا مشخص }", dr(16))
        'txtFacebook.Text = IIf(dr(17).ToString().Trim = String.Empty, "{ نا مشخص }", dr(17))
        'txtTwitter.Text = IIf(dr(18).ToString().Trim = String.Empty, "{ نا مشخص }", dr(18))
        'txtHotmail.Text = IIf(dr(19).ToString().Trim = String.Empty, "{ نا مشخص }", dr(19))
        'txtooVoo.Text = IIf(dr(20).ToString().Trim = String.Empty, "{ نا مشخص }", dr(20))
        'txtSkype.Text = IIf(dr(21).ToString().Trim = String.Empty, "{ نا مشخص }", dr(21))

        'rbEmailShow.Checked = IIf(dr(22) = True, True, False)
        'rbDontShowEmail.Checked = IIf(dr(22) = False, True, False)
        'txtSecondEmail.Text = IIf(dr(14).ToString().Trim = String.Empty, "{ نا مشخص }", dr(14))
        txtJob.Text = IIf(dr(6).ToString().Trim = String.Empty, "{ نا مشخص }", dr(6))
        txtAddressJob.Text = IIf(dr(7).ToString().Trim = String.Empty, "{ نا مشخص }", dr(7))
        txtTellJob.Text = IIf(dr(8).ToString().Trim = String.Empty, "{ نا مشخص }", dr(8))
        txtTellEmergncy.Text = IIf(dr(9).ToString().Trim = String.Empty, "{ نا مشخص }", dr(9))
        txtCompany.Text = IIf(dr(10).ToString().Trim = String.Empty, "{ نا مشخص }", dr(10))
        txtAddressCompany.Text = IIf(dr(11).ToString().Trim = String.Empty, "{ نا مشخص }", dr(11))
        txtAboutCompany.Text = IIf(dr(12).ToString().Trim = String.Empty, "{ نا مشخص }", dr(12))
        txtWebsiteJob.Text = IIf(dr(13).ToString().Trim = String.Empty, "{ نا مشخص }", dr(13))

        txtYahoo.Text = IIf(dr(15).ToString().Trim = String.Empty, "{ نا مشخص }", dr(15))
        txtGmail.Text = IIf(dr(16).ToString().Trim = String.Empty, "{ نا مشخص }", dr(16))
        txtFacebook.Text = IIf(dr(17).ToString().Trim = String.Empty, "{ نا مشخص }", dr(17))
        txtTwitter.Text = IIf(dr(18).ToString().Trim = String.Empty, "{ نا مشخص }", dr(18))
        txtHotmail.Text = IIf(dr(19).ToString().Trim = String.Empty, "{ نا مشخص }", dr(19))
        txtooVoo.Text = IIf(dr(20).ToString().Trim = String.Empty, "{ نا مشخص }", dr(20))
        txtSkype.Text = IIf(dr(21).ToString().Trim = String.Empty, "{ نا مشخص }", dr(21))

        rbEmailShow.Checked = IIf(dr(22) = True, True, False)
        rbDontShowEmail.Checked = IIf(dr(22) = False, True, False)
        txtSecondEmail.Text = IIf(dr(14).ToString().Trim = String.Empty, "{ نا مشخص }", dr(14))

    End Sub

    Protected Sub ChkUni_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkUni.CheckedChanged
        PnlUni.Visible = IIf(ChkUni.Checked, True, False)
    End Sub

    Protected Sub btnUpdateContact_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateContact.Click
        Dim dr As DataRow = ClassProfile_Section.ContactUser(Request.QueryString("email"))
        Dim bShow As Boolean
        bShow = IIf(rbEmailShow.Checked, True, False)
        bShow = IIf(rbDontShowEmail.Checked, False, True)
        ClassHomeSetting.UpdateContact(txtSchool.Text, txtMiddle_school.Text, txtHighShcool.Text, txtPreUniversity.Text, dr(5), txtJob.Text, txtAddressJob.Text, _
                                     txtTellJob.Text, txtTellEmergncy.Text, txtCompany.Text, txtAddressJob.Text, txtAboutCompany.Text, txtWebsiteJob.Text, _
                                     txtSecondEmail.Text, txtYahoo.Text, txtGmail.Text, txtFacebook.Text, txtTwitter.Text, txtHotmail.Text, txtooVoo.Text, _
                                     txtSkype.Text, bShow, Request.QueryString("email"))
        FillContact()

    End Sub

    Public Sub DeleteAvatar(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Session("AvatarID") = e.CommandArgument
        M_ShowAvatars.ActiveViewIndex = 1
    End Sub

    Public Function BorderColorPanel(ByVal flag As Object) As System.Drawing.Color
        If flag = 1 Then
            Return System.Drawing.ColorTranslator.FromHtml("#396e83")
        ElseIf flag = 0 Then
            Return System.Drawing.ColorTranslator.FromHtml("#ccc")
        End If
    End Function

    Public Sub UpdateFlag(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.UpdateFlagAvatars(e.CommandArgument, Request.QueryString("email"))
        DL_Avatars.DataBind()
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click
        ClassHomeSetting.DeleteAvatar(Session("AvatarID"))
        M_ShowAvatars.ActiveViewIndex = 0
        DL_Avatars.DataBind()
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        M_ShowAvatars.ActiveViewIndex = 0
    End Sub

    Dim dateStart As String = ""
    Dim dateEnd As String = ""
    Protected Sub btnEnter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnter.Click
        dateStart = txtDateStart.Text
        dateEnd = txtDateEnd.Text
        DG_Enter.DataBind()
    End Sub

    Protected Sub ODS_Entering_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Entering.Selecting
        e.InputParameters("dateStart") = dateStart
        e.InputParameters("dateEnd") = dateEnd
    End Sub

    Private Sub Degree()
        Select Case Val(ClassProfileHome.GetStarNum(Request.QueryString("email")))
            Case 0 To 71
                imgStar.ImageUrl = "~\content\images\home\star\star_0.png"
                lblDegree.Text = "درجه شهروندی : بدون درجه"
            Case 72 To 143
                imgStar.ImageUrl = "~\content\images\home\star\star_0-5.png"
                lblDegree.Text = "درجه شهروندی : یک "
            Case 144 To 215
                imgStar.ImageUrl = "~\content\images\home\star\star_1.png"
                lblDegree.Text = "درجه شهروندی : دو "
            Case 216 To 287
                imgStar.ImageUrl = "~\content\images\home\star\star_1-5.png"
                lblDegree.Text = "درجه شهروندی : سه "
            Case 288 To 359
                imgStar.ImageUrl = "~\content\images\home\star\star_2.png"
                lblDegree.Text = "درجه شهروندی : چهار "
            Case 360 To 431
                imgStar.ImageUrl = "~\content\images\home\star\star_2-5.png"
                lblDegree.Text = "درجه شهروندی : پنچ "
            Case 432 To 503
                imgStar.ImageUrl = "~\content\images\home\star\star_3.png"
                lblDegree.Text = "درجه شهروندی : شش "
            Case 504 To 577
                imgStar.ImageUrl = "~\content\images\home\star\star_3-5.png"
                lblDegree.Text = "درجه شهروندی : هفت "
            Case 578 To 647
                imgStar.ImageUrl = "~\content\images\home\star\star_4.png"
                lblDegree.Text = "درجه شهروندی : هشت "
            Case 648 To 719
                imgStar.ImageUrl = "~\content\images\home\star\star_4-5.png"
                lblDegree.Text = "درجه شهروندی : نه "
            Case Is > 720
                imgStar.ImageUrl = "~\content\images\home\star\star_5.png"
                lblDegree.Text = "درجه شهروندی : ده "
        End Select
    End Sub

    Protected Sub btnUpdateStar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateStar.Click
        ClassUserM.UpdateStarNum(txtNewStar.Text, Request.QueryString("email"))
        txtCurrentStart.Text = ClassUserM.GetStarNum(Request.QueryString("email"))
        Degree()
    End Sub

    Protected Sub cmbCountry_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCountry.DataBound
        'cmbCountry.Items.FindByValue(2).Selected = True
    End Sub

    Protected Sub cmbCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCountry.SelectedIndexChanged
        Response.Write(cmbCountry.SelectedValue)
    End Sub
End Class
