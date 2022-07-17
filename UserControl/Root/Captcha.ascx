<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Captcha.ascx.vb" Inherits="UserControl_Root_Captcha" %>
<style type="text/css">
    .ST_1
    {
        width: 100%;
    }
    .ST_2
    {
        color: #646464;
        width: 67px;
    }
    .DivOrg_
    {
        border: 3px solid #E4E4E4;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        padding: 2px;
    }
    .txtAnswer
    {
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        background-color: #CEE2EF;
        font-family: Tahoma;
        font-size: 11px;
        padding: 2px;
        text-align: center;
        width: 150px;
        border: 2px solid #CCCCCC;
        height: 20px;
        font-weight: bold;
    }
</style>
<asp:Panel ID="Pnl" runat="server" CssClass="DivOrg_">
    <div style="padding: 3px; text-shadow: 0.2em 0.2em #ccc; color: #567D8C;">
        گذرگاه امنیتی شهر دات کام
    </div>
    <table class="ST_1">
        <tr>
            <td class="ST_2">
                سوال
            </td>
            <td>
                <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="ST_2">
                جواب
            </td>
            <td>
                <div>
                    <div style="float: right;">
                        <asp:TextBox CssClass="txtAnswer" Width="189" ID="txtAnswer" runat="server"></asp:TextBox>
                    </div>
                    <div style="float: right; padding-right: 3px;">
                        <asp:ImageButton ID="btnOK" ImageUrl="~/Content/images/Home/OK_Captcha.png" runat="server"
                            ValidationGroup="Captcha" />
                    </div>
                </div>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="ST_2">
                درجه سوال
            </td>
            <td>
                <asp:ImageButton ID="btnEsay" runat="server" ToolTip="آسان" ImageUrl="~/Content/images/Home/captcha_esay.png" />
                &nbsp;
                <asp:ImageButton ID="btnMedium" runat="server" ToolTip="متوسط" ImageUrl="~/Content/images/Home/captcha_medium.png" />
                &nbsp;
                <asp:ImageButton ID="btnHard" runat="server" ToolTip="سخت" ImageUrl="~/Content/images/Home/captcha_hard.png" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="ST_2">
                تکرار سوال
            </td>
            <td>
                <asp:ImageButton ID="btnRepeat" runat="server" ToolTip="متوسط" ImageUrl="~/Content/images/Home/captcha_repeat.png" />
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Panel>
