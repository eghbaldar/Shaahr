Imports System.Data
Imports System.Data.SqlClient

Partial Class Stage_Search_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "جستجو همه جانبه - شهر"
        If Not IsPostBack Then
            If Session("MY-UsErNaMe") = "" Then
                txtFriends.Text = "شما اجازه دسترسی به این نوع جستجو را ندارید"
                txtFriends.Enabled = False
                btnFriendsSearch.Enabled = False
                txtFamilys.Text = "شما اجازه دسترسی به این نوع جستجو را ندارید"
                txtFamilys.Enabled = False
                btnFamilysSearch.Enabled = False
            Else
                txtFriends.Text = ""
                txtFriends.Enabled = True
                btnFriendsSearch.Enabled = True
                txtFamilys.Text = ""
                txtFamilys.Enabled = True
                btnFamilysSearch.Enabled = True
            End If
        End If
        EnterTextBox()

    End Sub

    Private Sub EnterTextBox()

        txtAllSearch.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnAllSearch.ClientID & "')")
        txtSubjectSearch.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnSubjectSearch.ClientID & "')")
        txtImageSearch.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnImageSearch.ClientID & "')")
        txtLinkSearch.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnLinkSearch.ClientID & "')")
        txtCitizenSearch.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnCitizenSearch.ClientID & "')")
        txtFriends.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnFriendsSearch.ClientID & "')")
        txtFamilys.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnFamilysSearch.ClientID & "')")
        txtShaahr.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnShaahr.ClientID & "')")
        txtMayor.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnMayor.ClientID & "')")
        txtCitizenShaahr.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnCitizenShaahr.ClientID & "')")
        txtPostShaahr.Attributes.Add("onkeypress", "return Btn_Click(event,'" & btnPostShaahr.ClientID & "')")

    End Sub

    Protected Sub Chk_Search_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Search.CheckedChanged
        If Chk_Search.Checked Then Div_Search.Visible = True
        If Not Chk_Search.Checked Then Div_Search.Visible = Not True
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click

        Dim Education As String = IIf(cmbEducation.Text = "-", "", cmbEducation.Text)
        Dim Year As String = IIf(cmbYears.Text = "-", "", cmbYears.Text)
        Dim Month As String = IIf(cmbMonth.Text = "-", "", cmbMonth.Text)
        Dim Day As String = IIf(cmbDay.Text = "-", "", cmbDay.Text)
        Dim Din As String = IIf(cmbRegion.Text = "-", "", cmbRegion.Text)
        Dim Language As String = IIf(cmbLanuage.Text = "-", "", cmbLanuage.Text)
        Dim Poletic As String = IIf(cmbPoletic.Text = "-", "", cmbPoletic.Text)
        DG_citizen.DataSource = ClassStage.SearchCitizen(txtFn_F.Text, txtLn_F.Text, txtFn_E.Text, txtLn_E.Text, txtAlias.Text, Education, Year, _
                                                             Month, Day, cmbCountry.Text, cmbState.Text, cmbCity.Text, cmbSex.Text, cmbMarrid.Text, _
                                                                  Din, Language, Poletic)

        DG_citizen.DataBind()
        lblCountFound.Text = String.Format(" نتیجه جستجو <b><span style='color:black;'>{0}</span></b> نفر می باشد.", DG_citizen.Rows.Count)

    End Sub

    Public Function SetAvatar(ByVal email As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=45&H=45"
    End Function
    '
    Public Function SetTitle(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function
    '
    Public Function SetBirthDate(ByVal email As Object) As String
        Return String.Format("تولد: {0}", ClassProfileHome.GetBirthDateByEmail(email.ToString))
    End Function
    '
    Public Function SetLocation(ByVal email As Object) As String
        Return ClassProfileHome.GetCountryStateByEmail(email.ToString)
    End Function

    Protected Sub DG_citizen_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DG_citizen.PageIndexChanging
        Dim Education As String = IIf(cmbEducation.Text = "-", "", cmbEducation.Text)
        Dim Year As String = IIf(cmbYears.Text = "-", "", cmbYears.Text)
        Dim Month As String = IIf(cmbMonth.Text = "-", "", cmbMonth.Text)
        Dim Day As String = IIf(cmbDay.Text = "-", "", cmbDay.Text)
        Dim Din As String = IIf(cmbRegion.Text = "-", "", cmbRegion.Text)
        Dim Language As String = IIf(cmbLanuage.Text = "-", "", cmbLanuage.Text)
        Dim Poletic As String = IIf(cmbPoletic.Text = "-", "", cmbPoletic.Text)

        DG_citizen.DataSource = ClassStage.SearchCitizen(txtFn_F.Text, txtLn_F.Text, txtFn_E.Text, txtLn_E.Text, txtAlias.Text, Education, Year, _
                                                             Month, Day, cmbCountry.Text, cmbState.Text, cmbCity.Text, cmbSex.Text, cmbMarrid.Text, _
                                                                 Din, Language, Poletic)
        DG_citizen.PageIndex = e.NewPageIndex
        DG_citizen.DataBind()
    End Sub

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    'Button Search
    Protected Sub btnAllSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAllSearch.Click
        If txtAllSearch.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=allsearch&factor=" + txtAllSearch.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnSubjectSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubjectSearch.Click
        If txtSubjectSearch.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=subject&factor=" + txtSubjectSearch.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnImageSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnImageSearch.Click
        If txtImageSearch.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=images&factor=" + txtImageSearch.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnLinkSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLinkSearch.Click
        If txtLinkSearch.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=links&factor=" + txtLinkSearch.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnCitizenSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCitizenSearch.Click
        If txtCitizenSearch.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=Citizen&factor=" + txtCitizenSearch.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnFriendsSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFriendsSearch.Click
        If txtFriends.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=friends&factor=" + txtFriends.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnFamilysSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFamilysSearch.Click
        If txtFamilys.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=familys&factor=" + txtFamilys.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnShaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShaahr.Click
        If txtShaahr.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=Shaahr&factor=" + txtShaahr.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnMayor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMayor.Click
        If txtMayor.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=Mayor&factor=" + txtMayor.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnCitizenShaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCitizenShaahr.Click
        If txtCitizenShaahr.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=CitizenShaahrs&factor=" + txtCitizenShaahr.Text.Replace("ی", "ي"))
        End If
    End Sub

    Protected Sub btnPostShaahr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPostShaahr.Click
        If txtPostShaahr.Text <> "" Then
            Response.Redirect("~\stage\search\SearchResult.aspx?type=PostShaahrs&factor=" + txtPostShaahr.Text.Replace("ی", "ي"))
        End If
    End Sub
End Class
