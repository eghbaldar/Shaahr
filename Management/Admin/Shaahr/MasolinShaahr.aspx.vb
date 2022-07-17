
Partial Class Management_Admin_Shaahr_MasolinShaahr
    Inherits System.Web.UI.Page

    Dim ClassUserM As New CMS_UserManagement
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassProfileHome As New HomeProfile

    Dim CMS_Class_Shaahr_Management As New CMS_Shaahr_Management

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت مسئولین شهر"
    End Sub

    Protected Sub btnInsertAuth_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertAuth.Click

        Dim flag As Boolean
        If RbInsertAuthFlag.Items(0).Selected Then flag = True
        If RbInsertAuthFlag.Items(1).Selected Then flag = False

        CMS_Class_Shaahr_Management.InsertAuthorities(1, cmbType.SelectedValue, txtInsertAuthEmail.Text, txtInsertAuthTitle.Text, txtInsertAuthCV.Value, _
                                                      txtInsertAuthRes.Value, txtInsertAuthTimeRe.Text, txtInsertAuthPriode.Text, txtInsertAuthDateStart.Text _
                                                      , txtInsertAuthDateEnd.Text, flag)
        txtInsertAuthCV.Value = ""
        txtInsertAuthDateEnd.Text = ""
        txtInsertAuthDateStart.Text = ""
        txtInsertAuthEmail.Text = ""
        txtInsertAuthPriode.Text = ""
        txtInsertAuthRes.Value = ""
        txtInsertAuthTimeRe.Text = ""
        txtInsertAuthTitle.Text = ""

    End Sub

    Public Function GetFN(ByVal email As String) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Function GetType_(ByVal type As String) As String
        Select Case type.ToString.Trim
            Case "0"
                Return "<div style='border:1px solid red;padding:2px;'>" + "رئیس جمهور" + "</div>"
            Case "01"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول رئیس جمهور" + "</div>"
            Case "02"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم رئیس جمهور" + "</div>"
            Case "1"
                Return "<div style='border:1px solid red;;padding:2px'>" + "استاندار استان اول" + "</div>"
            Case "11"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول استاندار استان اول" + "</div>"
            Case "12"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم استاندار استان اول" + "</div>"
            Case "2"
                Return "<div style='border:1px solid red;;padding:2px'>" + "استاندار استان دوم" + "</div>"
            Case "21"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول استاندار استان دوم" + "</div>"
            Case "22"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم استاندار استان دوم" + "</div>"
            Case "3"
                Return "<div style='border:1px solid red;;padding:2px'>" + "استاندار استان سوم" + "</div>"
            Case "31"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول استاندار استان سوم" + "</div>"
            Case "32"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم استاندار استان سوم" + "</div>"
            Case "4"
                Return "<div style='border:1px solid red;;padding:2px'>" + "استاندار استان چهار" + "</div>"
            Case "41"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول استاندار استان چهار" + "</div>"
            Case "42"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم استاندار استان چهار" + "</div>"
            Case "5"
                Return "<div style='border:1px solid red;;padding:2px'>" + "استاندار استان پنجم" + "</div>"
            Case "51"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون اول استاندار استان پنجم" + "</div>"
            Case "52"
                Return "<div style='border:1px solid red;;padding:2px'>" + "معاون دوم استاندار استان پنجم" + "</div>"
        End Select
    End Function

    Public Sub EnableFlagAuthorities(ByVal sender As Object, ByVal e As CommandEventArgs)
        CMS_Class_Shaahr_Management.UpdateFlagAuthorities(1, e.CommandArgument)
        DgAtuh.DataBind()
    End Sub

    Public Sub DisableFlagAuthorities(ByVal sender As Object, ByVal e As CommandEventArgs)
        CMS_Class_Shaahr_Management.UpdateFlagAuthorities(0, e.CommandArgument)
        DgAtuh.DataBind()
    End Sub

    Public Sub DeleteAuthorities(ByVal sender As Object, ByVal e As CommandEventArgs)
        CMS_Class_Shaahr_Management.DeleteAuthorities(e.CommandArgument)
        DgAtuh.DataBind()
    End Sub

    Protected Sub ChkShowAuth_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkShowAuth.CheckedChanged
        If ChkShowAuth.Checked Then DgAtuh.Visible = True
        If Not ChkShowAuth.Checked Then DgAtuh.Visible = Not True
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

    Public Sub GotoDetailAuth(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("MasolinShaahrDetail.aspx?id=" + e.CommandArgument, "_blank", "")
    End Sub

End Class
