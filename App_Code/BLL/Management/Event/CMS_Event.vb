Imports Microsoft.VisualBasic

Public Class CMS_Event

    Dim Query As New DS_CMS_EventTableAdapters.Query

    Public Function GetInformation(ByVal index As Byte) As String
        Select Case index
            Case 1
                Return Query._getAllOnline()
            Case 2
                Return Query._getAllRegister()
            Case 3
                Return Query._getReportsDetective()
            Case 4
                Return Query._getReportUser()
            Case 5
                Return Query._getTodayLogin(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            Case 6
                Return Query._getTodayRegister(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
        End Select
    End Function

End Class
