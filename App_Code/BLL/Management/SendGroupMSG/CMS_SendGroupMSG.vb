Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_SendGroupMSG

    Dim DS_Query As New DS_CMS_SendGroupMSGTableAdapters.Query
    Dim DS_CMS_GroupMSG As New DS_CMS_SendGroupMSGTableAdapters.Profile_InboxSystemTableAdapter
    Dim DS_CMS_GroupsMessages_Expire As New DS_CMS_SendGroupMSGTableAdapters.GroupsMessages_ExpireTableAdapter
    Dim DS_CMS_EmailsByDate As New DS_CMS_SendGroupMSGTableAdapters.EmailsByDateTableAdapter

    Public Function InsertGroupMSG(ByVal subject As String, ByVal msg As String) As Boolean
        Try
            DS_CMS_GroupMSG.CMS_SendGroupMSG(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), subject, msg)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountMsgExpire() As String
        Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
        Return DS_Query.getCountMsgExpire(sDate(0), sDate(1), sDate(2))
    End Function

    Public Function DeleteGroupMsgExpire() As Boolean
        Try
            Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).Split("/")
            DS_CMS_GroupsMessages_Expire.DeleteMsgExpire(sDate(0), sDate(1), sDate(2))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetEmailByDate() As DataTable
        Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).ToString.Split("/")
        Return DS_CMS_EmailsByDate.GetData(sDate(1), sDate(2))
    End Function

    Public Function GetCountAllUsersBirthDay() As String
        Dim sDate() As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate).ToString.Split("/")
        Return DS_Query.getCountAllUserBirthday(sDate(0), sDate(1), sDate(2))
    End Function

End Class