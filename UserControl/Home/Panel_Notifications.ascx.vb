Imports System.Data.SqlClient

Partial Class UserControl_Home_Panel_Notifications
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting

    Dim StrID As String

    Protected Sub btnDataBindGrid_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDataBindGrid.Click
        DG.DataBind()
        lblCount.Text = DG.Rows.Count
    End Sub

    Public Function ControlText(ByVal codeObj As Object) As String

        Dim Tedad_Update As String = "(14)"

        Dim sType As String = ""
        Select Case ClassHome.GetTypeObject(codeObj)
            Case 0
                sType = "عکس"
            Case 1
                sType = "پست"
            Case 2
                sType = "لینک"
            Case 3
                sType = "نظرسنجی"
        End Select

        Dim UpdateType As String = "نگاه"

        Return String.Format("بروزرسانی {0} {1} انجام شد...", "<span style='color:black;'>" + sType + "</span>", "علیمحمد اقبالدار")

    End Function

    Public Function SubjectPOST(ByVal codeObj As Object) As String
        Return ClassHome.GetDetailObject(codeObj)
    End Function

    Public Function CountUpdate(ByVal count As Object, ByVal code As Long, ByVal email As String) As String

        Dim S As String = String.Format("{0} بروزشده بررسی نشده ( {1} نگاه پست، {2} تکنظر {3} نگاه تکنظر )", count, _
                             ClassHome.GetCountUpdateWithTypeNotification(code, email, 1), _
                             ClassHome.GetCountUpdateWithTypeNotification(code, email, 0), _
                             ClassHome.GetCountUpdateWithTypeNotification(code, email, 2))
        Dim A As String = "<a style='color:black;text-decoration:none;' href='../user/DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(email) + "&code=" + code.ToString + "' >" + S + "</a>"
        Return A

    End Function

    Public Sub UpdateFlag(ByVal sender As Object, ByVal e As CommandEventArgs)

        ClassHome.DeleteFlagNotification(e.CommandArgument)
        DG.DataBind()
        lblCount.Text = ClassHome.GetCountNotification(Session("MY-UsErNaMe"))
        DeleteAll.Visible = IIf(ClassHome.GetCountNotification(Session("MY-UsErNaMe")) > 1, True, False)

    End Sub

    Public Sub ShowLink(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        ClassHome.DeleteFlagNotification(s(2))
        'ClassHome.UpdateFlagNotification(False, s(2))
        Response.Redirect("~\home\DetailPost.aspx?user=" + ClassProfile.getUsernameByEmail(s(1)) + "&code=" + s(0))

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblCount.Text = "0"

        If ClassHome.GetCountReciveMSG(Session("MY-UsErNaMe")) <> "" Then
            lbl_ResiveMSG.Text = ClassHome.GetCountReciveMSG(Session("MY-UsErNaMe"))
        Else
            Div_MSG.Visible = False
        End If
        ''''''''''''''''''''''''''''
        If ClassHome.GetCountRelation(Session("MY-UsErNaMe")) <> "" Then
            lbl_Relation.Text = ClassHome.GetCountRelation(Session("MY-UsErNaMe"))
        Else
            Div_Relation.Visible = False
        End If
        ''''''''''''''''''''''''''''        
        If ClassHomeSetting.GetCountInboxSystem(Session("MY-UsErNaMe")) <> "" Then
            lblMSG_system.Text = ClassHomeSetting.GetCountInboxSystem(Session("MY-UsErNaMe"))
        Else
            Div_Inbox.Visible = False
        End If

        lblCount.Text = ClassHome.GetCountNotification(Session("MY-UsErNaMe"))
        DeleteAll.Visible = IIf(ClassHome.GetCountNotification(Session("MY-UsErNaMe")) > 1, True, False)

    End Sub

    Protected Sub DeleteAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteAll.Click
        ClassHome.DeleteNotificationAll(Session("MY-UsErNaMe"))
        DG.DataBind()
        lblCount.Text = "0"
        DeleteAll.Visible = False
    End Sub

End Class
