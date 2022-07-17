<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false" CodeFile="ShaahrSetting.aspx.vb" Inherits="Management_Admin_Shaahr_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 75px;
        }
        .style14
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td>
                <b>تنظیمات جیرینگی بودن یا نبودن تاسیس شهر:</b></td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            مقدار جیرینگ:</td>
                        <td>
                            <asp:TextBox ID="txtFundationJiring" runat="server" style="text-align: left"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style14">
                            * اگر فیلد خالی باشد به منزله رایگان بودن تاسیس شهر می باشد.</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnFundationJiring" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

