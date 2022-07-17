Imports System.IO
Imports System.Data

Partial Class UserControl_Home_SetObject
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassHomeSetting As New HomeSetting

    Dim Email_ As String
    Property Email() As String
        Get
            Return Email_
        End Get
        Set(ByVal value As String)
            Email_ = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblCountAlbum.Text = String.Format("تعداد آلبوم های موجود: {0}", ClassHome.GetCountPictureAlbum_And_CountAlbum(Email_, True))
        lblCountPictureAlbum.Text = String.Format("تعداد عکس های موجود: {0}", ClassHome.GetCountPictureAlbum_And_CountAlbum(Email_, False))

        If Dl_Firends.Items.Count = 0 Then lblEmptyFreinds.Visible = True
        If Dl_Familys.Items.Count = 0 Then lblEmptyFamilys.Visible = True

    End Sub

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Photos.aspx?code=" + e.CommandArgument)
    End Sub

    Protected Sub ODS_Friends_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Friends.Selecting
        e.InputParameters("email") = Email_
    End Sub

    Public Sub RedirectToProfile(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Protected Sub ODS_Familys_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Familys.Selecting
        e.InputParameters("email") = Email_
    End Sub

    Public Function WhichFamily(ByVal name_email As Object) As String
        'Dim s() As String = name_email.ToString.Split("|")
        'Return s(0) + " (" + ClassHome.WhichFamily(s(1), Email_) + ")"
    End Function

    Public Function SetOrgAlbum(ByVal code As Object) As String

        Return IIf(ClassProfile_Section.Album(Email_, Convert.ToInt64(code)).Rows(0)(0).ToString() = String.Empty, _
                "~\content\images\Profile_View_Users\noPicture.png", _
                "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.Album(Email_, Convert.ToInt64(code)).Rows(0)(0).ToString() + "&W=114&H=96")

    End Function

    Protected Sub Ods_notAlbum_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles Ods_notAlbum.Selecting
        e.InputParameters("email") = Email_
    End Sub

    Protected Sub ODS_Album_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Album.Selecting
        e.InputParameters("email") = Email_
    End Sub

    Protected Sub btnSendPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendPost.Click

        ClassProfile.InsertObject(Email_, Email_, 2, txtPost.Text.Replace(vbLf, "</br>"), txtTitlePost.Text)
        txtTitlePost.Text = "عنوان مطلب شما ..."
        txtPost.Text = "متن شما ..."
        dSuccess.Style.Add("display", "inline")

    End Sub

    Protected Sub btnSendLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendLink.Click

        ClassProfile.InsertObject(Email_, Email_, 1, txtLink.Text, txtTextLink.Text.Replace(vbLf, "</br>"))
        txtLink.Text = "Http://"
        txtTextLink.Text = "توضیحات لینک شما ..."
        dSuccess.Style.Add("display", "inline")

    End Sub

    Protected Sub UP_Pooling_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles UP_Pooling.Load

        PnlOption.Controls.Clear()
        For i As Integer = 1 To Val(txtCountOption.Text)
            Dim uc As UserControl = LoadControl("TextBox.ascx")
            Dim li As New Literal
            li.Text = "<br/><br/>"
            PnlOption.Controls.Add(uc)
            PnlOption.Controls.Add(li)
        Next

    End Sub

    Protected Sub btnUP_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUP.Click
        If txtCountOption.Text < 100 Then txtCountOption.Text += 1
    End Sub

    Protected Sub btnDown_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDown.Click
        If txtCountOption.Text > 2 Then txtCountOption.Text -= 1
    End Sub

    Protected Sub btnStep2_Polling_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnStep2_Polling.Click
        MultiView_Polling.ActiveViewIndex = 1
    End Sub

    Protected Sub btnBackPolling_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBackPolling.Click
        MultiView_Polling.ActiveViewIndex = 0
    End Sub

    Protected Sub btnRegisterPolling_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRegisterPolling.Click

        'Check for Empty Field , Note: nabayad Filed khali rad shavad ;)
        For Each c As Control In PnlOption.Controls
            If c.GetType().ToString = "ASP.usercontrol_home_textbox_ascx" Then
                Dim txt As TextBox = CType(c.FindControl("TextBox1"), TextBox)
                If txt.Text = String.Empty Then
                    lblEmptyField.Text = "تمام گزینه ها باید پر شوند"
                    Exit Sub
                End If
            End If
        Next
        'insertPolling
        ClassHome.InsertPolling(Email_, txtQuestion.Text, txtDetail.Text.Replace(vbLf, "</br>"))
        'insertOption
        For Each c As Control In PnlOption.Controls
            If c.GetType().ToString = "ASP.usercontrol_home_textbox_ascx" Then
                Dim txt As TextBox = CType(c.FindControl("TextBox1"), TextBox)
                ClassHome.InsertOption(txt.Text)
                lblEmptyField.Text = ""
            End If
        Next
        txtCountOption.Text = 2
        txtDetail.Text = ""
        txtQuestion.Text = ""
        MultiView_Polling.ActiveViewIndex = 2
        'MultiView.ActiveViewIndex = 7

    End Sub

    Protected Sub btnRedirectAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRedirectAlbum.Click
        Response.Redirect("~\home\album.aspx")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~\home\noneAlbum.aspx")
    End Sub

    Public Function GetTypeFamily(ByVal Email As Object) As String
        Try
            Return String.Format("نوع ارتباط ( {0} )", ClassHome.WhichFamily(Val(ClassHomeSetting.GetTypeFamily(Session("MY-UsErNaMe"), Email.ToString))))
        Catch ex As Exception
            If Err.Number = 9 Then Return "نوع ارتباط دوستی"
        End Try
    End Function

    'Online
    Public Function CheckVisible(ByVal email As Object) As Boolean

        If ClassOnline.CheckOnline(email) Then
            If ClassOnline.GetStatusCode(email) = 4 Then
                Return False
            Else
                Return True
            End If
        Else
            Return False
        End If

    End Function

    Public Function CheckOnilneImage(ByVal email As Object) As System.Drawing.Color
        Select Case ClassOnline.GetStatusCode(email)
            Case 1
                Return System.Drawing.ColorTranslator.FromHtml("#11AA71")
            Case 2
                Return System.Drawing.ColorTranslator.FromHtml("#e17e00")
            Case 3
                Return System.Drawing.ColorTranslator.FromHtml("#ff0000")
            Case 4
                Return System.Drawing.ColorTranslator.FromHtml("#ccc")
            Case 5
                Return System.Drawing.ColorTranslator.FromHtml("#8da803")
        End Select
    End Function

    'Check kardane Service akharin Login karbaran
    Public Function CheckLastLoginService(ByVal email As Object) As Boolean
        Dim dr As DataRow = ClassHomeSetting.Permission(email.ToString)
        If Not dr(21) Then
            If ClassStage.CheckServiceExsistUsersByType(1, Session("MY-UsErNaMe")) Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If
    End Function
    '
    Public Function LastLogin(ByVal email As Object) As String

        Dim dr As DataRow = ClassHomeSetting.Permission(email.ToString)
        If ClassStage.CheckServiceExsistUsersByType(1, Session("MY-UsErNaMe")) Then
            If Not dr(21) Then
                Dim s() As String = ClassHome.GetLastLogin(email.ToString).Split(";")
                Return String.Format("تاریخ آخرین لاگین: {0} در ساعت: {1}", s(0), s(1))
            Else
                Return "تاریخ آخرین لاگین این کاربر غیر قابل مشاهده می باشد."
            End If
        Else
            Return ""
        End If

    End Function

    'chat
    Public Sub StartChat(ByVal sender As Object, ByVal e As CommandEventArgs)

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim dr As DataRow = ClassHomeSetting.Permission(e.CommandArgument)
        '''''''''''''''''''''''Freinds List''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(22)
            Case 0 'نمایش برای همه
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(e.CommandArgument, Session("MY-UsErNaMe"), 1) Then
                    Response.Redirect("~\outscope\state.aspx?state=chat")
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(e.CommandArgument, Session("MY-UsErNaMe"), 2) Then
                    Response.Redirect("~\outscope\state.aspx?state=chat")
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(e.CommandArgument, Session("MY-UsErNaMe"), 3) Then
                    Response.Redirect("~\outscope\state.aspx?state=chat")
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = e.CommandArgument) Then
                    Exit Sub
                End If
            Case 5 'هیچکس
                Response.Redirect("~\outscope\state.aspx?state=chat")
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        'If Session("OpenChatPage") <> "" Then Exit Sub
        'If ClassStage.GetCountNewRequest(Session("MY-UsErNaMe")) Then
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "OpenPage();", True)
        'End If
        'ClassStage.InsertNewRequest(Session("MY-UsErNaMe"), e.CommandArgument)
        'ClassStage.InsertUserNotification(Session("MY-UsErNaMe"), e.CommandArgument, True)

    End Sub

    Protected Sub btnResetPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResetPolling.Click
        MultiView_Polling.ActiveViewIndex = 0
    End Sub

End Class
