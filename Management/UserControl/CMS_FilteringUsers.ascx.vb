Imports System.Data
Imports System.Data.SqlClient

Partial Class Management_UserControl_CMS_FilteringUsers
    Inherits System.Web.UI.UserControl

    Dim ClassUserManagement As New CMS_UserManagement

    Public Sub New()

    End Sub

    Public Function EmailsList() As List(Of String)

    End Function

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click

        '----- Reset
        EmailsNET = ""
        Emails = ""
        '-----------
        Dim bBand As String = String.Empty
        If rbBand.Checked Then bBand = "1"
        If rbNotBand.Checked Then bBand = "0"

        Dim bSex As String = String.Empty
        If rbMale.Checked Then bSex = "1"
        If rbFamale.Checked Then bSex = "0"
        bSex = IIf(ChkSex.Checked = True, "", bSex)

        Dim bMarrid_Single As String = String.Empty
        If rbMarrid.Checked Then bMarrid_Single = "0"
        If rbNotMarrid.Checked Then bMarrid_Single = "1"
        bMarrid_Single = IIf(ChkMarrid_Single.Checked = True, "", bMarrid_Single)

        Dim arrDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
        '''''''''''''''''''''''''
        Dim ds As DataSet
        ds = ClassUserManagement.GetEmailByFiltering(txtUsername.Text, txtEmail.Text, bBand, txtAlias.Text, txtFnF.Text, txtLnF.Text, txtFnE.Text, txtLnE.Text, _
                                                 bSex, bMarrid_Single, IIf(Chk_Years.Checked, "", cmbYears.SelectedValue), _
                                                 IIf(Chk_Months.Checked, "", cmbMonth.SelectedValue), _
                                                 IIf(Chk_Days.Checked, "", cmbDay.SelectedValue), _
                                                 txtBrithTIme.Text, _
                                                 IIf(txtSen.Text <> "", Val(arrDate(0)) - Val(txtSen.Text), ""), _
                                                 IIf(cmbDin.SelectedValue = 1, "", cmbDin.SelectedValue), _
                                                 IIf(cmbMazhab.SelectedValue = 0, "", cmbMazhab.SelectedValue), _
                                                 IIf(Chk_Education.Checked, "", cmbEducation.SelectedValue), _
                                                 IIf(Chk_Location.Checked, "", cmbCountry.SelectedValue), _
                                                 IIf(Chk_Location.Checked, "", cmbState.SelectedValue), _
                                                 IIf(Chk_Location.Checked, "", cmbCity.SelectedValue), _
                                                 IIf(cmbLanguage.SelectedValue = 0, "", cmbLanguage.SelectedValue), _
                                                 IIf(cmbPoletic.SelectedValue = 0, "", cmbPoletic.SelectedValue), _
                                                 IIf(cmbDodi.SelectedValue = 0, "", cmbDodi.SelectedValue))

        If ds.Tables(0).Rows.Count > 0 Then GetEmailForBinding(ds)

        'lblCountUsers.Text = ds.Tables(0).Rows.Count.ToString
        '''''''''''''''''''
        'lblCountUsers.Text = ClassUserManagement.GetEmailByFiltering(txtUsername.Text, txtEmail.Text, bBand, txtAlias.Text, txtFnF.Text, txtLnF.Text, txtFnE.Text, txtLnE.Text, _
        '                                         bSex, bMarrid_Single, IIf(Chk_Years.Checked, "", cmbYears.SelectedValue), _
        '                                         IIf(Chk_Months.Checked, "", cmbMonth.SelectedValue), _
        '                                         IIf(Chk_Days.Checked, "", cmbDay.SelectedValue), _
        '                                         txtBrithTIme.Text, _
        '                                         txtSen.Text, _
        '                                         IIf(cmbDin.SelectedValue = 1, "", cmbDin.SelectedValue), _
        '                                         IIf(cmbMazhab.SelectedValue = 0, "", cmbMazhab.SelectedValue), _
        '                                         IIf(Chk_Education.Checked, "", cmbEducation.SelectedValue), _
        '                                         IIf(Chk_Location.Checked, "", cmbCountry.SelectedValue), _
        '                                         IIf(Chk_Location.Checked, "", cmbState.SelectedValue), _
        '                                         IIf(Chk_Location.Checked, "", cmbCity.SelectedValue), _
        '                                         IIf(cmbLanguage.SelectedValue = 0, "", cmbLanguage.SelectedValue), _
        '                                         IIf(cmbPoletic.SelectedValue = 0, "", cmbPoletic.SelectedValue), _
        '                                         IIf(cmbDodi.SelectedValue = 0, "", cmbDodi.SelectedValue))


    End Sub

    Shared EmailsNET As String
    Dim Emails As String
    Private Sub GetEmailForBinding(ByVal ds As DataSet)

        For i As Long = 0 To ds.Tables(0).Rows.Count - 1
            Emails += "'" + ds.Tables(0).Rows(i)(0).ToString + "',"
            EmailsNET += ds.Tables(0).Rows(i)(0).ToString + ","
        Next
        Emails = Emails.Substring(0, Emails.Length - 1)
        If Not Chk_AskForShowing.Checked Then
            dgv_UsersFilter.Visible = True
            dgv_UsersFilter.DataSource = ClassUserManagement.SetBindingByFiltering(Emails)
            dgv_UsersFilter.DataBind()
        Else
            dgv_UsersFilter.Visible = False
        End If
        lblCountUsers.Text = "<blink>" + String.Format("تعداد کاربران یافت شده: {0}", Emails.Split(",").Length) + "</blink>"

    End Sub

    Public Function RetEmails() As String()
        Dim EmailsSplit() As String = EmailsNET.Split(",")
        Return EmailsSplit
    End Function

    Protected Sub ChkMarrid_Single_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkMarrid_Single.CheckedChanged
        If ChkMarrid_Single.Checked Then
            rbMarrid.Enabled = False
            rbNotMarrid.Enabled = False
        End If
        If Not ChkMarrid_Single.Checked Then
            rbMarrid.Enabled = Not False
            rbNotMarrid.Enabled = Not False
        End If
    End Sub

    Protected Sub ChkSex_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkSex.CheckedChanged
        If ChkSex.Checked Then
            rbMale.Enabled = False
            rbFamale.Enabled = False
        End If
        If Not ChkSex.Checked Then
            rbMale.Enabled = Not False
            rbFamale.Enabled = Not False
        End If
    End Sub

    Protected Sub Chk_Years_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Years.CheckedChanged
        If Chk_Years.Checked Then
            cmbYears.Enabled = False
        End If
        If Not Chk_Years.Checked Then
            cmbYears.Enabled = Not False
        End If
    End Sub
    Protected Sub Chk_Months_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Months.CheckedChanged
        If Chk_Months.Checked Then
            cmbMonth.Enabled = False
        End If
        If Not Chk_Months.Checked Then
            cmbMonth.Enabled = Not False
        End If
    End Sub
    Protected Sub Chk_Days_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Days.CheckedChanged
        If Chk_Days.Checked Then
            cmbDay.Enabled = False
        End If
        If Not Chk_Days.Checked Then
            cmbDay.Enabled = Not False
        End If
    End Sub

    Protected Sub Chk_Education_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Education.CheckedChanged
        If Chk_Education.Checked Then
            cmbEducation.Enabled = False
        End If
        If Not Chk_Education.Checked Then
            cmbEducation.Enabled = Not False
        End If
    End Sub

    Protected Sub Chk_Location_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chk_Location.CheckedChanged
        If Chk_Location.Checked Then
            cmbCountry.Enabled = False
            cmbState.Enabled = False
            cmbCity.Enabled = False
        End If
        If Not Chk_Location.Checked Then
            cmbCountry.Enabled = Not False
            cmbState.Enabled = Not False
            cmbCity.Enabled = Not False
        End If
    End Sub

End Class
