﻿
Partial Class Management_Admin_OnlineUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - کاربران آنلاین"
        lblCount.Text = DG.Rows.Count
    End Sub

    Protected Sub RedirectAttrib(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("UserAttrib.aspx?email=" + e.CommandArgument, "_Blank", "")
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

End Class
