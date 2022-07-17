Imports System.Data

Public Class View_Users

    Dim DS_Query As New DS_View_UsersTableAdapters.Query
    Dim DS_Comment As New DS_View_UsersTableAdapters.Profile_CommentsTableAdapter
    Dim DS_LikeUnlikePost As New DS_View_UsersTableAdapters.tbl_Profile_like_unlike_postTableAdapter
    Dim DS_LikeUnlikeComment As New DS_View_UsersTableAdapters.tbl_Profile_like_unlike_commentTableAdapter
    Dim DS_Object As New DS_View_UsersTableAdapters.tbl_Profile_ObjectsTableAdapter
    Dim DS_Relationship As New DS_View_UsersTableAdapters.Profile_RelationshipTableAdapter
    Dim DS_List_BeforeUsers As New DS_View_UsersTableAdapters.Profile_List_BeforeUsersTableAdapter
    Dim DS_RelationWaiting As New DS_View_UsersTableAdapters.Relationship_WaitingTableAdapter
    Dim DS_FamilyWaiting As New DS_View_UsersTableAdapters.Family_WaitingTableAdapter
    Dim DS_Insert_Comment_LikePost_LikeComment_and_Notifications As New DS_View_UsersTableAdapters.Profile_Insert_Comment_LikePost_LikeComment_and_NotificationsTableAdapter

    Public Function Get_Think(ByVal email As String) As String
        Get_Think = DS_Query.Get_Think(email)
        Return Get_Think
    End Function

    Public Function Get_RandomPictureAlbum(ByVal email As String) As String(,)

        Dim DS_RndPictureAlbum As New DS_View_UsersTableAdapters.RandomPictureAlbumTableAdapter
        Dim Path(2, 1) As String
        Dim MyDataset As New DataTable
        MyDataset = DS_RndPictureAlbum.GetData(email)

        Try
            If MyDataset.Rows(0)(1).ToString <> "" Then
                Path(0, 0) = MyDataset.Rows(0)(1).ToString
                Path(0, 1) = DS_RndPictureAlbum.getCodeAlbumByCodeObject(MyDataset.Rows(0)(0).ToString) 'code photo
            Else
                Path(0, 0) = ""
                Path(0, 1) = ""
            End If
        Catch ex As Exception
            Path(0, 0) = ""
            Path(0, 1) = ""
        End Try
        
        Try
            If MyDataset.Rows(1)(1).ToString <> "" Then
                Path(1, 0) = MyDataset.Rows(1)(1).ToString
                Path(1, 1) = DS_RndPictureAlbum.getCodeAlbumByCodeObject(MyDataset.Rows(1)(0).ToString) 'code photo
            Else
                Path(1, 0) = ""
                Path(1, 1) = ""
            End If
        Catch ex As Exception
            Path(1, 0) = ""
            Path(1, 1) = ""
        End Try

        Try
            If MyDataset.Rows(2)(1).ToString <> "" Then
                Path(2, 0) = MyDataset.Rows(2)(1).ToString
                Path(2, 1) = DS_RndPictureAlbum.getCodeAlbumByCodeObject(MyDataset.Rows(2)(0).ToString) 'code photo
            Else
                Path(2, 0) = ""
                Path(2, 1) = ""
            End If
        Catch ex As Exception
            Path(2, 0) = ""
            Path(2, 1) = ""
        End Try

        Return Path

    End Function

    Public Function getUsernameByEmail(ByVal email As String) As String
        Return DS_Query.getUsernameByEmail(email)
    End Function

    Public Function getEmailByUsername(ByVal username As String) As String
        Return DS_Query.getEmailByUsername(username)
    End Function

    Public Function getOrginalAvatar(ByVal Email As String) As String
        Return DS_Query.getOrginalAvatar(Email)
    End Function

    ''' <summary>
    ''' مرد درست و زن غلط برگشت داده می شود
    ''' </summary>
    ''' <param name="email"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getSex(ByVal email As String) As Boolean
        If Not DS_Query.getSex(email) Then
            Return True 'مرد
        Else
            Return False 'زن
        End If
    End Function

    Public Function getMarridSingle(ByVal email As String) As Byte
        Return DS_Query.getMarrid_Single(email)
        '0:single
        '1:marrid
        '2:divorce        
    End Function

    '---------- Full-Checking of Send-Recive Married Reuqest
    Public Function DeleteReciveMarried(ByVal email As String) As Boolean
        DS_Query.DeleteReciveMarried(email)
    End Function

    Public Function DeleteSendMarried(ByVal email As String) As Boolean
        DS_Query.DeleteSendMarried(email)
    End Function

    Public Function GetCheckMarried(ByVal email As String, ByVal user As String) As Boolean

        If Val(DS_Query.getCheckMarried(email, user).ToString) > 0 Then
            Return True 'یعنی قبلا ازدواج کرده بود
        Else
            Return False 'یعنی قبلا ازدواج نـــکرده بود
        End If

    End Function

    Public Function DeleteAllTempFamilyByEmail(ByVal email As String) As Boolean
        DS_Query.DeleteAllTempFamilyByEmail(email, email)
    End Function

    Public Function UpdateRelationAfterChangeSex(ByVal email As String) As Boolean
        DS_Query.UpdateRelationAfterChangeSex(email, email)
    End Function

    '----------Relationship
    Public Function CheckRelationship(ByVal email As String, ByVal user As String) As Boolean
        Try
            If DS_Relationship.CheckWaiting(email, user, 1) = 0 Then
                Return True 'یعنی دوستی وجود ندارد و آماده ی دوستی است
            Else
                Return False 'دوستی وجود دارد و می تواند قطع شود
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertRelationship(ByVal Email As String, ByVal User As String, ByVal type As Byte, ByVal flag As Byte, ByVal DateResponse As String) As Boolean
        Try
            DS_Relationship.InsertRelationship(Email, User, type, flag, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), DateResponse)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckWaiting(ByVal Email As String, ByVal User As String) As Boolean
        Try
            If DS_Relationship.CheckWaiting(Email, User, 0) = 1 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteRelationship(ByVal email As String, ByVal user As String) As Boolean
        Try
            DS_Relationship.DeleteRelationship(email, user)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----------Post
    Public Function InsertObject(ByVal Email As String, ByVal for_who As String, ByVal Type As Byte, ByVal string_factor As String, ByVal detail As String) As Boolean
        Try
            DS_Object.InsertObject(Email, for_who, Type, string_factor, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), Now.ToLongTimeString.Substring(0, 8), detail, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteObject(ByVal code As Long) As Boolean
        Try
            DS_Object.DeleteObject(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '----------Comment of post
    Public Function InsertComment(ByVal code_obj As Long, ByVal email As String, ByVal text As String) As Boolean

        Try
            DS_Comment.InsertComment(code_obj, email, text)
        Catch ex As Exception

        End Try

    End Function

    Public Function DeleteComment(ByVal code As Long) As Boolean
        Try
            DS_Comment.DeleteComment(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountComment(ByVal cideObject As Long) As String
        Return DS_Comment.Get_CountComment(cideObject)
    End Function

    '----------Like of Post
    Public Function CheckLikeUnlikePost(ByVal code_object As Long, ByVal Email As String, ByVal for_who As String) As Boolean
        Try
            DS_LikeUnlikePost.CheckLikeUnlikePost(code_object, Email, for_who)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckDuplicateLike(ByVal code_object As Long, ByVal email As String) As Boolean
        Try
            If DS_LikeUnlikePost.CheckDuplicateLike(code_object, email) = 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountLikeUnlikePost(ByVal code_object As Long) As Integer
        Return DS_LikeUnlikePost.GetCountLikeUnlikePost(code_object)
    End Function

    '------------ Like of Comment
    Public Function CheckLikeUnlikeComment(ByVal code_comment As Long, ByVal Email As String, ByVal for_who As String) As Boolean
        Try
            DS_LikeUnlikeComment.CheckLikeUnlikeComment(code_comment, Email, for_who)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckDuplicateComment(ByVal code_comment As Long, ByVal email As String) As Boolean

        Try
            If DS_LikeUnlikeComment.CheckDuplicateLike(code_comment, email) = 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try

    End Function

    Public Function UserLikeComment(ByVal codeComment As Long, ByVal email As String) As DataTable

        Dim Data As New DS_View_UsersTableAdapters.Profile_ShowUsersLikeUnlikeCommentTableAdapter
        Return Data.GetData(codeComment, email)

    End Function

    Public Function GetCountLikeUnlikeComment(ByVal code_comment As Long) As Integer
        Return DS_LikeUnlikeComment.GetCountLikeComment(code_comment)
    End Function

    '------------ List User(s) For Notification
    Public Function InsertNotification(ByVal index As String, ByVal email As String, ByVal codeObject As Long, ByVal Text As String, ByVal CodeComment As Long) As Boolean
        If DS_Insert_Comment_LikePost_LikeComment_and_Notifications.GetData(index, codeObject, email, Text, CodeComment).Rows(0)(0).ToString = "1" Then
            Return True
        Else
            Return False
        End If
    End Function

    '------------ Relationship and Family Waitnig
    Public Function DeleteRelationshipWaiting(ByVal ID As Long) As Boolean
        DS_RelationWaiting.DeleteRaltionBy_ID(ID)
    End Function
    Public Function DeleteFamilyWaiting(ByVal ID As Long) As Boolean
        DS_FamilyWaiting.DeleteTempFamilyBy_ID(ID)
    End Function

End Class
