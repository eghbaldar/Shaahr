
Partial Class Management_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassContact As New CMS_Contact

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - پیام های کاربران"
    End Sub

    Public Function CheckColorPanel(ByVal flag As Object) As Drawing.Color
        If flag = True Then
            Return Drawing.Color.Green
        End If
        If flag = False Then
            Return Drawing.Color.Red
        End If
    End Function

    Public Function Check(ByVal flag As Object) As String
        If flag = True Then
            Return "بررسی شده"
        Else
            Return "بررسی نشده"
        End If
    End Function

    Protected Sub ShowMSG(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassContact.UpdateFlag(e.CommandArgument.ToString)
        lblMessage.Text = ClassContact.GetMSG(e.CommandArgument.ToString)
        lblDate.Text = ClassContact.GetDate(e.CommandArgument)
        lblTime.Text = ClassContact.GetTime(e.CommandArgument)
        dg1.DataBind()
        dg3.DataBind()
        dg3.DataBind()
    End Sub
    '
    Protected Sub DeleteContact(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassContact.DeleteContact(e.CommandArgument.ToString)
        dg1.DataBind()
        dg3.DataBind()
        dg3.DataBind()
    End Sub

End Class
