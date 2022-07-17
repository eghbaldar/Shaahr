<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Detail-Favorits.aspx.vb" Inherits="Management_Admin_Detail_Favorits"
    Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView" runat="server">
        <asp:View ID="ViewCat" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <FCKeditorV2:FCKeditor ID="FCK_Cat" runat="server" BasePath="~/Management/content/fckeditor/"
                            Height="500px"></FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnUpdateCat" runat="server" 
                            style="font-family: Tahoma; font-size: 11px" Text="اصلاح" />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewFav" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <FCKeditorV2:FCKeditor ID="FCK_Fav" runat="server" BasePath="~/Management/content/fckeditor/"
                            Height="500px"></FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<asp:Button ID="btnUpdateFav" runat="server" 
                            style="font-family: Tahoma; font-size: 11px" Text="اصلاح" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
