<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="J-doorway.aspx.vb" Inherits="Stage_Jiring_J_doorway" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 124px;
        }
        .style4
        {
            width: 355px;
        }
        .style7
        {
            background-color: #E8E8E8;
        }
        .style8
        {
            width: 124px;
            background-color: #E8E8E8;
        }
        .style9
        {
            width: 124px;
            height: 34px;
        }
        .style10
        {
            height: 34px;
        }
        @font-face
        {
            font-family: koodak;
            src: url(      "./../../content/font/W_koodak.TTF" );
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            پرداخت آنلاین بصورت درگاه
        </div>
        <div style="width: 744px; float: right;">
            <img src="../../content/images/Stage/Jiring/card-to-card.png" />
        </div>
        <div style="width: 744px; float: right;">
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="V1" runat="server">
                    
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    border: 1px solid #E1E1E1; background-color: #F6F6F6; width: 730px;">
                                    <div style="font-family: koodak; font-size: 18px; padding-right: 5px;">
                        مشخصات فاکتور
                    </div>
                                    <table class="style1">
                                        <tr>
                                            <td class="style3">
                                                نام شهروند:
                                            </td>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Style="font-weight: 700"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style8">
                                                نام کاریری:
                                            </td>
                                            <td class="style7">
                                                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                پست الکترونیک:
                                            </td>
                                            <td>
                                                &nbsp;<asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style8">
                                                جیرینگ فعلی:
                                            </td>
                                            <td class="style7">
                                                &nbsp;<asp:Label ID="lblCurJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                کد تراکنش:
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCode" runat="server" Style="font-weight: 700; color: #333333"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                    border-radius: 5px; border: 1px solid #E4BBB5; background-color: #FFE5E6; width: 730px;">
                                    <table class="style1">
                                        <tr>
                                            <td class="style4" style="text-align: left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice"
                                                    ErrorMessage="***" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                مبلغ مورد نظر را وارد کنید (ریال) :
                                            </td>
                                            <td style="text-align: right">
                                                <asp:TextBox ID="txtPrice" runat="server" Style="border: 1px solid #DB1E0B; -moz-border-radius: 5px;
                                                    text-align: center; -webkit-border-radius: 5px; border-radius: 5px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrice"
                                                    ErrorMessage="***" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    border: 1px solid #E1E1E1; background-color: #F6F6F6; width: 726px; padding: 2px;
                                    text-align: center;">
                                    <asp:ImageButton ID="btnPsargad" runat="server" ImageUrl="../../content/images/Stage/Jiring/Bank/bank_pasargad.png"
                                        ValidationGroup="1" />
                                    <asp:ImageButton ID="btnSaman" runat="server" ImageUrl="../../content/images/Stage/Jiring/Bank/bank_saman.png"
                                        ValidationGroup="1" />
                                    <asp:ImageButton ID="btnTejarat" runat="server" ImageUrl="../../content/images/Stage/Jiring/Bank/bank_tejarat.png"
                                        ValidationGroup="1" />
                                    <asp:ImageButton ID="btnParsian" runat="server" ImageUrl="../../content/images/Stage/Jiring/Bank/bank_parsian.png"
                                        ValidationGroup="1" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <b>نکته: </b>امکان پرداخت با کارت های عضو شتاب
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>توجه: </b>&nbsp;اگر کارت بانکی شما به بانکهای زیر است، می تواند امور حساب خود
                                            را به صورت اینترنتی انجام دهید:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            بانک سامان - بانک تجارت - بانک پارسیان
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="V2" runat="server">
                    <div style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                        border: 1px solid #E1E1E1; background-color: #F6F6F6; width: 733px; padding-top: 10px;
                        margin-top: 4px;">
                        <div style="font-family: koodak; font-size: 18px; padding-right: 5px;">
                            پیش فاکتور
                        </div>
                        <table class="style1">
                            <tr>
                                <td class="style3">
                                    نام شهروند:
                                </td>
                                <td>
                                    <asp:Label ID="lblName_" runat="server" Style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    نام کاریری:
                                </td>
                                <td class="style7">
                                    <asp:Label ID="lblUsername_" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    پست الکترونیک:
                                </td>
                                <td>
                                    &nbsp;<asp:Label ID="lblEmail_" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    جیرینگ فعلی:
                                </td>
                                <td class="style7">
                                    &nbsp;<asp:Label ID="lblCurJiring_" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    کد تراکنش:
                                </td>
                                <td>
                                    <asp:Label ID="lblCode_" runat="server" Style="font-weight: 700; color: #333333"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    بانک مقصد:
                                </td>
                                <td class="style7">
                                    <asp:Label ID="lblBank_" runat="server" Style="color: #CC0000; font-style: italic;
                                        font-weight: 700; font-size: 12px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    مبلغ درخواستی:
                                </td>
                                <td class="style10">
                                    <asp:Label ID="lblPrice_" runat="server" Style="font-weight: 700; color: #333333;
                                        font-size: 20px;"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Content/images/Home/OK_Captcha.png" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
