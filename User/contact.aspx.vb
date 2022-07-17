Imports System.Data

Partial Class user_contact
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    '--------------پاک شدنی ها
    'Dim em_me As String = "ali@y.y" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String 'karba.ri k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Try
        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        Title = String.Format(" ارتباطات {0}", ClassProfile_Section.GetFnLn(em_owner))
        'lblTitleInformation.Text = Title

        Dim dr As DataRow = ClassProfile_Section.ContactUser(em_owner)

        lblShcool.Text = IIf(dr(1).ToString().Trim = String.Empty, "-", dr(1))
        lblMiddle_school.Text = IIf(dr(2).ToString().Trim = String.Empty, "-", dr(2))

        lblHigh_school.Text = IIf(dr(3).ToString().Trim = String.Empty, "-", dr(3))
        lbl_PreUniversity.Text = IIf(dr(4).ToString().Trim = String.Empty, "-", dr(4))


        If dr(5).ToString().Trim <> String.Empty And dr(5).ToString().Trim <> 0 Then
            Dim drUni As DataRow = ClassProfile_Section.UniversityUser(dr(5))
            lblUniversity.Text = drUni(1)
            imgUniversity.ImageUrl = "~\content\images\Shaahrs\University\University\" + drUni(4)
        Else
            PnlUniversity.Visible = False
        End If

        lblJob.Text = IIf(dr(6).ToString().Trim = String.Empty, "-", dr(6))
        lblJob_location.Text = IIf(dr(7).ToString().Trim = String.Empty, "-", dr(7))
        lblJob_Tell.Text = IIf(dr(8).ToString().Trim = String.Empty, "-", dr(8))
        lblEmergncyTell.Text = IIf(dr(9).ToString().Trim = String.Empty, "-", dr(9))
        lblComapny_Name.Text = IIf(dr(10).ToString().Trim = String.Empty, "-", dr(10))
        lbl_LocationCompany.Text = IIf(dr(11).ToString().Trim = String.Empty, "-", dr(11))
        lbl_CompanyDetail.Text = IIf(dr(12).ToString().Trim = String.Empty, "-", dr(12))
        lbl_WebsiteCompany.Text = IIf(dr(13).ToString().Trim = String.Empty, "-", dr(13))

        lblYahoo.Text = IIf(dr(15).ToString().Trim = String.Empty, "-", dr(15))
        lblGmail.Text = IIf(dr(16).ToString().Trim = String.Empty, "-", dr(16))
        lblFacebook.Text = IIf(dr(17).ToString().Trim = String.Empty, "-", dr(17))
        lblTwitter.Text = IIf(dr(18).ToString().Trim = String.Empty, "-", dr(18))
        lblHomail.Text = IIf(dr(19).ToString().Trim = String.Empty, "-", dr(19))
        lbloovoo.Text = IIf(dr(20).ToString().Trim = String.Empty, "-", dr(20))
        lblSkype.Text = IIf(dr(21).ToString().Trim = String.Empty, "-", dr(21))

        lblPrimaryEmail.Text = IIf(dr(22) = True, em_owner, "قابل نمایش برای عموم نمی باشد")
        lblSecondEmail.Text = IIf(dr(14).ToString().Trim = String.Empty, "-", dr(14))

        'Catch ex As Exception

        'End Try
        Permission()

    End Sub

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Contact'''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(13)
            Case 0 'نمایش برای همه
                Div_Panel_Contact.Visible = True
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 5 'هیچکس
                Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
        End Select

    End Sub

End Class
