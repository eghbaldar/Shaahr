Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_Management

    Dim DS_Compelemnt As New DS_CMS_ManagementTableAdapters.CMS_ComplementTableAdapter

    Public Function GetCompelemnt() As DataTable
        Return DS_Compelemnt.GetData()
    End Function

    Public Function UpdateDontEnter(ByVal bit As Byte) As Boolean
        DS_Compelemnt.UpdatEDontEnter(bit)
    End Function

    Public Function UpdateDontEnterText(ByVal text As String) As Boolean
        DS_Compelemnt.UpdateDontEnterPart(text)
    End Function

    Public Function UpdateDontRegister(ByVal text As String) As Boolean
        DS_Compelemnt.UpdateDontRegister(text)
    End Function

    Public Function UpdateTopText(ByVal text As String) As Boolean
        DS_Compelemnt.UpdateTopText(text)
    End Function

    Public Function UpdateTopLogo(ByVal text As String) As Boolean
        DS_Compelemnt.UpdateTopLogo(text)
    End Function

    Public Function UpdatePicHeader(ByVal Filename As String) As Boolean
        DS_Compelemnt.UpdatePicHeader(Filename)
    End Function


End Class
