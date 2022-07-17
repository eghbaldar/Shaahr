
Partial Class UserControl_Home_FindUsers
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub UpdatePanel1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Up_Search.Load
        If txtSearch.Text <> "" Then
            DivResult.Visible = True
            Session("TEXT") = txtSearch.Text.Replace("ی", "ي")

            DL_Users.DataBind()
            DL_Shaahrs.DataBind()
            If DL_Users.Items.Count = 0 Then
                lblEmptyUser.Text = "<div style='padding:5px;color:gray;'>شهروندی با این مشخصات یافت نشد.</div>"
            Else
                lblEmptyUser.Text = ""
            End If
            If DL_Shaahrs.Items.Count = 0 Then
                lblEmptyShaahr.Text = "<div style='padding:5px;color:gray;'>شهری با این مشخصات یافت نشد.</div>"
            Else
                lblEmptyShaahr.Text = ""
            End If
        Else
            HttpContext.Current.Session.Remove("TEXT")
            DivResult.Visible = False            
        End If
    End Sub

    Public Function SetAvatar(ByVal email As Object, ByVal TYPE As Object) As String
        Select Case TYPE
            Case 1 'Users
                Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=50&H=50"
            Case 2 'Shaahr
        End Select
    End Function
    '
    Public Function SetTitle(ByVal email As Object, ByVal TYPE As Object) As String
        Select Case TYPE
            Case 1 'Users
                Return ClassProfile_Section.GetFnLn(email.ToString)
            Case 2 'Shaahr
        End Select
    End Function
    '
    Public Function SetBirthDate(ByVal email As Object, ByVal TYPE As Object) As String
        Select Case TYPE
            Case 1 'Users
                Return String.Format("تولد: {0}", ClassProfileHome.GetBirthDateByEmail(email.ToString))
            Case 2 'Shaahr
        End Select
    End Function
    '
    Public Function SetLocation(ByVal email As Object, ByVal TYPE As Object) As String
        Select Case TYPE
            Case 1 'Users
                Return ClassProfileHome.GetCountryStateByEmail(email.ToString)
            Case 2 'Shaahr
        End Select
    End Function

    Protected Sub btnGotoSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGotoSearch.Click
        Response.Redirect(("~/stage/search/"))
    End Sub

    Protected Sub btnGoSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoSearch.Click
        Response.Redirect(("~/stage/search/"))
    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

End Class
