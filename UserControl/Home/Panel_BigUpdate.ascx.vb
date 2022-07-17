Imports System.Data

Partial Class UserControl_Home_Panel_BigUpdate
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Dl_UpdateNews.Rows.Count = 0 Then Content.Visible = False
    End Sub

    Public Sub RecirectPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString().Split("|")
        Response.Redirect("~/user/DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(s(0)) + "&code=" + s(1))
        'Response.Redirect("DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(s(0)) + "&code=" + s(1))
    End Sub

    Public Function PostName(ByVal email As Object, ByVal for_who As Object) As String
        If email.ToString() = for_who.ToString() Then
            Return "<b><span style='color:#000'>" + ClassProfile_Section.GetFnLn(email.ToString) + "</span></b>"
        Else
            Return String.Format("ارسال از {0} برای {1}", "<a style='color:#000;text-decoration:none;font-weight:bold;' href='../user/default.aspx?user=" + ClassProfile.getUsernameByEmail(email.ToString) + "'>" + ClassProfile_Section.GetFnLn(email.ToString) + "</a>", "<a style='color:#000;text-decoration:none;font-weight:bold;' href='../user/default.aspx?user=" + ClassProfile.getUsernameByEmail(for_who.ToString) + "'>" + ClassProfile_Section.GetFnLn(for_who.ToString) + "</a>")
        End If
    End Function

    Public Function SetOption(ByVal [option] As Object, ByVal codeoption As Object, ByVal code_polling As Object) As String
        Dim Percent As Long = ClassProfile_Section.GetPercentPolling(code_polling.ToString, codeoption.ToString)
        Return "<div style='float:right;background-color:#000;color:#fff;-moz-border-radius: 3px;padding:2px;'>" + Percent.ToString + "%" + "</div>" + "<div style='float:right;margin-right:4px;font-size:12px;background-color:#d4dfe5;color:#000;border:1px solid #c3c3c3;height:20px;-moz-border-radius: 3px;padding:2px;'>" + [option].ToString + "</div>"
    End Function

    Public Sub DeleteObject(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteObject(e.CommandArgument)        
        Dl_UpdateNews.DataBind()
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

    Public Sub SetOption(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim args() As String = e.CommandArgument.ToString.Split("|")
        ClassProfile_Section.InsertPolling(Session("MY-UsErNaMe"), args(1), args(0))
        Dl_UpdateNews.DataBind()

    End Sub

    Protected Sub ODS_ParticipatePolling_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = Session("MY-UsErNaMe")
    End Sub

    Public Sub OpenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Session("PhotoDefaultPage") = True
        Response.Redirect("DetailPhoto.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "&from=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Protected Sub SetLikeUnlikePost(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim Check As Boolean = Not ClassProfile.InsertNotification(1, Session("MY-UsErNaMe"), e.CommandArgument, "", 0)
        If Check Then 'کاربر نگاه نگذاشته است
            If ClassProfile.GetCountLikeUnlikePost(e.CommandArgument) = 0 Then
                CType(sender, LinkButton).Text = "<span style='color:#6DB457;font-size:20px;'>●</span>"
                Exit Sub
            End If
            CType(sender, LinkButton).Text = "<span style='color:#6DB457;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:green;'>{1} {0}</span>", "نگاه", ClassProfile.GetCountLikeUnlikePost(e.CommandArgument))
        End If
        If Not Check Then 'کاربر نگاه گذاشته است 
            If ClassProfile.GetCountLikeUnlikePost(e.CommandArgument) = 1 And Not Check Then
                CType(sender, LinkButton).Text = "<span style='color:#626463;font-size:20px;'>●</span>" + _
                String.Format("<span style='font-size:10px;color:#626463;'>{0}</span>", "نگاه من")
                Exit Sub
            End If
            CType(sender, LinkButton).Text = "<span style='color:#626463;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:#626463;'>{0}{1} نگاه دیگر</span>", "نگاه من و ", ClassProfile.GetCountLikeUnlikePost(e.CommandArgument) - 1)
        End If

        '''''''''''''''  درجه شهروندی
        ClassHome.UpdateStarNum(2, Session("MY-UsErNaMe"))

    End Sub
    Public Function ChangeIconLikePost(ByVal code As Object) As String

        Dim Check As Boolean = ClassProfile.CheckDuplicateLike(code, Session("MY-UsErNaMe"))
        If Check Then 'کاربر نگاه نگذاشته است
            If ClassProfile.GetCountLikeUnlikePost(code) = 0 Then
                Return "<span style='color:#6DB457;font-size:20px;'>●</span>"
                Exit Function
            End If
            Return "<span style='color:#6DB457;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:green;'>{1} {0}</span>", "نگاه", ClassProfile.GetCountLikeUnlikePost(code))
        End If
        If Not Check Then 'کاربر نگاه گذاشته است 
            If ClassProfile.GetCountLikeUnlikePost(code) = 1 And Not Check Then
                Return "<span style='color:#626463;font-size:20px;'>●</span>" + _
                String.Format("<span style='font-size:10px;color:#626463;'>{0}</span>", "نگاه من")
                Exit Function
            End If
            Return "<span style='color:#626463;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:#626463;'>{0}{1} نگاه دیگر</span>", "نگاه من و ", ClassProfile.GetCountLikeUnlikePost(code) - 1)
        End If

    End Function
    Public Function VisibleNegahPost(ByVal code As Object) As Boolean

        If Session("MY-UsErNaMe") = Nothing Or ClassProfile.GetCountLikeUnlikePost(code) = 0 Then
            Return False
            Exit Function
        Else
            If ClassProfile.GetCountLikeUnlikePost(code) = 1 And (Not ClassProfile.CheckDuplicateLike(code, Session("MY-UsErNaMe"))) Then
                Return False
                Exit Function
            End If
        End If
        Return True

    End Function

    Protected Sub SetLikeUnlikeComment(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim Check As Boolean = Not ClassProfile.InsertNotification(2, Session("MY-UsErNaMe"), ClassHome.GetCodeObjectByCodeComment(e.CommandArgument), "", e.CommandArgument)
        If Check Then 'کاربر نگاه نگذاشته است
            If ClassProfile.GetCountLikeUnlikeComment(e.CommandArgument) = 0 Then
                CType(sender, LinkButton).Text = "<span style='color:#6DB457;font-size:20px;'>●</span>"
                Exit Sub
            End If
            CType(sender, LinkButton).Text = "<span style='color:#6DB457;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:green;'>{1} {0}</span>", "نگاه", ClassProfile.GetCountLikeUnlikeComment(e.CommandArgument))
        End If
        If Not Check Then 'کاربر نگاه گذاشته است 
            If ClassProfile.GetCountLikeUnlikeComment(e.CommandArgument) = 1 And Not Check Then
                CType(sender, LinkButton).Text = "<span style='color:#626463;font-size:20px;'>●</span>" + _
                String.Format("<span style='font-size:10px;color:#626463;'>{0}</span>", "نگاه من")
                Exit Sub
            End If
            CType(sender, LinkButton).Text = "<span style='color:#626463;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:#626463;'>{0}{1} نگاه دیگر</span>", "نگاه من و ", ClassProfile.GetCountLikeUnlikeComment(e.CommandArgument) - 1)
        End If

    End Sub
    Public Function UserLikeComment(ByVal code As Object) As String

        Dim Check As Boolean = ClassProfile.CheckDuplicateComment(code, Session("MY-UsErNaMe"))
        If Check Then 'کاربر نگاه نگذاشته است
            If ClassProfile.GetCountLikeUnlikeComment(code) = 0 Then
                Return "<span style='color:#6DB457;font-size:20px;'>●</span>"
                Exit Function
            End If
            Return "<span style='color:#6DB457;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:green;'>{1} {0}</span>", "نگاه", ClassProfile.GetCountLikeUnlikeComment(code))
        End If
        If Not Check Then 'کاربر نگاه گذاشته است 
            If ClassProfile.GetCountLikeUnlikeComment(code) = 1 And Not Check Then
                Return "<span style='color:#626463;font-size:20px;'>●</span>" + _
                String.Format("<span style='font-size:10px;color:#626463;'>{0}</span>", "نگاه من")
                Exit Function
            End If
            Return "<span style='color:#626463;font-size:20px;'>●</span>" + _
            String.Format("<span style='font-size:10px;color:#626463;'>{0}{1} نگاه دیگر</span>", "نگاه من و ", ClassProfile.GetCountLikeUnlikeComment(code) - 1)
        End If

    End Function
    Public Function VisibleNegahComment(ByVal code As Object) As Boolean

        If Session("MY-UsErNaMe") = Nothing Or ClassProfile.GetCountLikeUnlikeComment(code) = 0 Then
            Return False
            Exit Function
        Else
            If ClassProfile.GetCountLikeUnlikeComment(code) = 1 And (Not ClassProfile.CheckDuplicateComment(code, Session("MY-UsErNaMe"))) Then
                Return False
                Exit Function
            End If
        End If
        Return True

    End Function

    Public Function SpecialDate(ByVal Date_ As Object) As String
        Dim S() As String = Date_.ToString.Split(" ")
        Return ShamsiDate.Miladi2Shamsi(Date_, ShamsiDate.ShowType.LongDate) & " (" & S(1) & S(2).ToString.Replace("PM", " بعد از ظهر").Replace("AM", " قبل از ظهر") & ")"
    End Function

    Protected Sub DeleteCommand(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteComment(e.CommandArgument)
        Dl_UpdateNews.DataBind()
    End Sub

    Protected Sub SendCommand(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim s As LinkButton = CType(sender, LinkButton)
        Dim ss As String() = s.ClientID.Split("_")
        Dim Comment As String = String.Empty
        For i As Integer = 0 To Dl_UpdateNews.Rows.Count - 1
            Dim txt As TextBox = CType(Dl_UpdateNews.Rows(i).FindControl("txtPutComment"), TextBox)

            Dim sss As String() = txt.ClientID.Split("_")
            If ss(4) = sss(4) Then
                If txt.Text <> "نظر شما..." Then
                    Comment = txt.Text
                    txt.Text = "نظر شما..."
                End If
            End If
        Next
        If Comment <> "" Then
            ClassProfile.InsertNotification(0, Session("MY-UsErNaMe"), e.CommandArgument, Comment.Replace(vbLf, "</br>"), 0)
            Dl_UpdateNews.DataBind()
        End If

        '''''''''''''''  درجه شهروندی
        ClassHome.UpdateStarNum(3, Session("MY-UsErNaMe"))
        '''''''''''''''

    End Sub

    Protected Sub ODS_ProfileUpdateNews_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_ProfileUpdateNews.Selecting

        e.InputParameters("email") = Session("MY-UsErNaMe")

    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    Public Sub ShowAllComment(ByVal Sender As Object, ByVal e As CommandEventArgs)

        Dim btn As LinkButton = CType(Sender, LinkButton)
        Dim s1() As String = btn.ClientID.Split("_")

        For i As Byte = 0 To Dl_UpdateNews.Rows.Count - 1
            Dim lbl As Label = CType(Dl_UpdateNews.Rows(i).FindControl("lbl_status_Comment"), Label)
            Dim s2() As String = lbl.ClientID.Split("_")

            If s1(4) = s2(4) Then
                If lbl.Text = "0" Then lbl.Text = "1" Else lbl.Text = "0"
            End If
        Next

    End Sub

    Public Sub GotoToNazmie(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Dim S As String() = e.CommandArgument.ToString.Split("|")
        Response.Redirect(("~/Stage/Nazmie/report.aspx?link=shaahr.com/user/DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(S(1)) + "&code=" + S(0)).Replace("&", "|"))
    End Sub

    'Update Comment                                                                   

    Public Function UpdateCommentTitle(ByVal email As Object, ByVal for_who As Object) As String
        Return String.Format("{0} ارسال نظر از {1} برای پست {2}", "<img src='../content/images/home/comment.jpg' />", "<span style='color:#1f5263;font-weight:bold;'>" + ClassProfile_Section.GetFnLn(email.ToString) + "</span>", "<span style='color:#1f5263;font-weight:bold;'>" + ClassProfile_Section.GetFnLn(for_who.ToString) + "</span>")
    End Function

    Public Function CommentText(ByVal email As Object, ByVal for_who As Object, ByVal code As Object) As String
        Return ClassHome.GetComment(email.ToString, for_who.ToString, code.ToString)
    End Function

    Public Sub Redirect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("DetailPost.aspx?code=" + e.CommandArgument + "&user=" + ClassProfile.getUsernameByEmail(ClassHome.GetEmailByCode(e.CommandArgument)))
    End Sub

    Public Sub GoToPolling(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("DetailPost.aspx?code=" + e.CommandArgument + "&user=" + ClassProfile.getUsernameByEmail(ClassHome.GetEmailByCode(e.CommandArgument)))
    End Sub

    'UpdateLike
    Public Function GetAvatar(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=50&H=50"
    End Function
    '
    Public Function ControlText(ByVal detail As Object) As String
        If detail.ToString().Length > 80 Then
            Return String.Format("<b style='color:#000;'>نوشته:</b>  {0}", detail.ToString.Substring(0, 80) + "...")
        Else
            Return String.Format("<b style='color:#000;'>نوشته:</b>  {0}", detail.ToString)
        End If
    End Function
    '
    Public Function ControlLink(ByVal detail As Object) As String
        If detail.ToString().Length > 80 Then
            Return String.Format("<b style='color:#000;'>لینکی با عنوان:</b>  {0}", detail.ToString.Substring(0, 80) + "...")
        Else
            Return String.Format("<b style='color:#000;'>لینکی با عنوان:</b>  {0}", detail.ToString)
        End If
    End Function
    '
    Public Function ControlPhoto(ByVal detail As Object) As String
        If detail.ToString().Length > 80 Then
            Return String.Format("<b style='color:#000;'>تصویری با عنوان:</b>  {0}", detail.ToString.Substring(0, 80) + "...")
        Else
            Return String.Format("<b style='color:#000;'>تصویری با عنوان:</b>  {0}", detail.ToString)
        End If
    End Function
    '
    Public Function ControlPolling(ByVal code As Object) As String
        Dim Question As String = ClassHome.GetQuestionPolling(Val(code))
        Return String.Format("<b style='color:#000;'>نظرسنجی با سوال:</b>  {0}", Question)

    End Function

    Public Function ControlImage(ByVal Type As Object) As String
        Select Case Integer.Parse(Type)
            Case 0
                Return "~/content/images/Profile_View_Users/post_photo.png"
            Case 1
                Return "~/content/images/Profile_View_Users/post_link.png"
            Case 2
                Return "~/content/images/Profile_View_Users/post_post.png"
            Case 3
                Return "~/content/images/Profile_View_Users/post_polling.png"
        End Select
    End Function

    Protected Sub btnShowAllPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowAllPost.Click
        Response.Redirect("~\home\AllObj.aspx")
    End Sub

End Class