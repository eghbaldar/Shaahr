Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_Jiring

    Dim CMS_Jiring_Query As New DS_CMS_JiringTableAdapters.Query
    Dim CMS_Jiring_Define As New DS_CMS_JiringTableAdapters.CMS_DefineJiringTableAdapter
    Dim CMS_jiring_Factor As New DS_CMS_JiringTableAdapters.CMS_Factor_JiringTableAdapter
    Dim CMS_Jiring_Transfer_From As New DS_CMS_JiringTableAdapters.Profile_Jiring_Transfer_FromTableAdapter
    Dim CMS_Jiring_Transfer_To As New DS_CMS_JiringTableAdapters.Profile_Jiring_Transfer_ToTableAdapter
    Dim CMS_Jiring_Profile_Service As New DS_CMS_JiringTableAdapters.Profile_Jiring_ServiceTableAdapter
    Dim CMS_jiring_CardAll As New DS_CMS_JiringTableAdapters.Profile_Jiring_Card_AllTableAdapter
    Dim CMS_jiring_Card As New DS_CMS_JiringTableAdapters.Profile_Jiring_CardTableAdapter
    Dim CMS_jiring_FishAll As New DS_CMS_JiringTableAdapters.Profile_Jiring_Fish_AllTableAdapter
    Dim CMS_jiring_Fish As New DS_CMS_JiringTableAdapters.Profile_Jiring_FishTableAdapter
    Dim CMS_jiring_ServiceUser As New DS_CMS_JiringTableAdapters.Jiring_ServiceTableAdapter
    Dim CMS_Jiring_Transfer As New DS_CMS_JiringTableAdapters.Jiring_TransferTableAdapter
    Dim CMS_Jiring_Service As New DS_CMS_JiringTableAdapters.CMS_Jiring_ServiceTableAdapter
    Dim CMS_LoyaltyReward As New DS_CMS_JiringTableAdapters.CMS_LoyaltyRewardTableAdapter

    Public Function DeleteTransferJiringFrom(ByVal email As String) As Boolean
        Try
            CMS_Jiring_Transfer_From.DeleteFrom(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteTransferJiringTo(ByVal email As String) As Boolean
        Try
            CMS_Jiring_Transfer_To.DeleteTo(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateJiring(ByVal Jiring As String, ByVal email As String) As Boolean
        Try
            CMS_Jiring_Query.UpdateJiring(Jiring, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '---- Define

    Public Function InsertDefineJiring(ByVal subject As String, ByVal Text As String, ByVal username As String) As Boolean
        Try
            CMS_Jiring_Define.InsertDefine(subject, Text, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), username, 1)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteDefineJiring(ByVal ID As Long) As Boolean
        Try
            CMS_Jiring_Define.DeleteDefine(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDefineJiring(ByVal subject As String, ByVal Text As String, ByVal flag As Boolean, ByVal ID As Long) As Boolean
        Try
            CMS_Jiring_Define.UpdateDefine(subject, Text, flag, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRow(ByVal ID As Long) As DataTable
        Return CMS_Jiring_Define.Select_GetDate(ID)
    End Function

    '---- Factor

    Public Function InsertFactorJiring(ByVal Subject As String, ByVal TimePeriod As String, ByVal Type As Boolean, ByVal jiring As String) As Boolean
        Try
            CMS_jiring_Factor.InsertFactor(Subject, TimePeriod, Type, jiring, 1)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteFactorJiring(ByVal code As Long) As Boolean
        Try
            CMS_jiring_Factor.DeleteFactor(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateFactorJiring(ByVal Subject As String, ByVal TimePeriod As String, ByVal Type As Boolean, ByVal jiring As String, ByVal flag As Boolean, ByVal code As Long) As Boolean
        Try
            CMS_jiring_Factor.UpdateFactor(Subject, TimePeriod, Type, jiring, flag, code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRow_Factor(ByVal code As Long) As DataTable
        Return CMS_jiring_Factor.Select_row(code)
    End Function

    '----- User Service

    Public Function UpdateUserService(ByVal Code As Long, ByVal expire As Boolean, ByVal ID As Long) As Boolean
        Try
            CMS_Jiring_Profile_Service.UpdateUserService(Code, expire, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteUserService(ByVal ID As Long) As Boolean
        Try
            CMS_Jiring_Profile_Service.DeleteUserService(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----- Jiring Card

    Public Function DeleteAll_JiringCard() As Boolean
        Try
            CMS_jiring_CardAll.DeleteAllCard()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_JiringCard(ByVal ID As Long) As Boolean
        Try
            CMS_jiring_Card.DeleteJiringCard(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----- Jiring Fish

    Public Function DeleteAll_JiringFish() As Boolean
        Try
            CMS_jiring_FishAll.DeleteAllFish()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_JiringFish(ByVal ID As Long) As Boolean
        Try
            CMS_jiring_Fish.DeleteJiringFish(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----- Service Users

    Public Function DeleteAllService() As Boolean
        Try
            CMS_jiring_ServiceUser.DeleteAllService()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteExpireService() As Boolean
        Try
            CMS_jiring_ServiceUser.DeleteUserServiceExpire()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----- Trasnfer

    Public Function DeleteAllTransfer() As Boolean
        Try
            CMS_Jiring_Transfer.DeleteAllTransfer()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteUserTransfer(ByVal id As Long) As Boolean
        Try
            CMS_Jiring_Transfer.DeleteUserTransfer(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----- Service

    Public Function InsertJiringService(ByVal code As Long, ByVal Subject As String, ByVal Detail As String, ByVal Month As Byte _
                                        , ByVal Free As Boolean, ByVal Jiring As String, ByVal Type As Integer, ByVal Flag As Boolean _
                                        , ByVal Discount As String) As Boolean
        Try
            CMS_Jiring_Service.InsertService(code, Subject, Detail, Month, Free, Jiring, Type, Flag, Discount)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateJiringService(ByVal code As Long, ByVal Subject As String, ByVal Detail As String, ByVal Month As Byte _
                                        , ByVal Free As Boolean, ByVal Jiring As String, ByVal Type As Integer, ByVal Flag As Boolean _
                                        , ByVal Discount As String, ByVal code_Orginal As Long) As Boolean
        Try
            CMS_Jiring_Service.UpdateService(code, Subject, Detail, Month, Free, Jiring, Type, Flag, Discount, code_Orginal)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteJiringService(ByVal code As Long) As Boolean
        Try
            CMS_Jiring_Service.DeleteService(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRowService(ByVal Code As Long) As DataTable
        Return CMS_Jiring_Service.Select_Row(Code)
    End Function

    Public Function DeleteServiceFromProfileCycleJiring(ByVal code As Long) As Boolean
        Try
            CMS_Jiring_Service.DeleteServiceFrom_Profile_CycleJiring(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '------ Loyalty Reward
    Public Sub ActionLoyaltyReward()
        CMS_LoyaltyReward.GetData()
    End Sub

End Class
