Imports System.Drawing
Imports System.IO

Partial Class home_Menu_Setting_setting
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("تنظیمات نمایش پروفایل  - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        FillPicture()
        If Not IsPostBack Then FillPanels()

    End Sub

    Private Sub FillPanels()

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 1)
            Case True
                Rb_ShaahrVandi_Yes.Checked = True
            Case False
                Rb_ShaahrVandi_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 2)
            Case True
                Rb_Visit_Yes.Checked = True
            Case False
                Rb_Visit_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 3)
            Case True
                Rb_Update_Yes.Checked = True
            Case False
                Rb_Update_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 4)
            Case True
                Rb_Event_Yes.Checked = True
            Case False
                Rb_Event_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 5)
            Case True
                Rb_Know_Yes.Checked = True
            Case False
                Rb_Know_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 6)
            Case True
                Rb_Citizen_Yes.Checked = True
            Case False
                Rb_Citizen_No.Checked = True
        End Select

        Select Case ClassHomeSetting.StatusPanels(Session("MY-UsErNaMe"), 7)
            Case True
                Rb_Work_Yes.Checked = True
            Case False
                Rb_Work_No.Checked = True
        End Select

    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpload.Click
        If FileUpload1.FileName <> "" Then
            'Filename
            Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
            Dim r As New Random
            Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
            Filename = Session("MY-UsErNaMe") + "_" + Filename
            Dim FileInforamtion As New FileInfo(FileUpload1.FileName)
            Filename = Filename + FileInforamtion.Extension
            Try
                ''''''''''''''''''''''''''''''''
                ''''''''''' Checking '''''''''''
                If FileUpload1.FileContent.Length > 105000 Then
                    lblUpload.Text = "حجم عکس شما خارج از محدوده می باشد"
                    Exit Sub
                End If
                '
                FileUpload1.SaveAs(MapPath("~\content\images\Profile\Profile_Header\" + Filename))

                Dim bt As New Bitmap(MapPath("~\content\images\Profile\Profile_Header\" + Filename))
                If bt.Width > 970 Or bt.Width < 964 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\content\images\Profile\Profile_Header\" + Filename))
                    lblUpload.Text = "طول عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                If bt.Height > 94 Or bt.Width < 88 Then
                    bt.Dispose()
                    File.Delete(MapPath("~\content\images\Profile\Profile_Header\" + Filename))
                    lblUpload.Text = "ارتفاع عکس خارج از محدوده می باشد"
                    Exit Sub
                End If
                bt.Dispose()
                '''''''''''''' End Checking '''''''''
                ' عکس قبلی پاک شده سپس عکس جدید جایگزین می وشد
                If ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe")) <> "" Then
                    File.Delete(MapPath("~\content\images\Profile\Profile_Header\" + ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe"))))
                End If
                ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 0, Filename)

                bt.Dispose()
                lblUpload.Text = ""
                FillPicture()

                '--------------------- Agar error dadah yani File Aks nist
                Dim bt_ As New Bitmap(MapPath("~\content\images\Profile\Profile_Header\" + Filename))
                Dim c As Color = bt_.GetPixel(1, 1)
                '---------------------
                bt_.Dispose()

            Catch ex As Exception
                If Err.Number = 5 Then
                    File.Delete(MapPath("~\content\images\Profile\Profile_Header\" + Filename))
                    lblUpload.Text = "فرمت فایل معتبر نمی باشد لطفا از فرمت های مجاز استفاده فرمایید"
                End If
            End Try
        End If
    End Sub

    Private Sub FillPicture()
        If ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe")) = "" Then
            'imgBG.ImageUrl = "~\content\images\Profile_View_Users\headerProfileDefault.jpg"
        Else
            imgBG.ImageUrl = "~\content\images\Profile\Profile_Header\" + ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe"))
        End If
    End Sub

    Protected Sub btnClassic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClassic.Click
        ' عکس قبلی پاک شده سپس عکس جدید جایگزین می وشد
        If ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe")) <> "" Then
            File.Delete(MapPath("~\content\images\Profile\Profile_Header\" + ClassHomeSetting.GetBG_Profile(Session("MY-UsErNaMe"))))
        End If
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 0, "")
        Response.Redirect("~\home\menu\setting\setting.aspx")
    End Sub

    Protected Sub btnDefault_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDefault.Click
        Dim Filename As String = Guid.NewGuid.ToString() + ".jpg"
        File.Copy(MapPath("~\content\images\Profile_View_Users\headerProfileDefault.jpg"), MapPath("~\content\images\profile\Profile_Header\" + Filename))
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 0, Filename)
        FillPicture()
    End Sub

    Protected Sub Rb_ShaahrVandi_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_ShaahrVandi_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 1, 1)
    End Sub
    Protected Sub Rb_ShaahrVandi_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_ShaahrVandi_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 1, 0)
    End Sub

    Protected Sub Rb_Visit_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Visit_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 2, 1)
    End Sub
    Protected Sub Rb_Visit_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Visit_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 2, 0)
    End Sub

    Protected Sub Rb_Update_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Update_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 3, 1)
    End Sub
    Protected Sub Rb_Update_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Update_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 3, 0)
    End Sub

    Protected Sub Rb_Event_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Event_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 4, 1)
    End Sub
    Protected Sub Rb_Event_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Event_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 4, 0)
    End Sub

    Protected Sub Rb_Know_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Know_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 5, 1)
    End Sub
    Protected Sub Rb_Know_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Know_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 5, 0)
    End Sub

    Protected Sub Rb_Citizen_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Citizen_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 6, 1)
    End Sub
    Protected Sub Rb_Citizen_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Citizen_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 6, 0)
    End Sub

    Protected Sub Rb_Work_Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Work_Yes.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 7, 1)
    End Sub
    Protected Sub Rb_Work_No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Work_No.CheckedChanged
        ClassHomeSetting.UpdateSetting(Session("MY-UsErNaMe"), 7, 0)
    End Sub

End Class
