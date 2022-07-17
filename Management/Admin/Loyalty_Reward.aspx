<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false" CodeFile="Loyalty_Reward.aspx.vb" Inherits="Management_Admin_Loyalty_Reward" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 88px;
            height: 25px;
        }
        .style14
        {
            width: 88px;
            height: 42px;
        }
        .style15
        {
            height: 42px;
        }
        .style16
        {
            height: 25px;
        }
        .style17
        {
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            تاریخ جاری:</td>
                        <td class="style15">
                            <asp:Label ID="lblDateCur" runat="server" 
                                style="color: #0066FF; font-weight: 700; font-size: x-large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            ساعت جاری:</td>
                        <td class="style16">
                            <asp:Label ID="lblTimeCur" runat="server" 
                                style="color: #CC0000; font-weight: 700; font-size: large"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style17">
                ادمین محترم زمان دقیق برای دادن جیرینگ ساعت 23 شب (یازده شب) می باشد.</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAction" 
                OnClientClick="return confirm('مطمئن؟');"
                runat="server" Height="26px" 
                    style="font-family: Tahoma; font-size: 11px" Text="اعمال پاداش" Width="900px" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

