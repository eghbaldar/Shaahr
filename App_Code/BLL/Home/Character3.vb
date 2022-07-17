Imports Microsoft.VisualBasic

Public Class Character3

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    '------------
    Dim DS_Character3_Users As New DS_Character3TableAdapters.Profile_Character3_UsersTableAdapter
    Dim DS_Query As New DS_Character3TableAdapters.Query
    Dim DS_Character3_InsertCompulsory As New DS_Character3TableAdapters.Home_Character3_InsertCompulsoryTableAdapter
    Dim DS_Character3_OverOnMonthNoEnter As New DS_Character3TableAdapters.Home_Character3_OverOneMonthNoEnterTableAdapter
    Dim DS_Character3_ShaahrsUser As New DS_ShaahrTableAdapters.Character3_ShaahrsTableAdapter

    Public Function Count_Character3_Users(ByVal email As String) As String
        Return DS_Character3_Users.Count_Character3_Users(email)
    End Function

    Public Function Get_Type_Character3_Users(ByVal email As String) As String
        Return DS_Character3_Users._getType(email)
    End Function

    Public Function Get_Character3_OverMonthNoEnter(ByVal email As String) As Boolean
        Try
            Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
            If DS_Character3_OverOnMonthNoEnter.GetData(email, sDate(0), sDate(1), sDate(2)).Rows(0)(0).ToString = "1" Then
                Return True 'یعنی از یکماه گذشته است و باید شخصیت سوم پسام ارسال کند
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Get_WhichOne(ByVal email As String) As String
        Return DS_Query._getWhichOne(email)
    End Function

    Public Function Get_Detail(ByVal email As String, ByVal whichone As String) As String
        Return DS_Query._getDetail(email, whichone)
    End Function

    Public Function Delete_Charaacter3_Users(ByVal email As String, ByVal WhichOne As String) As Boolean
        Return DS_Character3_Users.Delete_Character3_Users(email, WhichOne)
    End Function

    Public Function Insert_Charaacter3_Users(ByVal email As String, ByVal detail As String, ByVal WhichOne As String, ByVal type As Boolean) As Boolean
        Try
            Return DS_Character3_Users.Insert_Character3_Users(email, detail, WhichOne, type)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Get_Text_Character3_Relationship(ByVal email As String, ByVal index As Boolean) As String
        Dim r As New Random
        Select Case index
            Case True 'کسی که باعث ایجاد ارتباط شده است پس جیرینگ به او تعلق می گیرد
                Dim text As String = ""
                Select Case r.Next(1, 6)
                    Case 1
                        text = String.Format("از دوستی تو و  {0} خیلی خیلی خوشحال شدم امیدوارم دوستی خوبی داشته باشید بابت اینکار خوب که کردی {1} جیرینگ پاداش میگیری", ClassProfile_Section.GetFnLn(email), "12000")
                    Case 2
                        text = String.Format(" وای یه دوستی !!!! من عاشقه این دوستیام دیگه به تو و {0} تبریک میگم . بابت اینکار خوب که کردی {1} جیرینگ پاداش میگیری", ClassProfile_Section.GetFnLn(email), "12000")
                    Case 3
                        text = String.Format("کار خیلی خوبی کردی که {0} به دوستات اضافه کردی دوست بیشتر زندگیه قشنگتر .  بابت اینکار خوب که کردی {1} جیرینگ پاداش میگیری", ClassProfile_Section.GetFnLn(email), "12000")
                    Case 4
                        text = String.Format("فکرشو میکردم که بالاخره با {0} دوست بشی فط نپرس از کجا .  بابت اینکار خوب که کردی {1} جیرینگ پاداش میگیری", ClassProfile_Section.GetFnLn(email), "12000")
                    Case 5
                        text = String.Format("بنظرم {0} فرد مناسبیه برای یه رابطه دوستانه , تبریک میگم بهتون . بابت اینکار خوب که کردی {1} جیرینگ پاداش میگیری", ClassProfile_Section.GetFnLn(email), "12000")
                End Select
                Return text
            Case False 'کسی که باعث ارتباط نشده است
                Dim text As String = ""
                Select Case r.Next(1, 6)
                    Case 1
                        text = String.Format("از دوستی تو و  {0} خیلی خیلی خوشحال شدم امیدوارم دوستی خوبی داشته باشید", ClassProfile_Section.GetFnLn(email))
                    Case 2
                        text = String.Format("وای یه دوستی !!!! من عاشقه این دوستیام دیگه به تو و {0} تبریک میگم", ClassProfile_Section.GetFnLn(email))
                    Case 3
                        text = String.Format("کار خیلی خوبی کردی که {0} به دوستات اضافه کردی دوست بیشتر زندگیه قشنگتر", ClassProfile_Section.GetFnLn(email))
                    Case 4
                        text = String.Format("فکرشو میکردم که بالاخره با {0} دوست بشی فط نپرس از کجا", ClassProfile_Section.GetFnLn(email))
                    Case 5
                        text = String.Format("بنظرم {0} فرد مناسبیه برای یه رابطه دوستانه , تبریک میگم بهتون", ClassProfile_Section.GetFnLn(email))
                End Select
                Return text
        End Select

    End Function

    Public Function Get_Text_Character3_Cut_Relationship(ByVal email As String, ByVal index As Boolean) As String

        Dim r As New Random
        Select Case index
            Case True 'کسی که باعث قطع ارتباط شده است پس جیرینگ از او گرفته می گیرد

                Dim text As String = ""

                Select Case r.Next(1, 4)
                    Case 1
                        text = String.Format("حالا دیگه با {0} قطع رابطه میکنی ؟ آخه چرا؟ دلت اومد؟ بابت این کارت به مبلغ {1} جریمه میشی", ClassProfile_Section.GetFnLn(email), "5000")
                    Case 2
                        text = String.Format("پس با {0} قطع رابطه کردی نمی دونم شاید کارت درست بود شاید نبود در هر صورت به مبلغ {1} جریمه شدی", ClassProfile_Section.GetFnLn(email), "5000")
                    Case 3
                        text = String.Format("متاسفم که با {0} قطع رابطه کردی امیدوارم اقدامی درست بوده باشه بابت این قطع ارتباط ک از طرف تو بده  مبلغ {1} جریمه میشی", ClassProfile_Section.GetFnLn(email), "5000")
                End Select
                Return text
            Case False 'کسی که باعث قطع ارتباط نشده است
                Dim text As String = ""
                Select Case r.Next(1, 4)
                    Case 1
                        text = String.Format("{0} باهات قطع ارتباط کرده اشکال نداره امیدوارم دیگه این قضیه برات اتفاق نیوفته", ClassProfile_Section.GetFnLn(email))
                    Case 2
                        text = String.Format("رابطه شما با {0} قطع شده و این قطع ارتباط از طرف خودش صورت گرفته ", ClassProfile_Section.GetFnLn(email))
                    Case 3
                        text = String.Format("{0} رابطشو با شما قطع کرد نمی دونم چرا ولی امیدوارم دلیله قانع کننده ای داشته باشه", ClassProfile_Section.GetFnLn(email))
                End Select
                Return text
        End Select

    End Function

    Public Function Insert_Character3Compulsory(ByVal email As String) As Boolean
        Try
            DS_Character3_InsertCompulsory.GetData(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Get_CountRelate(ByVal email As String) As Boolean
        If DS_Query._getCountRelate(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function Get_CountShaahrsUsers(ByVal email As String) As Boolean
        If DS_Query._getCountShaahrsUsers(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function Get_CountFavoritsUsers(ByVal email As String) As Boolean
        If DS_Query._getCountFavortisUsers(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function Get_AnyShaahr(ByVal email As String) As Boolean
        If DS_Character3_ShaahrsUser.GetData(email).Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    '////////////////////////  کارهای اجباری ///////////////////////////////////////////////////////////////////////
    'لیست کارهای اجباری که کاربر هنوز آنها را بررسی نکرده است
    Dim DS_Character3_Complusory_NotViewUsers As New DS_Character3TableAdapters.Character3_NotViewByUsersTableAdapter
    Dim DS_Character3_Users_Complusory As New DS_Character3TableAdapters.Profile_Character3_Users_CompulsoryTableAdapter
    Dim DS_Character3_Poll As New DS_Character3TableAdapters.CMS_Character3_PollingTableAdapter
    Dim DS_Character3_OptionPoll As New DS_Character3TableAdapters.CMS_Character3_PollingOptionTableAdapter
    Dim DS_Character3_UserPoll As New DS_Character3TableAdapters.Profile_Character3_UsersPollingTableAdapter
    Dim DS_Character3_News As New DS_Character3TableAdapters.CMS_Character3_TextureTableAdapter

    '---- برگرداندن دو مقدار 1:نوع کار فوق اجباری 2:کد عمل آن
    Public Function GetType_and_CodeObj(ByVal email As String) As String()
        Dim s(2) As String
        If DS_Character3_Complusory_NotViewUsers.GetData(email).Rows.Count > 0 Then
            s(2) = DS_Character3_Complusory_NotViewUsers.GetData(email).Rows(0)(2).ToString 'Code
            s(1) = DS_Character3_Complusory_NotViewUsers.GetData(email).Rows(0)(1).ToString 'CodeObj
            s(0) = DS_Character3_Complusory_NotViewUsers.GetData(email).Rows(0)(0).ToString 'Type
        Else
            s(0) = "-1"
            s(1) = "-1"
            s(2) = "-1"
        End If
        Return s
    End Function
    '
    Public Function Insert_Character3_Users_Compulsory(ByVal email As String, ByVal CodeEjbari As Long) As Boolean
        Try
            DS_Character3_Users_Complusory.Insert_Character3_Users_Compulsory(email, CodeEjbari)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '---- نظرسنجی

    Public Function GetCodeEjbari(ByVal codeObj As Long) As String
        Return DS_Query._getCodeEjbari(codeObj)
    End Function

    Public Function Polling(ByVal code As Long) As String()
        Dim sPoll(3) As String
        sPoll(0) = DS_Character3_Poll.GetData(code).Rows(0)(1) 'عنوان نظرسنجی
        sPoll(1) = DS_Character3_Poll.GetData(code).Rows(0)(2) 'سوال
        sPoll(2) = DS_Character3_Poll.GetData(code).Rows(0)(3) 'تاریخ
        sPoll(3) = DS_Character3_Poll.GetData(code).Rows(0)(4) 'زمان
        Return sPoll
    End Function

    Public Function lstOptionText(ByVal code As Long) As List(Of String)
        'متن گزینه را برمیگرداند
        Dim lstOption As New List(Of String)
        For i As Byte = 0 To DS_Character3_OptionPoll.GetData(code).Rows.Count - 1
            lstOption.Add(DS_Character3_OptionPoll.GetData(code).Rows(i)(2).ToString)
        Next
        Return lstOption

    End Function
    Public Function lstOptionValue(ByVal code As Long) As List(Of String)
        'کد گزینه را برمیگرداند
        Dim lstOption As New List(Of String)
        For i As Byte = 0 To DS_Character3_OptionPoll.GetData(code).Rows.Count - 1
            lstOption.Add(DS_Character3_OptionPoll.GetData(code).Rows(i)(0).ToString)
        Next
        Return lstOption

    End Function

    Public Function InsertUserPoll(ByVal CodePoll As Long, ByVal CodeOption As Byte, ByVal email As String) As Boolean
        Try
            DS_Character3_UserPoll.InsertUsersPoll(CodePoll, CodeOption, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountVoting(ByVal CodePoll As Long) As String
        Return DS_Query._getCountVoting(CodePoll)
    End Function

    '---- خبر ها

    Public Function News(ByVal Code As Long) As String()
        Dim sNews(5) As String
        sNews(0) = DS_Character3_News.GetData(Code).Rows(0)(0).ToString 'code
        sNews(1) = DS_Character3_News.GetData(Code).Rows(0)(1).ToString 'title
        sNews(2) = DS_Character3_News.GetData(Code).Rows(0)(2).ToString 'lid_detail
        sNews(3) = DS_Character3_News.GetData(Code).Rows(0)(4).ToString 'picpath
        sNews(4) = DS_Character3_News.GetData(Code).Rows(0)(5).ToString 'date
        sNews(5) = DS_Character3_News.GetData(Code).Rows(0)(6).ToString 'time
        Return sNews
    End Function
    

End Class
