
Partial Class Shaahr_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    '
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "ساختمان مدیریتی شهر دات کام - درخواست تاسیس شهر"

        Captcha.Width = 627

        lblFunder.Text = ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe"))

        If ClassCMSShaahr.GetShaahr_FundationJiring.Trim() = String.Empty Then
            'رایگان
            MultiViewJiring.ActiveViewIndex = 1
        Else
            'جیرینگی
            MultiViewJiring.ActiveViewIndex = 0
            lblWithJiring.Text = String.Format("ارزش تاسیس شهر {0} جیرینگ", "<span style='font-family:koodak;font-size:18px;'>" + ClassCMSShaahr.GetShaahr_FundationJiring.Trim() + "</span>")
        End If

    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsert.Click

        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''
        If Check_Silab(txtName.Text) Then
            lblName.Text = ""
            ''''''''''''''''''''''

            If Not ClassCMSShaahr.GetDuplicateRequestShaahr(Session("")) Then
                lblNotEnough.Text = "<blink>" + "کاربر محترم درخواست پیشین شما هنوز بررسی نشده، تا بررسی کامل آن، لطفا صبر کنید.با تشکر" + "</blink>"
                Exit Sub
            End If


            If ClassCMSShaahr.GetShaahr_FundationJiring.Trim() <> Nothing Then
                If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < Val(ClassCMSShaahr.GetShaahr_FundationJiring.Trim()) Then
                    lblNotEnough.Text = "<div style='background-color:#efd4d4;height:17px;width:630px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px;padding:5px;'>کاربر محترم; موجودی شما برای درخواست تاسیس شهر کافی نمی باشد.</div>"
                    Exit Sub
                End If
            End If            
            ''
            If ClassShaahr.InsertRequest_FundationShaahr(cmbState.SelectedValue, cmbFavorits.SelectedValue, Check_Correct(txtName.Text), txtCause.Text, Session("MY-UsErNaMe"), 2, "", 2, ClassCMSShaahr.GetShaahr_FundationJiring.Trim()) Then
                ClassShaahr.Insert_ShaahrComplement(Session("MY-UsErNaMe"))
                ClassStage.UpdateUserJiring(ClassCMSShaahr.GetShaahr_FundationJiring.Trim(), Session("MY-UsErNaMe"))
                MultiView.ActiveViewIndex = 1
                lblOk_Nok.Text = "کاربر محترم، در خواست شما با موفقیت ثبت شد، لطفا منتظر بمانید تا پیام تایید یا عدم تایید به شما برسد."
            Else
                MultiView.ActiveViewIndex = 1
                lblOk_Nok.Text = "کاربر محترم، اطلاعات شما ثبت نشد، لطفا دوباره تلاش کنید."
            End If
            txtCause.Text = ""
            txtName.Text = ""
            ''''''''''''''''''''''
        Else
            lblName.Text = "شما حداکثر باید از چهار کلمه برای نام شهر خود استفاده کنید."
        End If


    End Sub

    Private Function Check_Silab(ByVal Name As String) As Boolean

        Dim j As Integer = 0
        Dim n As Integer = 0
        Dim m As Integer = 0
        Dim txt As String = Name.Trim
        Dim l As Integer = txt.Length

        For i = 1 To l
            n = InStr(txt, "  ")
            If n <> 0 Then
                txt = txt.Remove(n, 1)
            End If
        Next

        l = txt.Length
        For j = 1 To l - 1
            If txt.Substring(j, 1) = " " Then
                m = m + 1
            End If
        Next
        If m + 1 >= 5 Then
            Return False
        Else
            Return True
        End If

    End Function

    Private Function Check_Correct(ByVal Name As String) As String

        Dim j As Integer = 0
        Dim n As Integer = 0
        Dim m As Integer = 0
        Dim txt As String = Name.Trim
        Dim l As Integer = txt.Length

        For i = 1 To l
            n = InStr(txt, "  ")
            If n <> 0 Then
                txt = txt.Remove(n, 1)
            End If
        Next
        Return txt

    End Function

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Public Function GetFav(ByVal code As String) As String
        Return ClassShaahr.GetFavorit(code)
    End Function

    Public Function GetState(ByVal codestate As String) As String
        Select Case codestate
            Case 1
                Return "استان اول"
            Case 2
                Return "استان دوم"
            Case 3
                Return "استان سوم"
            Case 4
                Return "استان چهارم"
            Case 5
                Return "استان پنجم"
        End Select
    End Function

End Class
