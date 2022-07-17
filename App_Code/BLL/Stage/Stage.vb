Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Stage

    Dim ClassHome As New HomeProfile
    Dim DS_Quesry As New DS_StageTableAdapters.Query
    Dim DS_FactorUsers As New DS_StageTableAdapters.Factor_Jiring_UsersTableAdapter
    Dim DS_JiringFish As New DS_StageTableAdapters.Profile_Jiring_FishTableAdapter
    Dim DS_JiringCard As New DS_StageTableAdapters.Profile_Jiring_CardTableAdapter
    Dim DS_JiringService As New DS_StageTableAdapters.CMS_Jiring_ServiceTableAdapter
    Dim DS_JiringTransfer As New DS_StageTableAdapters.Profile_Jiring_TransferTableAdapter
    Dim DS_ServiceUser As New DS_StageTableAdapters.Profile_Jiring_ServiceTableAdapter
    Dim DS_UsersServices As New DS_StageTableAdapters.UsersServicesTableAdapter
    Dim DS_CMSFactor As New DS_StageTableAdapters.CMS_Factor_JiringTableAdapter
    Dim DS_CycleJiring As New DS_StageTableAdapters.Profile_CycleJiringTableAdapter
    Dim DS_Nazmie_ReportUser As New DS_StageTableAdapters.Nazmie_ReportTableAdapter
    Dim DS_Nazmie_Complement As New DS_StageTableAdapters.Nazmie_ComplementTableAdapter
    Dim DS_Nazmie_Report_Detective As New DS_StageTableAdapters.Nazmie_Report_DetectiveTableAdapter
    Dim DS_Nazmie_RegDetective As New DS_StageTableAdapters.Nazmie_Register_DetectiveTableAdapter


    Public Function SearchCitizen(ByVal fn_f As String, ByVal ln_f As String, ByVal fn_e As String, _
                                  ByVal ln_e As String, ByVal [alias] As String, ByVal education As String, ByVal birth_year As String, ByVal birth_month As String, ByVal birth_day As String, _
                                  ByVal code_country As String, ByVal code_state As String, ByVal code_city As String, ByVal sex As String, ByVal marrid_single As String, _
                                  ByVal religion As String, ByVal foriegn_lanuage As String, ByVal Poletic As String) As DataTable

        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        sqlcnn.Open()
        Dim sqlcom As New SqlCommand("exec Stage_SearchCitizen '" + fn_f + "','" + ln_f + "','" + fn_e + "','" + ln_e + "','" + [alias] _
                                     + "','" + education + "','" + birth_year + "','" + birth_month + "','" + birth_day + _
                                     "','" + code_country + "','" + code_state + "','" + code_city + "','" + sex + "','" + _
                                     marrid_single + "','" + religion + "','" + foriegn_lanuage + "','" + Poletic + "'", sqlcnn)
        Dim sqlda As New SqlDataAdapter
        Dim ds As New DataSet
        sqlda.SelectCommand = sqlcom
        sqlda.Fill(ds)
        Return ds.Tables(0)
        sqlcnn.Close()

    End Function

    Public Function SearchOnlineUsers(ByVal fn_f As String, ByVal ln_f As String, ByVal fn_e As String, _
                                  ByVal ln_e As String, ByVal [alias] As String, ByVal education As String, _
                                  ByVal birth_year As String, ByVal birth_month As String, ByVal birth_day As String, _
                                  ByVal code_country As String, ByVal code_state As String, ByVal code_city As String, ByVal sex As String, _
                                  ByVal marrid_single As String, _
                                  ByVal religion As String, ByVal foriegn_lanuage As String, ByVal Poletic As String) As DataTable

        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        sqlcnn.Open()
        Dim sqlcom As New SqlCommand("exec Stage_SearchOnlineUsers '" + fn_f + "','" + ln_f + "','" + fn_e + "','" + ln_e + "','" + [alias] _
                                     + "','" + education + "','" + birth_year + "','" + birth_month + "','" + birth_day + _
                                     "','" + code_country + "','" + code_state + "','" + code_city + "','" + sex + "','" + _
                                     marrid_single + "','" + religion + "','" + foriegn_lanuage + "','" + Poletic + "'", sqlcnn)
        Dim sqlda As New SqlDataAdapter
        Dim ds As New DataSet
        sqlda.SelectCommand = sqlcom
        sqlda.Fill(ds)
        Return ds.Tables(0)
        sqlcnn.Close()

    End Function

    Public Function GetJiringByEmail(ByVal email As String) As String
        Return DS_Quesry.getJirngByEmail(email)
    End Function

    Public Function GetIncrease(ByVal email As String) As String
        Return DS_Quesry.getSumIncrease(email)
    End Function

    Public Function GetDecrease(ByVal email As String) As String
        Return DS_Quesry.getSumDecrease(email)
    End Function

    Public Function DeleteFactorUsers(ByVal email As String) As Boolean
        Try
            DS_FactorUsers.DeleteFactorUsers(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Insert_Jiring_Fish(ByVal Email As String, ByVal Bank As String, ByVal NumAcc As String, _
                                       ByVal Name As String, ByVal Family As String, ByVal Price As String, ByVal _Date As String _
                                        , ByVal RedNum As String) As Boolean
        Try
            DS_JiringFish.Insert_Jiring_Fish(Email, Bank, NumAcc, Name, Family, Price, _Date, RedNum)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLastCodeFish(ByVal email As String) As String
        Return DS_Quesry.getLastCode(email)
    End Function

    Public Function Insert_Jiring_Card(ByVal Email As String, ByVal Date_ As String, ByVal Time As String, ByVal _to As String, _
                                       ByVal CodePeygiri As String, ByVal CardNum As String, ByVal Name As String, ByVal detail As String) As Boolean
        Try
            DS_JiringCard.Insert_Jiring_Card(Email, Date_, Time, _to, CodePeygiri, CardNum, Name, detail)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLastCodeCard(ByVal email As String) As String
        Return DS_Quesry.getLastCodeCard(email)
    End Function

    Public Function SelectRow_Jiring_Service(ByVal code As Long) As DataRow
        Return DS_JiringService.Select_Row(code).Rows(0)
    End Function

    Public Function CheckExsitsService(ByVal email As String, ByVal code As Long) As String
        Try
            If DS_Quesry.CheckServiceExsistUsers(code, email) = "1" Then
                Return True
            Else
                Return False
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertServiceUsers(ByVal CodeService As Long, ByVal Email As String, ByVal Start_Date As String, _
                                       ByVal End_Date As String, ByVal Jiring As String, ByVal expire As Boolean) As Boolean
        DS_ServiceUser.InsertServiceUsers(CodeService, Email, Start_Date, End_Date, Jiring, expire)
    End Function

    Public Function EndDateService() As String

        Dim s() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
        Dim sal As String = s(0)
        Dim mah As String = s(1)
        Dim roz As String = s(2)

        If mah = 6 Then
            If roz = 31 Then
                roz = 30
            End If
        End If
        mah += 1
        If mah > 12 Then
            sal += 1
            mah = 1
        End If

        Return sal + "/" + mah + "/" + roz

    End Function

    Public Function UpdateUserJiring(ByVal Jiring As String, ByVal email As String) As Boolean
        Try
            DS_Quesry.Update_UserJiring(Jiring, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteUsersService(ByVal id As Long) As Boolean
        Try
            DS_UsersServices.DeleteUsersSerivce(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckServiceExsistUsersByType(ByVal type As Integer, ByVal email As String) As Boolean
        Try
            If DS_Quesry.CheckServiceExsistUsersByType(email, type) = "1" Then
                Return True 'yani karbar ejaze darad k khadamete in service ra bebeinad
            Else
                Return False
            End If
        Catch ex As Exception

        End Try
    End Function

    Public Function Select_Row_CMS_Factor(ByVal code As Long) As DataRow
        Return DS_CMSFactor.Select_Row(code).Rows(0)
    End Function

    Public Function InsertCycleJiring(ByVal code_factor As Long, ByVal email As String) As Boolean
        DS_CycleJiring.InsertCycle(code_factor, email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Function

    ''' <summary>
    ''' مقایسه دو تاریخ
    ''' توجه: تاریخ اول با تاریخ دوم مقایسه می شود
    ''' </summary>
    ''' <param name="Date1">تاریخ اول</param>
    ''' <param name="Date2">تاریخ دوم</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ''' 
    Function Bozorgtar_kochiktar(ByVal Date1 As String, ByVal Date2 As String) As Byte

        Dim arr1() As String = Date1.Split("/")
        Dim arr2() As String = Date2.Split("/")

        Dim sal1 As Integer = Val(arr1(0))
        Dim mah1 As Integer = Val(arr1(1))
        Dim roz1 As Integer = Val(arr1(2))

        Dim sal2 As Integer = Val(arr2(0))
        Dim mah2 As Integer = Val(arr2(1))
        Dim roz2 As Integer = Val(arr2(2))

        If sal1 = sal2 And mah1 = mah2 And roz1 = roz2 Then Return 0
        '---------------------------
        If sal1 > sal2 Then Return 1
        '---------------------------
        If sal1 = sal2 Then
            If mah1 > mah2 Then Return 1
        End If
        '---------------------------
        If sal1 = sal2 Then
            If mah1 = mah2 Then
                If roz1 > roz2 Then Return 1
            End If
        End If
        '---------------------------
        If sal1 < sal2 Then Return 2
        '---------------------------
        If sal1 = sal2 Then
            If mah1 < mah2 Then Return 2
        End If
        '---------------------------
        If sal1 = sal2 Then
            If mah1 = mah2 Then
                If roz1 < roz2 Then Return 2
            End If
        End If
        '---------------------------
        'Return 0: [Date1] = [Date2]
        'Return 1: [Date1] > [Date2]
        'Return 2: [Date1] < [Date2]

    End Function

    ''' <summary>
    ''' چک کردن انقضاء سرویس ها
    ''' </summary>
    ''' <param name="email"></param>
    ''' <remarks></remarks>
    Public Sub CheckExpireServices(ByVal email As String)

        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
        sqlcnn.Open()
        Dim sqlcom As New SqlCommand("select * from Tbl_Profile_Jiring_Service where email='" + email + "'", sqlcnn)
        Dim r As SqlDataReader
        r = sqlcom.ExecuteReader
        While r.Read
            If Bozorgtar_kochiktar(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), r(4)) = 1 And r(6) = True Then
                'r(4) --> تاریخ انقضا
                'r(6) --> Flase: سرویس قبلا منقضی شده True:سرویس هنوز فعال است 
                DS_ServiceUser.UpdateExpireService(r(0)) 'منقضی کردن سرویس
                ''''''''''''''''''''''''''''''''''''''''بررسی سرویس صندوق پستی'''''''''''''''''''''''''''''''''''''''''''
                'با دستور زیر بجز 20 پیام آخر صندوق پستی کاربری که سرویس آن منقصی شده است پاک می شود.
                'البته اگر تعداد پیام های صندوق پستیش بیش از 20 عدد بود
                If ClassHome.getCountMessagesRecived(email, 0) > 20 Then
                    If IsJiringService_ExtraInbox(r(0)) Then DS_UsersServices.DeleteInboxAfterExpireExtraInboxService(email)
                End If
                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            End If
        End While
        sqlcnn.Close()

    End Sub
    ''' <summary>
    ''' سه تابه پایین برای آن است که مشخص شود سرویسی که انقضاء شده است آیا سرویس ارتقای صندوق پستی است یا نه
    ''' </summary>
    ''' <param name="code"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetTypeServiceJiringByCodeService(ByVal code As Long) As Long
        Return DS_Quesry.getTypeServiceJiringByCodeService(code)
    End Function
    Public Function GetCodeServiceByIdUserService(ByVal id As Long) As Long
        Return DS_Quesry.getCodeServiceByIdUserService(id)
    End Function
    Public Function IsJiringService_ExtraInbox(ByVal id As Long) As Boolean
        If GetTypeServiceJiringByCodeService(GetCodeServiceByIdUserService(id)) = 2 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Sub DeleteInboxAfterExpireExtraInboxService(ByVal email As String)
        DS_UsersServices.DeleteInboxAfterExpireExtraInboxService(email)
    End Sub




    Public Function InsertTransferJiring(ByVal from As String, ByVal _To As String, ByVal Jiring As String, ByVal Percent_Jiring As String) As Boolean
        Try
            DS_JiringTransfer.InsertJiringTransfer(from, _To, Jiring, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), Percent_Jiring)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Nazmie

    Public Function GetCountDetective() As String
        Return DS_Quesry.getCountRegisterDetective()
    End Function

    Public Function InsertReportUsers(ByVal CodeCrime As Long, ByVal Type As String, ByVal email As String, ByVal fnln As String, ByVal emailOut As String, ByVal ViolationLink As String, ByVal LevelViolation As String, ByVal cuase_complain As String) As Boolean
        Try
            DS_Nazmie_ReportUser.InsertReport(CodeCrime, Type, email, fnln, emailOut, ViolationLink, LevelViolation, cuase_complain, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), 0)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetComplementNazmie(ByVal index As Byte) As String
        Select Case index
            Case 1
                'Status_Detective
                Return DS_Nazmie_Complement.GetData().Rows(0)(0).ToString()
            Case 2
                'Jiring_ReportUsers
                Return DS_Nazmie_Complement.GetData().Rows(0)(1).ToString()
            Case 3
                'Jiring_ReportDetective
                Return DS_Nazmie_Complement.GetData().Rows(0)(2).ToString()
        End Select
    End Function

    Public Function CheckRegDetective(ByVal email As String) As Boolean
        If DS_Quesry.getCheckRegDetective(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function InsertReportDetective(ByVal email As String, ByVal cause As String, ByVal level As String, ByVal CodeCrime As Long, ByVal ViolationLink As String) As Boolean
        Try
            'DS_Nazmie_Report_Detective.InsertReportDetective(email, , 0, 0, cause, 0, level)
            DS_Nazmie_Report_Detective.InsertReportDetective(email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), 2, 0, cause, level, CodeCrime, ViolationLink)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function ChechNotAllowRegDetective(ByVal email As String) As Boolean
        If DS_Quesry.getChechNotAllowRegDetective(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function InsertRegisterDetective(ByVal email As String) As Boolean
        Try
            DS_Nazmie_RegDetective.Insert(email, 0, 0)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateFindedDetective(ByVal email As String) As Boolean
        Try
            DS_Quesry.UpdateFindedDetective(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Search



End Class
