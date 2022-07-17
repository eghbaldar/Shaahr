Imports Microsoft.VisualBasic
Imports System.Data

Public Class Post

    Dim DS_UpdateNews As New DS_View_UsersTableAdapters.Profile_UpdateNewsTableAdapter

    Public Function SelectAll_UpdateNews(ByVal email As String, ByVal for_who As String) As DataTable
        Return DS_UpdateNews.GetData(email, for_who)
    End Function

End Class
