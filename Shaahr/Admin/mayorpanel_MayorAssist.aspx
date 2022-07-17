<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="mayorpanel_MayorAssist.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(     "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 71px;
        }
        .style4
        {
            width: 57px;
        }
        .style5
        {
            width: 95px;
        }
        .style7
        {
            width: 183px;
        }
        .style8
        {
            width: 166px;
        }
        .style9
        {
            width: 5px;
        }
        .style10
        {
            width: 10px;
        }
        .style11
        {
            width: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="lblNameSHaahr" Style="font-family: Koodak; font-size: 14px; color: #838383;"
                    runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ButtonShaahr ID="btnMnu_FristPage" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_News" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_Cate" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_assist" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_ShowShaahr" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                معاونین
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 6px; border: 1px solid #ccc;">
                    <table class="style1">
                        <tr>
                            <td>
                                انتخاب معاون اول
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style3">
                                            <asp:Image ID="imgAssist_1" runat="server" ForeColor="Transparent" runat="server"
                                                Height="100px" Style="-moz-border-radius: 5px" Width="100px" />
                                        </td>
                                        <td>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style5">
                                                        نام و نام خانوادگی:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNameAs1" runat="server" Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        سن شهروندی:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAgeShahrvandi1" runat="server" Style="color: #0066CC"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton Style="text-decoration: none; color: #EA8082;" ID="linkDelAssist1"
                                                            runat="server">( بدون معاون اول)</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        انتخاب کاربر:
                                                    </td>
                                                    <td>
                                                        <table class="style1">
                                                            <tr>
                                                                <td class="style7">
                                                                    <asp:TextBox ID="txtUser1" runat="server" Width="200px" Style="font-family: Tahoma;
                                                                        font-size: 11px; text-align: left;"></asp:TextBox>
                                                                </td>
                                                                <td class="style10">
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnUser1" runat="server"
                                                                        ImageUrl="~/Content/images/Home/addWork.png" ValidationGroup="1" />
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser1"
                                                                        ErrorMessage="●" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                                    <asp:Label ID="lblUser1" runat="server" Style="color: #FF0000"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 6px; border: 1px solid #ccc;">
                    <table class="style1">
                        <tr>
                            <td>
                                انتخاب معاون دوم
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style4">
                                            <asp:Image ID="imgAssist_2" runat="server" ForeColor="Transparent" runat="server"
                                                Height="100px" Style="-moz-border-radius: 5px" Width="100px" />
                                        </td>
                                        <td>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style5">
                                                        نام و نام خانوادگی:
                                                    </td>
                                                    <td>
                                                        &nbsp;<asp:Label ID="lblNameAs2" runat="server" Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        سن شهروندی:
                                                    </td>
                                                    <td>
                                                        &nbsp;<asp:Label ID="lblAgeShahrvandi2" runat="server" Style="color: #0066CC"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton Style="text-decoration: none; color: #EA8082;" ID="linkDelAssist2"
                                                            runat="server">( بدون معاون دوم)</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        اانتخاب کاربر:
                                                    </td>
                                                    <td>
                                                        <table class="style1">
                                                            <tr>
                                                                <td class="style8">
                                                                    <asp:TextBox ID="txtUser2" runat="server" Width="200px" Style="font-family: Tahoma;
                                                                        font-size: 11px; text-align: left;"></asp:TextBox>
                                                                </td>
                                                                <td class="style11">
                                                                    <asp:ImageButton ForeColor="Transparent" ID="btnUser2" runat="server" ImageUrl="~/Content/images/Home/addWork.png"
                                                                        ValidationGroup="2" />
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUser2"
                                                                        ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                                    <asp:Label ID="lblUser2" runat="server" Style="color: #FF0000"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style9">
                            <img alt="" src="../../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                        </td>
                        <td>
                            برای انتخاب معاون &quot;پست الکترونیک&quot; کاربر مورد نظر را وارد کنید.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
