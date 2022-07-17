<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Management_Outscope_login" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>پنل ورود به بخش مدیدریتی شهر دات کام</title>
    <link rel="SHORTCUT ICON" href="../../Content/images/Home/ShaahrFavorite.png" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 9px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Width="227px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass"
                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" Width="227px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <cc1:CaptchaControl ID="ccJoi" runat="server" CaptchaFontWarping="Extreme" CaptchaLineNoise="Medium"
                    CaptchaWidth="235" FontColor="Black" CaptchaBackgroundNoise="Medium" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCaptcha"
                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtCaptcha" runat="server" Width="227px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Height="26px" Text="Login" ValidationGroup="1" />
                <asp:TextBox ID="txtRnd" runat="server" Width="31px">0</asp:TextBox>
                <asp:Label ID="lblRnd" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblWrong" runat="server" Style="font-family: Tahoma; font-size: 11px;
                    color: #CC0000"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <div>
    </div>
    </form>
</body>
</html>
