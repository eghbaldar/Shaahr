Imports System.Data

Partial Class user_polling
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    '--------------پاک شدنی ها
    'Dim em_me As String = "ali@y.y" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String = "ali@y.y" 'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Title = String.Format("نظرسنجی های  {0}", ClassProfile_Section.GetFnLn(em_owner))
        'lblTitleInformation.Text = Title
        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        ''''
        Permission()
        ''''
        If DL_Polloing.Items.Count = 0 Then
            lblPolling.Text = "نظرسنجی برای این کاربر وجود ندارد."
            Div_Polling.Visible = False
        End If


    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Album'''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(9)
            Case 0 'نمایش برای همه
                Pnl_polling.Visible = True
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

    Public Function VisibleClosePolling(ByVal code As Object) As Boolean
        Return IIf(Session("MY-UsErNaMe") = em_owner, True, False)
    End Function

    Protected Sub ODS_Polling_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Polling.Selecting
        e.InputParameters("email") = em_owner
    End Sub

    Protected Sub ODS_ParticipatePolling_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("email") = Session("MY-UsErNaMe")
    End Sub

    Public Sub SetOption(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim args() As String = e.CommandArgument.ToString.Split("|")
        ClassProfile_Section.InsertPolling(Session("MY-UsErNaMe"), args(1), args(0))
        DL_Polloing.DataBind()

    End Sub

    Protected Sub btnShowAllPolling_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowAllPolling.Click
        Response.Redirect("~/user/AllPolling.aspx?user=" + ClassProfile.getUsernameByEmail(em_owner))
    End Sub

End Class
