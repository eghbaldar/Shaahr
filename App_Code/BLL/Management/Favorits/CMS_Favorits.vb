Imports Microsoft.VisualBasic

Public Class CMS_Favorits

    Dim DS_Query As New DS_CMS_FavoritsTableAdapters.Query
    Dim DS_Category As New DS_CMS_FavoritsTableAdapters.CMS_Favorits_CategoryTableAdapter
    Dim DS_Favorit As New DS_CMS_FavoritsTableAdapters.CMS_FavoritsTableAdapter
    Dim DS_UsersFav As New DS_CMS_FavoritsTableAdapters.Favorits_UsersTableAdapter

    Public Function GetDetailCat(ByVal code As Long) As String
        Return DS_Query.getDetailCat(code)
    End Function

    Public Function GetDetailFav(ByVal code As Long) As String
        Return DS_Query.getDetailFav(code)
    End Function

    Public Function DeleteCat(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_cat(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteFav(ByVal code As Long) As Boolean
        Try
            DS_Query.Delete_Fav(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CountCatUsers(ByVal code As Long) As String
        Return DS_Query.getCountCatUsers(code)
    End Function

    Public Function CountFavUsers(ByVal code As Long) As String
        Return DS_Query.getCountFavUsers(code)
    End Function

    Public Function UpdateDetailCat(ByVal detail As String, ByVal code As Long) As Boolean
        Try
            DS_Query.UpdateDetailCat(detail, code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDetailFav(ByVal detail As String, ByVal code As Long) As Boolean
        Try
            DS_Query.UpdateDetailFav(detail, code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertCategory(ByVal title As String, ByVal Logo As String, ByVal detail As String) As Boolean
        Try
            DS_Category.InsertCategory(title, Logo, detail)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertFavorit(ByVal code_category As Long, ByVal title As String, ByVal Logo As String, ByVal detail As String) As Boolean
        Try
            DS_Favorit.InsertFavorits(code_category, title, Logo, detail)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLogoCat(ByVal Code As Long) As String
        Return DS_Query.getLogoCat(Code)
    End Function

    Public Function GetLogoFav(ByVal Code As Long) As String
        Return DS_Query.getLogoFav(Code)
    End Function

    Public Function DeleteUserOfFavorit(ByVal ID As Long) As Boolean
        Try
            DS_UsersFav.DeleteUser(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
End Class