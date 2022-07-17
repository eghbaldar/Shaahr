Imports System.Data
Imports System.IO
Imports System.Drawing

Partial Class Management_Admin_Shaahr_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Public Function GetFN(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Function GetAvatar(ByVal email As String) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email) + "&W=80&H=80"
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblNameSHaahr.Text = ClassCMSShaahr.GetNameShaahr(Request.QueryString("id"))
        lblRank.Text = ClassCMSShaahr.GetRankShaahr(Request.QueryString("id"))
        Title = String.Format("جزییات شهر ----- {0}", ClassCMSShaahr.GetNameShaahr(Request.QueryString("id")))
        lblCountShaahrUsers.Text = DG_ShaahrUser.Rows.Count
        lblVisit.Text = ClassShaahr.GetVisitShaahr(Request.QueryString("id"))
        If Not IsPostBack Then FillAuth()
        If Not IsPostBack Then FillSetting()
    End Sub

    Public Function GetType_(ByVal type As String) As String
        Select Case type
            Case 0
                Return "<div style='padding:5px;border:2px solid red;'>رد</div>"
            Case 1
                Return "<div style='padding:5px;border:2px solid green;'>تایید</div>"
            Case 2
                Return "<div style='padding:5px;border:2px solid gray;'>در حال بررسی</div>"
        End Select

    End Function

    Public Sub Req_Presedent_YES(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 4)
        DG_StateShaahrs.DataBind()
    End Sub
    Public Sub Req_Presedent_NO(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 3)
        DG_StateShaahrs.DataBind()
    End Sub
    Public Sub Req_Governor_YES(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 2)
        DG_StateShaahrs.DataBind()
    End Sub
    Public Sub Req_Governor_NO(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 1)
        DG_StateShaahrs.DataBind()
    End Sub

    Private Sub FillSetting()

        txtName.Text = ClassCMSShaahr.GetNameShaahr(Request.QueryString("id"))
        lblNameSHaahr.Text = ClassCMSShaahr.GetNameShaahr(Request.QueryString("id"))

        txtSubName.Text = Server.HtmlEncode(ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(2).ToString)
        If ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(3).ToString = "" Then
            'Header
            imgHeader.ImageUrl = "~\Content\images\Shaahrs\Root\HeaderShaahr.png"
        Else
            imgHeader.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(3).ToString
        End If
        If ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(4).ToString = "" Then
            'Logo
            imgLogo.ImageUrl = "~\Content\images\Shaahrs\Root\ShaahrLogo.png"
        Else
            imgLogo.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(4).ToString
        End If
        If ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(5).ToString = "" Then
            'ADS
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Root\adsShaahr.png"
        Else
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Ads\" + ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(5).ToString
        End If
        '---------------------
        If ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(6) = True Then
            txtSubName.Style.Item("text-align") = "left"
            txtName.Style.Item("text-align") = "left"
            rbFormat.Items(1).Selected = True
        Else
            txtSubName.Style.Item("text-align") = "right"
            txtName.Style.Item("text-align") = "right"
            rbFormat.Items(0).Selected = True
        End If
        If ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(7).ToString = "0" Then
            rbLogoAlign.Items(0).Selected = True
        ElseIf ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(7).ToString = "1" Then
            rbLogoAlign.Items(1).Selected = True
        ElseIf ClassShaahr.ShaahrComplement(Request.QueryString("id")).Rows(0)(7).ToString = "2" Then
            rbLogoAlign.Items(2).Selected = True
        End If

    End Sub

    Public Sub Suspention_Yes(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateSuspention(True, e.CommandArgument)
        DgShaahr.DataBind()
    End Sub
    Public Sub Suspention_No(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateSuspention(False, e.CommandArgument)
        DgShaahr.DataBind()
    End Sub

    Public Sub DeleteNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.Delete_ShaahrNews(e.CommandArgument)
        DG_NEWS.DataBind()
    End Sub
    Public Sub DeleteCateogry(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(0, e.CommandArgument)
        DgCategory.DataBind()
    End Sub

    Public Sub DeletePost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(1, e.CommandArgument)
        Dg_Post.DataBind()
    End Sub

    Public Sub ShowPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("~\shaahr\threadShow.aspx?cdP=" + e.CommandArgument + "&Sh=Shaahr" + Request.QueryString("id"), "_blank", "")
    End Sub

    Public Sub DeleteAnswerPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(2, e.CommandArgument)
        DG_AnswerPost.DataBind()
    End Sub

    Private Sub FillAuth()

        Dim rw As DataRow = ClassShaahr.MayorAssists(Request.QueryString("id")).Rows(0)
        'Mayor
        imgMayor.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(ClassShaahr.GetMayor(Request.QueryString("id"))) + "&W=110&H=110"
        lblNameMayor.Text = ClassProfile_Section.GetFnLn(ClassShaahr.GetMayor(Request.QueryString("id")))
        'Assist 1
        If rw(0).ToString.Trim = String.Empty Then
            imgAssist_1.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
            lblNameAs1.Text = "کاربری تعیین نشده است."
        ElseIf rw(0).ToString.Trim <> String.Empty Then
            imgAssist_1.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(0).ToString) + "&W=110&H=110"
            lblNameAs1.Text = ClassProfile_Section.GetFnLn(rw(0))
        End If
        'Assist 2
        If rw(1).ToString.Trim = String.Empty Then
            imgAssist_2.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
            lblNameAs2.Text = "کاربری تعیین نشده است."
        ElseIf rw(1).ToString.Trim <> String.Empty Then
            imgAssist_2.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(1).ToString) + "&W=110&H=110"
            lblNameAs2.Text = ClassProfile_Section.GetFnLn(rw(1))
        End If

    End Sub

    Protected Sub btnUser1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUser1.Click
        ClassShaahr.UpdateMayorAssist(txtUser1.Text, txtUser2.Text, Request.QueryString("id"))
        FillAuth()
    End Sub

    Protected Sub btnUser2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUser2.Click
        ClassShaahr.UpdateMayorAssist(txtUser1.Text, txtUser2.Text, Request.QueryString("id"))
        FillAuth()
    End Sub

    Public Sub DeleteUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.DeleteShaahrUser(e.CommandArgument)
        DG_ShaahrUser.DataBind()
    End Sub

    '/////////////////////Setting///////////////////////////

    Protected Sub btnLogo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogo.Click

        If FU_Logo.FileName <> "" Then
            'Filename
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = Session("MY-UsErNaMe") + "_" + Filename
            Dim FileInforamtion As New FileInfo(FU_Logo.FileName)
            Filename = Filename + FileInforamtion.Extension
            Try
                ''''''''''''''''''''''''''''''''
                ''''''''''' Checking '''''''''''
                If FU_Logo.FileContent.Length > 30720 Then
                    lblCheck_Logo.Text = "حجم عکس شما خارج از محدوده می باشد"
                    Exit Sub
                End If
                '
                FU_Logo.SaveAs(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))

                Dim bt As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))
                If bt.Width > 108 Or bt.Width < 50 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))
                    lblCheck_Logo.Text = "طول عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                If bt.Height > 108 Or bt.Width < 50 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))
                    lblCheck_Logo.Text = "ارتفاع عکس خارج از محدوده می باشد"
                    Exit Sub
                End If

                bt.Dispose()
                lblCheck_Logo.Text = ""

                '--------------------- Agar error dadah yani File Aks nist
                Dim bt_ As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))
                Dim c As Color = bt_.GetPixel(1, 1)
                bt_.Dispose()

                'End Checking >> فایل هیج مشکلی ندارد ''''''''''''''''''''''''''''''''''''''''''''
                ' عکس قبلی پاک شده سپس عکس جدید جایگزین می وشد
                If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString <> "" Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString))
                End If
                ClassShaahr.Updaet_Logo(Filename, Request.QueryString("id"))
                FillSetting()

            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + Filename))
                    lblCheck_Logo.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                End If
            End Try

        End If

    End Sub
    Protected Sub btnDefaultLogo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDefaultLogo.Click
        If File.Exists(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString)) Then
            File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString))
            ClassShaahr.Updaet_Logo("", Request.QueryString("id"))
            FillSetting()
        End If
    End Sub
    Protected Sub btnHeader_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHeader.Click

        If FU_Header.FileName <> "" Then
            'Filename
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = Session("MY-UsErNaMe") + "_" + Filename
            Dim FileInforamtion As New FileInfo(FU_Header.FileName)
            Filename = Filename + FileInforamtion.Extension
            Try
                ''''''''''''''''''''''''''''''''
                ''''''''''' Checking '''''''''''
                If FU_Header.FileContent.Length > 153600 Then
                    lblCheck_Header.Text = "حجم عکس شما خارج از محدوده می باشد"
                    Exit Sub
                End If
                '
                FU_Header.SaveAs(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))

                Dim bt As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))
                If bt.Width > 898 Or bt.Width < 892 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))
                    lblCheck_Header.Text = "طول عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                If bt.Height > 223 Or bt.Width < 68 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))
                    lblCheck_Header.Text = "ارتفاع عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                bt.Dispose()
                lblCheck_Header.Text = ""

                '--------------------- Agar error dadah yani File Aks nist
                Dim bt_ As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))
                Dim c As Color = bt_.GetPixel(1, 1)
                bt_.Dispose()

                'End Checking >> فایل هیج مشکلی ندارد ''''''''''''''''''''''''''''''''''''''''''''
                ' عکس قبلی پاک شده سپس عکس جدید جایگزین می وشد
                If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString <> "" Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString))
                End If
                ClassShaahr.Updaet_Header(Filename, Request.QueryString("id"))
                FillSetting()

            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + Filename))
                    lblCheck_Header.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                End If
            End Try

        End If

    End Sub
    Protected Sub btnDefaultHeader_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDefaultHeader.Click
        If File.Exists(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString)) Then
            File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString))
            ClassShaahr.Updaet_Header("", Request.QueryString("id"))
            FillSetting()
        End If
    End Sub
    Protected Sub btnAds_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAds.Click

        If FU_Ads.FileName <> "" Then
            'Filename
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = Session("MY-UsErNaMe") + "_" + Filename
            Dim FileInforamtion As New FileInfo(FU_Ads.FileName)
            Filename = Filename + FileInforamtion.Extension
            Try
                ''''''''''''''''''''''''''''''''
                ''''''''''' Checking '''''''''''
                If FU_Ads.FileContent.Length > 30720 Then
                    lblCheck_Ads.Text = "حجم عکس شما خارج از محدوده می باشد"
                    Exit Sub
                End If
                '
                FU_Ads.SaveAs(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))

                Dim bt As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))
                If bt.Width > 742 Or bt.Width < 740 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))
                    lblCheck_Ads.Text = "طول عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                If bt.Height > 68 Or bt.Width < 62 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))
                    lblCheck_Ads.Text = "ارتفاع عکس خارج از محدوده می باشد"
                    Exit Sub
                End If

                bt.Dispose()
                lblCheck_Ads.Text = ""

                '--------------------- Agar error dadah yani File Aks nist
                Dim bt_ As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))
                Dim c As Color = bt_.GetPixel(1, 1)
                bt_.Dispose()

                'End Checking >> فایل هیج مشکلی ندارد ''''''''''''''''''''''''''''''''''''''''''''
                ' عکس قبلی پاک شده سپس عکس جدید جایگزین می وشد
                If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString <> "" Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_ads\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString))
                End If
                ClassShaahr.Updaet_Ads(Filename, Request.QueryString("id"))
                FillSetting()

            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + Filename))
                    lblCheck_Ads.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                End If
            End Try
        End If

    End Sub
    Protected Sub btnDefaultAds_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDefaultAds.Click
        If File.Exists(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString)) Then
            File.Delete(MapPath("~\Content\images\Shaahrs\Shaahrs_Ads\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString))
            ClassShaahr.Updaet_Ads("", Request.QueryString("id"))
            FillSetting()
        End If
    End Sub
    Protected Sub btnUpdateSubName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateSubName.Click
        ClassShaahr.Updaet_Subname(txtSubName.Text, Request.QueryString("id"))
    End Sub
    Protected Sub rbLogoAlign_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbLogoAlign.SelectedIndexChanged
        If rbLogoAlign.Items(0).Selected Then
            ClassShaahr.Updaet_LogoAlign(0, Request.QueryString("id"))
        End If
        If rbLogoAlign.Items(1).Selected Then
            ClassShaahr.Updaet_LogoAlign(1, Request.QueryString("id"))
        End If
        If rbLogoAlign.Items(2).Selected Then
            ClassShaahr.Updaet_LogoAlign(2, Request.QueryString("id"))
        End If
    End Sub
    Protected Sub rbFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbFormat.SelectedIndexChanged

        If rbFormat.Items(0).Selected Then
            txtName.Style.Item("text-align") = "right"
            txtSubName.Style.Item("text-align") = "right"
            ClassShaahr.Updaet_Format(False, Request.QueryString("id"))
        End If
        If rbFormat.Items(1).Selected Then
            txtName.Style.Item("text-align") = "left"
            txtSubName.Style.Item("text-align") = "left"
            ClassShaahr.Updaet_Format(True, Request.QueryString("id"))
        End If
    End Sub

    '////////////////////////////////////////////////

    '------------------------------------------------------

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
