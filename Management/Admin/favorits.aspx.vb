
Partial Class Management_Admin_favorits
    Inherits System.Web.UI.Page

    Dim ClassFavorit As New CMS_Favorits

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت علاقمندی ها"        
    End Sub

    Protected Sub RedirectDetailCat(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Detail-Favorits.aspx?type=cat&code=" + e.CommandArgument)
    End Sub

    Protected Sub RedirectDetail(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Detail-Favorits.aspx?type=fav&code=" + e.CommandArgument)
    End Sub

    Public Function getTextCat(ByVal code As Object) As String
        Return "تعداد کاربران علاقمند: " + ClassFavorit.CountCatUsers(code.ToString) + "   (برای دیدن کاربران کلیک کنید)"
    End Function

    Public Function getTextFav(ByVal code As Object) As String
        Return "تعداد کاربران علاقمند: " + ClassFavorit.CountFavUsers(code.ToString) + "   (برای دیدن کاربران کلیک کنید)"
    End Function

    Protected Sub RedirectUserCat(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-Favorits.aspx?type=cat&code=" + e.CommandArgument)
    End Sub

    Protected Sub RedirectUserFav(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-Favorits.aspx?type=fav&code=" + e.CommandArgument)
    End Sub

    Protected Sub ChkAdd_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkAdd.CheckedChanged
        PanelAdd.Visible = IIf(ChkAdd.Checked, True, False)
    End Sub

    Protected Sub btnAddCat_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCat.Click

        If txtTitleCat.Text = "" Or FCK_Add.Value = "" Or FileUpload_Cat.FileName = "" Then
            Exit Sub
        End If

        Dim rn As String = Guid.NewGuid.ToString
        Dim fInfo As New IO.FileInfo(FileUpload_Cat.FileName)
        FileUpload_Cat.SaveAs(MapPath("~\Content\images\Shaahrs\Favorits\FavoritCategory\" + rn + fInfo.Extension))
        ClassFavorit.InsertCategory(txtTitleCat.Text, rn + fInfo.Extension, FCK_Add.Value)
        txtTitleCat.Text = ""
        FCK_Add.Value = ""
        ChkAdd.Checked = False
        PanelAdd.Visible = False
        DG_Category.DataBind()

    End Sub

    Protected Sub ChkFav_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkFav.CheckedChanged
        Panel_AddFav.Visible = IIf(ChkFav.Checked, True, False)
    End Sub

    Protected Sub DeleteCat(ByVal sender As Object, ByVal e As CommandEventArgs)
        IO.File.Delete(MapPath("~\Content\images\Shaahrs\Favorits\FavoritCategory\" + ClassFavorit.GetLogoCat(e.CommandArgument)))
        ClassFavorit.DeleteCat(e.CommandArgument)
        DG_Category.DataBind()
        DG_Favorits.DataBind()
    End Sub

    Protected Sub DeleteFav(ByVal sender As Object, ByVal e As CommandEventArgs)
        IO.File.Delete(MapPath("~\Content\images\Shaahrs\Favorits\Favorits\" + ClassFavorit.GetLogoFav(e.CommandArgument)))
        ClassFavorit.DeleteFav(e.CommandArgument)
        DG_Favorits.DataBind()
    End Sub

    Protected Sub DG_Category_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles DG_Category.SelectedIndexChanging
        lblCat.Text = DG_Category.Rows(e.NewSelectedIndex).Cells(2).Text
    End Sub

    Protected Sub btnAddFav_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddFav.Click

        If txtTitleFav.Text = "" Or FCK_AddFav.Value = "" Or FileUpload_Fav.FileName = "" Then
            Exit Sub
        End If

        Dim rn As String = Guid.NewGuid.ToString
        Dim fInfo As New IO.FileInfo(FileUpload_Fav.FileName)
        FileUpload_Fav.SaveAs(MapPath("~\Content\images\Shaahrs\Favorits\Favorits\" + rn + fInfo.Extension))
        ClassFavorit.InsertFavorit(DG_Category.SelectedValue, txtTitleFav.Text, rn + fInfo.Extension, FCK_AddFav.Value)
        txtTitleFav.Text = ""
        FCK_AddFav.Value = ""
        ChkFav.Checked = False
        Panel_AddFav.Visible = False
        DG_Favorits.DataBind()

    End Sub

End Class
