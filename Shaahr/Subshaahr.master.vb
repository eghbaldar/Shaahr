Imports System.Drawing

Partial Class home_Home
    Inherits System.Web.UI.MasterPage

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr
    Dim ClassCharacter3 As New Character3

    Dim ShaahrCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ShaahrCode = (Request.QueryString("sh")).ToLower.ToString.Replace("shaahr", " ").Trim

        If Session("VisitShaahr" + ShaahrCode) = "" Then
            If Not IsPostBack Then ClassShaahr.UpdateVisitShaahr(ShaahrCode)
            Session("VisitShaahr" + ShaahrCode) = "Visited"
        End If
        '---------------------
        Try
            lblRotbe.Text = ClassCMSShaahr.GetRankShaahr(ShaahrCode)
            lblVisit.Text = ClassShaahr.GetVisitShaahr(ShaahrCode)
            lblOzv.Text = ClassShaahr.GetCountUsersShaahr(ShaahrCode)
            lblRotbeE.Text = ClassCMSShaahr.GetRankShaahr(ShaahrCode)
            lblVisitE.Text = ClassShaahr.GetVisitShaahr(ShaahrCode)
            lblOzvE.Text = ClassShaahr.GetCountUsersShaahr(ShaahrCode)
        Catch ex As Exception

        End Try

        Fill()
        Menu()

    End Sub

    Private Sub Fill()

        If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(6) = False Then
            'Right
            MV_NameSubname.ActiveViewIndex = 0
            lblSubnameRight.Text = ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(2).ToString
            lblNameRight.Text = ClassCMSShaahr.GetNameShaahr(ShaahrCode)
        ElseIf ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(6) = True Then
            'Left
            MV_NameSubname.ActiveViewIndex = 1
            lblSubnameLeft.Text = ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(2).ToString
            lblNameLeft.Text = ClassCMSShaahr.GetNameShaahr(ShaahrCode)
        End If
        '''''''''''''''''''' Header
        If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(3).ToString = "" Then
            P_Header.BackImageUrl = "~\Content\images\Shaahrs\Root\HeaderShaahr.png"
            Dim bt As New Bitmap(MapPath("~\Content\images\Shaahrs\Root\HeaderShaahr.png"))
            P_Header.Width = bt.Width
            P_Header.Height = bt.Height
        Else
            P_Header.BackImageUrl = "~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(3).ToString
            Dim bt As New Bitmap(MapPath("~\Content\images\Shaahrs\Shaahrs_Header\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(3).ToString))
            P_Header.Width = bt.Width
            P_Header.Height = bt.Height
        End If

        '''''''''''''''''''' Logo
        Select Case ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(7).ToString
            Case "0" 'Right
                If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString = "" Then
                    imgLogoR.ImageUrl = "~\Content\images\Shaahrs\Root\ShaahrLogo.png"
                Else
                    imgLogoR.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString
                End If
            Case "1" 'Center
                If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString = "" Then
                    imgLogoC.ImageUrl = "~\Content\images\Shaahrs\Root\ShaahrLogo.png"
                Else
                    imgLogoC.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString
                End If
            Case "2" 'Left
                If ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString = "" Then
                    imgLogoL.ImageUrl = "~\Content\images\Shaahrs\Root\ShaahrLogo.png"
                Else
                    imgLogoL.ImageUrl = "~\Content\images\Shaahrs\Shaahrs_Logo\" + ClassShaahr.ShaahrComplement(ShaahrCode).Rows(0)(4).ToString
                End If
        End Select        ''--------------------- Check BtnRegisters
        If Session("MY-UsErNaMe") = "" Or _
            ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayor(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist1(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist2(Session("MY-UsErNaMe"), ShaahrCode) Then

            btnRegisterL.Visible = False
            btnRegisterR.Visible = False

        End If
        '---------------------

    End Sub

    Protected Sub lblNameRight_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblNameRight.Click
        Response.Redirect("Shaahr.aspx?sh=" + Request.QueryString("sh"))
    End Sub

    Protected Sub lblNameLeft_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblNameLeft.Click
        Response.Redirect("Shaahr.aspx?sh=" + Request.QueryString("sh"))
    End Sub

    Protected Sub btnRegisterL_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRegisterL.Click
        ClassShaahr.InsertProfileShaahr(Session("MY-UsErNaMe"), ShaahrCode)
        ClassCharacter3.Insert_Charaacter3_Users(Session("MY-UsErNaMe"), String.Format("پیوستنتو به شهر {0} تبریک میگم، امیدوارم از این شهر لذت ببری و خوب توش فعالیت کنی.", " <span style='font-weight:bold;'>" + ClassCMSShaahr.GetNameShaahr(ShaahrCode) + "</span> "), "S", 1)
        Response.Redirect("~\Shaahr/Shaahr.aspx?sh=Shaahr" + ShaahrCode)
    End Sub

    Protected Sub btnRegisterR_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRegisterR.Click
        ClassShaahr.InsertProfileShaahr(Session("MY-UsErNaMe"), ShaahrCode)
        ClassCharacter3.Insert_Charaacter3_Users(Session("MY-UsErNaMe"), String.Format("پیوستنتو به شهر {0} تبریک میگم، امیدوارم از این شهر لذت ببری و خوب توش فعالیت کنی.", " <span style='font-weight:bold;'>" + ClassCMSShaahr.GetNameShaahr(ShaahrCode) + "</span> "), "S", 1)
        Response.Redirect("~\Shaahr/Shaahr.aspx?sh=Shaahr" + ShaahrCode)
    End Sub

    Protected Sub Mnu_R_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Mnu_R.MenuItemClick

        Select Case e.Item.Value
            Case "Report"
                'Response.Redirect("~/Stage/Nazmie/report.aspx?link=" + "shaahr.com/shaahr/shaahr.aspx?sh=shaahr" + ShaahrCode)
                Response.Redirect("~/Stage/Nazmie/report.aspx?link=" + Request.UrlReferrer.OriginalString.Replace("http://", " ").Trim.Replace("&", "|"))
            Case "Dispart"
                ClassShaahr.DeleteProfileShaahr(Session("MY-UsErNaMe"), ShaahrCode)
                Response.Redirect("~\Shaahr/Shaahr.aspx?sh=Shaahr" + ShaahrCode)
            Case "Citizens"
                Response.Redirect("~\Shaahr/ShaahrCitizens.aspx?sh=Shaahr" + ShaahrCode)
        End Select

    End Sub

    Protected Sub Mnu_L_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Mnu_L.MenuItemClick

        Select Case e.Item.Value
            Case "Report"
                'Response.Redirect("~/Stage/Nazmie/report.aspx?link=" + "shaahr.com/shaahr/shaahr.aspx?sh=shaahr" + ShaahrCode)
                Response.Redirect("~/Stage/Nazmie/report.aspx?link=" + Request.UrlReferrer.OriginalString.Replace("http://", " ").Trim.Replace("&", "|"))
            Case "Dispart"
                ClassShaahr.DeleteProfileShaahr(Session("MY-UsErNaMe"), ShaahrCode)
                Response.Redirect("~\Shaahr/Shaahr.aspx?sh=Shaahr" + ShaahrCode)
            Case "Citizens"
                Response.Redirect("~\Shaahr/ShaahrCitizens.aspx?sh=Shaahr" + ShaahrCode)
        End Select

    End Sub

    Protected Sub Mnu_L_MenuItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Mnu_L.MenuItemDataBound

        If Session("MY-UsErNaMe") = "" Then
            If ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Then
                For Each MenuItem As MenuItem In Mnu_L.Items
                    For Each submenuitem As MenuItem In MenuItem.ChildItems
                        If submenuitem.Value = "Report" Or submenuitem.Value = "Citizens" Then
                            submenuitem.Text = ""
                        End If
                    Next
                Next
            End If

        End If

    End Sub

    Private Sub Menu()

        If Session("MY-UsErNaMe") = "" Then 'Right
            For Each MenuItem As MenuItem In Mnu_R.Items
                For Each submenuitem As MenuItem In MenuItem.ChildItems
                    If submenuitem.Value = "Dispart" Or submenuitem.Value = "Citizens" Then
                        submenuitem.Enabled = False
                    End If
                Next
            Next        'Left
            For Each MenuItem As MenuItem In Mnu_L.Items
                For Each submenuitem As MenuItem In MenuItem.ChildItems
                    If submenuitem.Value = "Dispart" Or submenuitem.Value = "Citizens" Then
                        submenuitem.Enabled = False
                    End If
                Next
            Next
        ElseIf Not ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Then 'Right
            For Each MenuItem As MenuItem In Mnu_R.Items
                For Each submenuitem As MenuItem In MenuItem.ChildItems
                    If submenuitem.Value = "Dispart" Or submenuitem.Value = "Citizens" Then
                        submenuitem.Enabled = False
                    End If
                Next
            Next        'Left
            For Each MenuItem As MenuItem In Mnu_L.Items
                For Each submenuitem As MenuItem In MenuItem.ChildItems
                    If submenuitem.Value = "Dispart" Or submenuitem.Value = "Citizens" Then
                        submenuitem.Enabled = False
                    End If
                Next
            Next
        End If

    End Sub
    

End Class

