Imports System.Drawing
Imports System.Data
Imports System.IO

Partial Class user_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3
    Dim ClassShaahr As New Shaahr

    Dim em_owner As String  'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        Title = String.Format("پروفایل {0}", ClassProfile_Section.GetFnLn(em_owner))
        lblFnLn.Text = ClassProfile_Section.GetFnLn(em_owner)
        'note: ebteda Username karbar pardazesh shoda va Email o dar in label gharar migirad 
        GetThink() 'خواندن در ذهن من
        LoadAvatars() 'لود کردن آواتار کاربر و عکس های سه گانه کنار آوتار
        Plus.em_owner = em_owner  'برای آماده کردن دکمه ی ارتباط دوستی
        If (Not IsPostBack) And (Session("MY-UsErNaMe") <> "") And (Session("MY-UsErNaMe") <> ClassProfile.getEmailByUsername(Request.QueryString("user"))) Then RegisterVisit() 'ثبت ملاقات کاربر از صفحه جاری
        PanelCommandFriend() 'بررسی پنل دوستان
        Permission() 'بررسی حق دسترسی افراد
        NotUser() 'اگر کاربر مهمان وارد شد بعضی از ابرازها مخفی می شود
        FullInbox() 'چک کردن وضعیت صندوق پستی کاربر
        CheckEmpty() 'اگر پنل ها خالی بود کلا مخفی شوند

    End Sub

    Protected Sub ODS_Friends_More_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Friends_More.Selecting
        e.InputParameters("email") = em_owner
    End Sub
    Protected Sub ODS_Family_More_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Family_More.Selecting
        e.InputParameters("email") = em_owner
    End Sub
    Protected Sub ODS_UsersMoreShaahrs_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_UsersMoreShaahrs.Selecting
        e.InputParameters("email") = em_owner
    End Sub
    Protected Sub ODS_ProfileCommonMoreFriends_Selecting_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileCommonMoreFriends.Selecting
        e.InputParameters("email") = Session("MY-UsErNaMe")
        e.InputParameters("otherEmail") = em_owner
    End Sub

    Private Sub CheckEmpty()

        If DL_Friends.Items.Count = 0 Then Pnl_friend.Visible = False
        If DL_Common_Friend.Items.Count = 0 Then Pnl_common.Visible = False
        If DL_Family.Items.Count = 0 Then Pnl_Family.Visible = False
        If DL_Shaahrs.Items.Count = 0 Then Pnl_shaahr.Visible = False

    End Sub

    Private Sub FullInbox()

        'چک کردن پر بودن صندوق پستی کاربر
        If ClassStage.CheckServiceExsistUsersByType(2, em_owner) Then
            If ClassHome.getCountMessagesRecived(em_owner, 0) = "100" Then
                SendMessage.Visible = False
                Exit Sub
            End If
        Else
            If ClassHome.getCountMessagesRecived(em_owner, 0) = "20" Then
                SendMessage.Visible = False
                Exit Sub
            End If
        End If
        'چک کردن حق دسترسی
        If Not Permission(em_owner, True) Then
            SendMessage.Visible = False
            Exit Sub
        End If

    End Sub

    Private Function Permission(ByVal USER As String, ByVal Index As Boolean) As Boolean

        Select Case Index
            Case True 'پیام های فردی
                Dim dr As DataRow = ClassHomeSetting.Permission(USER)
                Select Case dr(17)
                    Case 0 'نمایش برای همه
                        Return True
                    Case 1 'نمایش برای دوستانم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 1) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 2 'نمایش برای بستگان
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 2) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 3 'نمایش برای همسرم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 3) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 4 'فقط من
                        If Not (Session("MY-UsErNaMe") = USER) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 5 'هیچکس
                        Return False
                End Select
            Case False ' پیام های گروهی
                Dim dr As DataRow = ClassHomeSetting.Permission(USER)
                Select Case dr(18)
                    Case 0 'نمایش برای همه
                        Return True
                    Case 1 'نمایش برای دوستانم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 1) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 2 'نمایش برای بستگان
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 2) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 3 'نمایش برای همسرم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 3) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 4 'فقط من
                        If Not (Session("MY-UsErNaMe") = USER) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 5 'هیچکس
                        Return False
                End Select
        End Select


    End Function

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Freinds List''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(5)
            Case 0 'نمایش برای همه
                Pnl_friend.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_friend.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_friend.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_friend.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Pnl_friend.Visible = False
                End If
            Case 5 'هیچکس
                Pnl_friend.Visible = False
        End Select
        'If Session("MY-UsErNaMe") = em_owner Then Pnl_friend.Visible = True 'اولویت من از همه بییشتر است
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Family List'''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(6)
            Case 0 'نمایش برای همه
                Pnl_Family.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_Family.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_Family.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_Family.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Pnl_Family.Visible = False
                End If
            Case 5 'هیچکس
                Pnl_Family.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Shaahrs List''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(7)
            Case 0 'نمایش برای همه
                Pnl_shaahr.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_shaahr.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_shaahr.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Pnl_shaahr.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Pnl_shaahr.Visible = False
                End If
            Case 5 'هیچکس
                Pnl_shaahr.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Get Photo'''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(14)
            Case 0 'نمایش برای همه
                Div_Panel_Photo.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Photo.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Photo.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Photo.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_Panel_Photo.Visible = False
                End If
            Case 5 'هیچکس
                Div_Panel_Photo.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Get Link'''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(15)
            Case 0 'نمایش برای همه
                Div_Panel_Link.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Link.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Link.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_Link.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_Panel_Link.Visible = False
                End If
            Case 5 'هیچکس
                Div_Panel_Link.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Get Text'''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(16)
            Case 0 'نمایش برای همه
                Div_Panel_text.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_text.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_text.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Div_Panel_text.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Div_Panel_text.Visible = False
                End If
            Case 5 'هیچکس
                Div_Panel_text.Visible = False
        End Select
        'اگر هر3  قسمت در بیلبور غیر فعال شد دیگر نیازی به نمایش دکمه های عملیاتی بیلبورد نمی باشد
        If Div_Panel_text.Visible = False And Div_Panel_Link.Visible = False And Div_Panel_Photo.Visible = False Then
            imgUpBilboard.Visible = False
            imgDownBilboard.Visible = False
        Else
            imgUpBilboard.Visible = True
            imgDownBilboard.Visible = True
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Send MSG '''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(17)
            Case 0 'نمایش برای همه
                SendMessage.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) Then
                    SendMessage.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) Then
                    SendMessage.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) Then
                    SendMessage.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    SendMessage.Visible = False
                End If
            Case 5 'هیچکس
                SendMessage.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Update News ''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(19)
            Case 0 'نمایش برای همه
                update.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    update.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    update.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    update.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    update.Visible = False
                End If
            Case 5 'هیچکس
                update.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Album'''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(8)
            Case 0 'نمایش برای همه

            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) Then
                    imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) Then
                    imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_1.PostBackUrl = ""
                    imgAvatar_2.PostBackUrl = ""
                    imgAvatar_3.PostBackUrl = ""
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) Then
                    imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_1.PostBackUrl = ""
                    imgAvatar_2.PostBackUrl = ""
                    imgAvatar_3.PostBackUrl = ""
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                    imgAvatar_1.PostBackUrl = ""
                    imgAvatar_2.PostBackUrl = ""
                    imgAvatar_3.PostBackUrl = ""
                End If
            Case 5 'هیچکس
                imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
                imgAvatar_1.PostBackUrl = ""
                imgAvatar_2.PostBackUrl = ""
                imgAvatar_3.PostBackUrl = ""
        End Select

    End Sub

    Private Sub PanelCommandFriend()
        If (Not IsPostBack) And (Session("MY-UsErNaMe") <> "") And (Session("MY-UsErNaMe") = ClassProfile.getEmailByUsername(Request.QueryString("user"))) Then Pnl_common.Visible = False
        If Session("MY-UsErNaMe") = "" Then Pnl_common.Visible = False
    End Sub

    Private Sub GetThink()
        lbThink.Text = ClassProfile.Get_Think(em_owner)
    End Sub

    Private Sub RegisterVisit()
        ClassHome.InsertVisit(Session("MY-UsErNaMe"), ClassProfile.getEmailByUsername(Request.QueryString("user")))
    End Sub

    Private Sub NotUser()

        If Session("MY-UsErNaMe") = "" Then
            imgUpBilboard.Visible = False
            imgDownBilboard.Visible = False
            SendMessage.Visible = False

            btnMORE_Common.Visible = False
            btnMORE_Family.Visible = False
            btnMORE_Friends.Visible = False
            btnMORE_Shaahr.Visible = False

        End If

        If em_owner = Session("MY-UsErNaMe") Or Session("MY-UsErNaMe") = "" Then
            SendMessage.Visible = False
        Else
            SendMessage.Visible = True
        End If

    End Sub

    Private Sub LoadAvatars()

        Dim Filename As String = ClassProfile.getOrginalAvatar(em_owner)
        If Filename <> "" Then
            imgBigAvatars.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(em_owner) + "&W=229&H=229"
            imgBigAvatars.Height = 229
            imgBigAvatars.Width = 229
        Else
            imgBigAvatars.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
            imgBigAvatars.Width = 229 : imgBigAvatars.Height = 229
        End If
        '''''''''''''''''''''''''''''''''''''
        '''''''''''' 3-Album ''''''''''''''''
        '''''''''''''''''''''''''''''''''''''
        Dim Filenames(,) As String = ClassProfile.Get_RandomPictureAlbum(em_owner)
        If Filenames(0, 0) <> "" Then
            imgAvatar_1.ImageUrl = "RandomAvatar.aspx?name=" + MapPath("~/content/images/Profile/photo/" + Filenames(0, 0))
            imgAvatar_1.PostBackUrl = "photos.aspx?code=" + Filenames(0, 1) + "&user=" + ClassProfile.getUsernameByEmail(em_owner)
        Else
            imgAvatar_1.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
        End If
        If Filenames(1, 0) <> "" Then
            imgAvatar_2.ImageUrl = "RandomAvatar.aspx?name=" + MapPath("~/content/images/Profile/photo/" + Filenames(1, 0))
            imgAvatar_2.PostBackUrl = "photos.aspx?code=" + Filenames(1, 1) + "&user=" + ClassProfile.getUsernameByEmail(em_owner)
        Else
            imgAvatar_2.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
        End If
        If Filenames(2, 0) <> "" Then
            imgAvatar_3.ImageUrl = "RandomAvatar.aspx?name=" + MapPath("~/content/images/Profile/photo/" + Filenames(2, 0))
            imgAvatar_3.PostBackUrl = "photos.aspx?code=" + Filenames(2, 1) + "&user=" + ClassProfile.getUsernameByEmail(em_owner)
        Else
            imgAvatar_3.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
        End If
        ''''''''''''''''''''''''''''''''''''
        '''''''''''' Header ''''''''''''''''
        ''''''''''''''''''''''''''''''''''''
        If ClassHomeSetting.GetBG_Profile(em_owner) <> "" Then
            imgHeader.ImageUrl = "~\content\images\profile\Profile_Header\" + ClassHomeSetting.GetBG_Profile(em_owner)
            imgHeader.Width = 962
            imgHeader.Height = 88
        End If

    End Sub

    Protected Sub btnSendPost_Click(ByVal sender As Object, ByVal e As Object) Handles btnSendPost.Click

        If txtPost.Text = "متن شما ..." Or txtTitlePost.Text = "عنوان مطلب شما ..." Or txtPost.Text = "" Or txtTitlePost.Text = "" Then Exit Sub

        ClassProfile.InsertObject(Session("MY-UsErNaMe"), em_owner, 2, txtPost.Text.Replace(vbLf, "</br>"), txtTitlePost.Text)
        '________________ Redirect
        Dim UsernameFrom As String = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")), UsernameTo As String = ClassProfile.getUsernameByEmail(em_owner)
        Response.Redirect("sendingpost.aspx?type=2&from=" + UsernameFrom + "&to=" + UsernameTo)

    End Sub

    Protected Sub btnSendLink_Click(ByVal sender As Object, ByVal e As Object) Handles btnSendLink.Click

        If txtLink.Text = "Http://" Or txtTextLink.Text = "توضیحات لینک شما ..." Or txtLink.Text = "" Or txtTextLink.Text = "" Then Exit Sub

        ClassProfile.InsertObject(Session("MY-UsErNaMe"), em_owner, 1, txtLink.Text, txtTextLink.Text.Replace(vbLf, "</br>"))
        '________________ Redirect
        Dim UsernameFrom As String = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")), UsernameTo As String = ClassProfile.getUsernameByEmail(em_owner)
        Response.Redirect("sendingpost.aspx?type=1&from=" + UsernameFrom + "&to=" + UsernameTo)

    End Sub

    Protected Sub btnSendPhoto_Click(ByVal sender As Object, ByVal e As Object) Handles btnSendPhoto.Click

        'If txtPhoto.Text = "" Or txtPhoto.Text = "توضیحات تصویر شما ..." Or PhotoUpload.FileName = "" Then Exit Sub
        'Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
        'Dim r As New Random
        'Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        'Filename = em_owner + "_" + Filename
        'Dim FileInforamtion As New FileInfo(PhotoUpload.FileName)
        'Try
        '    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '    If PhotoUpload.PostedFile.ContentLength.ToString > 170000 Then
        '        'lblError.Text = "حجم عکس شما باید کمتر از 300 کیلوبایت باشد."
        '    Else
        '        PhotoUpload.SaveAs(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
        '        '--------------------- معتبر نبودن پسوند فایل برای جلوگیری از هک شدن 
        '        Dim bt As New Bitmap(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
        '        Dim c As Color = bt.GetPixel(1, 1)
        '        '---------------------
        '        ClassProfile.InsertObject(Session("MY-UsErNaMe"), em_owner, 0, Filename + FileInforamtion.Extension, txtPhoto.Text)
        '        Dl_UpdateNews.DataBind()
        '        '--------------------- Redirect
        '        Dim UsernameFrom As String = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")), UsernameTo As String = ClassProfile.getUsernameByEmail(em_owner)
        '        Response.Redirect("sendingpost.aspx?type=0&from=" + UsernameFrom + "&to=" + UsernameTo)
        '    End If
        '    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Catch ex As Exception
        '    If Err.Number = 5 Then
        '        File.Delete(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
        '        'lblError.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
        '    End If
        'End Try
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If txtPhoto.Text = "" Or txtPhoto.Text = "توضیحات تصویر شما ..." Or PhotoUpload.FileName = "" Then Exit Sub
        If PhotoUpload.FileName <> "" Then
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = em_owner + "_" + Filename
            Dim FileInforamtion As New FileInfo(PhotoUpload.FileName)
            Filename = Filename + FileInforamtion.Extension
            Try
                If Not AccVolume(PhotoUpload.PostedFile.ContentLength.ToString) Then
                    'lblError.Text = "حجم مصرفی خانه شما توانایی گنجایش این فایل را ندارد."
                Else
                    ''''''''''' Checking '''''''''''
                    PhotoUpload.SaveAs(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                    '--------------------- Agar error dadah yani File Aks nist
                    Dim bt_ As New Bitmap(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                    Dim c As Color = bt_.GetPixel(1, 1)

                    ClassProfile.InsertObject(Session("MY-UsErNaMe"), em_owner, 0, Filename + FileInforamtion.Extension, txtPhoto.Text.Replace(vbLf, "</br>"))
                    'Dl_UpdateNews.DataBind()

                    Dim UsernameFrom As String = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")), UsernameTo As String = ClassProfile.getUsernameByEmail(em_owner)
                    Response.Redirect("sendingpost.aspx?type=0&from=" + UsernameFrom + "&to=" + UsernameTo)
                    bt_.Dispose()
                End If

            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\content\images\Profile\Photo\" + Filename + FileInforamtion.Extension))
                End If
            End Try
        End If

    End Sub

    Private Function AccVolume(ByVal FileLentgh As Integer) As Boolean

        Dim count As Long
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Photo\"), em_owner.ToLower, "tbl_Profile_Objects", "string_factor")
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Avatars\"), em_owner.ToLower, "tbl_Profile_Avatars", "PicPath")
        If (52428800 - count) >= FileLentgh Then
            Return True 'allow to upload
        Else
            Return False 'reject to upload
        End If

    End Function

    Protected Sub ODS_Comments_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_ProfileFriends_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileFriends.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_ProfileCommonFriends_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileCommonFriends.Selecting
        e.InputParameters("otherEmail") = em_owner
        e.InputParameters("Email") = Session("MY-UsErNaMe")
    End Sub

    Public Sub OpenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("PhotoDefaultPage") = True
        Response.Redirect("DetailPhoto.aspx?code=" + e.CommandArgument + "&user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub SendMessage_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SendMessage.Click

        lblTitleMessage.Text = String.Format("ارسال پیام به  {0}", ClassProfile_Section.GetFnLn(em_owner))
        lblDateMessage.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
        lblToMessage.Text = String.Format("ارسال پیام از {0} به {1}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")), ClassProfile_Section.GetFnLn(em_owner))
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog2');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog2');", True)

    End Sub

    Protected Sub btnSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMessage.Click

        If txtSubjectMessage.Text <> "" Then
            If txtMessage.Text <> "" Then
                If txtMessage.Text <> "متن شما ..." Then
                    If txtSubjectMessage.Text <> "عنوان پیام ..." Then
                        ClassProfile_Section.InsertMessage(Session("MY-UsErNaMe"), em_owner, txtSubjectMessage.Text, txtMessage.Text.Replace(vbLf, "</br>"), 0, 0, False) 'پیام دریافتی
                        ClassProfile_Section.InsertMessage(Session("MY-UsErNaMe"), em_owner, txtSubjectMessage.Text, txtMessage.Text.Replace(vbLf, "</br>"), 0, 0, True) 'پیام ارسالی
                        'شخصیت سوم و بررسی پر بودن صندوق پستی
                        If ClassStage.CheckServiceExsistUsersByType(2, em_owner) Then
                            'صندوق 100 تایی است
                            If Val(ClassHome.getCountMessagesRecived(em_owner, 0)) > 99 Then
                                ClassCharacter3.Insert_Charaacter3_Users(em_owner, String.Format("دوست من {0} خوبی؟ باید بگم صندوق پستیت متاسفانه پر شده ، بهتره چنتا از پیاماتو پاک کنی تا پیام بقیه بهت برسه", ClassProfile_Section.GetFnLn(em_owner)), "FF", True)
                            End If
                        Else
                            'صندوق 20 تایی است
                            If Val(ClassHome.getCountMessagesRecived(em_owner, 0)) > 19 Then
                                ClassCharacter3.Insert_Charaacter3_Users(em_owner, String.Format("دوست من {0} انشالله که حالت خوب باشه. صندوق پستیت متاسفانه پر شده ، بهت پیشنهاد میکنم که از سرویس افزایش صندوق پستی به 100 پیام استفاده کنی و یا چنتا از پیاماتو پاک کنی تا پیام بقیه بهت برسه", ClassProfile_Section.GetFnLn(em_owner)), "FF", True)
                            End If
                        End If
                        '''''''''''''''''
                        txtMessage.Text = "متن شما ..."
                        txtSubjectMessage.Text = "عنوان پیام ..."
                        lblTitleMessageAfterSend.Text = "ارسال با موفقیت انجام شد"
                        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog3');", True) 'Run JQuery Function
                        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog3');", True)
                    Else
                        txtMessage.Text = "متن شما ..."
                        txtSubjectMessage.Text = "عنوان پیام ..."
                        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
                        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
                    End If
                Else
                    txtMessage.Text = "متن شما ..."
                    txtSubjectMessage.Text = "عنوان پیام ..."
                    'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
                    ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
                End If
            End If
        Else
            txtMessage.Text = "متن شما ..."
            txtSubjectMessage.Text = "عنوان پیام ..."
            'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
        End If

    End Sub

    Protected Sub imgBigAvatars_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/?user=" + Request.QueryString("user"))
    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    'Mnu
    Protected Sub btnMnuPolling_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/polling.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub btnMnuContact_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/contact.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub btnMnuInfo_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/info.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub btnMnuAlbum_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/album.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub btnMnuPost_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/post.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Public Function SetPercent(ByVal codeoption As Object, ByVal code_polling As Object, ByVal [option] As Object) As String

        Dim Percent As Long = ClassProfile_Section.GetPercentPolling(code_polling.ToString, codeoption.ToString)

        Dim perect_ As Integer = Percent
        Dim ret As String = ""
        If perect_.ToString <> "0" Then
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;width:" & Val(perect_) & "px;background-color:#ACD7F2;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", [option], "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        Else
            'صفر درصد
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", [option].ToString, "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        End If
        Return ret

    End Function

    Protected Sub ODS_ParticipatePolling_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = Session("MY-UsErNaMe")
    End Sub

    Public Sub SetOption(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim args() As String = e.CommandArgument.ToString.Split("|")
        ClassProfile_Section.InsertPolling(Session("MY-UsErNaMe"), args(1), args(0))
        'Dl_UpdateNews.DataBind()

    End Sub

    Protected Sub btnShowAllPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/user/AllPolling.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

    Protected Sub ODS_Polling_Selecting1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = em_owner
    End Sub

    '------
    Protected Sub imgGuid_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~\home\")
    End Sub

    Protected Sub ODS_Family_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Family.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    '-- Online
    Public Function CheckVisible(ByVal user As Object) As Boolean

        If ClassOnline.CheckOnline(user) Then
            If ClassOnline.GetStatusCode(user) = 4 Then
                Return False
            Else
                Return True
            End If
        Else
            Return False
        End If

    End Function

    Public Function CheckOnilneImage(ByVal user As Object) As String
        Select Case ClassOnline.GetStatusCode(user)
            Case 1
                Return "~\content\images\stage\chat\online_avaliable.gif"
            Case 2
                Return "~\content\images\stage\chat\online_NotHere.gif"
            Case 3
                Return "~\content\images\stage\chat\online_busy.gif"
            Case 5
                Return "~\content\images\stage\chat\online_NotNow.gif"
        End Select
    End Function

    '-- shaahr
    Public Function GetFavorit(ByVal code As Long) As String
        Return ClassShaahr.GetFavorit(code)
    End Function
    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Protected Sub ODS_UsersShaahrs_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_UsersShaahrs.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    '-- More

    Protected Sub btnMORE_Friends_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Friends.Click
        MultiMore.ActiveViewIndex = 0
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Family_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Family.Click
        MultiMore.ActiveViewIndex = 1
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Common_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Common.Click
        MultiMore.ActiveViewIndex = 2
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Shaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Shaahr.Click
        MultiMore.ActiveViewIndex = 3
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog5');", True)
    End Sub

End Class

