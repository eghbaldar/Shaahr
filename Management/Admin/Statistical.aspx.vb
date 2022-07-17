Imports System.IO

Partial Class Management_Admin_Statistical
    Inherits System.Web.UI.Page

    Dim ClassStatistical As New CMS_Statistical
    Dim ClassOnline As New Online

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        AccFreeAndUseHOST()

        Title = "مدیریت شهر دات کام - آمار سایت"
        lblToday.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
        lblCOuntToday.Text = ClassStatistical.getCountToday(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))

        lblOnline.Text = Str(Val(ClassOnline.GetCountOnlineUsers) + Val(Application("OnlineGuest")))
        lblCountLogged.Text = String.Format("{0}", ClassOnline.GetCountOnlineUsers)
        lblCountGuest.Text = String.Format("{0}", Application("OnlineGuest"))

        lblCountPost.Text = ClassStatistical.getCountPost
        lblCountPostToday.Text = ClassStatistical.getCountPostToday

        lblCountRegister.Text = ClassStatistical.GetCountRegisterByDate(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))

    End Sub

    Protected Sub ODS_Today_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Today.Selecting
        e.InputParameters("dateStart") = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
    End Sub

    Public Sub ShowUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("UserAttrib.aspx?email=" + e.CommandArgument, "_Blank", "")
    End Sub

    Public Sub DeleteStatistical(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassStatistical.DeleteByID(e.CommandArgument)
        DG_Today.DataBind()
        DG_Today_Search.DataBind()
        lblCOuntToday.Text = ClassStatistical.getCountToday(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        DG_Today_Search.DataSource = ClassStatistical.SearchToday(txtIP.Text, txtEmail.Text, txtDate.Text)
        DG_Today_Search.DataBind()
        lblCountSearch.Text = DG_Today_Search.Rows.Count
    End Sub

    Protected Sub ODS_Today_tafkik_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_Today_tafkik.Selecting
        e.InputParameters("_date") = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
    End Sub

    Public Function GetPartName(ByVal part As Object) As String
        Select Case part.ToString
            Case 0
                Return "تعداد بازدید از صفحه نحست سایت"
            Case 1
                Return "تعداد کل بارگزاری سایت(کل بازدید ها از سایت)"
        End Select
    End Function

    Protected Sub ODS_TodayStatistical_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS_TodayStatistical.Selecting
        e.InputParameters("_date") = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
    End Sub

    Public Shared Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)

        Dim context As HttpContext = HttpContext.Current
        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then
            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)
            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If
            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If

    End Sub

    Protected Sub DG_TodayPart_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_TodayPart.RowDataBound
        lblTodayPart.Text = DG_TodayPart.Rows.Count
    End Sub

    Protected Sub DG_Part_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Part.RowDataBound
        lblPart.Text = DG_Part.Rows.Count
    End Sub

    Protected Sub btnSearchTafkik_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchTafkik.Click
        DG_Search_tafkik.DataBind()
    End Sub

    Protected Sub chkShowLoginToday_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkShowLoginToday.CheckedChanged
        DG_Today.Visible = chkShowLoginToday.Checked
    End Sub

    Protected Sub RBL_TypePost_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RBL_TypePost.SelectedIndexChanged
        lblCountPostBy.Text = ClassStatistical.getCountPostByType(RBL_TypePost.SelectedValue, txtDatePost.Text)
    End Sub

    Dim iUse As Integer = 0
    Private Sub AccFreeAndUseHOST()
        '-----------------------------------------------
        GetFiles(New DirectoryInfo(MapPath("~")))
        lbl_Full.Text = "فضای اشغال شده: " + "<b>" + (BytesToMegabytes(Convert.ToDouble(iUse)).ToString).ToString() + " MB" + "</b>"
        lbl_Free.Text = "فضای آزاد: " + "<b>" + (100 - BytesToMegabytes(Convert.ToDouble(iUse)).ToString).ToString() + " MB" + "</b>"
        '--------------------------------------------------

        Dim yval As Double() = {BytesToMegabytes(Convert.ToDouble(iUse)).ToString, 100 - BytesToMegabytes(Convert.ToDouble(iUse)).ToString}
        Dim xval As String() = {"Free", "Busy"}
        Charting.Series("Series1").Points.DataBindXY(xval, yval)

    End Sub

    Sub GetFiles(ByVal source As DirectoryInfo)
        Dim files() As FileInfo = source.GetFiles
        Dim f As FileInfo
        For Each f In files
            iUse += f.Length
            '
        Next
        Dim dirs() As DirectoryInfo = source.GetDirectories
        For Each Dir As DirectoryInfo In dirs
            GetFiles(Dir)
        Next
    End Sub

    Public Function BytesToMegabytes(ByVal Bytes As Double) As Double
        Dim dblAns As Double
        dblAns = (Bytes / 1024) / 1024
        BytesToMegabytes = Format(dblAns, "###,###,##0.00")
    End Function

    Public Function Percent(ByVal c As String) As String
        Return "<div><div style='background-color:red;height:10px;width:" + (Val(c) * 7).ToString + "px'></div></div>"
    End Function

    Protected Sub DeleteAllStatistical_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteAllStatistical.Click
        ClassStatistical.DeleteAllStaticstical()
        DL_Statistical.DataBind()
    End Sub
    Protected Sub DeleteTodayStatistical_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteTodayStatistical.Click
        ClassStatistical.DeleteStaticsticalByDate(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
        DL_Statistical.DataBind()
    End Sub
    Protected Sub DeleteStatisticalByDate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteStatisticalByDate.Click
        ClassStatistical.DeleteStaticsticalByDate(txtDateStatistical.Text)
        DL_Statistical.DataBind()
    End Sub

End Class

