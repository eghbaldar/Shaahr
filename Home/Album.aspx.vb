
Partial Class home_Album
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Photos.aspx?code=" + e.CommandArgument)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("آلبوم های {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        imgNotAlbum.ImageUrl = IIf(ClassProfile_Section.NotAlbum(Session("MY-UsErNaMe")).Rows(0)(0).ToString() = String.Empty, _
                                   "~\content\images\Profile_View_Users\noPicture.png", _
                          "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.NotAlbum(Session("MY-UsErNaMe")).Rows(0)(0).ToString + "&W=127&H=96")

    End Sub

    Public Function SetOrgAlbum(ByVal code As Object) As String

        Return IIf(ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(0).ToString() = String.Empty, _
                "~\content\images\Profile_View_Users\noPicture.png", _
                 "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(0).ToString() + "&W=127&H=96")

    End Function

    Public Function SetCountPicutreAlbum(ByVal code As Object) As String
        Return String.Format("تعداد عکس های: {0}", IIf(ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(1).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(1).ToString))
    End Function

    Public Function SetlblCountCommentAlbum(ByVal code As Object) As String
        Return String.Format("تعداد نظر ها: {0}", IIf(ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(2).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(2).ToString))
    End Function

    Public Function SetlblCountLikeAlbum(ByVal code As Object) As String
        Return String.Format("تعداد لایک ها: {0}", IIf(ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(3).ToString() = String.Empty, _
                                                                       "0", ClassProfile_Section.Album(Session("MY-UsErNaMe"), Convert.ToInt64(code)).Rows(0)(3).ToString))
    End Function

    Protected Sub imgNotAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgNotAlbum.Click
        If imgNotAlbum.ImageUrl <> "~\content\images\Profile_View_Users\noPicture.png" Then
            Response.Redirect("~/home/noneAlbum.aspx")
        End If
    End Sub

    Protected Sub btnCreateAlbum_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCreateAlbum.Click
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "AlbumC();", True)
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "AlbumC();", True)
    End Sub

    Public Function CountPicture(ByVal codeAlbum As Object) As String
        Dim Number As String
        Number = "<div style='float:right;'>تعداد تصاویر در این آلبوم : &nbsp;</div>"
        Number += "<div style='background-color:#1c4d5d;-moz-border-radius: 5px;float:right;color:#fff;padding-right:4px;padding-left:4px;'>" + ClassHome.GetCountPictureOfAlbum(codeAlbum.ToString).ToString + "</div>"
        Return Number
    End Function

    Protected Sub btnSendMessage_Click(ByVal sender As Object, ByVal e As EventArgs)
        If txtAlbumName.Text <> "" Then
            ClassHome.InsertAlbum(Session("MY-UsErNaMe"), txtAlbumName.Text)
            txtAlbumName.Text = ""
            DG_Album.DataBind()
            Dl_Album.DataBind()
        End If
    End Sub

    Public Sub DeleteAlbum(ByVal Sender As Object, ByVal e As CommandEventArgs)

        ClassProfile_Section.DeleteAlbum(e.CommandArgument)
        DG_Album.DataBind()
        Dl_Album.DataBind()

    End Sub

    Protected Sub DG_Album_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Album.RowDataBound

        For i As Integer = 0 To DG_Album.Rows.Count - 1

            Dim linkDelete As HtmlAnchor = DirectCast(DG_Album.Rows(i).FindControl("linkDelete"), HtmlAnchor)
            Dim btnDelete As ImageButton = DirectCast(DG_Album.Rows(i).FindControl("btnDeleteObject"), ImageButton)
            Dim prompt As String = "$.prompt('با حذف این آلبوم تمام عکس های آن حذف می گردد، مطمئن هستید؟ " + _
                           "<input type=""hidden"" value=""{0}"" name=""hidID"" />'" + _
                           ", {{buttons: {{ آری: true, خیر: false }}, callback: confirmDeleteResult}} ); CloseDialog(); return false; "
            linkDelete.Attributes("onclick") = String.Format(prompt, btnDelete.ClientID)

        Next

    End Sub

End Class

