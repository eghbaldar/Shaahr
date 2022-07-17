<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="pay.aspx.vb" Inherits="Stage_Jiring_pay" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: titr;
            src: url(      "./../../content/font/BTitrBd.ttf" );
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            افزایش جیرینگ
        </div>
        <div style="width: 731px; float: right;">
            <div style="width: 731px; height: 50px;margin-top:3px;">
                <div style="float: right;">
                    <img src="../../content/images/Stage/Jiring/MyJiring.jpg" />
                </div>
                <div style="float: right; height: 50px;">
                    <table class="style1">
                        <tr>
                            <td>
                                اعتبار شما:<br />
                                <a href="pay.aspx" style="color: Gray; text-decoration: none;">( افزایش موجودی )</a>
                            </td>
                            <td>
                                <asp:Label ID="lblJiring" runat="server" Text="Label"></asp:Label>
                                <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                                    height: 9px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="width: 732px; border-bottom: 1px solid #ccc; height: 1px;">
            </div>
        </div>
        <div style="width: 731px; padding: 5px; float: right;">
            <div style="background-image: url('../../content/images/Stage/Jiring/BgBtn.jpg');
                float: right; padding: 10px; width: 140px; height: 20px; text-align: center;
                border: 1px solid #ccc; -moz-border-radius: 8px;">
                <a href="J-doorway.aspx" style="color: Black; text-decoration: none;">پرداخت آنلاین
                    بانکی (درگاه)</a></div>
            <div style="background-image: url('../../content/images/Stage/Jiring/BgBtn.jpg');
                float: right; padding: 10px; width: 170px; height: 20px; margin-right: 5px; text-align: center;
                border: 1px solid #ccc; -moz-border-radius: 8px;">
                <a href="J-card-to-card.aspx" style="color: Black; text-decoration: none;">پرداخت آنلاین
                    بانکی (کارت به کارت)</a></div>
            <div style="background-image: url('../../content/images/Stage/Jiring/BgBtn.jpg');
                margin-right: 5px; padding: 10px; width: 200px; height: 20px; text-align: center;
                border: 1px solid #ccc; -moz-border-radius: 8px; float: right;">
                <a href="J-form.aspx" style="color: black; text-decoration: none;">پرداخت بصورت غیر
                    مستقیم (فیش بانکی)</a></div>
        </div>
    </div>
</asp:Content>
