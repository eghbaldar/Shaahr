
Partial Class Management_Admin_Detail_Favorits
    Inherits System.Web.UI.Page

    Dim ClassFaorits As New CMS_Favorits

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Request.QueryString("type")
            Case "cat"
                Title = "جزییات گروه های علاقه مندی ها"
                MultiView.ActiveViewIndex = 0
                If Not IsPostBack Then
                    FCK_Cat.Value = ClassFaorits.GetDetailCat(Request.QueryString("code"))
                End If
            Case "fav"
                Title = "جزییات علاقه مندی ها"
                MultiView.ActiveViewIndex = 1
                If Not IsPostBack Then
                    FCK_Fav.Value = ClassFaorits.GetDetailFav(Request.QueryString("code"))
                End If
        End Select
    End Sub

    Protected Sub btnUpdateCat_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateCat.Click
        ClassFaorits.UpdateDetailCat(FCK_Cat.Value, Request.QueryString("code"))
        Response.Redirect("favorits.aspx")
    End Sub

    Protected Sub btnUpdateFav_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateFav.Click
        ClassFaorits.UpdateDetailFav(FCK_Fav.Value, Request.QueryString("code"))
        Response.Redirect("favorits.aspx")
    End Sub
End Class
