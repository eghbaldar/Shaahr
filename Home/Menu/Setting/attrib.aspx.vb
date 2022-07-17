Imports System.Data

Partial Class home_Menu_Setting_attrib
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("مدیریت اطلاعات فردی - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        lblDateReg.Text = ClassHomeSetting.diffDate(ClassHomeSetting.GetDiffrentDateReg(Session("MY-UsErNaMe")), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
        'Orginal Setting
        Dim ORG() As String = ClassHomeSetting.getUser_Email_RegDate(Session("MY-UsErNaMe"))
        lblUsername_org.Text = ORG(0)
        lblEmail_org.Text = ORG(1)
        lblRegDate_org.Text = ORG(2)

    End Sub

    Protected Sub btnAuthUser_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAuthUser.Click

        If ClassHomeSetting.Athuenction(Session("MY-UsErNaMe"), txtPass_User.Text.Trim) = True Then
            Pnl_ChangeUsername.Enabled = True
            Pnl_ChangeUsername.BorderWidth = 1
            Pnl_ChangeUsername.BorderStyle = BorderStyle.Solid
            Pnl_ChangeUsername.BorderColor = System.Drawing.ColorTranslator.FromHtml("#81a5b3")
            lblUserName_auth.Text = ""
            lblUserName_auth.ForeColor = Drawing.Color.Red
        Else
            lblUserName_auth.ForeColor = Drawing.Color.Red
            lblUserName_auth.Text = "کلمه عبور نادرست است."
        End If

    End Sub

    Public Function CheckEngilisi(ByVal text As String) As Boolean

        'Return True --> Correct
        'Return False --> Incorrect : this text include farsi character
        Dim str_ As String = text.ToLower
        Dim EN As String = " 45 , 95 , 46 , 97 , 98 , 99 , 100 , 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 109 , 110 , 111 , 112 , 113 , 114 , 115 , 116 , 117 , 118 , 119 , 120 , 121 , 122"
        For i As Integer = 0 To str_.Length - 1
            If EN.IndexOf(Str(Asc(str_.Substring(i, 1)))) = "-1" Then Return False
        Next
        Return True

    End Function

    Function CheckDuplicate3More(ByVal text As String) As Boolean

        'Return True --> Correct
        'Return False --> Incorrect : this text include more 3 character same togheter
        For i As Integer = 0 To text.Length - 1
            Dim jDuplicate As Byte
            If (i <> text.Length - 1) Then
                If (text.Substring(i, 1) = text.Substring(i + 1, 1)) Then
                    If jDuplicate > 1 Then
                        Return False
                    Else
                        jDuplicate += 1
                    End If
                End If
            End If
        Next
        Return True

    End Function

    Protected Sub btnUpdateUsername_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateUsername.Click

        If Not CheckEngilisi(txtNewUsername.Text) Then
            lblUserName_auth.Text = "نام کاربری باید شامل حروف انگلیسی و نیز استفاده از کاراکتر (_) و (.) بدون استفاده از فاصله مجاز باشد."
            Exit Sub
        End If

        If Not CheckDuplicate3More(txtNewUsername.Text) Then
            lblUserName_auth.Text = "نام کاربری نباید شامل کارکترهای پست سر هم باشد."
            Exit Sub
        End If

        ClassHomeSetting.UpdateUsernameByEmail(txtNewUsername.Text.Trim, Session("MY-UsErNaMe"))
        lblUserName_auth.Text = "نام کاربری شما با موفقیت تغییر کرد."
        txtNewUsername.Text = ""
        Pnl_ChangeUsername.Enabled = False
        Pnl_ChangeUsername.BorderWidth = 0

        'Select Case ClassHomeSetting.CheckCharacter(txtNewUsername.Text.Trim)
        '    Case 0
        '        If Not ClassHomeSetting.CheckDuplicateUser(txtNewUsername.Text.Trim) Then

        '            If ClassHomeSetting.CheckEngilisi(txtNewUsername.Text.Trim) = 1 Then
        '                lblUserName_auth.Text = "فقط از حروف انگلیسی استفاده شود"
        '                Exit Sub
        '            Else
        '                lblUserName_auth.Text = String.Empty
        '            End If

        '            ClassHomeSetting.UpdateUsernameByEmail(txtNewUsername.Text.Trim, Session("MY-UsErNaMe"))
        '            lblUserName_auth.Text = "نام کاربری شما با موفقیت تغییر کرد."
        '            txtNewUsername.Text = ""
        '            Pnl_ChangeUsername.Enabled = False
        '            Pnl_ChangeUsername.BorderWidth = 0
        '        Else
        '            lblUserName_auth.Text = "لطفا نام کاربری دیگری را انتخاب کنید این نام کاربری تکراریست."
        '        End If
        '    Case 1
        '        lblUserName_auth.Text = "اولین حرف نباید از اعداد باشد"
        '    Case 2
        '        lblUserName_auth.Text = "تنها کارکتر مجاز زیرخط ( _ ) می باشد"
        '    Case 3
        '        lblUserName_auth.Text = "فقط از حروف انگلیسی استفاده شود"
        'End Select

    End Sub

    Protected Sub btnAuthPass_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAuthPass.Click

        If ClassHomeSetting.Athuenction(Session("MY-UsErNaMe"), txtPass_Pass.Text.Trim) = True Then
            Pnl_ChangePassword.Enabled = True
            Pnl_ChangePassword.BorderWidth = 1
            Pnl_ChangePassword.BorderStyle = BorderStyle.Solid
            Pnl_ChangePassword.BorderColor = System.Drawing.ColorTranslator.FromHtml("#81a5b3")
            lblPassword_auth.Text = ""
            lblPassword_auth.ForeColor = Drawing.Color.Red
        Else
            lblPassword_auth.ForeColor = Drawing.Color.Red
            lblPassword_auth.Text = " کلمه عبور نادرست است."
        End If

    End Sub

    Protected Sub btnUpdatePassword_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdatePassword.Click
        ClassHomeSetting.UpdatePasswordByEmail(txtNewPassword.Text, Session("MY-UsErNaMe"))
        txtNewPassword.Text = ""
        txtNewPasswordReapet.Text = ""
        lblPassword_auth.Text = " کلمه عبور با موفقیت تغییر کرده است"
        Pnl_ChangePassword.BorderWidth = 0
        Pnl_ChangePassword.Enabled = False
    End Sub

    Protected Sub btnOrginalInfo_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiView.ActiveViewIndex = 0
    End Sub
    '
    Protected Sub btnPersonalInfo_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiView.ActiveViewIndex = 1
        FillInformation()
    End Sub

    Private Sub FillInformation()

        Dim dr As DataRow = ClassProfile_Section.InformationUser(Session("MY-UsErNaMe"))
        txtNameFN.Text = IIf(dr(1).ToString().Trim = String.Empty, "", dr(1)).Replace("ي", "ی")
        txtFamilyFN.Text = IIf(dr(2).ToString().Trim = String.Empty, "", dr(2)).Replace("ي", "ی")
        txtNameEN.Text = IIf(dr(3).ToString().Trim = String.Empty, "", dr(3))
        txtFamilyEn.Text = IIf(dr(4).ToString().Trim = String.Empty, "", dr(4))
        txtAlias.Text = IIf(dr(5).ToString().Trim = String.Empty, "", dr(5))
        cmbSex.SelectedValue = IIf(dr(17) = False, 0, 1)

        'cmbMarrid.SelectedValue = IIf(dr(18) = False, 0, 1)
        cmbMarrid.SelectedValue = dr(18)

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

        cmbDay.Text = dr(9).ToString
        cmbYears.Text = dr(7).ToString
        txtTimeBirth.Text = IIf(dr(10).ToString().Trim = "1", "1", dr(10))

        cmbDin.SelectedValue = IIf(dr(20).ToString <> "", dr(20), 1)

        cmbMazhab.SelectedValue = IIf(dr(21).ToString <> "", dr(21), 0)

        cmbTahsilat.SelectedValue = dr(6)

        cmbCountry.DataBind()
        cmbCountry.Items.FindByValue(dr(11)).Selected = True

        cmbState.DataBind()
        cmbState.Items.FindByValue(dr(12)).Selected = True

        cmbCity.DataBind()
        cmbCity.Items.FindByValue(dr(13)).Selected = True


        txtNoneAddress.Text = IIf(dr(15).ToString().Trim = String.Empty, "", dr(15).ToString.Trim).Replace("ي", "ی")
        txtAddress.Text = IIf(dr(16).ToString().Trim = String.Empty, "", dr(16).ToString.Trim)

        cmbLanguage.SelectedIndex = dr(22)

        cmbPoletic.SelectedIndex = dr(23)

        cmbDodi.SelectedIndex = dr(19)


        txtWebsite.Text = IIf(dr(24).ToString().Trim = String.Empty, "", dr(24))
        txtWeblog.Text = IIf(dr(25).ToString().Trim = String.Empty, "", dr(25))

        lblError.Text = ""

    End Sub

    Protected Sub btnUpdateInfo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateInfo.Click

        Try
            If txtFamilyEn.Text = "" Or txtFamilyFN.Text = "" Or txtNameEN.Text = "" Or txtNameFN.Text = "" Then
                lblError.Text = "چهار قسمت نام فارسی , نام خانوادگی فارسی , نام انگلیسی و نام خانوادگی انگلیسی باید پر شوند"
                Exit Sub
            End If

            If ClassHomeSetting.CheckEngilisi(txtNameEN.Text) = 1 Then
                lblError.Text = "در نوشتن نام انگلیسی فقط از حروف انگلیسی استفاده شود"
                Exit Sub
            Else
                lblError.Text = ""
            End If
            '
            If ClassHomeSetting.CheckEngilisi(txtFamilyEn.Text) = 1 Then
                lblError.Text = "در نوشتن نام خانوادگی انگلیسی فقط از حروف انگلیسی استفاده شود"
                Exit Sub
            Else
                lblError.Text = ""
            End If
            '   
            ''''''''''''''' اگر جنسیت خود را تغییر بده تمام رابطه های فامیلی او "دوست " شده و تمام درخواست های فامیلی ارسال شده و دریافت شده پاک می شود.
            If ClassProfile.getSex(Session("MY-UsErNaMe")) Then
                If cmbSex.SelectedValue = 1 Then
                    ClassProfile.DeleteAllTempFamilyByEmail(Session("MY-UsErNaMe"))
                    ClassProfile.UpdateRelationAfterChangeSex(Session("MY-UsErNaMe"))
                End If
            End If

            If Not ClassProfile.getSex(Session("MY-UsErNaMe")) Then
                If cmbSex.SelectedValue = 0 Then
                    ClassProfile.DeleteAllTempFamilyByEmail(Session("MY-UsErNaMe"))
                    ClassProfile.UpdateRelationAfterChangeSex(Session("MY-UsErNaMe"))
                End If
            End If
            'Update                
            '''''''''''''''
            ClassHomeSetting.UpdateInformation(txtNameFN.Text, txtFamilyFN.Text, txtNameEN.Text, txtFamilyEn.Text, txtAlias.Text, _
                                               cmbTahsilat.SelectedValue, cmbYears.Text, cmbMonth.Text, cmbDay.Text, txtTimeBirth.Text, _
                                               cmbCountry.SelectedValue, cmbState.SelectedValue, cmbCity.SelectedValue, True, txtNoneAddress.Text, _
                                               txtAddress.Text, cmbSex.SelectedValue, cmbMarrid.SelectedValue, cmbDodi.SelectedValue, _
                                               cmbDin.SelectedValue, cmbMazhab.SelectedValue, cmbLanguage.SelectedValue, cmbPoletic.SelectedValue, _
                                               txtWebsite.Text, _
                                               txtWeblog.Text, _
                                               Session("MY-UsErNaMe"))
            FillInformation()
            lblError.Text = ""
            MultiView.ActiveViewIndex = 5
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnContactInfo_Click(ByVal Sender As Object, ByVal e As EventArgs)
        MultiView.ActiveViewIndex = 3
        FillContact()
    End Sub

    Private Sub FillContact()


        Dim dr As DataRow = ClassProfile_Section.ContactUser(Session("MY-UsErNaMe"))
        txtSchool.Text = IIf(dr(1).ToString().Trim = String.Empty, "", dr(1))
        txtMiddle_school.Text = IIf(dr(2).ToString().Trim = String.Empty, "", dr(2))
        txtHighShcool.Text = IIf(dr(3).ToString().Trim = String.Empty, "", dr(3))
        txtPreUniversity.Text = IIf(dr(4).ToString().Trim = String.Empty, "", dr(4))
        ''''''''''''''''''''''''''''''
        If ClassHomeSetting.UniversityName(dr(5)) <> "" And ClassHomeSetting.UniversityName(dr(5)) <> "0" Then
            lblUniversity.Text = ClassHomeSetting.UniversityName(dr(5)).ToString
        Else
            lblUniversity.Text = "دانشگاهی تعیین نشده است"
        End If
        ''''''''''''''''''''''''''''''
        txtJob.Text = IIf(dr(6).ToString().Trim = String.Empty, "", dr(6))
        txtAddressJob.Text = IIf(dr(7).ToString().Trim = String.Empty, "", dr(7))
        txtTellJob.Text = IIf(dr(8).ToString().Trim = String.Empty, "", dr(8))
        txtTellEmergncy.Text = IIf(dr(9).ToString().Trim = String.Empty, "", dr(9))
        txtCompany.Text = IIf(dr(10).ToString().Trim = String.Empty, "", dr(10))
        txtAddressCompany.Text = IIf(dr(11).ToString().Trim = String.Empty, "", dr(11))
        txtAboutCompany.Text = IIf(dr(12).ToString().Trim = String.Empty, "", dr(12))
        txtWebsiteJob.Text = IIf(dr(13).ToString().Trim = String.Empty, "", dr(13))

        txtYahoo.Text = IIf(dr(15).ToString().Trim = String.Empty, "", dr(15))
        txtGmail.Text = IIf(dr(16).ToString().Trim = String.Empty, "", dr(16))
        txtFacebook.Text = IIf(dr(17).ToString().Trim = String.Empty, "", dr(17))
        txtTwitter.Text = IIf(dr(18).ToString().Trim = String.Empty, "", dr(18))
        txtHotmail.Text = IIf(dr(19).ToString().Trim = String.Empty, "", dr(19))
        txtooVoo.Text = IIf(dr(20).ToString().Trim = String.Empty, "", dr(20))
        txtSkype.Text = IIf(dr(21).ToString().Trim = String.Empty, "", dr(21))

        rbEmailShow.Checked = IIf(dr(22) = True, True, False)
        rbDontShowEmail.Checked = IIf(dr(22) = False, True, False)
        txtSecondEmail.Text = IIf(dr(14).ToString().Trim = String.Empty, "", dr(14))

    End Sub

    Protected Sub btnUpdateContact_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateContact.Click

        Try
            Dim dr As DataRow = ClassProfile_Section.ContactUser(Session("MY-UsErNaMe"))
            Dim bShow As Boolean
            bShow = IIf(rbEmailShow.Checked, True, False)
            bShow = IIf(rbDontShowEmail.Checked, False, True)
            ClassHomeSetting.UpdateContact(txtSchool.Text, txtMiddle_school.Text, txtHighShcool.Text, txtPreUniversity.Text, dr(5), txtJob.Text, txtAddressJob.Text, _
                                         txtTellJob.Text, txtTellEmergncy.Text, txtCompany.Text, txtAddressJob.Text, txtAboutCompany.Text, txtWebsiteJob.Text, _
                                         txtSecondEmail.Text, txtYahoo.Text, txtGmail.Text, txtFacebook.Text, txtTwitter.Text, txtHotmail.Text, txtooVoo.Text, _
                                         txtSkype.Text, bShow, Session("MY-UsErNaMe"))
            FillContact()
            MultiView.ActiveViewIndex = 5
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnOutwardInfo_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiView.ActiveViewIndex = 4
        FillOutward()
    End Sub

    Private Sub FillOutward()

        Try
            Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
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

    Protected Sub btnUpdateOutward_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateOutward.Click

        Try
            ClassHomeSetting.UpdateOutWard(IIf(txtHeight.Text.Trim = "", 0, txtHeight.Text), IIf(txtWeight.Text.Trim = "", 0, txtWeight.Text), _
                                           cmbMorality.SelectedValue, _
                                           cmbCover.SelectedValue, cmbEyesColor.SelectedValue, cmbHcolor.SelectedValue, _
                                           cmbOrgan.SelectedValue, cmbBehaviour.SelectedValue, cmbStatusH.SelectedValue, Session("MY-UsErNaMe"))
            FillOutward()
            MultiView.ActiveViewIndex = 5
        Catch ex As Exception

        End Try

    End Sub

    Public Function CountFavorits(ByVal code As Object) As String
        Return "<span style='color:gray;'>" + String.Format("زیر مجموعه: {0}", "<b>" + ClassHomeSetting.CountFavoritsByCategoryCode(code.ToString) + "</b>") + "</span>"
    End Function

    Protected Sub btnFavoritInfo_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiView.ActiveViewIndex = 2
    End Sub

    Public Sub setSubSet(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("FavoritCode") = e.CommandArgument
        DL_Favorits.DataBind()
    End Sub

    Public Function CountFavoritsUsers(ByVal code As Object) As String
        Return String.Format("علاقه مندان:{0}", "<b>" + ClassProfile_Section.getCountFavoritUser(code.ToString) + "</b>")
    End Function

    Public Function BC_Panel(ByVal code As Object) As System.Drawing.Color
        If Not ClassHomeSetting.CheckFavorit(code.ToString, Session("MY-UsErNaMe")) Then
            Return System.Drawing.ColorTranslator.FromHtml("#e0ebef")
        End If
    End Function

    Public Sub InsertOrDeleteFavorit(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.InsertOrUpdateFavorit(e.CommandArgument, Session("MY-UsErNaMe"))
        DL_Favorits.DataBind()
        DL_Search.DataBind()
    End Sub

    Dim CodeCat As Long
    Protected Sub University(ByVal Sender As Object, ByVal e As CommandEventArgs)
        CodeCat = e.CommandArgument
        DG_Uni.DataBind()
    End Sub

    Protected Sub ODS_Uni_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Uni.Selecting
        e.InputParameters("CodeCategory") = CodeCat
    End Sub

    Protected Sub ChkUni_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkUni.CheckedChanged
        PnlUni.Visible = IIf(ChkUni.Checked, True, False)
    End Sub

    Protected Sub SetUniversity(ByVal Sender As Object, ByVal e As CommandEventArgs)

        ClassHomeSetting.UpdateUniversity(e.CommandArgument, Session("MY-UsErNaMe"))
        ChkUni.Checked = False
        CodeCat = Nothing
        PnlUni.Visible = False

        Dim dr As DataRow = ClassProfile_Section.ContactUser(Session("MY-UsErNaMe"))
        lblUniversity.Text = ClassHomeSetting.UniversityName(dr(5)).ToString

    End Sub

    Protected Sub img_color_skin_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_1.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
        If dr(1) = 1 Then
            ClassHomeSetting.UpdateOutWard(0, Session("MY-UsErNaMe"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(1, Session("MY-UsErNaMe"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_2.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
        If dr(1) = 2 Then
            ClassHomeSetting.UpdateOutWard(0, Session("MY-UsErNaMe"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(2, Session("MY-UsErNaMe"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_3.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
        If dr(1) = 3 Then
            ClassHomeSetting.UpdateOutWard(0, Session("MY-UsErNaMe"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(3, Session("MY-UsErNaMe"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_4.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
        If dr(1) = 4 Then
            ClassHomeSetting.UpdateOutWard(0, Session("MY-UsErNaMe"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(4, Session("MY-UsErNaMe"))
        FillColorSkin()
    End Sub
    Protected Sub img_color_skin_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles img_color_skin_5.Click
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
        If dr(1) = 5 Then
            ClassHomeSetting.UpdateOutWard(0, Session("MY-UsErNaMe"))
            FillColorSkin()
            Exit Sub
        End If
        ClassHomeSetting.UpdateOutWard(5, Session("MY-UsErNaMe"))
        FillColorSkin()
    End Sub

    Private Sub FillColorSkin()
        Dim dr As DataRow = ClassProfile_Section.OutwardUser(Session("MY-UsErNaMe"))
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

End Class
