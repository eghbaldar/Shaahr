Imports VB = Microsoft.VisualBasic
Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Public Class HomeSetting

    Dim DS_Query As New DS_SettingTableAdapters.Query
    Dim DS_Orginal As New DS_SettingTableAdapters.Profile_OrginalTableAdapter
    Dim DS_Information As New DS_SettingTableAdapters.tbl_Profile_InformationTableAdapter
    Dim DS_University As New DS_SettingTableAdapters.Tbl_CMS_UniversityTableAdapter
    Dim DS_Contact As New DS_SettingTableAdapters.tbl_Profile_contactTableAdapter
    Dim DS_outward As New DS_SettingTableAdapters.tbl_Profile_outwardTableAdapter
    Dim DS_FavoritCat As New DS_SettingTableAdapters.Favorits_CategoryTableAdapter
    Dim DS_Favorit As New DS_SettingTableAdapters.FavoritsTableAdapter
    Dim DS_Avatars As New DS_SettingTableAdapters.Profile_AvatarsTableAdapter
    Dim DS_Permission As New DS_SettingTableAdapters.Profile_PermissionTableAdapter
    Dim DS_CheckFriendFamilyWife As New DS_SettingTableAdapters.Home_Friends_Family_WifeTableAdapter
    Dim DS_Statement As New DS_SettingTableAdapters.Profile_Scure_StatementTableAdapter
    Dim DS_CheckStatement As New DS_SettingTableAdapters.CheckDupStatementTableAdapter
    Dim DS_Setting As New DS_SettingTableAdapters.Profile_SettingTableAdapter
    Dim DS_Request As New DS_SettingTableAdapters.Home_RequestTableAdapter
    Dim DS_TempFamily As New DS_SettingTableAdapters.Profile_TempFamilyTableAdapter
    Dim DS_SearchUsers As New DS_SettingTableAdapters.Home_SearchUsersTableAdapter
    Dim DS_SearchFamily As New DS_SettingTableAdapters.Home_SearchFamilysTableAdapter
    Dim DS_GetTypeFamily As New DS_SettingTableAdapters.GetTypeFamilyTableAdapter
    Dim DS_InboxSystem As New DS_SettingTableAdapters.Profile_InboxSystemTableAdapter
    Dim DS_Uni As New DS_SettingTableAdapters.CMS_UniversityTableAdapter
    Dim DS_Education As New DS_SettingTableAdapters.CMS_EducationTableAdapter

    Public Function getUser_Email_RegDate(ByVal email As String) As String()

        Dim s(2) As String
        s(0) = DS_Orginal.GetData(email).Rows(0)(1) 'username
        s(1) = DS_Orginal.GetData(email).Rows(0)(3) 'email
        s(2) = DS_Orginal.GetData(email).Rows(0)(6) 'regDate
        Return s

    End Function

    Public Function Athuenction(ByVal email As String, ByVal Pass As String) As Boolean

        Try
            Dim Encrypt As New Encryptor
            If Encrypt.EncryptText(Pass, "GOD_mohammad_60592110128").ToUpper.Trim = DS_Query.getPassByEmail(email).ToUpper.Trim Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try

    End Function

    Public Function CheckCharacter(ByVal text As String) As Byte

        '''''''''''''''RETURNs'''''''''''''''
        '>> 0 : OK
        '>> 1 : Not Standard (The First Letter is Number)
        '>> 2 : Not Standard (Character like *()&^%$...)
        '>> 3 : Not Standard (Farsi)
        ''''''''''''''''''''''''''''''''''''
        Dim s As String
        s = Text.Trim
        If Char.IsNumber(s.Substring(0, 1)) Then
            Return 1
            GoTo End_Error
        End If
        For i As Integer = 0 To s.Length - 1
            If Char.IsLetter(s.Substring(i, 1)) Then Continue For
            If Char.IsNumber(s.Substring(i, 1)) Then Continue For
            If s.Substring(i, 1) = "_" Then
                Continue For
            Else
                Return 2
                GoTo End_Error
            End If
        Next
        For i As Integer = 0 To s.Length - 1
            If Char.IsLetter(s.Substring(i, 1)) Then
                If Asc(s.Substring(i, 1)) > 198 Then
                    Return 3
                    GoTo End_Error
                End If
            End If
        Next
        Return 0
