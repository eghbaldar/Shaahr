Imports Microsoft.VisualBasic

Public Class Online

    Dim DS_Quesry As New DS_OnlineTableAdapters.Query
    Dim DS_Complement As New DS_OnlineTableAdapters.Profile_complementTableAdapter

    Public Function UpdateLastaLogin(ByVal email As String) As Boolean
        Try
            DS_Complement.UpdateLastDateLogin(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";" + Now.TimeOfDay.ToString.Substring(0, 8), email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateOnlineOffline(ByVal status As Boolean, ByVal email As String) As Boolean
        Try
            DS_Complement.UpdateOnlineOffline(status, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckOnline(ByVal email As String) As Boolean
        If DS_Quesry.getOnilneOfflineByEmail(email) = "1" Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetCountOnlineUsers() As String
        Return DS_Quesry.getCountOnilneUser
    End Function

    Public Function GetCountFriendsOnline(ByVal email As String) As String
        Return DS_Quesry.getCountFriendsOnline(email)
    End Function

    Public Function GetCountStateOnline(ByVal email As String) As String
        Return DS_Quesry.getCountStateOnline(email)
    End Function

    Public Function GetCountOnlineShaahr(ByVal email As String) As String
        Return DS_Quesry.getCountOnlineShaahr(email)
    End Function

    Public Function GetStatusCode(ByVal email As String) As String
        Return DS_Quesry.getStatusCode(email)
    End Function

    Public Function UpdateStatusCodeByEmail(ByVal statusCode As Byte, ByVal email As String) As Boolean
        Try
            DS_Complement.UpdateStatusCode(statusCode, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetOnlineAvaliable() As String
        Return DS_Quesry.getCountAvaliableUsers()
    End Function
    Public Function GetOnlineNotHere() As String
        Return DS_Quesry.getCountNotHereUsers()
    End Function
    Public Function GetOnlineBusy() As String
        Return DS_Quesry.getCountBusyUsers()
    End Function
    Public Function GetOnlineTransparent() As String
        Return DS_Quesry.getCountTransparentUsers()
    End Function
    Public Function GetOnlineNotNow() As String
        Return DS_Quesry.getCountNotNowUsers()
    End Function

End Class
