Imports System.Data

Partial Class user_album
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    Dim em_owner As String  'karbari k dar profileash hastim
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Title = String.Format("آلبوم تصاویر {0}", ClassProfile_Section.GetFnLn(em_owner))
        'lblTitleInformation.Text = Title

        ' P A R T [1]
        imgNotAlbum.ImageUrl = IIf(ClassProfile_Section.NotAlbum(em_owner).Rows(0)(0).ToString() = String.Empty, "~\content\images\Profile_View_Users\noPicture.png", _
                                   "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.NotAlbum(em_owner).Rows(0)(0).ToString + "&W=127&H=96")
        If ClassProfile_Section.NotAlbum(em_owner).Rows(0)(0).ToString() <> String.Empty Then
            imgNotAlbum.PostBackUrl = "noneAlbum.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner)
        End If

        lblCountPicture.Text = String.Format("تعداد عکس های: {0}", IIf(ClassProfile_Section.NotAlbum(em_owner).Rows(0)(1).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.NotAlbum(em_owner).Rows(0)(1).ToString))
        lblCountComment.Text = String.Format("تعداد نظر ها: {0}", IIf(ClassProfile_Section.NotAlbum(em_owner).Rows(0)(2).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.NotAlbum(em_owner).Rows(0)(2).ToString))
        lblCountLike.Text = String.Format("تعداد لایک ها: {0}", IIf(ClassProfile_Section.NotAlbum(em_owner).Rows(0)(3).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.NotAlbum(em_owner).Rows(0)(3).ToString))
        Permission()

    End Sub

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Album'''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(8)
            Case 0 'نمایش برای همه
                Pnl_Album.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 5 'هیچکس
                Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
        End Select

    End Sub

    Public Function SetOrgAlbum(ByVal code As Object) As String

        Return IIf(ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(0).ToString() = String.Empty, _
                "~\content\images\Profile_View_Users\noPicture.png", _
                "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(0).ToString() + "&W=117&H=90")

    End Function

    Public Function SetCountPicutreAlbum(ByVal code As Object) As String
        Return String.Format("تعداد عکس های: {0}", IIf(ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(1).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(1).ToString))
    End Function

    Public Function SetlblCountCommentAlbum(ByVal code As Object) As String
        Return String.Format("تعداد نظر ها: {0}", IIf(ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(2).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(2).ToString))
    End Function

    Public Function SetlblCountLikeAlbum(ByVal code As Object) As String
        Return String.Format("تعداد لایک ها: {0}", IIf(ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(3).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(em_owner, Convert.ToInt64(code)).Rows(0)(3).ToString))
    End Function

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        If ClassProfile_Section.GetCountPhotoAlbum(e.CommandArgument) Then
            Response.Redirect("photos.aspx?code=" + e.CommandArgument + "&user=" + Request.QueryString("user"))
        End If
    End Sub

    Protected Sub ODS_Album_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Album.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_NotAlbum_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_NotAlbum.Selecting
        e.InputParameters("email") = em_owner
    End Sub

End Class
