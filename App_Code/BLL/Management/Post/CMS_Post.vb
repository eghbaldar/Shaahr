Imports Microsoft.VisualBasic

Public Class CMS_Post

    Dim DS_Query As New DS_CMS_PostTableAdapters.Query
    Dim DS_Album As New DS_CMS_PostTableAdapters.Profile_AlbumTableAdapter
    Dim DS_NotAlbum As New DS_CMS_PostTableAdapters.Profile_Photo_Not_AlbumTableAdapter

    Public Function Delete_AllCommentPost(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_AllCommentPost(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_AllLikePost(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_AllLike_Post(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_AllLikeComment(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_AllLike_Comment(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_Post(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_Post(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function getSubject_Detail(ByVal code As Long, ByVal index As Boolean) As String
        'True --> Subject
        'False --> Detail
        Select Case index
            Case True
                Return DS_Query.getSubject(code)
            Case False
                Return DS_Query.getDetail(code)
        End Select
    End Function

    Public Function UpdateObject(ByVal code As Long, ByVal subject As String, ByVal detail As String) As Boolean
        Try
            DS_Query.UpdateObject(subject, detail, code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountPhotoAlbum(ByVal Code As Long) As String
        Return DS_Query.GetCountPhotoAlbum(Code)
    End Function

    Public Function DeleteAlbum(ByVal Code As Long) As Boolean
        Try
            DS_Album.DeleteAlbum(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeletePhoto(ByVal Code As Long) As Boolean
        Try
            DS_NotAlbum.DeletePhoto(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
