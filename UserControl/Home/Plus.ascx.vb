
Partial Class UserControl_Home_Plus
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile

    Private _em_owner As String

    Property em_owner() As String
        Get
            Return _em_owner
        End Get
        Set(ByVal value As String)
            _em_owner = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'اگر کاربر مهمان بود
        If Session("MY-UsErNaMe") = "" Then
            PnlRelationship.Visible = False
            Exit Sub
        End If
        'اگر کسی که در حال مشاهده پروفایل است صاحب پروفایل ها باشد دیگر نیازی نیست که این دکمه وجود داشته باشد
        If Session("MY-UsErNaMe") = _em_owner Then
            PnlRelationship.Visible = False
            Exit Sub
        End If
        'برای ایجاد ارتباط و قطع ارتباط 
        If ClassProfile.CheckRelationship(Session("MY-UsErNaMe"), _em_owner) = True Then
            imgPlus.ImageUrl = "~\content\images\Profile_View_Users\plus.png"
            imgPlus.ToolTip = String.Format("ایجاد ارتباط با {0}", ClassProfile_Section.GetFnLn(_em_owner))
        Else
            imgPlus.ImageUrl = "~\content\images\Profile_View_Users\noplus.png"
            imgPlus.ToolTip = String.Format("قطع ارتباط با {0}", ClassProfile_Section.GetFnLn(_em_owner))
        End If
        'اگه کاربر درخواست را داده و منتظر پاسخ است
        If ClassProfile.CheckWaiting(Session("MY-UsErNaMe"), _em_owner) Then
            imgPlus.ImageUrl = "~\content\images\Profile_View_Users\InWait.png"
            imgPlus.ToolTip = "درخواست شما قبلا ارسال شده است و باید منتظر پاسخ بمانید"
        End If
        '
        imgViwerProfile.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(Session("MY-UsErNaMe")) + "&W=40&H=40"
        imgOwnerProfile.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(_em_owner) + "&W=40&H=40"

    End Sub

    Protected Sub imgPlus_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgPlus.Click

        'اگه کاربر درخواست را داده و منتظر پاسخ است
        If ClassProfile.CheckWaiting(Session("MY-UsErNaMe"), _em_owner) Then
            Exit Sub
        End If
        'IF TYPE=1 --> yani ijad ertebad ElseIF Type=0 --> yani ghate ertebat
        If imgPlus.ImageUrl = "~\content\images\Profile_View_Users\plus.png" Then
            Response.Redirect("CheckRequest.aspx?type=1&From=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "&To=" + ClassProfile.getUsernameByEmail(_em_owner))
        ElseIf imgPlus.ImageUrl = "~\content\images\Profile_View_Users\noplus.png" Then
            Response.Redirect("CheckRequest.aspx?type=0&From=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "&To=" + ClassProfile.getUsernameByEmail(_em_owner))
        Else
            Response.Redirect("Default.aspx")
        End If

    End Sub

End Class
