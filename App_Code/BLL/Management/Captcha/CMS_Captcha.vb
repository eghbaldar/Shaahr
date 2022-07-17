Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_Captcha

    Dim DS_Captcha As New DS_CMS_CaptchaTableAdapters.CMS_CaptchaTableAdapter
    Dim DS_Captcha_Random As New DS_CMS_CaptchaTableAdapters.CMS_Captcha_RandomTableAdapter
    Dim DS_Query As New DS_CMS_CaptchaTableAdapters.Query

    Public Function GetRandomQuestion(ByVal level As String) As String()

        Dim dr As DataRow = DS_Captcha_Random.GetData(level).Rows(0)
        Dim s(1) As String
        s(0) = dr(2).ToString 'Question
        s(1) = dr(0).ToString 'ID's Question
        Return s

    End Function

    Public Function Check(ByVal Answer As String, ByVal ID As Long) As Boolean
        Try
            If DS_Query.getCheck(Answer, ID) > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertCaptcha(ByVal level As String, ByVal question As String, ByVal answer As String) As Boolean
        Try
            DS_Captcha.InsertCaptcha(level, question, answer)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
