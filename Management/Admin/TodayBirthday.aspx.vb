Imports System.Data
Partial Class Management_Admin_TodayBirthday
    Inherits System.Web.UI.Page

    Dim Class_CMS_UserManagement As New CMS_UserManagement
    Dim Class_CMS_SendGroup As New CMS_SendGroupMSG

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت تولدهای امروز"
        lblCount.Text = Class_CMS_SendGroup.GetCountAllUsersBirthDay()
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim dt As DataTable
        dt = Class_CMS_SendGroup.GetEmailByDate
        If dt.Rows.Count > 0 Then
            For i As Long = 0 To dt.Rows.Count - 1
                Class_CMS_UserManagement.InsertSystemInbox(dt.Rows(i)(0).ToString, txtTitle.Text, txtMSG.Text)
            Next
        End If
        txtMSG.Text = ""
        txtTitle.Text = ""
    End Sub

End Class
