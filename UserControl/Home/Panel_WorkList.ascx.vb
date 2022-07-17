
Partial Class UserControl_Home_Panel_WorkList
    Inherits System.Web.UI.UserControl

    Dim ClassHome As New HomeProfile

    Protected Sub btnInsertWork_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertWork.Click

        If txtTitle.Text <> "" Then
            ClassHome.InsertWork(Session("MY-UsErNaMe"), txtTitle.Text)
            txtTitle.Text = ""
            DG_Work.DataBind()
        End If

    End Sub

    Public Sub DeleteWork(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHome.DeleteWork(e.CommandArgument)
        DG_Work.DataBind()
    End Sub

End Class
