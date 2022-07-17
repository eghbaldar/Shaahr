Imports System.Data.SqlClient

Partial Class UserControl_Home_GuidMenu
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassEnter As New EnterUsers

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then Setting()
    End Sub

    Private Sub Setting()

        If Session("MY-UsErNaMe") <> "" Then
            lblGuidName.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))
            PnlGuidUser.Visible = True
            PnlGuidUserIcon.Visible = True
            PnlGuidUserJiring.Visible = True
            PnlGuidStatus.Visible = True
            hypGuidJiring.Text = String.Format("اعتبار شما: {0}", "<b>" + ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) + "</b>")
            hypGuidJiring.NavigateUrl = "~\stage\Jiring\default.aspx"

            imgGuid.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) + "&W=30&H=30"

            If ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) = "" Or (Not (IO.File.Exists(Server.MapPath("~\content\images\profile\avatars\" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")))))) Then
                imgGuid.ImageUrl = "~\content\images\home\noavatar.png"
            End If
            '----
           CheckOnlineUser
        Else
            lblGuidName.Text = "مهمان گرامی خوش آمدید!"
            PnlGuidGuestIcon.Visible = True
            PnlGuidGuest.Visible = True
            PnlGuidGuestJiring.Visible = True
        End If
        '----
        lblGuidDate.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate) + " (" + Now.ToShortTimeString.Substring(0, Now.ToShortTimeString.Length - 2).Trim + ")"

        hypGuidOnline.Text = String.Format("افراد آنلاین: {0}", "<b>" + ClassOnline.GetCountOnlineUsers + "</b>")
        lblFriendsOnilne.Text = String.Format("دوستان آنلاین: {0}", "<b>" + ClassOnline.GetCountFriendsOnline(Session("MY-UsErNaMe")) + "</b>")
        lblShaahrOnline.Text = String.Format(" هم شهری ها آنلاین: {0}", "<b>" + ClassOnline.GetCountOnlineShaahr(Session("MY-UsErNaMe")) + "</b>")
        lblStateOnline.Text = String.Format("هم ایالتی های آنلاین: {0}", "<b>" + ClassOnline.GetCountStateOnline(Session("MY-UsErNaMe")) + "</b>")
        lblCountCountry.Text = String.Format("افراد آنلاین: {0}", "<b>" + ClassOnline.GetCountOnlineUsers() + "</b>")
        lblAvaliable.Text = String.Format("در دسترس : {0}", "<b>" + ClassOnline.GetOnlineAvaliable() + "</b>")
        lblNotHere.Text = String.Format("هنوز نیامده اند : {0}", "<b>" + ClassOnline.GetOnlineNotHere() + "</b>")
        lblBusy.Text = String.Format("سر شلوغ ها : {0}", "<b>" + ClassOnline.GetOnlineBusy() + "</b>")
        lblTransparent.Text = String.Format("نامرئی ها : {0}", "<b>" + ClassOnline.GetOnlineTransparent() + "</b>")
        lblNotNow.Text = String.Format("فعلا نیستند : {0}", "<b>" + ClassOnline.GetOnlineNotNow() + "</b>")

        lblGMT.Text = "&nbsp;<b>GMT </b>" + Date.Today.DayOfWeek.ToString + " " + Now.ToUniversalTime.ToShortDateString + " " + Now.ToUniversalTime.TimeOfDay.ToString.Substring(0, 5) + ""

        Dim pc As New System.Globalization.HijriCalendar()
        Dim [date] As String = pc.GetYear(DateTime.Now) & "/" & pc.GetMonth(DateTime.Now) & "/" & pc.GetDayOfMonth(DateTime.Now)

        Select Case Now.DayOfWeek
            Case DayOfWeek.Saturday
                lblMec.Text = "سبت" + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Sunday
                lblMec.Text = "أّحَد " + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Monday
                lblMec.Text = "إثنان" + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Tuesday
                lblMec.Text = "ثلاثاء" + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Wednesday
                lblMec.Text = "أربعاء" + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Thursday
                lblMec.Text = "خمیس " + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
            Case DayOfWeek.Friday
                lblMec.Text = "الجمعه " + "&nbsp;<b>MEC </b>" + [date].ToString + " " + Now.ToUniversalTime.AddHours(2).TimeOfDay.ToString.Substring(0, 5)
        End Select

    End Sub

    Protected Sub btnSignOut_Click(ByVal sender As Object, ByVal e As EventArgs)
        ClassEnter.UpdateEnd_EnterStatistical(Session("MY-UsErNaMe"))
        ClassOnline.UpdateOnlineOffline(0, Session("MY-UsErNaMe"))
        'Status
        ClassOnline.UpdateStatusCodeByEmail(4, Session("MY-UsErNaMe")) 'moghe khoroj karbar Na-Marie mishavad Code=4
        '
        HttpContext.Current.Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~\default.aspx") 'http:\\www.shaahr.com
    End Sub

    Protected Sub imgGuid_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgGuid.Click
        Response.Redirect("~\home\")
    End Sub

    Private Sub CheckOnlineUser()
        Select Case ClassOnline.GetStatusCode(Session("MY-UsErNaMe"))
            Case 1
                imgUserOnline.ImageUrl = "~\content\images\Stage\chat\user_green.jpg"
                hypStatusUser.Text = "در دسترس هستم."
            Case 2
                imgUserOnline.ImageUrl = "~\content\images\Stage\chat\user_orange.jpg"
                hypStatusUser.Text = "پشت سیستم نیستم."
            Case 3
                imgUserOnline.ImageUrl = "~\content\images\Stage\chat\user_red.jpg"
                hypStatusUser.Text = "سرم شلوغه مزاحم نشوید."
            Case 4
                imgUserOnline.ImageUrl = "~\content\images\Stage\chat\user_gray.jpg"
                hypStatusUser.Text = "ناپدید شده ام."
            Case 5
                imgUserOnline.ImageUrl = "~\content\images\Stage\chat\user_yeshmi.jpg"
                hypStatusUser.Text = "در حال حاضر نمی آیم."
        End Select
    End Sub


    Protected Sub btnAvaliable_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAvaliable.Click
        ClassOnline.UpdateStatusCodeByEmail(1, Session("MY-UsErNaMe"))
        CheckOnlineUser()
    End Sub
    Protected Sub btnBusy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBusy.Click
        ClassOnline.UpdateStatusCodeByEmail(3, Session("MY-UsErNaMe"))
        CheckOnlineUser()
    End Sub
    Protected Sub btnNotHere_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNotHere.Click
        ClassOnline.UpdateStatusCodeByEmail(2, Session("MY-UsErNaMe"))
        CheckOnlineUser()
    End Sub
    Protected Sub btnTransparent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTransparent.Click
        ClassOnline.UpdateStatusCodeByEmail(4, Session("MY-UsErNaMe"))
        CheckOnlineUser()
    End Sub
    Protected Sub btnNotNow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNotNow.Click
        ClassOnline.UpdateStatusCodeByEmail(5, Session("MY-UsErNaMe"))
        CheckOnlineUser()
    End Sub

    Protected Sub hypGuidOnline_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles hypGuidOnline.Click
        Response.Redirect("~\stage\Online")
    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Response.Redirect("~/Outscope/CreateAccount/")
    End Sub

    Protected Sub btnAuth_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAuth.Click
        Response.Redirect("~/outscope/authenticate/")
    End Sub

    Protected Sub lblGuidName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblGuidName.Click
        Response.Redirect("~\home\")
    End Sub

End Class

Public NotInheritable Class ResponseHelper

    Private Sub New()
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

