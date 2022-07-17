Imports Microsoft.VisualBasic
Imports System.Data

Public Class Shaahr

    Dim ClassProfile As New View_Users

    Dim DS_CMS_Query As New DS_ShaahrTableAdapters.Query
    Dim DS_Shaahr_Request_FundationShaahr As New DS_ShaahrTableAdapters.Shaahr_Request_FundationShaahrTableAdapter
    Dim DS_Shaahr_Search As New DS_ShaahrTableAdapters.Search_Shaahr_Request_FundationShaahrTableAdapter
    Dim DS_Shaahr_Complement As New DS_ShaahrTableAdapters.Shaahr_ShaahrComplementTableAdapter
    Dim DS_ShaahrNews As New DS_ShaahrTableAdapters.Shaahr_ShaahrNewsTableAdapter
    Dim DS_ProfleShaahr As New DS_ShaahrTableAdapters.Profile_ShaahrsTableAdapter
    Dim DS_ShaahrCategoryPost As New DS_ShaahrTableAdapters.Shaahr_ShaahrCategoryPostTableAdapter
    Dim DS_ShaahrPost As New DS_ShaahrTableAdapters.Shaahr_ShaahrPostTableAdapter
    Dim DS_ShaahrAnswerPost As New DS_ShaahrTableAdapters.Shaahr_AnswerPostTableAdapter
    Dim DS_ShaahrMayorAssist As New DS_ShaahrTableAdapters.Shaahr_MayorAssistsTableAdapter

    Public Function GetCountInhabitShaahr(ByVal email As String) As String
        Return DS_CMS_Query.getCountInhabitShaahr(email).ToString
    End Function

    Public Function AuthenticationAuth(ByVal email As String) As Boolean
        If DS_CMS_Query.AuthenticationAuth(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function InsertRequest_FundationShaahr(ByVal CodeState As Byte, ByVal CodeCategory As Long, ByVal Name As String, _
                                                  ByVal CuaseFundation As String, ByVal Funder As String, _
                                                  ByVal EnableGovernor As Byte, ByVal CuaseGovernor As String, _
                                                  ByVal EnablePresedentNazmie As Byte, ByVal CodePeygiriJiring As String) As Boolean
        Try
            DS_Shaahr_Request_FundationShaahr.InsertRequestFundation(CodeState, CodeCategory, Name, CuaseFundation, Funder, EnableGovernor, CuaseGovernor, _
                                                         EnablePresedentNazmie, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), CodePeygiriJiring)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SearchShaahr(ByVal name As String) As DataTable
        Return DS_Shaahr_Search.GetData(name)
    End Function

    Public Function GetFavorit(ByVal code As Long) As String
        Return DS_CMS_Query.getFavorits(code)
    End Function

    Public Function Insert_ShaahrComplement(ByVal Funder As String) As Boolean
        Try
            DS_Shaahr_Complement.InsertComplement(DS_CMS_Query.GetLastID_ReqShaahr(Funder), "", "", "", "")
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function ShaahrComplement(ByVal IDRequest As Long) As DataTable
        Return DS_Shaahr_Complement.GetData(IDRequest)
    End Function

    Public Function Updaet_Subname(ByVal subname As String, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_Subname(subname, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Updaet_Header(ByVal Header As String, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_Header(Header, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Updaet_Logo(ByVal Logo As String, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_Logo(Logo, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Updaet_Ads(ByVal Ads As String, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_ads(Ads, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Updaet_Format(ByVal Format As Boolean, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_Format(Format, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Updaet_LogoAlign(ByVal Align As String, ByVal ID As Long) As Boolean
        Try
            DS_Shaahr_Complement.Update_LogoAlign(Align, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InsertShaahrNews(ByVal CodeShaahr As Long, ByVal Subject As String, ByVal Text As String, ByVal email As String, ByVal flag As Boolean) As Boolean
        Try
            DS_ShaahrNews.InsertShaahrNews(CodeShaahr, Subject, Text, email, 0, flag, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Delete_ShaahrNews(ByVal ID As Long) As Boolean
        Try
            DS_ShaahrNews.DeleteShaahrNews(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function ShaahrNewsById(ByVal codeShaahr As Long, ByVal ID As Long) As DataTable
        Return DS_ShaahrNews.Select_Row(codeShaahr, ID)
    End Function

    Public Function UpdateNews(ByVal subject As String, ByVal Text As String, ByVal flag As Boolean, ByVal id As Long) As Boolean
        Try
            DS_ShaahrNews.UpdateNews(subject, Text, flag, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetSubjectNews(ByVal code As Long) As String
        Return DS_CMS_Query.GetSubjectNews(code)
    End Function

    Public Function InsertProfileShaahr(ByVal Email As String, ByVal code_shaahr As Long) As Boolean
        Try
            DS_ProfleShaahr.InsertProfileShaahrs(Email, code_shaahr, 1)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteProfileShaahr(ByVal Email As String, ByVal code_shaahr As Long) As Boolean
        Try
            DS_ProfleShaahr.DeleteProfileShaahrs(Email, code_shaahr)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckRegisterUserInShaahr(ByVal Email As String, ByVal code_shaahr As Long) As Boolean
        Try
            If DS_CMS_Query.CheckRegisterUserInShaahr(Email, code_shaahr) > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
        End Try
    End Function

    Public Function UpdateVisitShaahr(ByVal id As Long) As Boolean
        Try
            DS_Shaahr_Complement.UpdateVisit(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetVisitShaahr(ByVal id As Long) As String
        Return DS_CMS_Query.GetVisitShaahr(id)
    End Function

    Public Function GetCountUsersShaahr(ByVal id As Long) As String
        Return DS_CMS_Query.GetCountUsersShaahr(id)
    End Function

    Public Function InsertShaahrCategory(ByVal CodeShaahr As Long, ByVal Subject As String, ByVal detail As String, ByVal luck As Boolean) As Boolean
        Try
            DS_ShaahrCategoryPost.InsertCat(CodeShaahr, Subject, detail, luck)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetSubjectCategory(ByVal id As Long) As String
        Return DS_CMS_Query.getSubjectCategory(id)
    End Function

    Public Function InsertShaahrPost(ByVal CodeCategory As Long, ByVal Subject As String, ByVal Text As String, ByVal email As String, _
                                     ByVal luck As Boolean) As Boolean
        Try
            DS_ShaahrPost.InsertShaahrPost(CodeCategory, Subject, Text, email, 0, Now.TimeOfDay.ToString.Substring(0, 8) _
                                     , ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), luck)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetLuckPost(ByVal code As Long) As Boolean
        Return DS_CMS_Query.getLuckPost(code)
    End Function

    Public Function GetLuckCategory(ByVal code As Long) As Boolean
        Return DS_CMS_Query.getLuckCategory(code)
    End Function

    Public Function UpdateVisitPost(ByVal Code As Long) As Boolean
        Try
            DS_ShaahrPost.UpdateVisitPost(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetVisitPost(ByVal code As Long) As String
        Return DS_ShaahrPost.GetVisitPost(code)
    End Function

    Public Function GetSumVisitPost(ByVal code As Long) As String
        Return DS_CMS_Query.GetSumVisitPost(code)
    End Function

    Public Function GetCountPost(ByVal code As Long) As String
        Return DS_ShaahrPost.GetCountPost(code)
    End Function

    Public Function GetlastUpdatePost(ByVal code As Long) As String
        Return DS_ShaahrPost.GetLastUpdateDate(code)
    End Function

    Public Function InsertShaahrAnswerPost(ByVal CodePost As Long, ByVal Subject As String, ByVal Text As String, ByVal email As String) As Boolean
        Try
            DS_ShaahrAnswerPost.InsertAnswerPost(CodePost, Subject, Text, email, Now.TimeOfDay.ToString.Substring(0, 8), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountAnswer(ByVal code As Long) As String
        Return DS_ShaahrAnswerPost.GetCountAnswer(code)
    End Function

    Public Function UpdateMayorAssist(ByVal index As Boolean, ByVal Assist As String, ByVal Code As Long) As Boolean
        Try
            Select Case index
                Case True
                    DS_ShaahrMayorAssist.UpdateAssists1(ClassProfile.getEmailByUsername(Assist), Code)
                Case False
                    DS_ShaahrMayorAssist.UpdateAssists2(ClassProfile.getEmailByUsername(Assist), Code)
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function MayorAssists(ByVal codeShaahr As Long) As DataTable
        Return DS_ShaahrMayorAssist.GetData(codeShaahr)
    End Function

    Public Function GetMayor(ByVal Code As Long) As String
        Return DS_CMS_Query.GetMayor(Code)
    End Function

    Public Function UpdateLockUnlockCategory(ByVal L As String, ByVal Code As Long) As Boolean
        Try
            DS_ShaahrCategoryPost.UpdateLock_Unlock(L, Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateLockUnlockPost(ByVal L As String, ByVal Code As Long) As Boolean
        Try
            DS_ShaahrPost.UpdateLock_Unlock(L, Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckMayor(ByVal email As String, ByVal code As Long) As Boolean
        If DS_CMS_Query.CheckMayor(email, code) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckMayorAssist1(ByVal email As String, ByVal code As Long) As Boolean
        If DS_CMS_Query.CheckMayor_Assist1(email, code) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckMayorAssist2(ByVal email As String, ByVal code As Long) As Boolean
        If DS_CMS_Query.CheckMayor_Assist2(email, code) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function DeleteCategory_Post_AnswerPost(ByVal index As Byte, ByVal code As Long) As Boolean
        Try
            Select Case index
                Case 0 'category
                    DS_ShaahrCategoryPost.DeleteCategory(code)
                Case 1 'post
                    DS_ShaahrPost.DeletePost(code)
                Case 2 'answer post
                    DS_ShaahrAnswerPost.DeleteAnswerPost(code)
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function CheckUserWriteAnswerPost(ByVal email As String, ByVal ID As Long) As Boolean
        If DS_CMS_Query.CheckUserWritePost(ID, email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetSubjectPost(ByVal code As Long) As String
        Return DS_CMS_Query.GetSubjectPost(code)
    End Function

    Public Function CheckEnter_Mayor(ByVal email As String) As Boolean
        If DS_CMS_Query.CheckEnter_Mayor(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckEnter_MayorAssist1(ByVal email As String) As Boolean
        If DS_CMS_Query.CheckEnter_Assist_1(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function CheckEnter_MayorAssist2(ByVal email As String) As Boolean
        If DS_CMS_Query.CheckEnter_Assist_2(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetCodeShaahrByCodeCategoryPost(ByVal CodeCategoryPost As Long) As String
        Return DS_CMS_Query.GetCodeShaahrByCodeCategoryPost(CodeCategoryPost)
    End Function

    Public Function GetShaahrLogo(ByVal id As Long) As String
        Return DS_CMS_Query.GetShaahrLogo(id)
    End Function

    Public Function GetCountShaahrOfState(ByVal CodeState As Long) As String
        Return DS_CMS_Query.GetCountShaahrOfState(CodeState)
    End Function

    Public Function GetCountFavoritsByCodeCategory(ByVal code_category As Long) As String
        Return DS_CMS_Query.GetCountFavoritsByCodeCategory(code_category)
    End Function

    Public Function GetVisitState(ByVal CodeState As Long) As String
        Return DS_CMS_Query.GetVisitState(CodeState)
    End Function

    Public Function UpdateVisitNews(ByVal IdNews As Long) As Boolean
        Try
            DS_ShaahrNews.UpdateVisitNews(IdNews)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
