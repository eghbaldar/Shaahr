
Partial Class Stage_Jiring_Default
    Inherits System.Web.UI.Page

    Dim ClassStage As New Stage
    Dim ClassProfile_Section As New View_Users_Sections

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "جیرینگ - شهر"
        If Session("MY-UsErNaMe") = String.Empty Then Response.Redirect("define.aspx")
        lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:titr;font-size:25px;' >" + ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) + "</span></b>")

    End Sub

End Class
