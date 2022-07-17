
Partial Class Management_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassNews As New CMS_News
    Shared CodeCategory As Integer

    Protected Sub DeleteCategory(ByVal sender As Object, ByVal e As CommandEventArgs)
        CodeCategory = Val(e.CommandArgument)
        PnlDeletecategory.Visible = True
    End Sub

    Protected Sub BtnCancelCat_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnCancelCat.Click
        PnlDeletecategory.Visible = False
    End Sub

    Protected Sub BtnDelCat_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnDelCat.Click
        ClassNews.DeleteCategory(CodeCategory)
        DG.DataBind()
        PnlDeletecategory.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - خبر ها"
    End Sub

    Protected Sub btnInsertCategory_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertCategory.Click
        ClassNews.InsertCategory(txtNameCategory.Text)
        txtNameCategory.Text = ""
        cmb_Category.DataBind()
        DG.DataBind()
    End Sub

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertNews.Click
        If cmb_Category.Items.Count > 0 Then
            ClassNews.InsertNews(txtTitle.Text, txtBreif.Text, FCKeditor.Value, chk.Checked, Session("UserAdmin"), cmb_Category.SelectedValue, rbType.SelectedValue)
            txtBreif.Text = ""
            txtTitle.Text = ""
            cmb_Category.SelectedIndex = 0
            FCKeditor.Value = ""
            DG_News.DataBind()
        End If
    End Sub

    Protected Sub EditShow(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("newsCom.aspx?id=" + e.CommandArgument)
    End Sub

    Protected Sub Delete(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassNews.DeleteNews(e.CommandArgument)
        DG_News.DataBind()
    End Sub

End Class
