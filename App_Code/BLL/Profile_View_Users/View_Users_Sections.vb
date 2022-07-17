Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class View_Users_Sections

    Dim DS_Query As New DS_View_Users_SectionsTableAdapters.Query
    Dim DS_Information As New DS_View_Users_SectionsTableAdapters.tbl_Profile_InformationTableAdapter
    Dim DS_Contact As New DS_View_Users_SectionsTableAdapters.tbl_Profile_contactTableAdapter
    Dim DS_University As New DS_View_Users_SectionsTableAdapters.Tbl_CMS_UniversityTableAdapter
    Dim DS_Album As New DS_View_Users_SectionsTableAdapters.tbl_Profile_AlbumTableAdapter
    Dim DS_PictureNotAlbum As New DS_View_Users_SectionsTableAdapters.Profile_Not_PictureAlbumTableAdapter
    Dim DS_PictureAlbum As New DS_View_Users_SectionsTableAdapters.Profile_PictureAlbumTableAdapter
    Dim DS_Photos As New DS_View_Users_SectionsTableAdapters.ProfilePhotosTableAdapter
    Dim DS_Message As New DS_View_Users_SectionsTableAdapters.tbl_Profile_InboxTableAdapter
    Dim DS_ParticipatePolling As New DS_View_Users_SectionsTableAdapters.Profile_Participate_PollingTableAdapter
    Dim DS_Polling As New DS_View_Users_SectionsTableAdapters.Profile_ShowPollingTableAdapter
    Dim DS_OutWard As New DS_View_Users_SectionsTableAdapters.tbl_Profile_outwardTableAdapter
    Dim DS_FavoritsUsers As New DS_View_Users_SectionsTableAdapters.Favorits_userTableAdapter

    Public Function GetFnLn(ByVal email As String) As String
        Return DS_Query.Get_FnLnByEmail(email)
    End Function

    Public Function InformationUser(ByVal email As String) As DataRow
        Return DS_Information.GetData(email).Rows(0)
    End Function

    Public Function GetCountryStateCity(ByVal cCountry As Long, ByVal cState As Long, ByVal cCity As Long) As String()

        Dim sLocation(2) As String
        sLocation(0) = DS_Query.Get_CountryName(cCountry)
        sLocation(1) = DS_Query.Get_StateName(cState)
        sLocation(2) = DS_Query.Get_CityName(cCity)
        Return sLocation

    End Function

    Public Function ContactUser(ByVal email As String) As DataRow
        Return DS_Contact.GetData(email).Rows(0)
    End Function

    Public Function UniversityUser(ByVal code As Long) As DataRow
        Return DS_University.GetData(code).Rows(0)
    End Function

    'Picture - Album
    Public Function GetCountPhotoAlbum(ByVal CodeAlbum As Long) As Boolean
        Try
            If DS_Query.Get_CountPhotoAlbum(CodeAlbum) > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function NotAlbum(ByVal email As String) As DataTable
        Return DS_PictureNotAlbum.GetData(email)
    End Function

    Public Function Album(ByVal email As String, ByVal code_album As Long) As DataTable
        Return DS_PictureAlbum.GetData(email, code_album)
    End Function

    Public Function GetAlbumNameByCode(ByVal code As Long) As String
        Return DS_Album.getAlbumNameByCode(code)
    End Function

    Public Function GetCountPictureCommet(ByVal code As Long) As String
        Return DS_Photos.getCountPictureComment(code)
    End Function

    Public Function GetCountPictureLike(ByVal code As Long) As String
        Return DS_Photos.getCountPictureLike(code)
    End Function

    Public Function GetPhotoPathByCodeObject(ByVal code As Long) As String
        Return DS_Photos.Get_PhotoPathByObjectCode(code)
    End Function

    Public Function GetPhotoDetailByCodeObject(ByVal code As Long) As String
        Return DS_Photos.Get_PhotoDetailByObjectCode(code)
    End Function

    Public Function DeleteAlbum(ByVal code As Long) As Boolean
        Try
            DS_Album.DeleteAlbum(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Message
    Public Function InsertMessage(ByVal Email As String, ByVal for_who As String, ByVal subject As String, ByVal message As String, _
                                  ByVal Type As Byte, ByVal deliverd As Boolean, ByVal flag As Boolean) As Boolean
        Try
            DS_Message.InsertMessage(Email, for_who, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), subject, message, Type, deliverd, flag)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Polling
    Public Function InsertPolling(ByVal email As String, ByVal code_polling As Long, ByVal code_option As Long) As Boolean
        Try
            DS_ParticipatePolling.InsertPolling(email, code_polling, code_option)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetPercentPolling(ByVal code_polling As String, ByVal code_option As String)
        Return DS_Polling.Profile_PercentPolling(code_polling, code_option)
    End Function

    'Outward
    Public Function OutwardUser(ByVal email As String) As DataRow
        Return DS_OutWard.GetData(email).Rows(0)
    End Function

    '
    Public Function getCountFavoritUser(ByVal codeFavorit As Long) As String
        Return DS_FavoritsUsers.getCountFavorit(codeFavorit)
    End Function

End Class
