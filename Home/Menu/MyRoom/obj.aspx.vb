
Partial Class home_Menu_MyRoom_obj
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Request.QueryString("type")
            Case 0 'Photo
                MultiView.ActiveViewIndex = 2
                lbl.Text = "عکس های من "
                Title = String.Format("عکس های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
            Case 1 'Link
                MultiView.ActiveViewIndex = 1
                lbl.Text = "لینک های من "
                Title = String.Format("لینک های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
            Case 2 'Text
                MultiView.ActiveViewIndex = 0
                lbl.Text = "مطالب من "
                Title = String.Format("مطالب {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
            Case 3 'Polling
                MultiView.ActiveViewIndex = 3
                lbl.Text = "نظر سنجی های من"
                Title = String.Format("نظر سنجی های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        End Select

    End Sub

    Public Sub ShowText(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "&code=" + e.CommandArgument)
    End Sub

    Public Function CountLike(ByVal code As Object) As String
        Return ClassHomeSetting.GetCountLikeByCode(code.ToString)
    End Function

    Public Function CountComment(ByVal code As Object) As String
        Return ClassHomeSetting.GetCountCommentByCode(code.ToString)
    End Function

    Protected Sub btnMyText_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMyText.Click
        MultiView.ActiveViewIndex = 0
        lbl.Text = "مطالب من "
        Title = String.Format("مطالب {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub
    Protected Sub btnMyPhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMyPhoto.Click
        MultiView.ActiveViewIndex = 2
        lbl.Text = "عکس های من "
        Title = String.Format("عکس های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub
    Protected Sub btnMyLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMyLink.Click
        MultiView.ActiveViewIndex = 1
        lbl.Text = "لینک های من "
        Title = String.Format("لینک های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub
    Protected Sub btnMyPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMyPolling.Click
        MultiView.ActiveViewIndex = 3
        lbl.Text = "نظر سنجی های من"
        Title = String.Format("نظر سنجی های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

    Shared IndexView As Integer
    Public Sub DeleteOBJ(ByVal sender As Object, ByVal e As CommandEventArgs)

        'DeleteObject by CodeObject
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Session("Index") = s(1)
        Session("ObjCode") = s(0)
        MultiView.ActiveViewIndex = 4

        Select Case s(1)
            Case 0 'Photo
                lbl.Text = "مطالب من "
            Case 1 'Link
                lbl.Text = "لینک های من "
            Case 2 'Text
                lbl.Text = "عکس های من "
            Case 3 'Polling
                lbl.Text = "نظر سنجی های من"
        End Select

    End Sub
    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click

        ClassHomeSetting.DeleteObject(Session("ObjCode"))
        DG_Link.DataBind()
        DG_Photo.DataBind()
        DG_Polling.DataBind()
        DG_Text.DataBind()
        MultiView.ActiveViewIndex = Session("Index")
        Session.Remove("ObjCode")
        Session.Remove("Index")

    End Sub
    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click

        MultiView.ActiveViewIndex = Session("Index")
        Session.Remove("ObjCode")
        Session.Remove("Index")

    End Sub

    Protected Sub btnSendPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendPost.Click

        ClassProfile.InsertObject(Session("MY-UsErNaMe"), Session("MY-UsErNaMe"), 2, txtPost.Text.Replace(vbLf, "</br>"), txtTitlePost.Text)
        txtTitlePost.Text = "عنوان مطلب شما ..."
        txtPost.Text = "متن شما ..."
        DG_Text.DataBind()
        MultiView.ActiveViewIndex = 0
        lbl.Text = "مطالب من "

    End Sub

    Protected Sub btnSendLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendLink.Click

        ClassProfile.InsertObject(Session("MY-UsErNaMe"), Session("MY-UsErNaMe"), 1, txtLink.Text, txtTextLink.Text.Replace(vbLf, "</br>"))
        txtLink.Text = "Http://"
        txtTextLink.Text = "توضیحات لینک شما ..."
        DG_Link.DataBind()
        MultiView.ActiveViewIndex = 1
        lbl.Text = "لینک های من "

    End Sub

    Protected Sub btnGotoAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGotoAlbum.Click
        Response.Redirect("~/home/Album.aspx")
    End Sub

End Class
