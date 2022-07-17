Imports Microsoft.VisualBasic

Public Class CMS_Contact

    Dim DS_CMS_Contact As New DS_CMS_ContactTableAdapters.Query

    Public Function GetMSG(ByVal id As Long) As String
        Return DS_CMS_Contact.getMsg(id)
    End Function

    Public Function GetDate(ByVal id As Long) As String
        Return DS_CMS_Contact.getDate(id)
    End Function

    Public Function GetTime(ByVal id As Long) As String
        Return DS_CMS_Contact.getTime(id)
    End Function

    Public Function UpdateFlag(ByVal id As Long) As Boolean
        DS_CMS_Contact.UpdateFlag(id)
    End Function

    Public Function DeleteContact(ByVal id As Long) As Boolean
        DS_CMS_Contact.DeleteContact(id)
    End Function

End Class
