Imports System.Data

Partial Class Management_Admin_Users_Premission
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim Class_CMS_Jiring As New CMS_Jiring
    Dim ClassPost As New CMS_Post

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مدیریت شهر دات کام - مدیریت حق دسترسی ها {0}", ClassProfile_Section.GetFnLn(Request.QueryString("email")))
        If Not IsPostBack Then
            txtStatement.Text = ClassHomeSetting.GetStatementSecurity(Request.QueryString("email"))
            FillPermission()
        End If

    End Sub

    Private Sub FillPermission()

        Dim dr As DataRow = ClassHomeSetting.Permission(Request.QueryString("email"))

        If dr(2) Then RB_Statement_Yes.Checked = True
        If Not dr(2) Then RB_Statement_No.Checked = True
        'Auth Citizen
        Select Case dr(3)
            Case True
                RB_Auth_Yes.Checked = True
            Case False
                RB_Auth_No.Checked = True
        End Select
        'Friends List
        Select Case dr(5)
            Case 0
                RB_FriendList_All.Checked = True
            Case 1
                RB_FriendList_Friends.Checked = True
            Case 2
                RB_FriendList_FamilyList.Checked = True
            Case 3
                RB_FriendList_Wife.Checked = True
            Case 4
                RB_FriendList_My.Checked = True
            Case 5
                RB_FriendList_AnyOne.Checked = True
        End Select
        'Family List
        Select Case dr(6)
            Case 0
                RB_FamilyList_All.Checked = True
            Case 1
                RB_FamilyList_Friends.Checked = True
            Case 2
                RB_FamilyList_FamilyList.Checked = True
            Case 3
                RB_FamilyList_Wife.Checked = True
            Case 4
                RB_FamilyList_MY.Checked = True
            Case 5
                RB_FamilyList_AnyOne.Checked = True
        End Select
        'ShaahrList
        Select Case dr(7)
            Case 0
                RB_ShaahrList_All.Checked = True
            Case 1
                RB_ShaahrList_Friends.Checked = True
            Case 2
                RB_ShaahrList_FamilyList.Checked = True
            Case 3
                RB_ShaahrList_Wife.Checked = True
            Case 4
                RB_ShaahrList_My.Checked = True
            Case 5
                RB_ShaahrList_AnyOne.Checked = True
        End Select
        'Album
        Select Case dr(8)
            Case 0
                RB_Album_All.Checked = True
            Case 1
                RB_Album_Friends.Checked = True
            Case 2
                RB_Album_FamilyList.Checked = True
            Case 3
                RB_Album_Wife.Checked = True
            Case 4
                RB_Album_My.Checked = True
            Case 5
                RB_Album_AnyOne.Checked = True
        End Select
        'Polling
        Select Case dr(9)
            Case 0
                RB_Polling_All.Checked = True
            Case 1
                RB_Polling_Friends.Checked = True
            Case 2
                RB_Polling_FamilyList.Checked = True
            Case 3
                RB_Polling_Wife.Checked = True
            Case 4
                RB_Polling_MY.Checked = True
            Case 5
                RB_Polling_AnyOne.Checked = True
        End Select
        'Personal Information
        Select Case dr(10)
            Case 0
                RB_InfoPerson_All.Checked = True
            Case 1
                RB_InfoPerson_Firneds.Checked = True
            Case 2
                RB_InfoPerson_FamilyList.Checked = True
            Case 3
                RB_InfoPerson_Wife.Checked = True
            Case 4
                RB_InfoPerson_My.Checked = True
            Case 5
                RB_InfoPerson_AnyOne.Checked = True
        End Select
        'OutWard Information
        Select Case dr(11)
            Case 0
                RB_InfoOut_All.Checked = True
            Case 1
                RB_InfoOut_Friends.Checked = True
            Case 2
                RB_InfoOut_FamilyList.Checked = True
            Case 3
                RB_InfoOut_Wife.Checked = True
            Case 4
                RB_InfoOut_My.Checked = True
            Case 5
                RB_InfoOut_AnyOne.Checked = True
        End Select
        'information Favortis
        Select Case dr(12)
            Case 0
                RB_InfoFavorit_All.Checked = True
            Case 1
                RB_InfoFavorit_Friends.Checked = True
            Case 2
                RB_InfoFavorit_FamilyList.Checked = True
            Case 3
                RB_InfoFavorit_Wife.Checked = True
            Case 4
                RB_InfoFavorit_My.Checked = True
            Case 5
                RB_InfoFavorit_AnyOne.Checked = True
        End Select
        'information Contact
        Select Case dr(13)
            Case 0
                RB_InfoContact_All.Checked = True
            Case 1
                RB_InfoContact_Friends.Checked = True
            Case 2
                RB_InfoContact_FamilyList.Checked = True
            Case 3
                RB_InfoContact_Wife.Checked = True
            Case 4
                RB_InfoContact_My.Checked = True
            Case 5
                RB_InfoContact_AnyOne.Checked = True
        End Select
        'Get Photo
        Select Case dr(14)
            Case 0
                RB_getPhoto_All.Checked = True
            Case 1
                RB_getPhoto_Firends.Checked = True
            Case 2
                RB_getPhoto_FamilyList.Checked = True
            Case 3
                RB_getPhoto_wife.Checked = True
            Case 4
                RB_getPhoto_my.Checked = True
            Case 5
                RB_getPhoto_anyone.Checked = True
        End Select
        'Get Link
        Select Case dr(15)
            Case 0
                RB_getLink_All.Checked = True
            Case 1
                RB_getLink_firneds.Checked = True
            Case 2
                RB_getLink_FamilyList.Checked = True
            Case 3
                RB_getLink_wife.Checked = True
            Case 4
                RB_getLink_my.Checked = True
            Case 5
                RB_getLink_anyone.Checked = True
        End Select
        'Get Text
        Select Case dr(16)
            Case 0
                RB_getText_All.Checked = True
            Case 1
                RB_getText_friends.Checked = True
            Case 2
                RB_getText_FamilyList.Checked = True
            Case 3
                RB_getText_wife.Checked = True
            Case 4
                RB_getText_my.Checked = True
            Case 5
                RB_getText_anyone.Checked = True
        End Select
        'Message
        Select Case dr(17)
            Case 0
                RB_Message_All.Checked = True
            Case 1
                RB_Message_friends.Checked = True
            Case 2
                RB_Message_FamilyList.Checked = True
            Case 3
                RB_Message_wife.Checked = True
            Case 4
                RB_Message_my.Checked = True
            Case 5
                RB_Message_anyone.Checked = True
        End Select
        'Message Group
        Select Case dr(18)
            Case 0
                RB_MsgGroup_All.Checked = True
            Case 1
                RB_MsgGroup_Friends.Checked = True
            Case 2
                RB_MsgGroup_FamilyList.Checked = True
            Case 3
                RB_MsgGroup_wife.Checked = True
            Case 4
                RB_MsgGroup_my.Checked = True
            Case 5
                RB_MsgGroup_anyone.Checked = True
        End Select
        ''ShowUpdateNews()
        Select Case dr(19)
            Case 0
                RB_ShowUpdateNews_All.Checked = True
            Case 1
                RB_ShowUpdateNews_friends.Checked = True
            Case 2
                RB_ShowUpdateNews_FamilyList.Checked = True
            Case 3
                RB_ShowUpdateNews_wife.Checked = True
            Case 4
                RB_ShowUpdateNews_my.Checked = True
            Case 5
                RB_ShowUpdateNews_anyone.Checked = True
        End Select
        'ShowCommonAlbum
        Select Case dr(20)
            Case 1
                RB_CommonAlbum_Yes.Checked = True
            Case 0
                RB_CommonAlbum_No.Checked = True
        End Select
        'LastLogin
        Select Case dr(21)
            Case True
                RB_LastLgoin_Yes.Checked = True
            Case False
                RB_LastLgoin_No.Checked = True
        End Select
        ''Allow Chat
        Select Case dr(22)
            Case 0
                RB_AllowUpdateChat_All.Checked = True
            Case 1
                RB_AllowUpdateChat_friends.Checked = True
            Case 2
                RB_AllowUpdateChat_FamilyList.Checked = True
            Case 3
                RB_AllowUpdateChat_wife.Checked = True
            Case 4
                RB_AllowUpdateChat_my.Checked = True
            Case 5
                RB_AllowUpdateChat_anyone.Checked = True
        End Select
    End Sub

    'تنظیمات ورودی سایت

    Protected Sub RB_Statement_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Statement_Yes.CheckedChanged
        ClassHomeSetting.UpdatePermission_Entering(Request.QueryString("email"), True, 1)
    End Sub

    Protected Sub RB_Statement_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Statement_No.CheckedChanged
        ClassHomeSetting.UpdatePermission_Entering(Request.QueryString("email"), False, 1)
    End Sub

    Protected Sub RB_Auth_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Auth_Yes.CheckedChanged
        ClassHomeSetting.UpdatePermission_Entering(Request.QueryString("email"), True, 2)
    End Sub

    Protected Sub RB_Auth_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Auth_No.CheckedChanged
        ClassHomeSetting.UpdatePermission_Entering(Request.QueryString("email"), False, 2)
    End Sub

    'به اشتراک گزاری اطلاعات سایت

    '-------------- لیست دوستان
    Protected Sub RB_FriendList_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 1)
    End Sub
    Protected Sub RB_FriendList_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 1)
    End Sub
    Protected Sub RB_FriendList_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 1)
    End Sub
    Protected Sub RB_FriendList_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 1)
    End Sub
    Protected Sub RB_FriendList_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 1)
    End Sub
    Protected Sub RB_FriendList_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FriendList_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 1)
    End Sub

    '-------------- لیست بستگان
    Protected Sub RB_FamilyList_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 2)
    End Sub
    Protected Sub RB_FamilyList_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 2)
    End Sub
    Protected Sub RB_FamilyList_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 2)
    End Sub
    Protected Sub RB_FamilyList_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 2)
    End Sub
    Protected Sub RB_FamilyList_MY_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_MY.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 2)
    End Sub
    Protected Sub RB_FamilyList_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_FamilyList_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 2)
    End Sub

    '------------- لیست شهر ها
    Protected Sub RB_ShaahrList_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 3)
    End Sub
    Protected Sub RB_ShaahrList_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 3)
    End Sub
    Protected Sub RB_ShaahrList_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 3)
    End Sub
    Protected Sub RB_ShaahrList_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 3)
    End Sub
    Protected Sub RB_ShaahrList_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 3)
    End Sub
    Protected Sub RB_ShaahrList_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShaahrList_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 3)
    End Sub

    '------------- آلبوم تصاویر
    Protected Sub RB_Album_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 4)
    End Sub
    Protected Sub RB_Album_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 4)
    End Sub
    Protected Sub RB_Album_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 4)
    End Sub
    Protected Sub RB_Album_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 4)
    End Sub
    Protected Sub RB_Album_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 4)
    End Sub
    Protected Sub RB_Album_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Album_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 4)
    End Sub

    '--------- نظرسنجی ها
    Protected Sub RB_Polling_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 5)
    End Sub
    Protected Sub RB_Polling_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 5)
    End Sub
    Protected Sub RB_Polling_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 5)
    End Sub
    Protected Sub RB_Polling_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 5)
    End Sub
    Protected Sub RB_Polling_MY_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_MY.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 5)
    End Sub
    Protected Sub RB_Polling_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Polling_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 5)
    End Sub

    '-------- اطلاعات شخصی
    Protected Sub RB_InfoPerson_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 6)
    End Sub
    Protected Sub RB_InfoPerson_Firneds_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_Firneds.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 6)
    End Sub
    Protected Sub RB_InfoPerson_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 6)
    End Sub
    Protected Sub RB_InfoPerson_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 6)
    End Sub
    Protected Sub RB_InfoPerson_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 6)
    End Sub
    Protected Sub RB_InfoPerson_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoPerson_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 6)
    End Sub


    '--------- اطلاعات ظاهری
    Protected Sub RB_InfoOut_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 7)
    End Sub
    Protected Sub RB_InfoOut_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 7)
    End Sub
    Protected Sub RB_InfoOut_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 7)
    End Sub
    Protected Sub RB_InfoOut_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 7)
    End Sub
    Protected Sub RB_InfoOut_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 7)
    End Sub
    Protected Sub RB_InfoOut_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoOut_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 7)
    End Sub

    '---------- علاقمندی ها

    Protected Sub RB_InfoFavorit_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 8)
    End Sub
    Protected Sub RB_InfoFavorit_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 8)
    End Sub
    Protected Sub RB_InfoFavorit_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 8)
    End Sub
    Protected Sub RB_InfoFavorit_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 8)
    End Sub
    Protected Sub RB_InfoFavorit_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 8)
    End Sub
    Protected Sub RB_InfoFavorit_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoFavorit_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 8)
    End Sub

    '------- اطلاعات ارتباطی

    Protected Sub RB_InfoContact_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 9)
    End Sub
    Protected Sub RB_InfoContact_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 9)
    End Sub
    Protected Sub RB_InfoContact_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 9)
    End Sub
    Protected Sub RB_InfoContact_Wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_Wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 9)
    End Sub
    Protected Sub RB_InfoContact_My_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_My.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 9)
    End Sub
    Protected Sub RB_InfoContact_AnyOne_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_InfoContact_AnyOne.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 9)
    End Sub

    '----------- ارسال عکس

    Protected Sub RB_getPhoto_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 10)
    End Sub
    Protected Sub RB_getPhoto_Firends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_Firends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 10)
    End Sub
    Protected Sub RB_getPhoto_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 10)
    End Sub
    Protected Sub RB_getPhoto_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 10)
    End Sub
    Protected Sub RB_getPhoto_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 10)
    End Sub
    Protected Sub RB_getPhoto_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getPhoto_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 10)
    End Sub

    '------- ارسال لینک
    Protected Sub RB_getLink_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 11)
    End Sub
    Protected Sub RB_getLink_firneds_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_firneds.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 11)
    End Sub
    Protected Sub RB_getLink_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 11)
    End Sub
    Protected Sub RB_getLink_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 11)
    End Sub
    Protected Sub RB_getLink_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 11)
    End Sub
    Protected Sub RB_getLink_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getLink_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 11)
    End Sub

    '------ ارسال نوشته
    Protected Sub RB_getText_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 12)
    End Sub
    Protected Sub RB_getText_friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 12)
    End Sub
    Protected Sub RB_getText_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 12)
    End Sub
    Protected Sub RB_getText_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 12)
    End Sub
    Protected Sub RB_getText_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 12)
    End Sub
    Protected Sub RB_getText_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_getText_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 12)
    End Sub

    '---------- گرفتن پیام فردی

    Protected Sub RB_Message_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 13)
    End Sub
    Protected Sub RB_Message_friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 13)
    End Sub
    Protected Sub RB_Message_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 13)
    End Sub
    Protected Sub RB_Message_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 13)
    End Sub
    Protected Sub RB_Message_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 13)
    End Sub
    Protected Sub RB_Message_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_Message_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 13)
    End Sub

    '---------  گرفتن پیام گروهی
    Protected Sub RB_MsgGroup_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 14)
    End Sub
    Protected Sub RB_MsgGroup_Friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_Friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 14)
    End Sub
    Protected Sub RB_MsgGroup_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 14)
    End Sub
    Protected Sub RB_MsgGroup_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 14)
    End Sub
    Protected Sub RB_MsgGroup_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 14)
    End Sub
    Protected Sub RB_MsgGroup_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_MsgGroup_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 14)
    End Sub

    '-------- نمایش بروزرسانی
    Protected Sub RB_ShowUpdateNews_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 15)
    End Sub
    Protected Sub RB_ShowUpdateNews_friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 15)
    End Sub
    Protected Sub RB_ShowUpdateNews_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 15)
    End Sub
    Protected Sub RB_ShowUpdateNews_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 15)
    End Sub
    Protected Sub RB_ShowUpdateNews_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 15)
    End Sub
    Protected Sub RB_ShowUpdateNews_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_ShowUpdateNews_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 15)
    End Sub

    '-------- نمایش در آلوم های مشترک
    Protected Sub RB_CommonAlbum_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_CommonAlbum_Yes.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 16)
    End Sub
    Protected Sub RB_CommonAlbum_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_CommonAlbum_No.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 16)
    End Sub

    '-------- مخفی سازی تاریخ آخرین لاگین
    Protected Sub RB_LastLgoin_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_LastLgoin_Yes.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 17)
    End Sub
    Protected Sub RB_LastLgoin_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_LastLgoin_No.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 17)
    End Sub

    '-------- اجازه گفتگوی چت با
    Protected Sub RB_AllowUpdateChat_All_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_All.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 0, 18)
    End Sub
    Protected Sub RB_AllowUpdateChat_friends_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_friends.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 1, 18)
    End Sub
    Protected Sub RB_AllowUpdateChat_FamilyList_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_FamilyList.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 2, 18)
    End Sub
    Protected Sub RB_AllowUpdateChat_wife_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_wife.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 3, 18)
    End Sub
    Protected Sub RB_AllowUpdateChat_my_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_my.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 4, 18)
    End Sub
    Protected Sub RB_AllowUpdateChat_anyone_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RB_AllowUpdateChat_anyone.CheckedChanged
        ClassHomeSetting.UpdatePermission_Sharing(Request.QueryString("email"), 5, 18)
    End Sub

    Protected Sub btnUpdateStatementSecure_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateStatementSecure.Click
        If txtStatement.Text <> "" Then
            If ClassHomeSetting.CheckDuplicateSecureStatement(Request.QueryString("email"), txtStatement.Text) Then
                ClassHomeSetting.UpdateStatement(txtStatement.Text, Request.QueryString("email"))
                lblUserName_auth.Text = "جمله امنیتی بدرستی اصلاح گردید."
                txtStatement.Text = ClassHomeSetting.GetStatementSecurity(Request.QueryString("email"))
            Else
                lblUserName_auth.Text = "این جمله توسط کاربر دیگری انتخاب شده برای امنیت بیشتر جمله دیگری را انتخاب کنید "
            End If
        End If
    End Sub

End Class
