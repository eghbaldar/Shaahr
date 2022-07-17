
Partial Class outscope_CreateAccount_Default
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassEnter As New EnterUsers
    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ClassEnter.Get_DontRegister Then Response.Redirect("~/Outscope/state.aspx?state=NotRegister_OR_Entering")
        Captcha.Width = 727
        Title = "شهر دات کام -  ایجاد حساب کاربری جدید"

    End Sub

    Public Function CheckEngilisi(ByVal text As String) As Boolean

        'Return True --> Correct
        'Return False --> Incorrect : this text include farsi character
        Dim str_ As String = text.ToLower
        Dim EN As String = " 48 , 49 , 50 , 51 , 52 , 53 , 54 , 55 , 56 , 57 , " & " 45 , 95 , 46 , 97 , 98 , 99 , 100 , 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 109 , 110 , 111 , 112 , 113 , 114 , 115 , 116 , 117 , 118 , 119 , 120 , 121 , 122"
        For i As Integer = 0 To str_.Length - 1
            If EN.IndexOf(Str(Asc(str_.Substring(i, 1)))) = "-1" Then Return False
        Next
        Return True

    End Function

    Function CheckDuplicate3More(ByVal text As String) As Boolean

        'Return True --> Correct
        'Return False --> Incorrect : this text include more 3 character same togheter
        For i As Integer = 0 To text.Length - 1
            Dim jDuplicate As Byte
            If (i <> text.Length - 1) Then
                If (text.Substring(i, 1) = text.Substring(i + 1, 1)) Then
                    If jDuplicate > 1 Then
                        Return False
                    Else
                        jDuplicate += 1
                    End If
                End If
            End If
        Next
        Return True

    End Function

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRegister.Click

        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''
        If ClassEnter.CheckEmail(txtEmail.Text) Then
            lbl.Text = "این پست الکترونیکی قبلا در سیستم ثبت شده است."
            Exit Sub
        End If

        If ClassEnter.CheckUsername(txtUsername.Text) Then
            lbl.Text = "لطفا نام کاربری دیگری را انتخاب کنید این نام کاربری تکراریست."
            Exit Sub
        End If

        If Not CheckEngilisi(txtUsername.Text) Then
            lbl.Text = "نام کاربری باید شامل حروف انگلیسی و نیز استفاده از کاراکتر (_) و (.) بدون استفاده از فاصله مجاز باشد."
            Exit Sub
        End If

        If Not CheckDuplicate3More(txtUsername.Text) Then
            lbl.Text = "نام کاربری نباید شامل کارکترهای پست سر هم باشد."
            Exit Sub
        End If

        If Not Chk_Raw.Checked Then
            lbl.Text = "لطفا قوانین شهر را مطالعه کرده و برای ثبت نام آن را تایید کنید."
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''

        Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Trim.Split("/")
        Dim r As New Random
        Dim Filename As String = s(0).ToString + s(1).ToString + s(2).ToString + "-" + r.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Filename = txtEmail.Text + "_" + Filename
        IO.File.Copy(MapPath("~\content\images\home\DefualtAvatar.JPG"), MapPath("~\content\images\Profile\Avatars\" + Filename + ".JPG"))
        ' '' ''ClassEnter.Insert_Avatar(txtEmail.Text, Filename + ".JPG")
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Dim bSex As Boolean
        If rbMale.Checked Then bSex = False
        If rbFamale.Checked Then bSex = True

        ClassEnter.Insert_ProfileCraeteUser(txtEmail.Text.ToLower, txtFn_F.Text, txtLn_F.Text, "", "", txtUsername.Text, txtPassword.Text, Request.UserHostName, "", txtSecurityStatement.Text, Filename + ".JPG", bSex)

        lbl.Text = ""
        txtEmail.Text = ""
        txtFn_F.Text = ""
        txtLn_F.Text = ""
        txtPassword.Text = ""
        txtSecurityStatement.Text = ""
        txtUsername.Text = ""
        Chk_Raw.Checked = False
        Response.Redirect("~\outscope\state.aspx?state=create")


    End Sub

End Class
