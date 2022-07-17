Imports System.Data

Partial Class Management_Admin_Shaahr_Default
    Inherits System.Web.UI.Page

    Dim ClassShaahr As New CMS_Shaahr_Management

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = " قوانین - مدیریت شهرها"
    End Sub

    Public Sub Delete(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteLaw(e.CommandArgument)
        DGLaw.DataBind()
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        ClassShaahr.InsertLaw(cmbLawInsert.SelectedValue, txtTitle.Text, txtLaw.Value)
        txtLaw.Value = ""
        txtTitle.Text = ""
        DGLaw.DataBind()
    End Sub

    Public Sub Edit(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Session("ID_Law_Shaahr") = e.CommandArgument
        PnlEdit.Visible = True
        Dim rw As datarow
        rw = ClassShaahr.ShaahrLaw(e.CommandArgument).Rows(0)
        txtLawEdit.Value = rw(3)
        txtTitleEdit.Text = rw(2)
        cmbLawEdit.SelectedValue = rw(1)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        ClassShaahr.UpdateLaw(cmbLawEdit.SelectedValue, txtTitleEdit.Text, txtLawEdit.Value, Session("ID_Law_Shaahr"))
        Session.Remove("ID_Law_Shaahr")
        PnlEdit.Visible = False
        DGLaw.DataBind()
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Session.Remove("ID_Law_Shaahr")
        PnlEdit.Visible = False
    End Sub

End Class
