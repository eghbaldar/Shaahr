Imports System.Data
Partial Class Management_Admin_Management
    Inherits System.Web.UI.Page

    Dim ClassManagement As New CMS_Management
    Dim ClassEnter As New EnterUsers

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت سیستم"
        If Not IsPostBack Then Fill()
    End Sub

    Private Sub Fill()

        Dim dr As DataRow = ClassManagement.GetCompelemnt.Rows(0)
        chkDontEnter.Checked = dr(2)
        txtDontEnterText.Text = dr(3)
        chkDontReg.Checked = dr(14)
        txtTopText.Text = dr(12)
        '
        imgHeaderHome.ImageUrl = "~\Content\images\Header\" + ClassEnter.Get_Header
        imgHeaderProfile.ImageUrl = "~\content\images\Profile_View_Users\headerProfileDefault.jpg"
        ImgTopLogo.ImageUrl = "~\content/images/LogoTopSite/logoHeader.jpg"
        '
        imgPicDay.ImageUrl = "~\Content\images\Day_Picture\" + ClassEnter.Get_PicDay(0)
        txtTextDay.Text = ClassEnter.Get_PicDay(1)
        txtDayLink.Text = ClassEnter.Get_PicDay(2)

    End Sub

    Protected Sub btnUpdateDontEnter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateDontEnter.Click
        ClassManagement.UpdateDontEnter(chkDontEnter.Checked)
        ClassManagement.UpdateDontEnterText(txtDontEnterText.Text)
    End Sub

    Protected Sub btnUpdateDontReg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateDontReg.Click
        ClassManagement.UpdateDontRegister(chkDontReg.Checked)
    End Sub

    Protected Sub btnUpdateHeaderHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateHeaderHome.Click

        If FileUp_Header.FileName = Nothing Then Exit Sub
        Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
        Dim r As New Random
        Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        '-----------------
        ClassManagement.UpdatePicHeader(Filename + ".png")
        IO.File.Delete(MapPath("~\Content\images\Header\" + ClassEnter.Get_Header))
        FileUp_Header.SaveAs(MapPath("~\Content\images\Header\" + Filename + ".png"))
        imgHeaderHome.ImageUrl = "~\Content\images\Header\" + Filename + ".png"

    End Sub

    Protected Sub btnUpdateHeaderProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateHeaderProfile.Click
        IO.File.Delete(MapPath("~\content\images\Profile_View_Users\headerProfileDefault.jpg"))
        FileUp_Profile.SaveAs(MapPath("~\content\images\Profile_View_Users\headerProfileDefault.jpg"))
        imgHeaderProfile.ImageUrl = "~\content\images\Profile_View_Users\headerProfileDefault.jpg"
    End Sub

    Protected Sub btnUpdateTextTop_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateTextTop.Click
        ClassManagement.UpdateTopText(txtTopText.Text)
    End Sub

    Protected Sub btnUpdateTopLogo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateTopLogo.Click
        IO.File.Delete(MapPath("~\content\images\LogoTopSite\logoHeader.jpg"))
        FileUp_TopLogo.SaveAs(MapPath("~\content\images\LogoTopSite\logoHeader.jpg"))
        ImgTopLogo.ImageUrl = "~\content\images\LogoTopSite\logoHeader.jpg"
    End Sub

    Protected Sub btnDay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDay.Click
        ClassEnter.UpdateDAY_LinkText(txtDayLink.Text, txtTextDay.Text)
        Fill()
    End Sub

    Protected Sub btnSendDayPic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendDayPic.Click
        If FileUp_PicDay.FileName = Nothing Then Exit Sub
        Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
        Dim r As New Random
        Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        '-----------------
        FileUp_PicDay.SaveAs(MapPath("~\Content\images\Day_Picture\" + Filename + ".png"))
        ClassEnter.UpdateDAY_Pic(Filename + ".png")
        Fill()
    End Sub

End Class
