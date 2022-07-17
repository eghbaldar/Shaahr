Imports System.Data

Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("پنل مدیریتی شهر - {0}", ClassCMSShaahr.GetNameShaahr(Session("Mayor")))
        lblNameSHaahr.Text = ClassCMSShaahr.GetNameShaahr(Session("Mayor"))
        If Not IsPostBack Then fill()
        SetButton()

    End Sub

    Private Sub fill()

        Try
            Dim rw As DataRow = ClassShaahr.MayorAssists(Session("Mayor")).Rows(0)
            'Assist 1
            If rw(0).ToString.Trim = String.Empty Then
                imgAssist_1.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
                lblNameAs1.Text = "کاربری تعیین نشده است."
                lblAgeShahrvandi1.Text = "کاربری تعیین نشده است."
            ElseIf rw(0).ToString.Trim <> String.Empty Then
                txtUser1.Text = ClassProfile.getUsernameByEmail(rw(0))
                imgAssist_1.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(0).ToString) + "&W=110&H=110"
                lblNameAs1.Text = ClassProfile_Section.GetFnLn(rw(0))
                lblAgeShahrvandi1.Text = ClassHomeSetting.diffDate(ClassHomeSetting.GetDiffrentDateReg(rw(0).ToString), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            End If
            'Assist 2
            If rw(1).ToString.Trim = String.Empty Then
                imgAssist_2.ImageUrl = "~\Content\images\Shaahrs\Root\user.png"
                lblNameAs2.Text = "کاربری تعیین نشده است."
                lblAgeShahrvandi2.Text = "کاربری تعیین نشده است."
            ElseIf rw(1).ToString.Trim <> String.Empty Then
                txtUser2.Text = ClassProfile.getUsernameByEmail(rw(1))
                imgAssist_2.ImageUrl = "~\user\Crop.aspx?P=" + ClassProfile.getOrginalAvatar(rw(1).ToString) + "&W=110&H=110"
                lblNameAs2.Text = ClassProfile_Section.GetFnLn(rw(1))
                lblAgeShahrvandi2.Text = ClassHomeSetting.diffDate(ClassHomeSetting.GetDiffrentDateReg(rw(1).ToString), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            End If
        Catch ex As Exception

        End Try

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

    Public Function GetAvatar(ByVal email As String) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email) + "&W=110&H=110"
    End Function

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Protected Sub btnUser1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUser1.Click

        If ClassProfile.getEmailByUsername(txtUser1.Text) = Nothing Then
            lblUser1.Text = "کاربری یا این مشخصات وجود ندارد."
        Else
            ClassShaahr.UpdateMayorAssist(True, txtUser1.Text, Session("Mayor"))
            lblUser1.Text = ""
            fill()
        End If

    End Sub

    Protected Sub btnUser2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUser2.Click

        If ClassProfile.getEmailByUsername(txtUser2.Text) = Nothing Then
            lblUser2.Text = "کاربری یا این مشخصات وجود ندارد."
        Else
            ClassShaahr.UpdateMayorAssist(False, txtUser2.Text, Session("Mayor"))
            lblUser2.Text = ""
            fill()            
        End If

    End Sub

    Protected Sub linkDelAssist1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkDelAssist1.Click
        ClassShaahr.UpdateMayorAssist(True, "", Session("Mayor"))
        txtUser1.Text = Nothing
        fill()
    End Sub
    Protected Sub linkDelAssist2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkDelAssist2.Click
        ClassShaahr.UpdateMayorAssist(False, "", Session("Mayor"))
        txtUser2.Text = Nothing
        fill()
    End Sub

End Class

