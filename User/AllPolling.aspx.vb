
Partial Class user_AllPolling
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    '--------------پاک شدنی ها
    'Dim em_me As String = "ali@y.y" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String 'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Title = String.Format("نظرسنجی های  {0}", ClassProfile_Section.GetFnLn(em_owner))
        lblTitleInformation.Text = Title
        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))

    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
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

    Public Function SetOption(ByVal [option] As Object, ByVal codeoption As Object, ByVal code_polling As Object) As String
        Dim Percent As Long = ClassProfile_Section.GetPercentPolling(code_polling.ToString, codeoption.ToString)
        Return "<div style='float:right;background-color:#000;color:#fff;-moz-border-radius: 3px;padding:2px;'>" + Percent.ToString + "%" + "</div>" + "<div style='float:right;margin-right:4px;font-size:12px;background-color:#d4dfe5;color:#000;border:1px solid #c3c3c3;height:20px;-moz-border-radius: 3px;padding:2px;'>" + [option].ToString + "</div>"
    End Function

    Public Sub SetOption(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim args() As String = e.CommandArgument.ToString.Split("|")
        ClassProfile_Section.InsertPolling(Session("MY-UsErNaMe"), args(1), args(0))
        'Dl_user
        DL_Polloing.DataBind()

    End Sub

End Class
