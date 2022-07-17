
Partial Class home_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr
    Dim ClassEnter As New EnterUsers

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SetObject.Email = Session("MY-UsErNaMe")

        If Not IsPostBack Then

            Title = String.Format("خانــــه {0}", ClassProfile_Section.GetFnLn((Session("MY-UsErNaMe"))))
            Panels()
            ClassStage.CheckExpireServices(Session("MY-UsErNaMe")) 'Check Service Jiring & Expire it.
            Panel_Visit.OtherEmail = Session("MY-UsErNaMe")
            'set value usercontrol

            'for chrome (rafe behamrikhtegie menu-asp.net)
            If Request.UserAgent.IndexOf("AppleWebKit") > 0 Then
                Request.Browser.Adapters.Clear()
            End If

        End If

        '''''''''''''''''''
        For Each MenuItem As MenuItem In Mnu.Items
            For Each submenuitem As MenuItem In MenuItem.ChildItems
                If submenuitem.Value = "Split" Then
                    submenuitem.Text = "<span style='color:#ccc;'>.....................................</span>"
                End If
            Next
        Next

    End Sub

    'Get Favortit's shaahr
    'Public Function GetFavorit(ByVal code As Long) As String
    '    Return ClassShaahr.GetFavorit(code)
    'End Function
    
    Public Sub GotoThread(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("~\shaahr\threadShow.aspx?cdP=" + s(0) + "&Sh=Shaahr" + ClassShaahr.GetCodeShaahrByCodeCategoryPost(s(1))) 'cdT = CoDe Thread
    End Sub

    'Panels
    Private Sub Panels()

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 1)
            Case True
                Panel__Sharvandi.Visible = True
            Case False
                Panel__Sharvandi.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 2)
            Case True
                Panel__Visit.Visible = True
            Case False
                Panel__Visit.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 3)
            Case True
                Panel__Update.Visible = True
            Case False
                Panel__Update.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 4)
            Case True
                Panel__Event.Visible = True
            Case False
                Panel__Event.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 5)
            Case True
                Panel__Know.Visible = True
            Case False
                Panel__Know.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 6)
            Case True
                Panel__shaahr.Visible = True
            Case False
                Panel__shaahr.Visible = False
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 7)
            Case True
                Panel__Work.Visible = True
            Case False
                Panel__Work.Visible = False
        End Select

    End Sub

    'mnu
    Protected Sub mnuProfile_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Response.Redirect("~\user\Default.aspx?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    End Sub

    'Protected Sub btnProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProfile.Click
    '    Response.Redirect("~\user\default.aspx?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
    'End Sub

    Protected Sub Mnu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Mnu.MenuItemClick

        If e.Item.Value = "Profile" Then
            Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")))
        End If

        If e.Item.Value = "ExitShaahr" Then
            Try
                Response.Cookies("ShaahrDotCom").Expires = DateTime.Now.AddYears(-30)
            Catch ex As Exception
            End Try
            ClassEnter.UpdateEnd_EnterStatistical(Session("MY-UsErNaMe"))
            ClassOnline.UpdateOnlineOffline(0, Session("MY-UsErNaMe"))
            'Status
            ClassOnline.UpdateStatusCodeByEmail(4, Session("MY-UsErNaMe")) 'moghe khoroj karbar Na-Marie mishavad Code=4
            '
            HttpContext.Current.Session.Abandon()
            FormsAuthentication.SignOut()
            Response.Redirect("~\default.aspx") 'http:\\www.shaahr.com
        End If
        
    End Sub

End Class
