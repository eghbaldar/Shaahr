
Partial Class Management_Admin_Shaahr_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3
    '
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "مدیریت شهرها"
        '
        lblShaahrEnable.Text = ClassCMSShaahr.GetCount(1)
        lblShaahrDisable.Text = ClassCMSShaahr.GetCount(2)
        lblShaahrNotConideration.Text = ClassCMSShaahr.GetCount(3)
        lblShaahrSuspension.Text = ClassCMSShaahr.GetCount(4)
        lblShaahrCitizen.Text = ClassCMSShaahr.GetCount(5)

    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Try
            Return ClassProfile_Section.GetFnLn(funder)
        Catch ex As Exception

        End Try
    End Function

    Public Function GetFav(ByVal code As String) As String
        Return ClassShaahr.GetFavorit(code)
    End Function

    Public Function GetState(ByVal codestate As String) As String
        Select Case codestate
            Case 1
                Return "استان اول"
            Case 2
                Return "استان دوم"
            Case 3
                Return "استان سوم"
            Case 4
                Return "استان چهارم"
            Case 5
                Return "استان پنجم"
        End Select
    End Function

    Public Sub Req_EnableBoth(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateEnableBothShaahr(e.CommandArgument)
        DG_ReqWaiting.DataBind()
        DG_Shaahrs.DataBind()
    End Sub

    Public Sub Req_DisableBoth(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateDisableBothShaahr(e.CommandArgument)
        DG_ReqWaiting.DataBind()
        DG_Shaahrs.DataBind()
    End Sub

    Public Sub Req_Presedent_YES(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 4)
        DG_ReqWaiting.DataBind()
    End Sub
    Public Sub Req_Presedent_NO(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 3)
        DG_ReqWaiting.DataBind()
    End Sub
    Public Sub Req_Governor_YES(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 2)
        DG_ReqWaiting.DataBind()
    End Sub
    Public Sub Req_Governor_NO(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.UpdateRequestOneOfOne(e.CommandArgument, 1)
        DG_ReqWaiting.DataBind()
    End Sub

    Protected Sub cmbShaahrs_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbShaahrs.SelectedIndexChanged

        DG_Shaahrs.PageSize = txtRecords.Text
        Select Case cmbShaahrs.SelectedValue
            Case 1 'فعال
                Session("Governor") = 1
                Session("Pre") = 1
            Case 2 'تایید نشده توسط نشمیه
                Session("Governor") = 0
                Session("Pre") = 0
        End Select
        DG_Shaahrs.DataBind()

    End Sub

    Public Sub DeleteReq(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMSShaahr.DeleteRequest(e.CommandArgument)
        DG_ReqWaiting.DataBind()
    End Sub

    Public Sub GotoDetailShaahrs(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("DetailShaahr.aspx?id=" + e.CommandArgument)
    End Sub

    Public Function GetCountFavortis(ByVal code As Long) As String
        Return ClassCMSShaahr.GetCountShaahrWithFavorits(code)
    End Function

    Protected Sub SendMSGforInugurate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SendMSGforInugurate.Click
        ClassCharacter3.Insert_Charaacter3_Users(txtEmailMayor.Text, txtMsgInugrationMayor.Text, "CS", 1)
        txtEmailMayor.Text = ""
        txtMsgInugrationMayor.Text = ""
    End Sub

End Class

