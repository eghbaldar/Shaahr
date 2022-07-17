Imports Microsoft.VisualBasic
Imports System.Security.Cryptography


Public Class EnterUsers

    Dim DS_EnterUsers As New DS_EnterUsersTableAdapters.CheckUsersTableAdapter
    Dim DS_Query As New DS_EnterUsersTableAdapters.Query
    Dim DS_CMS_Complement As New DS_EnterUsersTableAdapters.tbl_CMS_ComplementTableAdapter
    Dim DS_CMS_NotMatch As New DS_EnterUsersTableAdapters.Tbl_CMS_NotMach_ComputerNameTableAdapter
    Dim DS_EnterStatistical As New DS_EnterUsersTableAdapters.Profile_EnterStatisticalTableAdapter
    Dim DS_CMS_Statistical As New DS_EnterUsersTableAdapters.CMS_StatisticalTableAdapter
    Dim DS_Peremission As New DS_EnterUsersTableAdapters.PermissionTableAdapter

    Public Function CheckAuth(ByVal email As String, ByVal password As String) As Boolean

        Dim Encrypt As New Encryptor
        Dim Pass As String = Encrypt.EncryptText(password, "GOD_mohammad_60592110128")

        If DS_EnterUsers.GetData(email, Pass).Rows(0)(0).ToString() = "1" Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function Get_FnLn_PicUser(ByVal email As String, ByVal index As Boolean) As String
        'IF index = true return firstname and lastname
        'IF index = false return address user's picture 
        Select Case index
            Case True
                Return DS_Query.Get_FnLn(email).ToString
            Case False
                Return DS_Query.Get_PicUser(email).ToString
        End Select
    End Function

    Public Function Get_DontEnter() As Boolean

        If DS_CMS_Complement.GetData().Rows(0)(2) = True Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function Get_TextDontEnter() As String
        Return DS_CMS_Complement.GetData().Rows(0)(3).ToString
    End Function

    Public Function Get_DontAds() As Boolean

        If DS_CMS_Complement.GetData().Rows(0)(4) = True Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function Get_Ads() As String()

        Dim Ads(5) As String
        For i As Byte = 0 To 5
            Ads(i) = DS_CMS_Complement.GetData().Rows(0)(i + 5).ToString
        Next
        Return Ads

    End Function

    Public Function Get_Header() As String
        Return DS_CMS_Complement.GetData().Rows(0)(1).ToString
    End Function

    Public Function Get_BandStatus(ByVal email As String) As Boolean
        Return DS_Query.getBand(email)
    End Function

    Public Function Get_DontRegister() As Boolean
        If DS_Query.getDontRegister() = 1 Then Return False
        If DS_Query.getDontRegister() = 0 Then Return True
    End Function

    Public Function CheckEmail(ByVal email As String) As Boolean
        If DS_Query.gerCheckEmail(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckUsername(ByVal username As String) As Boolean
        If DS_Query.gerCheckUsername(username) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function InsertNotMachComputerName(ByVal email As String, ByVal hads_computername As String, ByVal hads_statemenet As String) As Boolean
        Try
            DS_CMS_NotMatch.Insert1(email, hads_computername, hads_statemenet)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckDupReq(ByVal email As String) As Boolean
        If DS_CMS_NotMatch.getDuplicateReq(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckEmailUsername(ByVal email As String, ByVal username As String) As Boolean
        If DS_Query.CheckEmail_Username(username, email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetLastLognDate(ByVal email As String) As String
        Return DS_Query.getLastLoginDate(email)
    End Function

    Public Function UpdateCitizen(ByVal AuthCitizen As Boolean, ByVal email As String) As Boolean
        Try
            DS_Peremission.UpdateAuthCitizen(AuthCitizen, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'درج در جدول آمار مدیریتی سایت 
    Public Function InsertCMSStatistical(ByVal IP As String, ByVal Time As String, ByVal Date_ As String, ByVal Part As Byte) As Boolean
        Try
            DS_CMS_Statistical.InsertQuery(IP, Date_, Time, Part)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'وقتی کاربر دو ماه به بالا وارد پروفایل خودش نشود درجه های شهروندی او صفر خواهد شد
    Dim ClassProfileHome As New HomeProfile
    Public Sub CheckDecreaseDegreeUser(ByVal email As String)

        Dim LastLogin As String() = ClassProfileHome.GetLastLogin(email).Split(";")
        Dim tara As String = LastLogin(0)
        Dim tarb As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)

        Dim ta1, ta2, ta3 As Integer
        Dim tb1, tb2, tb3 As Integer
        Dim s, d As Double
        If Val(tara) = 0 Or tara = "" Or Val(tarb) = 0 Or tarb = "" Then Exit Sub
        s = Val(tara)
        d = Val(tarb)
        If s > d Then tarb = s : tara = d 'درصورتيکه تاريخ انتها کوچکتر از ابتدا وارد گردد اين تابع موقتا جاي آنها را بصورت خودکار تغيير و ادامه مراحل محاسبه را انجام مي دهد

        Dim arr1() As String = tara.Split("/")
        Dim arr2() As String = tarb.Split("/")

        ta1 = arr1(0)
        ta2 = arr1(1)
        ta3 = arr1(2)

        tb1 = arr2(0)
        tb2 = arr2(1)
        tb3 = arr2(2)

        If tb3 < ta3 Then
            tb3 = tb3 + Int(IIf(tb2 < 7, 31, 30))
            tb2 = tb2 - 1
        End If
        If tb2 = 0 Or tb2 < ta2 Then
            tb2 = tb2 + 12
            tb1 = tb1 - 1
        End If
        
        If (tb1 - ta1) > 0 Then
            DS_Query.ResetStarNum(email)
        End If
        If (tb2 - ta2) > 1 Then '1-->یعنی اگه تعداد ماه هایی که ورود نکرده بیشتر از یک ماه باشد ، درواقع یعنی 2 ماه ورود نکرده باشد ، درجه شهروندی را صفر کن
            DS_Query.ResetStarNum(email)
        End If

    End Sub

    ''' <summary>
    ''' (لینک عکس , آدرس عکس )
    ''' </summary>
    ''' <returns>(لینک عکس , آدرس عکس )</returns>
    ''' <remarks>(لینک عکس , آدرس عکس )</remarks>
    Public Function Get_PicDay(ByVal index As Byte) As String
        '0 -> get Path
        '2 -> get Link
        '1 -> get Text
        Select Case index
            Case 0
                Return DS_CMS_Complement.GetData().Rows(0)(0).ToString
            Case 1
                Return DS_CMS_Complement.GetData().Rows(0)(15).ToString
            Case 2
                Return DS_CMS_Complement.GetData().Rows(0)(11).ToString
        End Select
    End Function

    Public Function UpdateDAY_LinkText(ByVal PicDayLink As String, ByVal PicDayText As String) As Boolean
        Try
            DS_CMS_Complement.UpdateDAY_linkText(PicDayLink, PicDayText)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDAY_Pic(ByVal PicDay As String) As Boolean
        Try
            DS_CMS_Complement.UpdateDAY_pic(PicDay)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Enter Statistical
    Public Function InsertEnterStatistical(ByVal Email As String, ByVal IP As String) As Boolean
        Try
            DS_EnterStatistical.InsertEnterStatistical(Email, IP, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), "", "", 1)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateFlag_EnterStatistical(ByVal email As String) As Boolean
        Try
            DS_EnterStatistical.UpdateFlag(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateEnd_EnterStatistical(ByVal email As String) As Boolean
        Try
            DS_EnterStatistical.UpdateEnd(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Inserting into Table(s) when Craeting

    Dim DS_Complement As New DS_EnterUsersTableAdapters.Profile_complementTableAdapter
    Dim DS_Information As New DS_EnterUsersTableAdapters.Profile_InformationTableAdapter
    Dim DS_Mind As New DS_EnterUsersTableAdapters.Profile_MindTableAdapter
    Dim DS_Orginal As New DS_EnterUsersTableAdapters.Profile_OrginalTableAdapter
    Dim DS_Outward As New DS_EnterUsersTableAdapters.Profile_outwardTableAdapter
    Dim DS_Permission As New DS_EnterUsersTableAdapters.Profile_PermissionTableAdapter
    Dim DS_SecurityStatement As New DS_EnterUsersTableAdapters.Profile_Scure_StatementTableAdapter
    Dim DS_Setting As New DS_EnterUsersTableAdapters.Profile_SettingTableAdapter
    Dim DS_Avatars As New DS_EnterUsersTableAdapters.Profile_AvatarsTableAdapter
    Dim DS_Contact As New DS_EnterUsersTableAdapters.Profile_contactTableAdapter

    Dim DS_Profile_CreateUser As New DS_EnterUsersTableAdapters.Profile_CreateUserTableAdapter
    Public Function Insert_ProfileCraeteUser(ByVal Email As String, ByVal Fn_F As String, ByVal Ln_F As String, ByVal Fn_E As String, ByVal Ln_E As String, _
                                             ByVal username As String, ByVal password As String, ByVal IP As String, ByVal CitizenName As String, _
                                             ByVal textScure As String, ByVal PicPath As String, ByVal sex As Boolean) As Boolean
        Dim Encrypt As New Encryptor
        Dim Pass As String = Encrypt.EncryptText(password, "GOD_mohammad_60592110128")
        DS_Profile_CreateUser.GetData(Email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Fn_F, Ln_F, Fn_E, Ln_E, username, Pass, IP, CitizenName, textScure, PicPath, sex)

    End Function
    ''
    ''
    ''
    ''
    '' Code hae zir bayad pak shavad az 1 ta 2
    '1
    Public Function Insert_Complement(ByVal Email As String) As Boolean
        DS_Complement.InsertQuery(Email, 0, 1, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), 0)
    End Function

    Public Function Insert_Information(ByVal email As String, ByVal fn_f As String, ByVal ln_f As String, ByVal Fn_E As String, ByVal ln_e As String) As Boolean
        DS_Information.InsertQuery(email, fn_f, ln_f, Fn_E, ln_e, "", 1, 1300, 1, 1, "", 1, 1, 1, False, "", "", False, False, "", "", "", "", "", "", "")
    End Function

    Public Function Insert_Mind(ByVal email As String) As Boolean
        DS_Mind.InsertQuery(email, "", True, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate))
    End Function

    Public Function Insert_Orginal(ByVal username As String, ByVal password As String, ByVal email As String, ByVal IP As String) As Boolean
        Dim Encrypt As New Encryptor
        Dim Pass As String = Encrypt.EncryptText(password, "GOD_mohammad_60592110128")
        DS_Orginal.InsertQuery(username, Pass, email, 0, IP, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), True, "0;-1")
    End Function

    Public Function Insert_Outward(ByVal email As String) As Boolean
        DS_Outward.InsertQuery(email, "", 0, 0, "", "", "", "", "", "", "")
    End Function

    Public Function Insert_Permission(ByVal email As String, ByVal CitizenName As String) As Boolean
        DS_Permission.InsertQuery(email, False, False, CitizenName, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    End Function

    Public Function Insert_SecurityStatement(ByVal email As String, ByVal text As String) As Boolean
        DS_SecurityStatement.InsertQuery(email, text)
    End Function

    Public Function Insert_Setting(ByVal email As String) As Boolean
        DS_Setting.InsertQuery(email, True, True, True, True, True, True, "b56d709c-05f3-4431-bbe4-3f6b71863848.jpg", True)
    End Function

    Public Function Insert_Avatar(ByVal email As String, ByVal PicPath As String) As String
        DS_Avatars.InsertQuery(email, PicPath, True)
    End Function

    Public Function Insert_Contact(ByVal email As String) As Boolean
        DS_Contact.InsertQuery(email, "", "", "", "", 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", True)
    End Function
    '2
    ''
    ''
    ''
    ''
    ''
End Class
