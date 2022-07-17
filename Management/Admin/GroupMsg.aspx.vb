Imports System.Data

Partial Class Management_Admin_GroupMsg
    Inherits System.Web.UI.Page

    Dim Class_CMS_GroupMSG As New CMS_SendGroupMSG
    Dim Class_CMS_UserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCountMsgExpire.Text = String.Format("تعداد پیام های از یکماه گذشته : {0}", Class_CMS_GroupMSG.GetCountMsgExpire())
        Title = "مدیریت شهر دات کام - ارسال پیام گروهی سیستمی"
        lblSendGroupMsg.Text = ""
    End Sub

    Protected Sub btnSendMSG_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMSG.Click
        If Class_CMS_GroupMSG.InsertGroupMSG(txtSubject.Text, txtMsg.Text) Then
            lblSendGroupMsg.Text = "پیام با موفقیت ارسال گردید"
            txtMsg.Text = ""
            txtSubject.Text = ""
        Else
            lblSendGroupMsg.Text = "در ارسال پیام مشکلی رخ داده است"
        End If
    End Sub

    Protected Sub btnSendMSGByFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMSGByFilter.Click
        Dim s() As String = CMS_FilteringUsers.RetEmails()
        For i As Long = 0 To s.Length - 2
            Class_CMS_UserManagement.InsertSystemInbox(s(i), txtSubjectByFilter.Text, txtMsgByFilter.Text)
        Next
        txtMsgByFilter.Text = ""
        txtSubjectByFilter.Text = ""
        lblSendGroupMsgByFilter.Text = "پیام با موفقیت ارسال گردید"
    End Sub

    Protected Sub ODS_MsgExpire_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_MsgExpire.Selecting
        Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
        e.InputParameters("cur_sal") = sDate(0)
        e.InputParameters("cur_mah") = sDate(1)
        e.InputParameters("cur_roz") = sDate(2)
    End Sub

    Protected Sub Chk_ShowMsgExpire_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_ShowMsgExpire.CheckedChanged
        If Chk_ShowMsgExpire.Checked Then
            DG_MsgExpire.Visible = True
        End If
        If Not Chk_ShowMsgExpire.Checked Then
            DG_MsgExpire.Visible = False
        End If
    End Sub

    Protected Sub DeleteMsgExpire_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteMsgExpire.Click
        Class_CMS_GroupMSG.DeleteGroupMsgExpire()
        DG_MsgExpire.DataBind()
        lblCountMsgExpire.Text = String.Format("تعداد پیام های از یکماه گذشته : {0}", Class_CMS_GroupMSG.GetCountMsgExpire())
    End Sub

End Class

