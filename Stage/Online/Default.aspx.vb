Imports System.Data

Partial Class Stage_Online_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage
    Dim ClassOnline As New Online

    Public Function SetAvatar(ByVal email As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email.ToString) + "&W=45&H=45"
    End Function

    Public Function SetTitle(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Public Function SetBirthDate(ByVal email As Object) As String
        Return String.Format("تولد: {0}", ClassProfileHome.GetBirthDateByEmail(email.ToString))
    End Function
    '
    Public Function SetLocation(ByVal email As Object) As String
        Return ClassProfileHome.GetCountryStateByEmail(email.ToString)
    End Function

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click

        Dim Education As String = IIf(cmbEducation.Text = "-", "", cmbEducation.Text)
        Dim Year As String = IIf(cmbYears.Text = "-", "", cmbYears.Text)
        Dim Month As String = IIf(cmbMonth.Text = "-", "", cmbMonth.Text)
        Dim Day As String = IIf(cmbDay.Text = "-", "", cmbDay.Text)
        Dim Din As String = IIf(cmbRegion.Text = "-", "", cmbRegion.Text)
        Dim Language As String = IIf(cmbLanuage.Text = "-", "", cmbLanuage.Text)
        Dim Poletic As String = IIf(cmbPoletic.Text = "-", "", cmbPoletic.Text)
        DG_citizen.DataSource = ClassStage.SearchOnlineUsers(txtFn_F.Text, txtLn_F.Text, txtFn_E.Text, txtLn_E.Text, txtAlias.Text, Education, Year, _
                                                             Month, Day, cmbCountry.Text, cmbState.Text, cmbCity.Text, cmbSex.Text, cmbMarrid.Text, _
                                                                  Din, Language, Poletic)

        DG_citizen.DataBind()
        lblCountFound.Text = String.Format(" نتیجه جستجو <b><span style='color:black;'>{0}</span></b> نفر می باشد.", DG_citizen.Rows.Count)
        div_result.Visible = True

    End Sub
    '-- Online
    Public Function CheckVisible(ByVal user As Object) As Boolean

        If ClassOnline.CheckOnline(user) Then
            If ClassOnline.GetStatusCode(user) = 4 Then
                Return False
            Else
                Return True
            End If
        Else
            Return False
        End If

    End Function

    Public Function CheckOnilneImage(ByVal user As Object) As String
        Select Case ClassOnline.GetStatusCode(user)
            Case 1
                Return "~\content\images\stage\chat\online_avaliable.gif"
            Case 2
                Return "~\content\images\stage\chat\online_NotHere.gif"
            Case 3
                Return "~\content\images\stage\chat\online_busy.gif"
            Case 5
                Return "~\content\images\stage\chat\online_NotNow.gif"
        End Select
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "مشاهده و جستجوی افراد آنلاین - شهر"

        Dim Education As String = IIf(cmbEducation.Text = "-", "", cmbEducation.Text)
        Dim Year As String = IIf(cmbYears.Text = "-", "", cmbYears.Text)
        Dim Month As String = IIf(cmbMonth.Text = "-", "", cmbMonth.Text)
        Dim Day As String = IIf(cmbDay.Text = "-", "", cmbDay.Text)
        Dim Din As String = IIf(cmbRegion.Text = "-", "", cmbRegion.Text)
        Dim Language As String = IIf(cmbLanuage.Text = "-", "", cmbLanuage.Text)
        Dim Poletic As String = IIf(cmbPoletic.Text = "-", "", cmbPoletic.Text)
        DG_citizen.DataSource = ClassStage.SearchOnlineUsers(txtFn_F.Text, txtLn_F.Text, txtFn_E.Text, txtLn_E.Text, txtAlias.Text, Education, Year, _
                                                             Month, Day, cmbCountry.Text, cmbState.Text, cmbCity.Text, cmbSex.Text, cmbMarrid.Text, _
                                                                  Din, Language, Poletic)
        DG_citizen.DataBind()
        lblCountFound.Text = String.Format(" نتیجه جستجو <b><span style='color:black;'>{0}</span></b> نفر می باشد.", DG_citizen.Rows.Count)
        div_result.Visible = False

    End Sub

    Protected Sub Chk_Search_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Search.CheckedChanged

        If Chk_Search.Checked Then
            Div_Jiring.Visible = True
            'اعلام هزینه سرویس
            Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(8)
            lblJiring.Text = String.Format("هزینه این سرویس {0} جیرینگ می باشد.", "<span style='font-size:20px;'><b>" + dr(4) + "</b></span>")
        End If
        If Not Chk_Search.Checked Then
            Div_Search.Visible = False
            Div_Jiring.Visible = False
            div_result.Visible = False
        End If

    End Sub

    Protected Sub btnKasrJiring_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnKasrJiring.Click

        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(8)
        'آیا کاربر موجودی کافی را برای خریدن سرویس را دارد
        If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < Val(dr(4)) Then
            lblJiring.Text = "<span style='font-size:15px;color:red;'><blink>" + String.Format("هزینه این سرویس {0} جیرینگ می باشد.و موجودی شما برای استفاده از این سرویس کافی نمی باشد لطفا موجوی خود ا افزایش داده و دوباره اقدام کنید.", "<span style='font-size:20px;'><b>" + dr(4) + "</b></span>") + "</blink></span>"
            Exit Sub
        End If
        'کسر مبلغ از موجودی کاربر  و ثبت در گردش حساب 
        ClassStage.UpdateUserJiring(dr(4), Session("MY-UsErNaMe"))
        ClassStage.InsertCycleJiring(8, Session("MY-UsErNaMe"))
        '----------------
        Div_Search.Visible = True
        Div_Jiring.Visible = False
        div_result.Visible = True

    End Sub

    Protected Sub Redirect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

End Class

