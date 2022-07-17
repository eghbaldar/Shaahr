Imports System.IO
Imports System.Drawing

Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtName.Text = ClassCMSShaahr.GetNameShaahr(Session("Mayor"))
        lblNameSHaahr.Text = ClassCMSShaahr.GetNameShaahr(Session("Mayor"))
        Title = String.Format("پنل مدیریتی شهر - {0}", ClassCMSShaahr.GetNameShaahr(Session("Mayor")))
        If Not IsPostBack Then Fill()
        SetButton()

    End Sub

    Private Sub Fill()

        txtSubName.Text = Server.HtmlEncode(ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(2).ToString)
        If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString = "" Then
            'Header
            imgHeader.ImageUrl = "~\Content\images\Shaahrs\Root\HeaderShaahr.png"
        Else
            imgHeader.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(3).ToString
        End If
        If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString = "" Then
            'Logo
            imgLogo.ImageUrl = "~\Content\images\Shaahrs\Root\ShaahrLogo.png"
        Else
            imgLogo.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(4).ToString
        End If
        If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString = "" Then
            'ADS
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Root\adsShaahr.png"
        Else
            imgAds.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Ads\" + ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(5).ToString
        End If
        '---------------------
        If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(6) = True Then
            txtSubName.Style.Item("text-align") = "left"
            txtName.Style.Item("text-align") = "left"
            rbFormat.Items(1).Selected = True
        Else
            txtSubName.Style.Item("text-align") = "right"
            txtName.Style.Item("text-align") = "right"
            rbFormat.Items(0).Selected = True
        End If
        If ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(7).ToString = "0" Then
            rbLogoAlign.Items(0).Selected = True
        ElseIf ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(7).ToString = "1" Then
            rbLogoAlign.Items(1).Selected = True
        ElseIf ClassShaahr.ShaahrComplement(Session("Mayor")).Rows(0)(7).ToString = "2" Then
            rbLogoAlign.Items(2).Selected = True
        End If

    End Sub

    Private Sub SetButton()

        btnMnu_ShowShaahr.NewText = "نمایش شهر"
        btnMnu_ShowShaahr.UrlMode = False
        btnMnu_ShowShaahr.Url = "~\Shaahr\Shaahr.aspx?sh=shaahr" + Session("Mayor")

        btnMnu_News.NewText = "اخبار شهرداری"
        btnMnu_News.UrlMode = False
        btnMnu_News.Url = "mayorpanel_news.aspx"

        btnMnu_assist.NewText = "معاونین شهردار"
        btnMnu_assist.UrlMode = False
        btnMnu_assist.Url = "mayorpanel_MayorAssist.aspx"

        btnMnu_Cate.NewText = "طبقه بندی ها و پست ها"
        btnMnu_Cate.UrlMode = False
        btnMnu_Cate.Url = "mayorpanel_CatPost.aspx"

        btnMnu_FristPage.NewText = "صفحه اصلی مدیریتی"
        btnMnu_FristPage.UrlMode = False
        btnMnu_FristPage.Url = "mayorpanel.aspx"

    End Sub


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
                ClassShaahr.Updaet_Logo(Filename, Session("Mayor"))
                Fill()

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
            ClassShaahr.Updaet_Logo("", Session("Mayor"))
            Fill()
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
                ClassShaahr.Updaet_Header(Filename, Session("Mayor"))
                Fill()

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
            ClassShaahr.Updaet_Header("", Session("Mayor"))
            Fill()
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
                ClassShaahr.Updaet_Ads(Filename, Session("Mayor"))
                Fill()

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
            ClassShaahr.Updaet_Ads("", Session("Mayor"))
            Fill()
        End If
    End Sub

    Protected Sub btnUpdateSubName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateSubName.Click
        ClassShaahr.Updaet_Subname(txtSubName.Text, Session("Mayor"))
    End Sub

    Protected Sub rbLogoAlign_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbLogoAlign.SelectedIndexChanged
        If rbLogoAlign.Items(0).Selected Then
            ClassShaahr.Updaet_LogoAlign(0, Session("Mayor"))
        End If
        If rbLogoAlign.Items(1).Selected Then
            ClassShaahr.Updaet_LogoAlign(1, Session("Mayor"))
        End If
        If rbLogoAlign.Items(2).Selected Then
            ClassShaahr.Updaet_LogoAlign(2, Session("Mayor"))
        End If
    End Sub

    Protected Sub rbFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbFormat.SelectedIndexChanged

        If rbFormat.Items(0).Selected Then
            txtName.Style.Item("text-align") = "right"
            txtSubName.Style.Item("text-align") = "right"
            ClassShaahr.Updaet_Format(False, Session("Mayor"))
        End If
        If rbFormat.Items(1).Selected Then
            txtName.Style.Item("text-align") = "left"
            txtSubName.Style.Item("text-align") = "left"
            ClassShaahr.Updaet_Format(True, Session("Mayor"))
        End If

    End Sub


End Class
