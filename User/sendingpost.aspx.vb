
Partial Class user_sendingpost
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim EmailFrom As String = ClassProfile.getEmailByUsername(Request.QueryString("from"))
        Dim EmailTo As String = ClassProfile.getEmailByUsername(Request.QueryString("to"))

        If EmailFrom = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        If EmailTo = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Title = String.Format("ارسال پست توسط  {0}  به پروفایل  {1}", ClassProfile_Section.GetFnLn(EmailFrom), ClassProfile_Section.GetFnLn(EmailTo))
        lblDate.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
        lblTime.Text = Now.ToShortTimeString
        lblNameFrom.Text = String.Format("از: {0}", ClassProfile_Section.GetFnLn(EmailFrom))
        lblNameTo.Text = String.Format("به: {0}", ClassProfile_Section.GetFnLn(EmailTo))

        imgFrom.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(EmailFrom) + "&W=100&H=100"
        imgTo.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(EmailTo) + "&W=100&H=100"

        Dim TYPE As String
        Select Case Request.QueryString("type")
            Case 0
                TYPE = "عکس"
            Case 1
                TYPE = "لینک"
            Case 2
                TYPE = "متن"
        End Select
        lblType.Text = String.Format("نوع ارسال : {0}", TYPE)
        lblSuccess.Text = String.Format(" {0} شما با موفقیت ارسال گردید.", TYPE)
        ''''''''''''''''''''''''''''''''''''
        '''''''''''' Header ''''''''''''''''
        ''''''''''''''''''''''''''''''''''''
        If ClassHomeSetting.GetBG_Profile(EmailTo) <> "" Then
            imgHeader.ImageUrl = "~\content\images\profile\Profile_Header\" + ClassHomeSetting.GetBG_Profile(EmailTo)
            imgHeader.Width = 962
            imgHeader.Height = 88
        End If

    End Sub

    Protected Sub BacktoProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BacktoProfile.Click
        Response.Redirect("Default.aspx?user=" + Request.QueryString("to"))
    End Sub

End Class