End_Error:


    End Function

    Public Function CheckDuplicateUser(ByVal user As String) As Boolean
        Try
            If DS_Query.CheckDupUser(user) > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateUsernameByEmail(ByVal user As String, ByVal email As String) As Boolean
        Try
            DS_Orginal.UpdateUsername(user, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdatePasswordByEmail(ByVal pass As String, ByVal email As String) As Boolean
        Try
            Dim Encrypt As New Encryptor
            DS_Orginal.UpdatePassword(Encrypt.EncryptText(pass, "GOD_mohammad_60592110128"), email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckFarsi(ByVal C_S As String) As Byte

        ''''''''''''''''RETURNs'''''''''''''''
        ''>> 0 : OK
        ''>> 1 : Error
        'Dim s As String = text.Trim
        'For i As Integer = 0 To s.Length - 1
        '    If Asc(s.Substring(i, 1)) = 32 Then Continue For
        '    If Not Char.IsLetterOrDigit(s.Substring(i, 1)) Then
        '        Return 1
        '    End If
        'Next
        'For i As Integer = 0 To s.Length - 1
        '    If Asc(s.Substring(i, 1)) = 32 Then Continue For
        '    If Asc(s.Substring(i, 1)) = 144 Or Asc(s.Substring(i, 1)) = 152 Or Asc(s.Substring(i, 1)) = 198 Or Asc(s.Substring(i, 1)) = 129 Or Asc(s.Substring(i, 1)) = 142 Or Asc(s.Substring(i, 1)) = 141 Then
        '        Continue For
        '    Else
        '        If Asc(s.Substring(i, 1)) < 199 Then
        '            Return 1
        '        End If
        '    End If
        'Next
        'Return 0
        Dim Var_Loop, Var_Len As Integer
        Var_Len = Len(C_S)
        C_S = LCase(C_S)
        For Var_Loop = 1 To Var_Len
            '0 To 9
            If Asc(Mid(C_S, Var_Loop, 1)) = 48 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 49 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 51 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 52 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 53 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 54 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 55 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 56 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 57 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 58 Then Continue For
            'UnderLine
            If Asc(Mid(C_S, Var_Loop, 1)) = 95 Then Continue For

            If Mid(C_S, Var_Loop, 1) < Chr(220) Or Mid(C_S, Var_Loop, 1) > Chr(128) Then
                Return 1
            End If
        Next
        Return 0

    End Function

    Public Function CheckEngilisi(ByVal C_S As String) As Byte

        ''''''''''''''''RETURNs'''''''''''''''
        ''>> 0 : OK
        ''>> 1 : Error
        'Dim s As String
        's = text.Trim
        'For i As Integer = 0 To s.Length - 1
        '    If Asc(s.Substring(i, 1)) = 32 Then Continue For
        '    If Not Char.IsLetterOrDigit(s.Substring(i, 1)) Then
        '        Return 1
        '    End If
        'Next
        'For i As Integer = 0 To s.Length - 1
        '    If Asc(s.Substring(i, 1)) = 32 Then Continue For
        '    If Asc(s.Substring(i, 1).ToLower) < 97 Or Asc(s.Substring(i, 1).ToLower) > 122 Then
        '        Return 1
        '    End If
        'Next
        'Return 0
        ''''''''''''''''''''''''' New Code '''''''''''''''''''''''''''''
        Dim Var_Loop, Var_Len As Integer
        Var_Len = Len(C_S)
        C_S = LCase(C_S)
        For Var_Loop = 1 To Var_Len
            '0 To 9
            If Asc(Mid(C_S, Var_Loop, 1)) = 48 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 49 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 51 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 52 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 53 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 54 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 55 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 56 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 57 Then Continue For
            If Asc(Mid(C_S, Var_Loop, 1)) = 58 Then Continue For
            'UnderLine
            If Asc(Mid(C_S, Var_Loop, 1)) = 95 Then Continue For

            If Mid(C_S, Var_Loop, 1) < Chr(97) Or Mid(C_S, Var_Loop, 1) > Chr(122) Then
                Return 1
            End If
        Next
        Return 0

    End Function

    Public Function UpdateInformation(ByVal fn_f As String, ByVal ln_f As String, ByVal fn_e As String, ByVal ln_e As String, ByVal _alias As String, ByVal Education As String, ByVal birth_year As Integer, ByVal birth_month As Integer, ByVal birth_day As Integer, ByVal birth_time As String, _
                                              ByVal code_country As Integer, ByVal code_state As Integer, ByVal code_city As Integer, ByVal none_location As String, ByVal location As String, ByVal address As String, ByVal sex As Boolean, ByVal marrid_single As String, _
                                              ByVal dodi As String, ByVal religion As String, ByVal mazhab As String, ByVal foriegn_lanuage As String, ByVal poletic As String, ByVal webpage As String, ByVal blogpage As String, ByVal email As String) As Boolean
        Try
            DS_Information.UpdateInformation(fn_f, ln_f, fn_e, ln_e, _alias, Education, birth_year, birth_month, birth_day, birth_time, _
                                              code_country, code_state, code_city, none_location, location, address, sex, marrid_single, _
                                              dodi, religion, mazhab, foriegn_lanuage, poletic, webpage, blogpage, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UniversityName(ByVal code As Long) As String
        Return DS_University.getuniversityName(code)
    End Function

    Public Function UpdateContact(ByVal school As String, ByVal middle_school As String, ByVal highshcool As String, ByVal pre_university As String, ByVal university As Integer, ByVal job As String, ByVal job_location As String, ByVal job_tell As String, _
                                     ByVal emergency_tell As String, ByVal company_name As String, ByVal company_location As String, ByVal company_detail As String, ByVal company_weblog As String, ByVal second_email As String, ByVal yahooID As String, ByVal gmailID As String, _
                                     ByVal FacebookID As String, ByVal TwitterID As String, ByVal HotmailID As String, ByVal oovooID As String, ByVal skypID As String, ByVal ShowOrgEmail As Boolean, ByVal email As String) As Boolean
        Try
            DS_Contact.UpdateContact(school, middle_school, highshcool, pre_university, university, job, job_location, job_tell, _
                                     emergency_tell, company_name, company_location, company_detail, company_weblog, second_email, yahooID, gmailID, _
                                     FacebookID, TwitterID, HotmailID, oovooID, skypID, ShowOrgEmail, email)

            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateOutWard(ByVal height As String, ByVal weight As String, ByVal morality As String, ByVal cover As String, _
                                  ByVal color_eyes As String, ByVal color_hairs As String, ByVal organ As String, _
                                  ByVal behavior As String, ByVal status_hair As String, ByVal email As String)
        DS_outward.UpdateOutward(height, weight, morality, cover, color_eyes, color_hairs, organ, behavior, status_hair, email)
    End Function

    Public Function UpdateOutWard(ByVal color_skin As Integer, ByVal email As String)
        DS_outward.UpdateColorSkin(color_skin, email)
    End Function

    Public Function CountFavoritsByCategoryCode(ByVal code As Long) As String
        Return DS_FavoritCat.getFavoritsByCategoryCode(code)
    End Function

    Public Function CheckFavorit(ByVal codeFavorit As Long, ByVal email As String) As Boolean
        Try
            If DS_Favorit.CheckFavorit(codeFavorit, email) > 0 Then
                'In Favorit baraye in EMAIL ghablan sabt shode astr
                Return False
            Else
                Return True
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertOrUpdateFavorit(ByVal code As Long, ByVal email As String) As Boolean
        Try
            If DS_Favorit.CheckFavorit(code, email) > 0 Then
                'Delete
                DS_Favorit.DeleteFavorit(email, code)
            Else
                'Insert
                DS_Favorit.InsertFavorit(code, email)
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateFlagAvatars(ByVal ID As Long, ByVal email As String) As Boolean
        Try
            DS_Avatars.UpdateFlag(ID, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteAvatar(ByVal ID As Long) As Boolean
        Try
            DS_Avatars.DeleteAvatarByID(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertAvatar(ByVal email As String, ByVal picpath As String) As Boolean
        If DS_Avatars.CheckCountAvatar(email) > 0 Then
            DS_Avatars.InsertAvatar(email, PicPath, 0)
        Else
            DS_Avatars.InsertAvatar(email, PicPath, 1)
        End If
    End Function

    Public Function GetCountCommentByCode(ByVal code As Long) As String
        Return DS_Query.getCountCommentByCode(code)
    End Function

    Public Function GetCountLikeByCode(ByVal code As Long) As String
        Return DS_Query.getCountLikePostByCode(code)
    End Function

    Public Function DeleteObject(ByVal Code As Long) As Boolean
        Try
            DS_Query.DeleteObject(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'User's Volume

    Public Function CheckNormalVolume(ByVal PathWithMapPath As String, ByVal email As String, ByVal TableName As String, ByVal FieldName As String) As String ' Boolean

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("select [" + FieldName + "] from " + TableName, sqlconn)
        Dim rb As SqlDataReader
        Dim lst_PicPath As New List(Of String)
        sqlconn.Open()
        rb = sqlcom.ExecuteReader
        While rb.Read
            lst_PicPath.Add(rb(0))
        End While
        sqlconn.Close()
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim iUse As Integer = 0
        Dim Path As New DirectoryInfo(PathWithMapPath)
        Dim Files() As FileInfo = Path.GetFiles
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        For i As Long = 0 To Files.Length - 1
            For j As Long = 0 To lst_PicPath.Count - 1
                Dim infoFiles As New FileInfo(Files(i).Name)
                If lst_PicPath(j).Trim.ToUpper = infoFiles.Name.Trim.ToUpper Then
                    '
                    Dim S() As String = Files(i).Name.Split("_")
                    If S(0) = email Then iUse += Files(i).Length
                    '
                End If
            Next
        Next
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Return iUse


    End Function

    'Permission

    Public Function Permission(ByVal email As String) As DataRow
        Return DS_Permission.GetData(email).Rows(0)
    End Function

    Public Function UpdatePermission_Entering(ByVal email As String, ByVal bit As Boolean, ByVal Index As Byte) As Boolean
        Try
            Select Case Index
                Case 1 'جمله امنیتی
                    DS_Permission.Up_StatementSecure(bit, email)
                Case 2 'تایید همشهری
                    DS_Permission.Up_AuthCitizen(bit, email)
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdatePermission_Sharing(ByVal email As String, ByVal check As Byte, ByVal index As Byte) As Boolean
        Try
            Select Case index
                Case 1 'نمایش لیست دوستان
                    DS_Permission.Up_ShowFriendsList(check, email)
                Case 2 'نمایش لیست بستگان
                    DS_Permission.Up_ShowFamilysList(check, email)
                Case 3 'نمایش شهرها
                    DS_Permission.Up_ShowShaahrList(check, email)
                Case 4 'نمایش آلبوم تصاویر
                    DS_Permission.Up_ShowAlbum(check, email)
                Case 5 'نمایش نظرسنجی ها
                    DS_Permission.Up_ShowPolling(check, email)
                Case 6 'نمایش اطلاعات شخصی
                    DS_Permission.Up_ShowInfoPersonal(check, email)
                Case 7 'نمایش اطلاعات ظاهری
                    DS_Permission.Up_ShowOutWard(check, email)
                Case 8 'نمایش علاقمندی ها
                    DS_Permission.Up_ShowFavorit(check, email)
                Case 9 'نمایش اطلاعات ارتباطی
                    DS_Permission.Up_ShowContact(check, email)
                Case 10 'ارسال عکس
                    DS_Permission.Up_getPhoto(check, email)
                Case 11 'ارسال لینک
                    DS_Permission.Up_getLink(check, email)
                Case 12 'ارسال نوشته
                    DS_Permission.Up_getText(check, email)
                Case 13 'گرفتن پیام فردی
                    DS_Permission.Up_getMessage(check, email)
                Case 14 'گرفتن پیام گروهی
                    DS_Permission.Up_getGroupMessage(check, email)
                Case 15 'نمایش بروزرسانی برای
                    DS_Permission.Up_ShowUpdateNews(check, email)
                Case 16 'نمایش بروزرسانی برای
                    DS_Permission.Up_ShowCommonAlbum(check, email)
                Case 17 'مخفی سازی تاریخ آخرین لاگین کاربران
                    DS_Permission.Up_LastLogin(check, email)
                Case 18 'اجازه گفتگوی آنلاین
                    DS_Permission.Up_AllowChat(check, email)
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Check_FriendFamilyWife(ByVal email As String, ByVal user As String, ByVal index As Byte) As Boolean
        ' Try
        Select Case index
            Case 1
                'index 1===> dostan
                If DS_CheckFriendFamilyWife.GetData(email, user, 1).Rows.Count > 0 Then
                    Return False
                Else
                    Return True
                End If
            Case 2
                'index 2===> bastegan (not wife)
                If DS_CheckFriendFamilyWife.GetData(email, user, 2).Rows.Count > 0 Then
                    Return False
                Else
                    Return True
                End If
            Case 3
                'index 3===> wife
                If DS_CheckFriendFamilyWife.GetData(email, user, 3).Rows.Count > 0 Then
                    Return False
                Else
                    Return True
                End If
        End Select
        'Catch ex As Exception
        '    Return False
        'End Try
    End Function

    'Security Part

    Public Function GetStatementSecurity(ByVal email As String) As String
        Return DS_Statement.GetData(email).Rows(0)(2).ToString
    End Function

    Public Function UpdateStatement(ByVal text As String, ByVal email As String) As Boolean
        Try
            DS_Statement.UpdateSecureStatement(Text, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckDuplicateSecureStatement(ByVal email As String, ByVal text As String) As Boolean
        If DS_CheckStatement.GetData(text.Replace("ي", "ی"), email).Rows(0)(0).ToString() = "1" Then
            Return False
        Else
            Return True
        End If
    End Function

    Public Function GetIDStatementSecurtiy(ByVal email As String) As String
        Return DS_Query.GetID_ByEmail_StatementSecurity(email)
    End Function

    Public Function UpdateBandUser(ByVal email As String, ByVal band As Boolean) As Boolean
        Try
            DS_Query.UpdateBandUser(band, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";-2", email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateCitizenName(ByVal name As String, ByVal email As String) As Boolean
        Try
            DS_Permission.UpdateCitizenName(Name, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Setting
    Public Function UpdateUniversity(ByVal uni As Long, ByVal email As String) As Boolean
        Try
            DS_Uni.UpdateUni(uni, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetBG_Profile(ByVal email As String) As String
        Return DS_Setting.GetData(email).Rows(0)(8).ToString
    End Function

    Public Function StatusPanels(ByVal email As String, ByVal Index As Byte) As Boolean
        Select Case Index
            Case 1
                Return DS_Setting.GetData(email).Rows(0)(2) 'P1
            Case 2
                Return DS_Setting.GetData(email).Rows(0)(3) 'P2
            Case 3
                Return DS_Setting.GetData(email).Rows(0)(4) 'P3
            Case 4
                Return DS_Setting.GetData(email).Rows(0)(5) 'P4
            Case 5
                Return DS_Setting.GetData(email).Rows(0)(6) 'P5
            Case 6
                Return DS_Setting.GetData(email).Rows(0)(7) 'P6
            Case 7
                Return DS_Setting.GetData(email).Rows(0)(9) 'P6
        End Select
    End Function

    Public Function UpdateSetting(ByVal email As String, ByVal Index As String, ByVal value As String) As Boolean
        Try
            Select Case Index
                Case 0
                    DS_Setting.Up_BG(value, email) 'BG_Profile
                Case 1
                    DS_Setting.Up_P1(value, email) 'P1
                Case 2
                    DS_Setting.Up_P2(value, email) 'P2
                Case 3
                    DS_Setting.Up_P3(value, email) 'P3
                Case 4
                    DS_Setting.Up_P4(value, email) 'P4
                Case 5
                    DS_Setting.Up_P5(value, email) 'P5
                Case 6
                    DS_Setting.Up_P6(value, email) 'P6
                Case 7
                    DS_Setting.Up_P7(value, email) 'P7
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    ''' <summary>
    ''' اختلاف بین تاریخ ها
    ''' </summary>
    ''' <param name="DateSmall">تاریخ کوچکتر</param>
    ''' <param name="DateBig">تاریخ بزرگتر مثل تاریخ جاری سیستم</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function diffDate(ByVal DateSmall As String, ByVal DateBig As String) As String

        Dim ta1, ta2, ta3 As Integer
        Dim tb1, tb2, tb3 As Integer
        Dim s, d As Double
        If Val(DateSmall) = 0 Or DateSmall = "" Or Val(DateBig) = 0 Or DateBig = "" Then diffDate = " " : Exit Function
        s = Val(DateSmall)
        d = Val(DateBig)
        If s > d Then DateBig = s : DateSmall = d 'درصورتيکه تاريخ انتها کوچکتر از ابتدا وارد گردد اين تابع موقتا جاي آنها را بصورت خودکار تغيير و ادامه مراحل محاسبه را انجام مي دهد

        Dim arr1() As String = DateSmall.Split("/")
        Dim arr2() As String = DateBig.Split("/")

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

        diffDate = GetFigures((tb1 - ta1)) & "سال و" & GetFigures((tb2 - ta2)) & "ماه و" & GetFigures((tb3 - ta3)) & "روز "

    End Function

    Public Function GetDiffrentDateReg(ByVal email As String) As String
        Return DS_Query.getDiffDaterReg(email)
    End Function

    Function GetFigures(ByRef x As String) As String

        Dim one(10) As String
        Dim two(10) As String
        Dim Three(10) As String
        Dim Hundred(10) As String
        Dim Thousand As String
        Dim lakh As String
        Dim Crore As String
        Dim Billion As String
        Dim Million As String
        Dim Trillion As String



        one(0) = "صفر" : one(1) = "یک" : one(2) = "دو" : one(3) = "سه" : one(4) = "چهار"
        one(5) = "پنج" : one(6) = "شش" : one(7) = "هفت" : one(8) = "هشت" : one(9) = "نه"

        two(0) = "ده" : two(1) = "یازده" : two(2) = "دوازده" : two(3) = "سیزده" : two(4) = "چهارده"
        two(5) = "پانزده" : two(6) = "شانزده" : two(7) = "هفده" : two(8) = "هیجده" : two(9) = "نوزده"

        Three(2) = "بیست" : Three(3) = "سی" : Three(4) = "چهل" : Three(5) = "پنجاه"
        Three(6) = "شصت" : Three(7) = "هفتاد" : Three(8) = "هشتاد" : Three(9) = "نود"

        Hundred(1) = "یکصد" : Hundred(2) = "دویست" : Hundred(3) = "سیصد"
        Hundred(4) = "چهارصد" : Hundred(5) = "پانصد" : Hundred(6) = "ششصد"
        Hundred(7) = "هفتصد" : Hundred(8) = "هشتصد" : Hundred(9) = "نه صد"

        Thousand = "هزار" : lakh = " هزار" : Crore = " میلیون" : Billion = "میلیارد"
        Million = "میلیون" : Trillion = "تریلیون"

        Dim inp, RetVal As String

        inp = CStr(Val(x))
        Select Case Len(inp)
            Case 1
                If x <> "" Then RetVal = one(CInt(x))
            Case 2
                If Int(CDbl(VB.Right(inp, 1))) > 0 And CDbl(VB.Left(inp, 1)) > 1 Then RetVal = " و " & GetFigures(CStr(Int(CDbl(VB.Right(inp, 1)))))

                If CDbl(VB.Left(inp, 1)) > 1 Then RetVal = Three(CInt(VB.Left(inp, 1))) & RetVal

                If CDbl(VB.Left(inp, 1)) = 1 Then RetVal = two(CInt(VB.Right(inp, 1)))

            Case 3
                If Int(CDbl(VB.Right(inp, 2))) > 0 Then RetVal = " و " & GetFigures(CStr(Int(CDbl(VB.Right(inp, 2)))))
                RetVal = Hundred(Int(CDbl(VB.Left(inp, 1)))) & RetVal
            Case 4
                If Int(CDbl(VB.Right(inp, 3))) > 0 Then RetVal = " و " & _
              GetFigures(CStr(Int(CDbl(VB.Right(inp, 3)))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 1)))) & Thousand & RetVal
            Case 5
                If Int(CDbl(VB.Right(inp, 3))) > 0 Then RetVal = " و " & GetFigures(CStr(Int(CDbl(VB.Right(inp, 3)))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 2)))) & Thousand & RetVal
            Case 6
                If CInt(VB.Right(inp, 5)) = 0 Then
                    RetVal = Hundred(Int(CDbl(VB.Left(inp, 1)))) & lakh
                Else
                    If CInt(VB.Right(inp, 3)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 3))))

                    RetVal = GetFigures(Int(CDbl(VB.Left(inp, 3)))) & lakh & RetVal
                End If
            Case 7
                If CInt(VB.Right(inp, 6)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 6))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 1)))) & Crore & RetVal
            Case 8
                If CInt(VB.Right(inp, 6)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 6))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 2)))) & Crore & RetVal
            Case 9
                If CInt(VB.Right(inp, 6)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 6))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 3)))) & Crore & RetVal
            Case 10
                If CInt(VB.Right(inp, 9)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 9))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 1)))) & Billion & RetVal
            Case 11
                If CInt(VB.Right(inp, 9)) > 0 Then RetVal = " و " & GetFigures(CStr(CInt(VB.Right(inp, 9))))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 2)))) & Billion & RetVal
            Case 12
                If Val(VB.Right(inp, 9)) > 0 Then RetVal = " و " & GetFigures(VB.Right(inp, 9))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 3)))) & Million & RetVal
            Case 13
                If Val(VB.Right(inp, 12)) > 0 Then RetVal = " و " & GetFigures(VB.Right(inp, 12))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 1)))) & Million & RetVal
            Case 14
                If Val(VB.Right(inp, 12)) > 0 Then RetVal = " و " & GetFigures(VB.Right(inp, 12))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 2)))) & Trillion & RetVal
            Case 15
                If Val(VB.Right(inp, 12)) > 0 Then RetVal = " و " & GetFigures(VB.Right(inp, 12))
                RetVal = GetFigures(Int(CDbl(VB.Left(inp, 3)))) & Trillion & RetVal
        End Select
        GetFigures = " " & RetVal & " "
        GetFigures = Replace(GetFigures, "  ", " ")
    End Function

    Public Function GetEducation(ByVal CodeEducation As Integer) As String
        Return DS_Education.getEducation(CodeEducation)
    End Function

    Public Function GetCountAvatars(ByVal email As String) As String
        Return DS_Query.getCountAvatars(email)
    End Function

    'Request
    Public Function UpdateFlagRequest(ByVal flag As Byte, ByVal id As Long) As Boolean
        Try
            DS_Request.UpdateFlag(flag, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDateRequest(ByVal id As Long) As Boolean
        Try
            DS_Request.UpdateDateRequest(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteRequestByID(ByVal id As Long) As Boolean
        Try
            DS_Request.DeleteRequestByID(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertTempFlamily(ByVal EmailFrom As String, ByVal EmailTo As String, ByVal Type As Byte, ByVal ID_Relation As Long) As Boolean
        Try
            DS_TempFamily.InsertTempFamily(EmailFrom, EmailTo, Type, ID_Relation)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DuplicateRequestFamily(ByVal EmailFrom As String, ByVal EmailTo As String) As Boolean
        If DS_Query.CheckDuplicateFamily(EmailFrom, EmailTo) = 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function DeleteTempFamily(ByVal id As Long) As Boolean
        Try
            DS_TempFamily.DeleteTempFamily(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateRelationType(ByVal type As Byte, ByVal id As Long) As Boolean
        Try
            DS_TempFamily.UpdateRelation(type, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectSearchFriends(ByVal index As Byte, ByVal email As String, ByVal strFarsi As String, ByVal strEngilis As String) As DataTable
        Return DS_SearchUsers.GetData(index, email, strFarsi, strEngilis)
    End Function

    Public Function SelectSearchFamily(ByVal index As Byte, ByVal email As String, ByVal strFarsi As String, ByVal strEngilis As String) As DataTable
        Return DS_SearchFamily.GetData(index, email, strFarsi, strEngilis)
    End Function

    Public Function GetTypeFamily(ByVal user As String, ByVal email As String) As String
        Return DS_GetTypeFamily.GetData(user, email).Rows(0)(0).ToString
    End Function

    Public Function DeleteTempFamily(ByVal ID_Relation As Long, ByVal EmailTo As String) As Boolean
        Try
            DS_Query.DeleteTempFamily(ID_Relation, EmailTo)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Inbox systemi
    Public Function InsertInboxSystem(ByVal Email As String, ByVal subject As String, ByVal message As String) As Boolean
        Try
            DS_InboxSystem.InsertInbox(Email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), subject, message)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteInboxSystem(ByVal id As Long) As Boolean
        Try
            Return DS_InboxSystem.DeleteInbox(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountInboxSystem(ByVal email As String) As String
        Return DS_InboxSystem.getCount(email)
    End Function

    Public Function GetMessage(ByVal ID As Long) As String
        Return DS_InboxSystem.getMessage(ID)
    End Function

End Class


