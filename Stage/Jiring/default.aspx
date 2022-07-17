<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="default.aspx.vb" Inherits="Stage_Jiring_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: titr;
            src: url(   "./../../content/font/BTitrBd.ttf" );
        }
        .style3
        {
            width: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
           جیرینگ
        </div>
    <div style="width: 733px;">
        <div style="width: 733px; height: 50px;margin-top:3px;">
            <div style="float: right;">
                <img src="../../content/images/Stage/Jiring/MyJiring.jpg" />
            </div>
            <div style="float: right; height: 50px;">
                <table class="style1">
                    <tr>
                        <td class="style3">
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
        <div style="width: 733px; border-bottom: 1px solid #ccc; height: 1px;">
        </div>
        <div style="width: 733px; padding: 5px;">
            <div style="background-image: url('../../content/images/Stage/Jiring/BgBtn.jpg');
                float: right; padding: 10px; width: 50px; height: 20px; text-align: center; border: 1px solid #ccc;
                -moz-border-radius: 8px;">
                <a href="define.aspx" style="color: Black; text-decoration: none;">تعاریف</a></div>
            <div style="background-image: url('../../content/images/Stage/Jiring/BgBtn.jpg');
                margin-right: 5px; padding: 10px; width: 150px; height: 20px; text-align: center;
                border: 1px solid #ccc; -moz-border-radius: 8px; float: right;">
                <a href="factor.aspx" style="color: black; text-decoration: none;">عوامل افزایش و کاهش
                    جیرینگ</a></div>
        </div>
    </div>
    </div>
</asp:Content>
