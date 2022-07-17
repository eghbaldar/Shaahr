<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="RemoveVisited.aspx.vb" Inherits="Management_Admin_RemoveVisited" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 71px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>لیست ملاقات های از یک هفته و یا یک ماه گذشته</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد رکورد ها:
                        </td>
                        <td>
                            <asp:Label ID="lblCount" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRemoveAll" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Text="حذف ملاقات هایی که تاریخشان از یک هفته گذشته است" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <b>لیست کارهای اجباری از یک هفته گذشته ی دیده نشده</b></td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <table class="style1">
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد رکورد ها:
                        </td>
                        <td>
                            <asp:Label ID="lblCountSorena" runat="server" 
                                Style="font-weight: 700; color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRemoveAllSorena" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Text="حذف کارهای اجباری که تاریخشان از یک هفته گذشته است" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
