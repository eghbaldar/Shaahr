Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_News

    Dim DS_CMS_NewsCat As New DS_CMS_NewsTableAdapters.CMS_NewsCategoryTableAdapter
    Dim DS_CMS_News As New DS_CMS_NewsTableAdapters.CMS_NewsTableAdapter

    Public Function DeleteCategory(ByVal code As Long) As Boolean
        DS_CMS_NewsCat.DeleteCategory(code)
    End Function

    Public Function InsertCategory(ByVal name As String) As Boolean
        DS_CMS_NewsCat.InsertCategory(name)
    End Function

    Public Function InsertNews(ByVal title_news As String, ByVal lid_news As String, ByVal news As String, _
                               ByVal Flag As Byte, ByVal username As String, ByVal Code_Category As Long, ByVal type As Byte) As Boolean
        DS_CMS_News.InsertNews(title_news, lid_news, news, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), Now.TimeOfDay.ToString.Substring(0, 8), Flag, username, Code_Category, Type)
    End Function

    Public Function DeleteNews(ByVal id As Long) As Boolean
        DS_CMS_News.DeleteNews(id)
    End Function

    Public Function SelectRowNews(ByVal id As Long) As DataRow
        Return DS_CMS_News.Select_row(id).Rows(0)
    End Function

    Public Function UpdateNews(ByVal title_news As String, ByVal lid_news As String, ByVal news As String, _
                               ByVal Flag As Byte, ByVal Code_Category As Long, ByVal id As Long, ByVal type As Byte) As Boolean
        DS_CMS_News.UpdateNews(title_news, lid_news, news, Flag, Code_Category, type, id)
    End Function

End Class
