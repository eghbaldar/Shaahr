<%@ Page Language="VB" MasterPageFile="~/Home/Home.master" AutoEventWireup="false"
    CodeFile="invitation.aspx.vb" Inherits="Home_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 220px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            دعوت نامه
        </div>
        <div style="width: 744px; padding: 5px; float: right;">
            <div style="float: right;">
                <img src="../Content/images/Home/invite.png" /></div>
            <div style="padding: 2px;">
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
        </div>
        <div style="width: 744px; float: right; padding: 5px;">
            <table class="style6">
                <tr>
                    <td class="style7">
                        پست الکترونیکی شخص مورد نظر را وارد کنید:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        &nbsp;
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="فرمت پست الکترونیکی را صحیح وارد کنید." ValidationGroup="2"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            &nbsp;</div>
    </div>
</asp:Content>
