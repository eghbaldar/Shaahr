<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MSG_Backup.ascx.vb" Inherits="Home_Menu_Fund_MSG_Backup" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<div style="padding: 4px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
    border: 1px solid #ccc; float: right; margin-top: 5px; width: 733px;">
    <table class="style1">
        <tr>
            <td>
                <img src="../../../Content/images/Home/backupIcon.png" />
                تهیه پشتیبان از پیام های دریافتی و ارسالی
            </td>
        </tr>
        <tr><td><blink>ناقص</blink></td></tr>
        <tr>
            <td>
                1) قصد تهیه پشتیبان از کدام قسمت را دارید ، لطفا انتخاب کنید:
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="0">پیام های دریافتی</asp:ListItem>
                    <asp:ListItem Value="1">پیام های ارسالی</asp:ListItem>
                    <asp:ListItem Value="2">پیام های دریافتی گروهی</asp:ListItem>
                    <asp:ListItem Value="3">پیام های ارسالی گروهی</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                2) نوع فرمت خروجی دلخواهتان را انتخاب کنید:
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem Value="0"> (*Word (.doc</asp:ListItem>
                    <asp:ListItem Value="1">(*Excel (.xsl</asp:ListItem>
                    <asp:ListItem Value="2">(*PDF (.pdf</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="btnAction" Style="color: #4B7FA6; text-decoration: none; border: 1px solid #D6E1E7;
                    padding: 3px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                    runat="server">شروع عملیات پشتیبان گیری ...</asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
