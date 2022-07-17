Imports System.Data
Partial Class Management_Admin_Nazmie
    Inherits System.Web.UI.Page

    Dim Class_CMS_Nazmie As New CMS_Nazmie
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "مدیریت شهر دات کام - مدیریت نظمیه"
        lblCountERails.Text = DG_Rails.Rows.Count
        lblCountSuspention.Text = DG_Suspention.Rows.Count

        If Not IsPostBack Then FillSetting()

    End Sub

    Private Sub FillSetting()
        Dim row As DataRow = Class_CMS_Nazmie.SelectComplement().Rows(0)
        Select Case row(0)
            Case True
                Rb_Status_Detective_Register.Items(0).Selected = True
            Case False
                Rb_Status_Detective_Register.Items(1).Selected = True
        End Select
        txtJiring_ReportUsers.Text = row(1)
        txtJiring_ReportDetectice.Text = row(2)
    End Sub

    Public Sub EditCategoryNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Pnl_UpdateCategory.Visible = True
        Dim row As DataRow = Class_CMS_Nazmie.SelectRow_CategoryNews(e.CommandArgument).Rows(0)
        txtUpdateCategoryName.Text = row(1)
        Session("CodeCategory") = e.CommandArgument
    End Sub

    Public Sub DeleteCategoryNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteCategoryNews(e.CommandArgument)
        DG_Category.DataBind()
    End Sub

    Protected Sub btnUpdateCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateCategory.Click
        Class_CMS_Nazmie.UpdateCategoryNews(txtUpdateCategoryName.Text, Session("CodeCategory"))
        DG_Category.DataBind()
        Pnl_UpdateCategory.Visible = False
        Session.Remove("CodeCategory")
    End Sub

    Protected Sub CancelUpdateCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelUpdateCategory.Click
        Pnl_UpdateCategory.Visible = False
        Session.Remove("CodeCategory")
    End Sub

    Protected Sub Chk_CategoryNazmie_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_CategoryNazmie.CheckedChanged
        If Chk_CategoryNazmie.Checked Then
            DG_Category.Visible = True
        End If
        If Not Chk_CategoryNazmie.Checked Then
            DG_Category.Visible = False
        End If
    End Sub

    Protected Sub Chk_InsertCategoryNazmie_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_InsertCategoryNazmie.CheckedChanged
        If Chk_InsertCategoryNazmie.Checked Then
            PnlInsertCategory.Visible = True
        End If
        If Not Chk_InsertCategoryNazmie.Checked Then
            PnlInsertCategory.Visible = False
        End If
    End Sub

    Protected Sub btnInsertCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertCategory.Click
        Class_CMS_Nazmie.InsertCategoryNews(txtInsertCategoryName.Text)
        DG_Category.DataBind()
        txtInsertCategoryName.Text = ""
        PnlInsertCategory.Visible = False
    End Sub

    Protected Sub CancelInsertCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelInsertCategory.Click
        txtInsertCategoryName.Text = ""
        PnlInsertCategory.Visible = False
    End Sub

    Public Sub EditNews(ByVal sender As Object, ByVal e As CommandEventArgs)

        PnlEditNews.Visible = True
        Session("ID_News") = e.CommandArgument
        Dim row As DataRow = Class_CMS_Nazmie.SelectRow_News(e.CommandArgument).Rows(0)
        cmbUpdateNews.SelectedValue = row(8)
        txtUpdateTitleNews.Text = row(0)
        txtUpdateLidNews.Text = row(1)
        txtUpdateNews.Value = row(2)
        Select Case row(5)
            Case True
                Rb_UpdateNews.Items(0).Selected = True
                Rb_UpdateNews.Items(1).Selected = False
            Case False
                Rb_UpdateNews.Items(1).Selected = True
                Rb_UpdateNews.Items(0).Selected = False
        End Select

    End Sub

    Public Sub DeleteNews(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteNews(e.CommandArgument)
        DG_NewsNazmie.DataBind()
    End Sub

    Protected Sub CancelUpdateNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelUpdateNews.Click
        PnlEditNews.Visible = False
        Session.Remove("ID_News")
    End Sub

    Protected Sub btnUpdateNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateNews.Click
        Dim Flag As Boolean
        If Rb_UpdateNews.Items(0).Selected = True Then Flag = True
        If Rb_UpdateNews.Items(1).Selected = True Then Flag = False
        Class_CMS_Nazmie.UpdateNews(cmbUpdateNews.SelectedValue, txtUpdateTitleNews.Text, txtUpdateLidNews.Text, txtUpdateNews.Value, Flag, Session("ID_News"))
        DG_NewsNazmie.DataBind()
        Session.Remove("ID_News")
        PnlEditNews.Visible = False
    End Sub

    Protected Sub Chk_News_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_News.CheckedChanged
        If Chk_News.Checked Then
            DG_NewsNazmie.Visible = True
        End If
        If Not Chk_News.Checked Then
            DG_NewsNazmie.Visible = False
        End If
    End Sub

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertNews.Click
        Class_CMS_Nazmie.InsertNews(cmbInsertNews.SelectedValue, txtInsertTitleNews.Text, txtInsertLidNews.Text, txtInsertNews.Value)
        DG_NewsNazmie.DataBind()
        PnlInsertNews.Visible = False
    End Sub

    Protected Sub CancelInsertNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelInsertNews.Click
        PnlInsertNews.Visible = False
    End Sub

    Protected Sub Chk_InsertNews_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_InsertNews.CheckedChanged
        If Chk_InsertNews.Checked Then
            PnlInsertNews.Visible = True
        End If
        If Not Chk_InsertNews.Checked Then
            PnlInsertNews.Visible = False
        End If
    End Sub

    Protected Sub Chk_Law_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Law.CheckedChanged
        If Chk_Law.Checked Then
            DG_Law.Visible = True
        End If
        If Not Chk_Law.Checked Then
            DG_Law.Visible = False
        End If
    End Sub

    Public Sub DeleteLaw(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Nazmie.DeleteLaw(e.CommandArgument)
        DG_Law.DataBind()
    End Sub

    Public Function CheckTypeLaw(ByVal Type As Object) As String
        Select Case Type.ToString
            Case "1"
                Return "قوانین کلی"
            Case "2"
                Return "عناوین جرم و تخلفات"
            Case "3"
                Return "هشدار های پیشگیرانه"
        End Select
    End Function

    Public Function CheckBGLaw(ByVal Type As Object) As System.Drawing.Color
        Select Case Type.ToString
            Case "1"
                Return System.Drawing.Color.Gray
            Case "2"
                Return System.Drawing.Color.Red
            Case "3"
                Return System.Drawing.Color.Green
        End Select
    End Function

    Public Sub EditLaw(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("Code_Law") = e.CommandArgument
        PnlUpdateLaw.Visible = True
        Dim row As DataRow = Class_CMS_Nazmie.SelectRow_Law(e.CommandArgument).Rows(0)
        txtUpdateSubjectLaw.Text = row(1)
        txtUpdateDetailLaw.Value = row(2)
        Select Case row(4)
            Case 1
                RbUpdateLaw.Items(0).Selected = True
                RbUpdateLaw.Items(1).Selected = False
                RbUpdateLaw.Items(2).Selected = False
            Case 2
                RbUpdateLaw.Items(0).Selected = False
                RbUpdateLaw.Items(1).Selected = True
                RbUpdateLaw.Items(2).Selected = False
            Case 3
                RbUpdateLaw.Items(0).Selected = False
                RbUpdateLaw.Items(1).Selected = False
                RbUpdateLaw.Items(2).Selected = True
        End Select
    End Sub

    Protected Sub btnUpdateLaw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateLaw.Click

        Dim Type As Byte
        If RbUpdateLaw.Items(0).Selected = True Then Type = 1
        If RbUpdateLaw.Items(1).Selected = True Then Type = 2
        If RbUpdateLaw.Items(2).Selected = True Then Type = 3
        Class_CMS_Nazmie.UpdateLaw(txtUpdateSubjectLaw.Text, txtUpdateDetailLaw.Value, Type, Session("Code_Law"))
        Session.Remove("Code_Law")
        PnlUpdateLaw.Visible = False
        DG_Law.DataBind()

    End Sub

    Protected Sub Chk_InsertLaw_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_InsertLaw.CheckedChanged
        If Chk_InsertLaw.Checked Then
            PnlInsertLaw.Visible = True
        End If
        If Not Chk_InsertLaw.Checked Then
            PnlInsertLaw.Visible = False
        End If
    End Sub

    Protected Sub btnInsertLaw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertLaw.Click
        Dim Type As Byte
        If RbInsertLaw.Items(0).Selected = True Then Type = 1
        If RbInsertLaw.Items(1).Selected = True Then Type = 2
        If RbInsertLaw.Items(2).Selected = True Then Type = 3
        Class_CMS_Nazmie.InsertLaw(txtInsertSubjectLaw.Text,  txtInsertDetailLaw.Value, Type)
        DG_Law.DataBind()
        PnlInsertLaw.Visible = False
    End Sub

    Protected Sub CancelInsertLaw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelInsertLaw.Click
        PnlInsertLaw.Visible = False
    End Sub

    Public Function GetFnLn(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Sub RedirectToRail(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("RailUser.aspx?email=" + e.CommandArgument)
    End Sub

    Public Function GetTypeSuspention(ByVal type As Object) As String
        Select Case type
            Case "0"
                Return "تعلیق یک"
            Case "1"
                Return "تعلیق دو"
            Case "2"
                Return "تعلیق سه )اخرا("
        End Select
    End Function

    Protected Sub btnUpdateSetting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateSetting.Click
        Dim B As Boolean
        If Rb_Status_Detective_Register.Items(0).Selected Then B = True
        If Rb_Status_Detective_Register.Items(1).Selected Then B = False
        Class_CMS_Nazmie.UpdateComplement(B, txtJiring_ReportUsers.Text, txtJiring_ReportDetectice.Text)
    End Sub

End Class

