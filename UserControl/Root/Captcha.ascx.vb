
Partial Class UserControl_Root_Captcha
    Inherits System.Web.UI.UserControl

    Dim ClassCaptcha As New CMS_Captcha

    Private _width As Integer
    Property Width() As Integer
        Get
            Return _width
        End Get
        Set(ByVal value As Integer)
            _width = value
        End Set
    End Property

    Public Sub _No()
        Pnl.BorderColor = System.Drawing.ColorTranslator.FromHtml("#e45750")
        GenerateText(1)
    End Sub
    Private Sub Defualt()
        Pnl.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E4E4E4")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Pnl.Width = _width
        If Not IsPostBack Then GenerateText(1) '0:esay         '1:medium        '2:hard 

    End Sub

    Private Sub GenerateText(ByVal Level As String)
        Dim s() As String = ClassCaptcha.GetRandomQuestion(Level)
        lblID.Text = s(1)
        lblQuestion.Text = s(0)
    End Sub

    Protected Sub btnEsay_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEsay.Click
        GenerateText(0) '0:esay         '1:medium        '2:hard 
        Defualt()
    End Sub
    Protected Sub btnMedium_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMedium.Click
        GenerateText(1) '0:esay         '1:medium        '2:hard 
        Defualt()
    End Sub
    Protected Sub btnHard_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHard.Click
        GenerateText(2) '0:esay         '1:medium        '2:hard 
        Defualt()
    End Sub
    Protected Sub btnRepeat_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRepeat.Click
        GenerateText(1) '0:esay         '1:medium        '2:hard 
        Defualt()
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnOK.Click
        If Check() Then
            Pnl.BorderColor = System.Drawing.ColorTranslator.FromHtml("#89C186")
        Else
            _No()
        End If
    End Sub

    Public Function Check() As Boolean
        If ClassCaptcha.Check(Server.HtmlDecode(txtAnswer.Text), lblID.Text) Then
            Return True
        Else
            _No()
            GenerateText(2)
            Return False
        End If
    End Function

    Public Sub Clear()
        txtAnswer.Text = ""
        Pnl.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E4E4E4")
        GenerateText(1)
    End Sub

End Class
