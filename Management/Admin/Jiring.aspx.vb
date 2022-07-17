Imports System.Data

Partial Class Management_Admin_Jiring
    Inherits System.Web.UI.Page

    Dim ClassUserM As New CMS_UserManagement
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassProfileHome As New HomeProfile
    Dim Class_CMS_Jiring As New CMS_Jiring

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت جیرینگ"
    End Sub

    ''' <summary>
    ''' Define Jiring
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>

    Protected Sub ChkShowDefineJiring_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkShowDefineJiring.CheckedChanged
        If ChkShowDefineJiring.Checked Then
            PnlDefineJiring.Visible = True
        ElseIf Not ChkShowDefineJiring.Checked Then
            PnlDefineJiring.Visible = Not True
            PnlDefineJiringEdit.Visible = False
        End If
    End Sub

    Public Sub ShowEditDefineJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("IdDefineJiring") = e.CommandArgument
        PnlDefineJiringEdit.Visible = True
        txtEditSubject.Text = Class_CMS_Jiring.SelectRow(e.CommandArgument).Rows(0)(1)
        txtEditText.Text = Class_CMS_Jiring.SelectRow(e.CommandArgument).Rows(0)(2)
        Select Case Class_CMS_Jiring.SelectRow(e.CommandArgument).Rows(0)(5)
            Case True
                RbStatusEditDefine.Items(0).Selected = True
                RbStatusEditDefine.Items(1).Selected = False
            Case False
                RbStatusEditDefine.Items(1).Selected = True
                RbStatusEditDefine.Items(0).Selected = False
        End Select
    End Sub

    Protected Sub btnUpdateDefine_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateDefine.Click
        Dim Flag As Boolean
        If RbStatusEditDefine.Items(0).Selected = True Then Flag = True
        If RbStatusEditDefine.Items(1).Selected = True Then Flag = False
        Class_CMS_Jiring.UpdateDefineJiring(txtEditSubject.Text, txtEditText.Text, Flag, Session("IdDefineJiring"))
        Session.Remove("IdDefineJiring")
        txtEditSubject.Text = ""
        txtEditText.Text = ""
        PnlDefineJiringEdit.Visible = False
        DG_DefineJiring.DataBind()
    End Sub

    Public Sub DeleteDefineJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.DeleteDefineJiring(e.CommandArgument)
        DG_DefineJiring.DataBind()
    End Sub

    Protected Sub btnInsertDefine_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertDefine.Click
        Class_CMS_Jiring.InsertDefineJiring(txtInsertSubject.Text, txtInsertText.Text, "")
        txtInsertSubject.Text = ""
        txtInsertText.Text = ""
        Pnl_InsertDefine.Visible = False
        DG_DefineJiring.DataBind()
    End Sub

    Protected Sub ChkInsertDefineJiring_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkInsertDefineJiring.CheckedChanged
        If ChkInsertDefineJiring.Checked Then
            Pnl_InsertDefine.Visible = True
        ElseIf Not ChkInsertDefineJiring.Checked Then
            Pnl_InsertDefine.Visible = Not True
        End If
    End Sub

    ''' <summary>
    ''' Factor Jiring
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    ''' 

    Public Sub ShowEditFactorJiring(ByVal sender As Object, ByVal e As CommandEventArgs)

        Session("CodeFactorJiring") = e.CommandArgument
        lblEditCodeFactor.Text = e.CommandArgument
        PnlUpdateFactor.Visible = True
        txtEditSubjectFactor.Text = Class_CMS_Jiring.SelectRow_Factor(e.CommandArgument).Rows(0)(1)
        txtEditPeriodFactor.Text = Class_CMS_Jiring.SelectRow_Factor(e.CommandArgument).Rows(0)(2)
        Select Case Class_CMS_Jiring.SelectRow_Factor(e.CommandArgument).Rows(0)(3)
            Case True
                RbEditTypeFactor.Items(1).Selected = False
                RbEditTypeFactor.Items(0).Selected = True
            Case False
                RbEditTypeFactor.Items(1).Selected = True
                RbEditTypeFactor.Items(0).Selected = False
        End Select
        txtEditFactorJiring.Text = Class_CMS_Jiring.SelectRow_Factor(e.CommandArgument).Rows(0)(4)
        Select Case Class_CMS_Jiring.SelectRow_Factor(e.CommandArgument).Rows(0)(5)
            Case True
                RbStatusEditFactor.Items(0).Selected = True
                RbStatusEditFactor.Items(1).Selected = False
            Case False
                RbStatusEditFactor.Items(1).Selected = True
                RbStatusEditFactor.Items(0).Selected = False
        End Select

    End Sub

    Protected Sub btnEditFactor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditFactor.Click
        Dim Type As Boolean
        If RbEditTypeFactor.Items(0).Selected = True Then Type = True
        If RbEditTypeFactor.Items(1).Selected = True Then Type = False
        Dim Flag As Boolean
        If RbStatusEditFactor.Items(0).Selected = True Then Flag = True
        If RbStatusEditFactor.Items(1).Selected = True Then Flag = False
        Class_CMS_Jiring.UpdateFactorJiring(txtEditSubjectFactor.Text, txtEditPeriodFactor.Text, Type, txtEditFactorJiring.Text, Flag, Session("CodeFactorJiring"))
        Session.Remove("CodeFactorJiring")
        DG_FactorJiring.DataBind()
        PnlUpdateFactor.Visible = False
    End Sub

    Public Sub DeleteFactorJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.DeleteFactorJiring(e.CommandArgument)
        DG_FactorJiring.DataBind()
    End Sub

    Protected Sub ChkInsertFactorJiring_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkInsertFactorJiring.CheckedChanged
        If ChkInsertFactorJiring.Checked Then
            Pnl_InsertFactor.Visible = True
        ElseIf Not ChkInsertFactorJiring.Checked Then
            Pnl_InsertFactor.Visible = Not True
        End If
    End Sub

    Protected Sub btnInsertFactor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertFactor.Click
        Dim Type As Boolean
        If RbInsertTypeFactor.Items(0).Selected = True Then Type = True
        If RbInsertTypeFactor.Items(1).Selected = True Then Type = False
        Class_CMS_Jiring.InsertFactorJiring(txtInsertSubjectFactor.Text, txtInsertPeriodFactor.Text, Type, txtInsertFactorJiring.Text)
        txtInsertSubjectFactor.Text = ""
        txtInsertPeriodFactor.Text = ""
        txtInsertFactorJiring.Text = ""
        DG_FactorJiring.DataBind()
        Pnl_InsertFactor.Visible = False
    End Sub

    Public Sub ShowProfile(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("UserAttrib.aspx?email=" + e.CommandArgument)
    End Sub

    Public Sub DeleteJiringCard(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.Delete_JiringCard(e.CommandArgument)
        DG_Jiring_Card.DataBind()
    End Sub

    Public Function GetFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Protected Sub btnDeleteAllCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteAllCard.Click
        Class_CMS_Jiring.DeleteAll_JiringCard()
        DG_Jiring_Card.DataBind()
    End Sub

    Protected Sub Chk_ShowJiringCard_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_ShowJiringCard.CheckedChanged
        If Chk_ShowJiringCard.Checked Then
            DG_Jiring_Card.Visible = True
        ElseIf Not Chk_ShowJiringCard.Checked Then
            DG_Jiring_Card.Visible = Not True
        End If
    End Sub

    Public Sub DeleteJiringFish(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.Delete_JiringFish(e.CommandArgument)
        DG_Jiring_Fish.DataBind()
    End Sub

    Protected Sub Chk_ShowJiringFish_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_ShowJiringFish.CheckedChanged
        If Chk_ShowJiringFish.Checked Then
            DG_Jiring_Fish.Visible = True
        ElseIf Not Chk_ShowJiringFish.Checked Then
            DG_Jiring_Fish.Visible = Not True
        End If
    End Sub

    Protected Sub btnDeleteAllFish_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteAllFish.Click
        Class_CMS_Jiring.DeleteAll_JiringFish()
        DG_Jiring_Fish.DataBind()
    End Sub

    Protected Sub Chk_ShowService_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_ShowService.CheckedChanged
        If Chk_ShowService.Checked Then
            DG_Service.Visible = True
        ElseIf Not Chk_ShowService.Checked Then
            DG_Service.Visible = Not True
        End If
    End Sub

    Protected Sub btnDeleteAllService_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteAllService.Click
        Class_CMS_Jiring.DeleteAllService()
        DG_Service.DataBind()
    End Sub

    Public Sub ShowProfileJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("Users-Jiring.aspx?email=" + e.CommandArgument)
    End Sub

    Public Sub DeleteBuyService(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.DeleteUserService(e.CommandArgument)
        DG_Service.DataBind()
    End Sub

    Protected Sub btnDeleteAllTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteAllTransfer.Click
        Class_CMS_Jiring.DeleteAllTransfer()
        DG_Jiring_Transfer.DataBind()
    End Sub

    Public Sub DeleteTransferUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.DeleteUserTransfer(e.CommandArgument)
        DG_Jiring_Transfer.DataBind()
    End Sub

    Protected Sub ChkShowTransfer_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkShowTransfer.CheckedChanged
        If ChkShowTransfer.Checked Then
            DG_Jiring_Transfer.Visible = True
        ElseIf Not ChkShowTransfer.Checked Then
            DG_Jiring_Transfer.Visible = Not True
        End If
    End Sub

    ''' <summary>
    ''' مدیریت سرویس ها
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' 

    Protected Sub btnEditFactorCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditFactorCancel.Click
        PnlUpdateFactor.Visible = False
    End Sub
    
    Protected Sub btnInsertFactorCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertFactorCancel.Click
        Pnl_InsertFactor.Visible = False
    End Sub

    Public Sub ShowEditServiceJiring(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim dr As DataRow = Class_CMS_Jiring.SelectRowService(e.CommandArgument).Rows(0)
        Session("CodeOrginal") = dr(0)
        txtEditCodeService.Text = dr(0)
        txtEditSubjectService.Text = dr(1)
        txtEditDetailService.Text = dr(2)
        txtEditMonthService.Text = dr(3)
        Select Case dr(4)
            Case True
                RbEditFreeService.Items(1).Selected = False
                RbEditFreeService.Items(0).Selected = True
            Case False
                RbEditFreeService.Items(1).Selected = True
                RbEditFreeService.Items(0).Selected = False
        End Select
        txtEditJiringService.Text = dr(5)
        txtEditTypeService.Text = dr(6)
        Select Case dr(7)
            Case True
                RbEditFlagService.Items(1).Selected = False
                RbEditFlagService.Items(0).Selected = True
            Case False
                RbEditFlagService.Items(1).Selected = True
                RbEditFlagService.Items(0).Selected = False
        End Select
        txtEditDiscountService.Text = dr(8)
        PnlEditService.Visible = True

    End Sub

    Protected Sub ChkInsertService_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkInsertService.CheckedChanged
        If ChkInsertService.Checked Then
            PnlInsertService.Visible = True
        ElseIf Not ChkInsertService.Checked Then
            PnlInsertService.Visible = Not True
        End If
    End Sub

    Protected Sub btnEditServiceCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditServiceCancel.Click
        PnlEditService.Visible = False
        Session.Remove("CodeOrginal")
    End Sub

    Protected Sub btnUpdateService_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateService.Click
        Dim Free As Boolean
        If RbEditFreeService.Items(0).Selected = True Then Free = True
        If RbEditFreeService.Items(1).Selected = True Then Free = False
        Dim Flag As Boolean
        If RbEditFlagService.Items(0).Selected = True Then Flag = True
        If RbEditFlagService.Items(1).Selected = True Then Flag = False
        Class_CMS_Jiring.UpdateJiringService(txtEditCodeService.Text, txtEditSubjectService.Text, txtEditDetailService.Text, txtEditMonthService.Text, _
                                             Free, txtEditJiringService.Text, txtEditTypeService.Text, Flag, txtEditDiscountService.Text, Session("CodeOrginal"))
        DG_JrinigService.DataBind()
        Session.Remove("CodeOrginal")
    End Sub

    Protected Sub btnInsertService_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertService.Click
        Dim Free As Boolean
        If RbFreeService.Items(0).Selected = True Then Free = True
        If RbFreeService.Items(1).Selected = True Then Free = False
        Dim Show As Boolean
        If RbShowService.Items(0).Selected = True Then Show = True
        If RbShowService.Items(1).Selected = True Then Show = False
        Class_CMS_Jiring.InsertJiringService(txtCodeService.Text, txtInsertSubjectService.Text, txtDetailService.Text, txtMonthService.Text, _
                                    Free, txtJiringService.Text, txtTypeService.Text, Show, txtDiscountService.Text)
        DG_JrinigService.DataBind()
        PnlInsertService.Visible = False
    End Sub

    Public Sub DeleteServiceJiring(ByVal sender As Object, ByVal e As CommandEventArgs)
        'حذف خود سرویس
        Class_CMS_Jiring.DeleteJiringService(e.CommandArgument)
        'حذف این سرویس از گردش حساب همه کاربران در صورت وجود 
        Class_CMS_Jiring.DeleteServiceFromProfileCycleJiring(e.CommandArgument)
        DG_JrinigService.DataBind()
    End Sub

    Protected Sub btnDeleteExpireService_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteExpireService.Click
        Class_CMS_Jiring.DeleteExpireService()
        DG_Service.DataBind()
    End Sub

End Class

