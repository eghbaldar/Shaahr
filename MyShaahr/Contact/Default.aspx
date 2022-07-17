<%@ Page Language="VB" MasterPageFile="~/MyShaahr/Contact/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="MyShaahr_Contact_Default" Title="Untitled Page" %>
    <%@ Register Src="../../UserControl/Root/Captcha.ascx" TagName="Captcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 92px;
        }
    .ST_2
    {
        color: #646464;
        width: 67px;
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            تماس با شهر
        </div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="width: 744px; padding: 5px; float: right;">
                    <div style="float: right;">
                        <img src="../../content/images/MyShaahr/contact.png" />
                    </div>
                    <div style="padding: 2px;">
                        سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس 
                        های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های 
                        فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال 
                        سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                        <div style="padding: 5px; color: #0d6d87;">
                            <asp:Label ID="lblReportUser" runat="server"></asp:Label></div>
                        <div style="padding-right: 5px; color: #0d6d87;">
                            <asp:Label ID="lblReportDetective" runat="server"></asp:Label></div>
                    </div>
                </div>
                <div style="width: 744px; padding: 5px; float: right;">
                    <table class="style6">
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                نام و نام خانوادگی:
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 270px; padding: 5px;
                                    background-color: #f9f9f9;">
                                    <asp:TextBox ID="txtFnLn" runat="server" Width="265px" Style="border: 0; background-color: #f9f9f9;"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtFnLn" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                پست الکترونیکی:
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 270px; padding: 5px;
                                    background-color: #f9f9f9;">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="265px" Style="border-style: none;direction:ltr;
                                        border-color: inherit; border-width: 0; background-color: #f9f9f9; text-align: left;"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtEmail" ValidationGroup="1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="فرمت پست الکترونیکی را اصلاح کنید." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="1"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                شماره&nbsp; تلفن:
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 170px; padding: 5px;
                                    background-color: #f9f9f9;">
                                    <asp:TextBox ID="txtTell" runat="server" Width="165px" Style="border-style: none;
                                        border-color: inherit; border-width: 0; background-color: #f9f9f9; text-align: left;"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtTell" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                گروه:
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 170px; padding: 5px;
                                    background-color: #e5eff6;">
                                    <asp:DropDownList ID="cmbGroup" runat="server" Style="font-family: Tahoma; font-size: 12px;
                                        border: 0; background-color: #e5eff6; padding: 2px;">
                                        <asp:ListItem>گروه پشتیبانی شهر</asp:ListItem>
                                        <asp:ListItem>گروه امنیت و پشتیانی شهر</asp:ListItem>
                                        <asp:ListItem>گروه برنامه نویسی شهر</asp:ListItem>
                                        <asp:ListItem>گروه طراحی و گرافیک شهر</asp:ListItem>
                                        <asp:ListItem>تیم مدیریت شهر</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                پیام:
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <div style="-moz-border-radius: 5px; border: 1px solid #a8c7db; width: 539px; padding: 5px;
                                    background-color: #e5eff6;">
                                    <asp:TextBox ID="txtCuase" runat="server" Width="536px" Style="border: 0; background-color: #e5eff6;resize:none;"
                                        Height="123px" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtCuase" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                </asp:UpdatePanel>
                                <uc1:Captcha ID="Captcha" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <asp:LinkButton ID="btnSend" ValidationGroup="1" Style="color: #096D9E; font-family: koodak;
                                    font-size: 16px; text-decoration: none; margin-right: 2px;" runat="server">ارسال</asp:LinkButton>
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
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="float: right; margin-top: 5px; border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                    width: 737px; height: 100%; background-color: #f3fbff;" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img src="../../content/images/Home/Accept.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                پیام شما با موفقیت ارسال گردید، لطفا منتظر پاسخ بمانید.
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
