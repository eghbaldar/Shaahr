Imports Microsoft.VisualBasic

Public Class CMS_Character3

    Dim DS_Query As New DS_CMS_Character3TableAdapters.Query


    '//////////////////////////////// کارهای فوق اجباری /////////////////////////////////
    Dim DS_CMS_Poll As New DS_CMS_Character3TableAdapters.Character3_PollingTableAdapter
    Dim DS_CMS_PollOption As New DS_CMS_Character3TableAdapters.Character3_PollingOptionTableAdapter
    Dim DS_CMS_Compulsory As New DS_CMS_Character3TableAdapters.Profile_Character3_CompulsoryTableAdapter
    Dim DS_CMS_Users_Compulsory As New DS_CMS_Character3TableAdapters.Profile_Character3_Users_CompulsoryTableAdapter
    Dim DS_Character3_Texture As New DS_CMS_Character3TableAdapters.CMS_Character3_TextureTableAdapter

    'Orginal Set Compulsory Character3
    'دستورات اصلی کنترل کارهای فوق اجباری

    Public Function InsertCharacter3_Compulsory(ByVal flag As Boolean, ByVal Type As Byte, ByVal codeObj As Long) As Boolean
        Try
            DS_CMS_Compulsory.InsertCharacter3_Compulsory(flag, Type, codeObj)
            'Flag : Enable/Disible
            'Type : {Polling :0 ,  News :1 }
            'CodeObj : {براساس نوع هر عملیات مثلا نطرسنجی یا خیر یا ... کد مربوط بعد از درج بصورت دستی در این فیلد قرار میگیرد}
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteCompulsory(ByVal Code As Long) As Boolean
        Try
            DS_CMS_Compulsory.DeleteCharacter3_Compulsory(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateEnableDisible(ByVal Flag As Boolean, ByVal Code As Long) As Boolean
        Try
            DS_CMS_Compulsory.UpdateFlag(Flag, Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Insert_UsersCompulsory(ByVal email As String, ByVal CodeEjbari As Long) As Boolean
        Try
            DS_CMS_Users_Compulsory.InsertUsers_Compulsory(email, CodeEjbari)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Part [1] : Polling {Type=0}
    'نظرسنجی مربوط به کارهای فوق اجباری

    Public Function InsertPoll(ByVal title As String, ByVal detail As String) As Boolean
        Try
            DS_CMS_Poll.InsertPoll(title, detail, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeletePoll(ByVal Code As Long) As Boolean
        Try
            DS_CMS_Poll.DeletePoll(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertPollOption(ByVal CodePoll As Long, ByVal _Option As String) As Boolean
        Try
            DS_CMS_PollOption.InsertPollOption(CodePoll, _Option)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeletePollOption(ByVal code As Long) As Boolean
        Try
            DS_CMS_PollOption.DeletePollOption(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLastCodePolling() As String
        Return DS_Query.getLastCodePolling
    End Function

    'Part [2] : Polling {Type=1}

    Public Function Insert_Character3_News(ByVal Title As String, ByVal Lid_Detail As String, ByVal Detail As String, ByVal PicPath As String) As Boolean
        Try
            DS_Character3_Texture.InsertNews(Title, Lid_Detail, Detail, PicPath, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_Character3_News(ByVal code As Long) As Boolean
        Try
            DS_Character3_Texture.DeleteNews(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '//////////////////////////////// ................. /////////////////////////////////

End Class
