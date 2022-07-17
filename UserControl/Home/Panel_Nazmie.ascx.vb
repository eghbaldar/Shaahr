
Partial Class UserControl_Home_Panel_Nazmie
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim rnd As New Random
        Select Case rnd.Next(1, 4).ToString
            Case 1
                P_1.Visible = True
            Case 2
                P_2.Visible = True
            Case 3
                P_3.Visible = True
        End Select

    End Sub

    Protected Sub btnNazmie_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNazmie.Click
        Response.Redirect("~/Stage/Nazmie/")
    End Sub

    Protected Sub imgNazmie_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgNazmie.Click
        Response.Redirect("~/Stage/Nazmie/")
    End Sub
End Class
