Imports System.Drawing
Imports System.Data
Imports System.IO

Partial Class user_User
    Inherits System.Web.UI.MasterPage

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassShaahr As New Shaahr
    '--------------پاک شدنی ها
    'Dim em_me As String = "m@m.m" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String  'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Session("MY-UsErNaMe") = em_me
        'note: ebteda Username karbar pardazesh shoda va Email o dar in label gharar migirad 
        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        GetThink() 'خواندن در ذهن من
        LoadAvatars() 'Load Avatars
        Plus.em_owner = em_owner  'برای آماده کردن دکمه ی ارتباط دوستی
        PanelCommandFriend() 'بررسی پنل دوستان
        Permission() 'بررسی حق دسترسی افراد
        CheckEmpty()

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

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Freinds List''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(5)
            Case 0 'نمایش برای همه
                Pnl_friend.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) Then
                    Pnl_friend.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) Then
                    Pnl_friend.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) Then
                    Pnl_friend.Visible = False
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Pnl_friend.Visible = False
                End If
            Case 5 'هیچکس
                Pnl_friend.Visible = False
        End Select
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Family List'''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(6)
            Case 0 'نمایش برای همه
                Pnl_Family.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) Then
                    Pnl_Family.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) Then
                    Pnl_Family.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) Then
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
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) Then
                    Pnl_shaahr.Visible = False
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) Then
                    Pnl_shaahr.Visible = False
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) Then
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

    Private Sub LoadAvatars()

        Dim Filename As String = ClassProfile.getOrginalAvatar(em_owner)
        If Filename <> "" Then
            'Dim img As Image = Image.FromFile(MapPath("~/content/images/Profile/Avatars/" + Filename))
            ''اگه سایز اسنتاندارد بود که خودش نشون بدهد
            'If img.Width = 229 And img.Height = 223 Then imgBigAvatars.Width = 229 : imgBigAvatars.Height = 229
            ''اگه از اون سایز بزرگتر بود باید عملیات برش را بصول و عرض مشخص انجام دهد
            'If img.Width > 229 Or img.Height > 223 Then
            '    imgBigAvatars.Width = 229 : imgBigAvatars.Height = 229
            '    Session("CropAvatar") = MapPath("~/content/images/Profile/Avatars/" + Filename)
            '    imgBigAvatars.ImageUrl = "CropAvatar.aspx"
            'End If
            imgBigAvatars.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(em_owner) + "&W=229&H=229"
            imgBigAvatars.Height = 229
            imgBigAvatars.Width = 229
        Else
            imgBigAvatars.ImageUrl = "~\content\images\Profile_View_Users\noPicture.png"
            imgBigAvatars.Width = 229 : imgBigAvatars.Height = 229
        End If

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

    Protected Sub ODS_ProfileFriends_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileFriends.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_ProfileCommonFriends_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileCommonFriends.Selecting
        e.InputParameters("otherEmail") = em_owner
        e.InputParameters("Email") = Session("MY-UsErNaMe")
    End Sub


    Protected Sub imgBigAvatars_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/user/?user=" + Request.QueryString("user"))
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

    '------
    Protected Sub imgGuid_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~\home\")
    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
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

    '--- shaahrs

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
        ScriptManager.RegisterStartupScript(Page, Page.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Family_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Family.Click
        MultiMore.ActiveViewIndex = 1
        ScriptManager.RegisterStartupScript(Page, Page.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Common_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Common.Click
        MultiMore.ActiveViewIndex = 2
        ScriptManager.RegisterStartupScript(Page, Page.GetType, "", "Modal('dialog5');", True)
    End Sub
    Protected Sub btnMORE_Shaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMORE_Shaahr.Click
        MultiMore.ActiveViewIndex = 3
        ScriptManager.RegisterStartupScript(Page, Page.GetType, "", "Modal('dialog5');", True)
    End Sub

End Class

