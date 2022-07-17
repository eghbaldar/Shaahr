<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Events.aspx.vb" Inherits="Management_Admin_Events" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 218px;
        }
        .style14
        {
            width: 218px;
            height: 38px;
            font-size: large;
            background-color: #99CCFF;
        }
        .style15
        {
            height: 38px;
        }
        .style16
        {
            width: 218px;
            height: 39px;
            font-size: large;
            background-color: #FFFFCC;
        }
        .style17
        {
            height: 39px;
        }
        .style18
        {
            width: 218px;
            height: 45px;
            font-size: large;
            background-color: #CCFFFF;
        }
        .style19
        {
            height: 45px;
        }
        .style20
        {
            width: 218px;
            height: 43px;
            font-size: large;
            background-color: #FF9900;
        }
        .style21
        {
            height: 43px;
            background-color: #FF9900;
        }
        .style22
        {
            height: 50px;
        }
        .style23
        {
            height: 54px;
        }
        .style24
        {
            height: 50px;
            width: 141px;
            font-size: large;
        }
        .style25
        {
            height: 54px;
            width: 141px;
            font-size: large;
        }
        .style118
        {
            color: #FFFFFF;
            font-size: large;
            background-color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td class="style14">
                                    کاربران آنلاین:
                                </td>
                                <td class="style15">
                                    <asp:Label ID="lblCountUsersOnline" runat="server" 
                                        style="font-weight: 700; font-size: 20px"></asp:Label>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style16">
                                    ثبت نام های امروز:
                                </td>
                                <td class="style17">
                                    <asp:Label ID="lblTodayRegister" runat="server" 
                                        style="font-weight: 700; font-size: 20px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style18">
                                    کل ثبت نام ها:
                                </td>
                                <td class="style19">
                                    <asp:Label ID="lblAllRegister" runat="server" 
                                        style="font-weight: 700; font-size: 20px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style118">
                                    کل کاربران لاگین کرده امروز:</td>
                                <td class="style19">
                                    <asp:Label ID="lblLogined" runat="server" 
                                        style="font-weight: 700; font-size: 20px"></asp:Label>
                                    اشتباه است</td>
                            </tr>
                            <tr>
                                <td class="style20">
                                    گزارشات تخلف بررسی<br />
                                    <br />
                                    &nbsp;نشده:
                                </td>
                                <td class="style21">
                                    <table class="style1">
                                        <tr>
                                            <td class="style24">
                                                گزارش های عادی:
                                            </td>
                                            <td class="style22">
                                                <asp:Label ID="lblReportUsers" runat="server" 
                                                    style="font-weight: 700; font-size: 20px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style25">
                                                گزارش های<br />
                                                <br />
                                                &nbsp;کارگاهان:
                                            </td>
                                            <td class="style23">
                                                <asp:Label ID="lblReportDetective" runat="server" 
                                                    style="font-weight: 700; font-size: 20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Timer ID="Timer" runat="server" Interval="5000">
                                    </asp:Timer>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtInterval" runat="server"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" style="font-size: 11px" Text="OK" />
                                    <asp:Button ID="Button2" runat="server" style="font-size: 11px" 
                                        Text="Enable/Disable" />
                                    <br />
                                    بصورت پیش فرض هر 5 ثانیه یک بار عمل میکند.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    در حال بارگذاری ...
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
