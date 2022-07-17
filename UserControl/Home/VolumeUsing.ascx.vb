Imports System.IO

Partial Class UserControl_Home_VolumeUsing
    Inherits System.Web.UI.UserControl

    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'System.Threading.Thread.Sleep(1000)
        Read()
    End Sub

    Public Sub Read()
        lblAllVolume.Text = "<span style='color:white;'>حجم کل:</span><span style='color:#fff;font-weight:bold;'> %100</span>"
        lblUseVolume.Text = "<span style='color:white;'>حجم مصرفی شما:</span><blink><span style='color:#F5D0B6;font-weight:bold;'> %" + Math.Round(Val(AccVolume())).ToString + "</span></blink>"
        lblRemainVolume.Text = "<span style='color:white;'>حجم باقیمانده شما:</span><blink><span style='color:#c6fbe6;font-weight:bold;'> %" + (100 - Math.Round(Val(AccVolume()))).ToString + "</span></blink>"

        Dim BGColor As String
        Dim ForeColor As String
        If Val(Math.Round(Val(AccVolume()))) >= 99 Then
            BGColor = "#CC1A00"
            ForeColor = "#ffffff"
        Else
            BGColor = "#BDDDF6"
            ForeColor = "#000000"
        End If

        LProgress.Text = "<div style='width: 192px; background-color: #D9EBF9; height: 20px; border: 1px solid #E0E0E0;'>" + _
                         "<div style='width: " + (((Math.Round(Val(AccVolume()))) * 192) / 100).ToString + "px; height: 17px; background-color: " + BGColor + "; border-left: 1px solid #9CC8EB;" + _
                         "text-align: center; color: " + ForeColor + "; padding-top: 3px;'>" + _
                         Math.Round(Val(AccVolume())).ToString + "%" + _
                         "</div>" + _
                         "</div>"
        'LProgress.Text = (Val(AccVolume())).ToString
    End Sub

    Private Function AccVolume() As String

        '50 MG -----> 52,428,800 B

        Dim count As Long
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Photo\"), Session("MY-UsErNaMe"), "tbl_Profile_Objects", "string_factor")
        count += ClassHomeSetting.CheckNormalVolume(MapPath("~\Content\images\Profile\Avatars\"), Session("MY-UsErNaMe"), "tbl_Profile_Avatars", "PicPath")

        Return (100 * (count)) / 52428800
        'Return count

    End Function

    'Dim iUse As Integer = 0
    'Private Function Rank(ByVal Path As String) As Long
    '    GetFiles(New DirectoryInfo(MapPath(Path)))
    '    Return iUse
    'End Function
    'Sub GetFiles(ByVal source As DirectoryInfo)
    '    iUse = 0
    '    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    '    Dim files() As FileInfo = source.GetFiles

    '    For Each MyFile As FileInfo In files
    '        Dim S() As String = MyFile.Name.Split("_")
    '        If S(0) = Session("MY-UsErNaMe") Then iUse += MyFile.Length 'Response.Write(MyFile.Length.ToString + "<br/>") 
    '    Next
    '    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'End Sub

End Class

