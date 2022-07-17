
Partial Class Management_Admin_University
    Inherits System.Web.UI.Page

    Dim ClassUni As New CMS_University

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - دانشگاهها"
    End Sub

    Public Function GetCountUniCat(ByVal code As Object) As String
        Return "تعداد کاربران زیر گروه : " + ClassUni.GetCountUserUniCat(code.ToString) + "   (برای دیدن کاربران کلیک کنید)"
    End Function

    Public Function GetCountUni(ByVal code As Object) As String
        Return "تعداد کاربران این دانشگاه : " + ClassUni.GetCountUserUni(code.ToString) + "   (برای دیدن کاربران کلیک کنید)"
    End Function

    Protected Sub RedirectCat(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-University.aspx?type=cat&code=" + e.CommandArgument)
    End Sub

    Protected Sub RedirectUni(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-University.aspx?type=uni&code=" + e.CommandArgument)
    End Sub

    Protected Sub InsertCat_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertCat.Click

        If txtNameCat.Text = "" Or FileCat.FileName = "" Then
            Exit Sub
        End If

        Dim rn As String = Guid.NewGuid.ToString
        Dim fInfo As New IO.FileInfo(FileCat.FileName)
        FileCat.SaveAs(MapPath("~\Content\images\Shaahrs\University\UniversityCat\" + rn + fInfo.Extension))
        ClassUni.InsertCat(txtNameCat.Text, rn + fInfo.Extension)
        DG_Cat.DataBind()
        chkcat.Checked = False
        PanelCat.Visible = False

    End Sub

    Protected Sub chkcat_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkcat.CheckedChanged
        PanelCat.Visible = IIf(chkcat.Checked, True, False)
    End Sub

    Protected Sub chkUni_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkUni.CheckedChanged
        PanelUni.Visible = IIf(chkUni.Checked, True, False)
    End Sub

    Protected Sub DG_Cat_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles DG_Cat.SelectedIndexChanging
        lblUni.Text = DG_Cat.Rows(e.NewSelectedIndex).Cells(3).Text
    End Sub

    Protected Sub DeleteCat(ByVal sender As Object, ByVal e As CommandEventArgs)
        IO.File.Delete(MapPath("~\Content\images\Shaahrs\University\UniversityCat\" + ClassUni.GetLogoCat(e.CommandArgument)))
        ClassUni.DeleteCat(e.CommandArgument)
        DG_Cat.DataBind()
    End Sub

    Protected Sub InsertUni_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertUni.Click

        If txtUni.Text = "" Or txtAddress.Text = "" Or FileUni.FileName = "" Then
            Exit Sub
        End If

        Dim rn As String = Guid.NewGuid.ToString
        Dim fInfo As New IO.FileInfo(FileUni.FileName)
        FileUni.SaveAs(MapPath("~\Content\images\Shaahrs\University\University\" + rn + fInfo.Extension))
        ClassUni.InsertUni(txtUni.Text, txtAddress.Text, txtWeb.Text, rn + fInfo.Extension, DG_Cat.SelectedValue)
        DG_Cat.DataBind()
        chkUni.Checked = False
        PanelUni.Visible = False
        DG_Uni.DataBind()

    End Sub

    Protected Sub DeleteUni(ByVal sender As Object, ByVal e As CommandEventArgs)
        IO.File.Delete(MapPath("~\Content\images\Shaahrs\University\University\" + ClassUni.GetLogoUni(e.CommandArgument)))
        ClassUni.DeleteUni(e.CommandArgument)
        DG_Uni.DataBind()
    End Sub

End Class
