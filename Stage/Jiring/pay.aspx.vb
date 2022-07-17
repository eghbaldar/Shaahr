
Partial Class Stage_Jiring_pay

    Inherits System.Web.UI.Page
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "افزایش جیرینگ - شهر"
        If Session("MY-UsErNaMe") <> "" Then lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:titr;font-size:25px;' >" + ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) + "</span></b>")
    End Sub

End Class
