
Partial Class UserControl_Home_Panel_InhabitShaahr
    Inherits System.Web.UI.UserControl

    Dim ClassShaahr As New Shaahr

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Val(ClassShaahr.GetCountInhabitShaahr(Session("MY-UsErNaMe"))) > 4 Then
                LinkMore.Visible = True
            End If
        End If        

    End Sub

    Protected Sub LinkMore_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkMore.Click
        Response.Redirect("MoreShaahr.aspx")
    End Sub

End Class
