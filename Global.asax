<%@ Application Language="VB" %>

<script RunAt="server">
    
    Dim ClassOnline As New Online
    Dim ClassEnter As New EnterUsers
    Dim ClassStage As New Stage
    
    'Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)

    '    'Dim req As HttpRequest = MyBase.Request
    '    'Response.Write(req.UserHostAddress.ToString)
    '    'Response.Write(req.Url)

    'End Sub

    'Protected Sub Application_AcquireRequestState(ByVal sender As Object, ByVal e As System.EventArgs)
    '    'If System.Web.HttpContext.Current.Session IsNot Nothing Then
    '    '    If System.Web.HttpContext.Current.Session("MY-UsErNaMe") IsNot Nothing Then
    '    '        'Response.Write(System.Web.HttpContext.Current.Session("Username").ToString())
    '    '        'Response.Redirect("~\default.aspx")
    '    '    End If
    '    'End If
    'End Sub

    '-----------------------------------------------------------------
    
    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application("OnlineGuest") = 0
        'ClassEnter.InsertCMSStatistical(Context.Request.UserHostAddress.ToString, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), 0)
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        FormsAuthentication.SignOut()
    End Sub
        
    'Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
    'End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Application("OnlineGuest") = Val(Application("OnlineGuest")) + 1
        Application.UnLock()
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        
        Try
            Response.Cookies("ShaahrDotCom").Expires = DateTime.Now.AddYears(-30)
        Catch ex As Exception
        End Try
        'کم شدن مهمانان
        Application.Lock()
        Application("OnlineGuest") = Val(Application("OnlineGuest")) - 1
        Application.UnLock()
        'آفلان شدن کاربر لاگین مرده در صورن بستن مستقیم پنجره
        ClassEnter.UpdateEnd_EnterStatistical(Session("MY-UsErNaMe"))
        ClassOnline.UpdateOnlineOffline(0, Session("MY-UsErNaMe"))
        ClassOnline.UpdateStatusCodeByEmail(4, Session("MY-UsErNaMe")) 'moghe khoroj karbar Na-Marie mishavad Code=4
        FormsAuthentication.SignOut()
        HttpContext.Current.Session.Abandon()
        ''''''''''''''''''''''
        Response.Redirect("~\default.aspx") 'http:\\www.shaahr.com
        
    End Sub
    

</script>

