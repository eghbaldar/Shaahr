
Partial Class UserControl_Root_ButtonShaahr
    Inherits System.Web.UI.UserControl

    Private Text_ As String
    Private UrlMode_ As Boolean
    Private Url_ As String

    Public Property NewText() As String
        Get
            Return Text_
        End Get
        Set(ByVal value As String)
            Text_ = value
        End Set
    End Property
    Public Property UrlMode() As Boolean
        Get
            Return UrlMode_
        End Get
        Set(ByVal value As Boolean)
            UrlMode_ = value
        End Set
    End Property
    Public Property Url() As String
        Get
            Return Url_
        End Get
        Set(ByVal value As String)
            Url_ = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ButtonShaahr.Text = Text_

        ButtonShaahr.Attributes.Add("onmousemove", "return move('" + ButtonShaahr.ClientID + "')")
        ButtonShaahr.Attributes.Add("onmouseout", "return out('" + ButtonShaahr.ClientID + "')")

    End Sub

    Protected Sub ButtonShaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShaahr.Click
        If UrlMode_ Then
            Redirect(Url_, "_blank", "")
        Else
            Response.Redirect(Url_)
        End If        
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
