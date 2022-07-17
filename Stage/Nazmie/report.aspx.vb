
Partial Class Stage_Nazmie_report
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "گزارش تخلف کاربران - شهر"
        If Request.QueryString("V-URL") <> Nothing Then
            txtLink.Text = Request.QueryString("V-URL")
        End If
        If Session("MY-UsErNaMe") = Nothing Then
            MultiView.ActiveViewIndex = 1
            MultiView_Detective.ActiveViewIndex = 1
        Else
            Select Case ClassStage.CheckRegDetective(Session("MY-UsErNaMe"))
                Case True
                    MultiView_Detective.ActiveViewIndex = 0
                Case False
                    MultiView_Detective.ActiveViewIndex = 1
            End Select
            lblUsername.Text = ClassProfile.getUsernameByEmail(Session("MY-UsErNaMe")) + "  (" + ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")) + ")"
            MultiView.ActiveViewIndex = 0
        End If
        lblReportUser.Text = String.Format("مقدار جیرینگ پاداش جهت اعلام صحیح تخلف برای کاربران عادی: مبلغ {0} جیرینگ می باشد.", "<span style='color:#199b34;font-weight:bold;'>" + ClassStage.GetComplementNazmie(2) + "</span> <img src='../../content/images/Stage/Jiring/JiringSymbol.png'/>")
        lblReportDetective.Text = String.Format("مقدار جیرینگ پاداش جهت اعلام صحیح تخلف برای کاربران ویژه(کارگاهان): مبلغ {0} جیرینگ می باشد.", "<span style='color:#199b34;font-weight:bold;'>" + ClassStage.GetComplementNazmie(3) + "</span> <img src='../../content/images/Stage/Jiring/JiringSymbol.png'/>")

        If Request.QueryString("link") <> "" Then
            txtLink.Text = Request.QueryString("link").Replace("|", "&")
            txtLinkDetective.Text = Request.QueryString("link").Replace("|", "&")
        End If

    End Sub

    Protected Sub btnUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUser.Click

        If Session("MY-UsErNaMe") = Nothing Then
            ClassStage.InsertReportUsers(cmbCrimeUser.SelectedValue, 0, "", txtFnLn.Text, txtEmailOut.Text, txtLink.Text, cmbLevelUser.Text, txtCuase.Text)
        Else
            ClassStage.InsertReportUsers(cmbCrimeUser.SelectedValue, 1, Session("MY-UsErNaMe"), "", "", txtLink.Text, cmbLevelUser.Text, txtCuase.Text)
        End If
        MultiView_Orjinal.ActiveViewIndex = 1

    End Sub

    Protected Sub btnDetective_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDetective.Click
        ClassStage.InsertReportDetective(Session("MY-UsErNaMe"), txtCuaseDetective.Text, cmbLevelDetective.Text, cmbCrimeDetective.SelectedValue, txtLinkDetective.Text)
        ClassStage.UpdateFindedDetective(Session("MY-UsErNaMe"))
        MultiView_Orjinal.ActiveViewIndex = 1
    End Sub

End Class
