Imports Microsoft.VisualBasic

Public Class CMS_University

    Dim DS_Query As New DS_CMS_UniversityTableAdapters.Query
    Dim DS_Cat As New DS_CMS_UniversityTableAdapters.CMS_Category_UniversityTableAdapter
    Dim DS_Uni As New DS_CMS_UniversityTableAdapters.CMS_UniversityTableAdapter

    Public Function GetCountUserUniCat(ByVal code As Long) As String
        Return DS_Query.getCountUserUniCat(code)
    End Function

    Public Function GetCountUserUni(ByVal code As Long) As String
        Return DS_Query.getCountUserUni(code)
    End Function

    Public Function InsertCat(ByVal name As String, ByVal logo As String) As Boolean
        Try
            DS_Cat.InsertCat(name, logo)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertUni(ByVal name As String, ByVal address As String, ByVal LinkWebsite As String, ByVal picture As String, ByVal CodeCategory As Long) As Boolean
        Try
            DS_Uni.InsertUni(name, address, LinkWebsite, picture, CodeCategory)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteCat(ByVal code As Long) As Boolean
        DS_Cat.DeleteCat(code)
    End Function

    Public Function DeleteUni(ByVal code As Long) As Boolean
        DS_Uni.DeleteUni(code)
    End Function

    Public Function GetLogoCat(ByVal code As Long) As String
        Return DS_Query.getLogoCat(code)
    End Function

    Public Function GetLogoUni(ByVal code As Long) As String
        Return DS_Query.getLogoUni(code)
    End Function

End Class
