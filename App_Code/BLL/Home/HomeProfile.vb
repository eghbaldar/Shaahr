Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class HomeProfile


    Dim ClassProfile_Section As New View_Users_Sections
    '--------------------------------------------------

    Dim DS_Avatars As New DS_HomeProfileTableAdapters.Profile_AvatarsTableAdapter
    Dim DS_Query As New DS_HomeProfileTableAdapters.Query
    Dim DS_Visit As New DS_HomeProfileTableAdapters.Panel_VisitTableAdapter
    Dim DS_Familys As New DS_HomeProfileTableAdapters.MyFamilysTableAdapter
    Dim DS_Polling As New DS_HomeProfileTableAdapters.Profile_PollingTableAdapter
    Dim DS_OptionPolling As New DS_HomeProfileTableAdapters.Profile_Option_PollingTableAdapter
    Dim DS_Album As New DS_HomeProfileTableAdapters.Profile_AlbumTableAdapter
    Dim DS_UpdateNews As New DS_HomeProfileTableAdapters.Home_UpdateNewsByCodeTableAdapter
    Dim DS_WorkList As New DS_HomeProfileTableAdapters.Profile_WorkListTableAdapter
    Dim DS_MessageRecived As New DS_HomeProfileTableAdapters.Message_ResiveTableAdapter
    Dim DS_MessageSend As New DS_HomeProfileTableAdapters.Message_SendTableAdapter
    Dim DS_MessageRecived_Group As New DS_HomeProfileTableAdapters.Message_Resive_GroupTableAdapter
    Dim DS_MessageSend_Group As New DS_HomeProfileTableAdapters.Message_Send_GroupTableAdapter
    Dim DS_Notification As New DS_HomeProfileTableAdapters.Profile_NotificationsTableAdapter
    Dim DS_TypeNotification As New DS_HomeProfileTableAdapters.Profile_NotificationsWithTypeTableAdapter

    Public Function GetEmailByIdEmail(ByVal code_orginal As Long) As String
        Return DS_Query.getEmailByIdEmail(code_orginal)
    End Function

    Public Function UpdateOrgAvatar(ByVal email As String, ByVal id As Long) As Boolean
        Try
            DS_Avatars.UpdateOrginalAvatar(email, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateThink(ByVal email As String, ByVal text As String) As Boolean
        Try
            DS_Query.UpdateThink(text, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountVisit(ByVal email As String, ByVal Other_email As String) As String
        'Return DS_Visit.getCountVisit(Other_email, email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Function

    Public Function GetSumVisit(ByVal other_email As String) As String
        'Return DS_Visit.getSumToday(other_email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Function

    Public Function InsertVisit(ByVal email As String, ByVal other_email As String) As Boolean
        Try
            DS_Visit.InsertVisit(email, other_email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLastLogin(ByVal email As String) As String
        Return DS_Query.getLastLogin(email)
    End Function

    Public Function WhichFamily(ByVal index As Byte) As String

        Select Case index
            Case 0
                Return "دوست"
            Case 1
                Return "زن و شوهر"
            Case 2
                Return "پدر و دختر"
            Case 3
                Return "پدر و پسر"
            Case 4
                Return "مادر و دختر"
            Case 5
                Return "مادر و پسر"
            Case 6
                Return "برادر و برادر"
            Case 7
                Return "برادر و خواهر"
            Case 8
                Return "خواهر و خواهر"
            Case 9
                Return "پسر خاله و پسر خاله"
            Case 10
                Return "پسر خاله و دختر خاله"
            Case 11
                Return "دختر خاله و دختر خاله"
            Case 12
                Return "خاله و خواهرزاده"
            Case 13
                Return "دایی و خواهرزاده"
            Case 14
                Return "پسرعمو و پسرعمو"
            Case 15
                Return "پسرعمو و دخترعمو"
            Case 16
                Return "دخترعمو و دخترعمو"
            Case 17
                Return "عمو و برادرزاده"
            Case 18
                Return "پسرعمه و پسردایی"
            Case 19
                Return "پسرعمه و دختردایی"
            Case 20
                Return "دخترعمه و پسردایی"
            Case 21
                Return "دخترعمه و دختردایی"
            Case 22
                Return "عمه و برادرزاده"
            Case 23
                Return "مادبزرگ مادری و نوه"
            Case 24
                Return "پدربزرگ مادری و نوه"
            Case 25
                Return "مادربزرگ پدری و نوه"
            Case 26
                Return "پدربزرگ پدری و نوه"
        End Select

    End Function
    'Public Function WhichFamily(ByVal email As String, ByVal user As String) As String

    '    Select Case DS_Familys.WhichFamily(user, email)
    '        Case 1
    '            Return "زن و شوهر"
    '        Case 2
    '            Return "پدر و دختر"
    '        Case 3
    '            Return "پدر و پسر"
    '        Case 4
    '            Return "مادر و دختر"
    '        Case 5
    '            Return "مادر و پسر"
    '        Case 6
    '            Return "برادر و برادر"
    '        Case 7
    '            Return "برادر و خواهر"
    '        Case 8
    '            Return "خواهر و خواهر"
    '        Case 9
    '            Return "پسر خاله و پسر خاله"
    '        Case 10
    '            Return "پسر خاله و دختر خاله"
    '        Case 11
    '            Return "دختر خاله و دختر خاله"
    '        Case 12
    '            Return "خاله و خواهرزاده"
    '        Case 13
    '            Return "دایی و خواهرزاده"
    '        Case 14
    '            Return "پسرعمو و پسرعمو"
    '        Case 15
    '            Return "پسرعمو و دخترعمو"
    '        Case 16
    '            Return "دخترعمو و دخترعمو"
    '        Case 17
    '            Return "عمو و برادرزاده"
    '        Case 18
    '            Return "پسرعمه و پسردایی"
    '        Case 19
    '            Return "پسرعمه و دختردایی"
    '        Case 20
    '            Return "دخترعمه و پسردایی"
    '        Case 21
    '            Return "دخترعمه و دختردایی"
    '        Case 22
    '            Return "عمه و برادرزاده"
    '        Case 23
    '            Return "مادبزرگ مادری و نوه"
    '        Case 24
    '            Return "پدربزرگ مادری و نوه"
    '        Case 25
    '            Return "مادربزرگ پدری و نوه"
    '        Case 26
    '            Return "پدربزرگ پدری و نوه"
    '    End Select

    'End Function

    Public Function GetBirthDateByEmail(ByVal email As String) As String
        Return DS_Query.getBirthDateByEmail(email)
    End Function

    Public Function GetCountryStateByEmail(ByVal email As String) As String
        Return DS_Query.getLocationByEmail(email)
    End Function

    Public Function GetCountPictureAlbum_And_CountAlbum(ByVal email As String, ByVal flag As Boolean) As String
        'flag =true return تعداد آلبوم ها 
        'flag =false return تعداد عکس های آلبوم ها 
        If flag Then Return DS_Query.getCountAlbum(email)
        If Not flag Then Return DS_Query.getCountPictureAlbum(email)
    End Function

    Public Function GetComment(ByVal email As String, ByVal for_who As String, ByVal code As Long) As String
        Return DS_UpdateNews.getComment(email, for_who, code)
    End Function

    Public Function GetEmailByCode(ByVal code As Long) As String
        Return DS_UpdateNews.GetEmailByCode(code)
    End Function

    Public Function GetDetailObject(ByVal code As Long) As String
        Return DS_Query.getDetailObjects(code)
    End Function

    Public Function GetTypeObject(ByVal code As Long) As String
        Return DS_Query.getTypeObject(code)
    End Function

    Public Function GetCountUpdateWithTypeNotification(ByVal codeObj As Long, ByVal email As String, ByVal type As Byte) As String
        If DS_TypeNotification.GetData(codeObj, email, type).Rows.Count > 0 Then
            Return DS_TypeNotification.GetData(codeObj, email, type).Rows(0)(0).ToString
        Else
            Return "0"
        End If
    End Function


    'Information of top site
    Public Function GeText_Logo_OfTopSite(ByVal index As Boolean) As String
        Select Case index
            Case True
                Return DS_Query.getTopTextOfTopSite()
            Case False
                Return DS_Query.getTopLogoOfTopSite()
        End Select
    End Function

    'Degree Citizen (Star Numbering)
    Public Function GetStarNum(ByVal email As String) As String
        Return DS_Query.getStarNum(email)
    End Function

    Public Function UpdateStarNum(ByVal star As Integer, ByVal email As String) As Boolean
        Try
            If Val(GetStarNum(email)) < 3917 Then DS_Query.Home_Increase_StarNum(star, email)
        Catch ex As Exception
        End Try
    End Function

    'Polling
    Public Function InsertPolling(ByVal email As String, ByVal question As String, ByVal detail As String) As Boolean
        Try
            DS_Polling.InsertObject(email, email, 3, question, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), Now.ToShortTimeString.Substring(0, Now.ToShortTimeString.Length - 2), detail)
            Dim CodeObject As Long = DS_Polling.getLastCodeObjectPolling(email, email)
            DS_Polling.InsertPolling(CodeObject, question, "", detail, 1, "")
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CodePolling() As String
        Return DS_Polling.getLastCodePolling()
    End Function

    Public Function InsertOption(ByVal [option] As String) As Boolean
        Try
            DS_OptionPolling.InsertOptionPolling(CodePolling(), [option])
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetQuestionPolling(ByVal code_Object As Long) As String
        Return DS_Query.getQuestionPolling(code_Object)
    End Function

    'Photo
    Public Function InsertPhotoAlbum(ByVal code_album As Long, ByVal email As String, ByVal code_object As Long) As Boolean
        Try
            DS_Album.InsertPictureAlbum(code_album, email, code_object)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeletePhoto(ByVal codeobject As Long) As Boolean
        Try
            DS_Query.DeletePhoto(codeobject)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdatePhotoAlbum(ByVal codeAlbum As Long, ByVal email As String, ByVal codeObject As Long) As Boolean
        Try
            DS_Album.UpdatePictureAlbum(codeAlbum, email, codeObject)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLastCodeObject_ForPhoto(ByVal email As String)
        Return DS_Album.getLastCodeObject_ForPhoto(email, email)
    End Function

    Public Function GetCountPictureOfAlbum(ByVal codeAlbum As Long) As Long
        Return DS_Album.getCountPictureOfAlbum(codeAlbum)
    End Function

    Public Function InsertAlbum(ByVal email As String, ByVal Albumname As String) As Boolean
        Try
            DS_Album.InsertAlbum(email, Albumname, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Firends_Knowing
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function FriendsKnowing(ByVal email As String) As DataTable

        Try
            Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
            Dim sqlcom As New SqlCommand
            Dim sqlda As New SqlDataAdapter
            Dim ds As New DataSet
            sqlcnn.Open()
            sqlcom.Connection = sqlcnn
            sqlcom.CommandText = "exec Home_Friends_Friends_Show '" + email + "'"
            sqlda.SelectCommand = sqlcom
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlcnn.Close()
        Catch ex As Exception

        End Try

    End Function

    Public Function CountFriendsKnowing(ByVal email As String, ByVal userEmail As String) As Integer

        Try
            Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
            Dim sqlcom As New SqlCommand
            Dim sqlda As New SqlDataAdapter
            Dim ds As New DataSet
            sqlcnn.Open()
            sqlcom.Connection = sqlcnn
            sqlcom.CommandText = "exec Home_Friends_Friends_User '" + email + "','" + userEmail + "'"
            sqlda.SelectCommand = sqlcom
            sqlda.Fill(ds)
            Return ds.Tables(0).Rows.Count
            sqlcnn.Close()
        Catch ex As Exception

        End Try

    End Function

    Public Function UsersFriendsKnowing(ByVal email As String, ByVal userEmail As String) As String

        Try
            Dim Result As String = ""
            Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
            Dim sqlcom As New SqlCommand
            Dim r As SqlDataReader
            sqlcnn.Open()
            sqlcom.Connection = sqlcnn
            sqlcom.CommandText = "exec Home_Friends_Friends_User '" + email + "','" + userEmail + "'"
            r = sqlcom.ExecuteReader
            While r.Read
                Result += ClassProfile_Section.GetFnLn(r(0)) + "<br/>"
            End While
            sqlcnn.Close()

            If CountFriendsKnowing(email, userEmail) > 9 Then
                Result += "و . . ."
            End If

            Return Result.ToString '.Substring(0, Result.Length - 3)

        Catch ex As Exception

        End Try

    End Function

    'BirthDay
    Public Function BirthDay(ByVal _date As String) As String

        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand
        Dim sqlda As New SqlDataAdapter
        Dim ds As New DataSet
        sqlcnn.Open()
        sqlcom.Connection = sqlcnn
        sqlcom.CommandText = "exec Home_BirthDay '" + _date + "'"
        sqlda.SelectCommand = sqlcom
        sqlda.Fill(ds)
        sqlcnn.Close()
        Return ds.Tables(0).Rows(0)(0).ToString

    End Function

    'WorkList
    Public Function InsertWork(ByVal email As String, ByVal title As String) As Boolean
        Try
            DS_WorkList.InsertWork(email, title, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteWork(ByVal id As Long) As Boolean
        Try
            DS_WorkList.DeleteWork(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Message
    Public Function getCountMessagesRecived(ByVal email As String, ByVal whichOne As Byte) As String

        Select Case whichOne
            Case 0 'All MSG
                Return DS_MessageRecived.getCountAllMsgRecive(email)
            Case 1 'Read MSG
                Return DS_MessageRecived.getCountMsgRead(email)
            Case 2 'UnRead MSG
                Return DS_MessageRecived.getCountMsgUnRead(email)
        End Select

    End Function

    Public Function getDeliverd(ByVal ID As Long) As Byte
        Return DS_MessageRecived.getDeliverd(ID)
    End Function

    Public Function SelectInboxByID(ByVal id As Long) As DataRow
        Return DS_MessageRecived.SelectInbox_ByID(id).Rows(0)
    End Function

    Public Function UpdateDeliverdByID(ByVal id As Long) As Boolean
        Try
            DS_MessageRecived.UpdateDeliverdByID(1, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteMsgByID(ByVal ID As Long) As Boolean
        Try
            DS_MessageRecived.DeleteMSG(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertInbox(ByVal email As String, ByVal other_email As String, ByVal subject As String, ByVal message As String, _
                                ByVal type As Byte, ByVal deliverd As Byte, ByVal flag As Boolean) As Boolean
        Try
            DS_MessageRecived.InsertInbox(email, other_email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), subject, message, type, deliverd, flag)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function getCountMessagesSend(ByVal email As String, ByVal whichOne As Byte) As String

        Select Case whichOne
            Case 0 'All MSG
                Return DS_MessageSend.getCountAllMsgSend(email)
            Case 1 'Deliverd
                Return DS_MessageSend.getCountMsgDeliverd(email)
            Case 2 'Not Deliverd
                Return DS_MessageSend.getCountMsgNotDeliverd(email)
        End Select

    End Function

    Public Function getCountMessagesRecive_Group(ByVal email As String, ByVal whichOne As Byte) As String

        Select Case whichOne
            Case 0 'All MSG
                Return DS_MessageRecived_Group.getCountAllMsgRecive(email)
            Case 1 'Read
                Return DS_MessageRecived_Group.getCountMsgRead(email)
            Case 2 'UnRead
                Return DS_MessageRecived_Group.getCountMsgUnRead(email)
        End Select

    End Function

    Public Function getCountAllSendGroup(ByVal email As String) As String
        Return DS_MessageSend_Group.getCountAllMsgSend(email)
    End Function

    Public Function getMessageByID(ByVal ID As Long) As String
        Return DS_MessageRecived.getMessageByID(ID)
    End Function

    'Notifications

    Public Function GetEmailByCodeObject(ByVal code As String) As String
        Return DS_Query.getEmailByObjectCode(code)
    End Function

    Public Function UpdateFlagNotification(ByVal flag As Boolean, ByVal id As Long) As Boolean
        Try
            DS_Notification.UpdateFlag(flag, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteFlagNotification(ByVal code As Long) As Boolean
        Try
            DS_Notification.DeleteNotifications(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCodeObjectByCodeComment(ByVal code As Long) As String
        Return DS_Query.getCodeObjectByCodeComment(code)
    End Function

    Public Function GetCountReciveMSG(ByVal email As String) As String
        Return DS_Query.getCountReciveMSG(email)
    End Function

    Public Function GetCountRelation(ByVal email As String) As String
        Return DS_Query.Home_GetCountRelation(email)
    End Function

    Public Function DeleteNotificationAll(ByVal email As String) As Boolean
        Try
            DS_Notification.DeleteAllNotifications(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountNotification(ByVal email As String) As String
        Return DS_Query.getCountNotification(email)
    End Function

    '

End Class


