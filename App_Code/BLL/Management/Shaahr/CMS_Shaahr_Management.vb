Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_Shaahr_Management

    Dim DS_CMS_Query As New DS_CMS_Shaahr_ManagementTableAdapters.Query
    Dim DS_CMS_Shaahr_Authorities As New DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_AuthoritiesTableAdapter
    Dim DS_CMS_Shaahr_RequestWaiting As New DS_CMS_Shaahr_ManagementTableAdapters.RequestShaahr_WaitingTableAdapter
    Dim DS_CMS_Shaahr_Law As New DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_LawTableAdapter
    Dim DS_CMS_ShaahrUser As New DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_Detail_ShaahrUsersTableAdapter

    Public Function InsertAuthorities(ByVal Which As Boolean, ByVal Type As String, ByVal Email As String, ByVal Title_Post As String _
                                      , ByVal cv As String, ByVal Responsibilty As String, _
                                      ByVal Time_Responsibilty As String, ByVal Priode_Responsibilty As Byte, _
                                      ByVal Date_Start_Responsibilty As String, ByVal Date_End_Responsibilty As String, ByVal Flag As Boolean) As Boolean
        Try
            DS_CMS_Shaahr_Authorities.InsertAuthorities(Which, Type, Email, Title_Post, cv, Responsibilty, Time_Responsibilty, Priode_Responsibilty, _
                                                         Date_Start_Responsibilty, Date_End_Responsibilty, Flag)

            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateFlagAuthorities(ByVal flag As Boolean, ByVal id As Long) As Boolean
        DS_CMS_Shaahr_Authorities.UpdateFlag(flag, id)
    End Function

    Public Function DeleteAuthorities(ByVal id As Long) As Boolean
        DS_CMS_Shaahr_Authorities.DeleteAuth(id)
    End Function

    Public Function GetRankShaahr(ByVal CodeShaahr As Long) As String
        Return DS_CMS_Query.getRankShaahr(CodeShaahr)
    End Function

    'shaahr setting

    Public Function UpdateShaahr_FundationJiring(ByVal Jiring As String) As Boolean
        Try
            DS_CMS_Query.Update_Setting_FundationJiring(Jiring)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetShaahr_FundationJiring() As String
        Return DS_CMS_Query.Get_Setting_FundationJiring()
    End Function

    Public Function GetDuplicateRequestShaahr(ByVal founder As String) As Boolean
        If DS_CMS_Query.getDuplicateRequestShaahr(founder) > 0 Then
            Return False
        Else
            Return True
        End If
    End Function



    Public Function UpdateEnableBothShaahr(ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_RequestWaiting.UpdateEnableBoth(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDisableBothShaahr(ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_RequestWaiting.UpdateDisableBoth(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateRequestOneOfOne(ByVal id As Long, ByVal index As Byte) As Boolean
        Try
            Select Case index
                Case 1 'Governor NO
                    DS_CMS_Shaahr_RequestWaiting.UpdateReqGovernor_NO(id)
                Case 2 'GOvernor YES
                    DS_CMS_Shaahr_RequestWaiting.UpdateReqGovernor_Yes(id)
                Case 3 'Presedent NO
                    DS_CMS_Shaahr_RequestWaiting.UpdateReqPresedent_NO(id)
                Case 4 'Presedent YES
                    DS_CMS_Shaahr_RequestWaiting.UpdateReqPresedent_Yes(id)
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountShaahrWithFavorits(ByVal codeCat As Long) As String
        Return DS_CMS_Query.GetCountShaahrWithFavorits(codeCat)
    End Function

    Public Function GetNameShaahr(ByVal id As Long) As String
        Return DS_CMS_Query.GetNameShaahr(id)
    End Function

    Public Function UpdateSuspention(ByVal Suspention As Boolean, ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_RequestWaiting.UpdateSuspention(Suspention, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteRequest(ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_RequestWaiting.DeleteRequest(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteShaahrUser(ByVal id As Long) As Boolean
        Try
            DS_CMS_ShaahrUser.DeleteShaahrUser(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Law

    Public Function InsertLaw(ByVal Type As String, ByVal title As String, ByVal Text As String) As Boolean
        Try
            DS_CMS_Shaahr_Law.InsertLaw(Type, title, Text, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteLaw(ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_Law.DeleteLaw(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function ShaahrLaw(ByVal id As Long) As DataTable
        Return DS_CMS_Shaahr_Law.Select_row(id)
    End Function

    Public Function UpdateLaw(ByVal type As String, ByVal title As String, ByVal text As String, ByVal id As Long) As Boolean
        Try
            DS_CMS_Shaahr_Law.UpdateLaw(type, title, text, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '

    Public Function GetCount(ByVal index As Byte) As String
        Select Case index
            Case 1 'شهر های فعال
                Return DS_CMS_Query.getCount_shaahrEnable()
            Case 2 'شهرهای غیرفعال
                Return DS_CMS_Query.getCount_ShaahrDisable()
            Case 3 'شهرهای بررسی نشده
                Return DS_CMS_Query.getCount_ShaahrNoConsider()
            Case 4 'شهرهای تعلیق شده
                Return DS_CMS_Query.getCount_ShaahrSuspension()
            Case 5 'شهروندان شهرها
                Return DS_CMS_Query.getCount_ShaahrUsers()
        End Select
    End Function


End Class
