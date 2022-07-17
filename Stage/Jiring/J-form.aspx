<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="J-form.aspx.vb" Inherits="Stage_Jiring_J_fish" Title="Untitled Page" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Dropdownlist  -->
    <link href="../../content/js/Dropdownlist/Styles/Selectbox.css" rel="stylesheet"
        type="text/css" />

    <script src="../../content/js/Dropdownlist/Scripts/jquery-1.5.1.js" type="text/javascript"
        charset="utf-8"></script>

    <script type="text/javascript" src="../../content/js/Dropdownlist/Scripts/jquery.selectbox-0.5.js"></script>

    <script type="text/javascript">
	    $(document).ready(function () {
	        $('.selectbox').selectbox();
	    });
    </script>

    <script language="javascript">
function moneyCommaSep(ctrl)
{
var separator = ",";
var int = ctrl.value.replace ( new RegExp ( separator, "g" ), "" );
var regexp = new RegExp ( "\\B(\\d{3})(" + separator + "|$)" );
do
{
int = int.replace ( regexp, separator + "$1" );
}
while ( int.search ( regexp ) >= 0 )
ctrl.value = int;
}
    </script>

    <!-- End  -->
    <style type="text/css">
        .font
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .style3
        {
            width: 5px;
        }
        .style4
        {
            width: 129px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            پرداخت آنلاین بصورت فیش بانکی
        </div>
        <div style="width: 744px; float: right;">
            <img src="../../content/images/Stage/Jiring/J-form.png" />
        </div>
        <div style="width: 744px; float: right;">
            <table class="style1">
                <tr>
                    <td class="style4">
                        برای حساب:
                    </td>
                    <td>
                        <asp:Label ID="lblFnLn" runat="server" Style="font-size: 12px"></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        نام بانک:
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbBank" class="selectbox" ClientIDMode="Static" name="Items"
                            runat="server">
                            <asp:ListItem>بانک ملی ایران</asp:ListItem>
                            <asp:ListItem>بانک صادارات</asp:ListItem>
                            <asp:ListItem>بانک پارسیان</asp:ListItem>
                            <asp:ListItem>بانک ملت</asp:ListItem>
                            <asp:ListItem>بانک سامان</asp:ListItem>
                            <asp:ListItem>بانک تجارت</asp:ListItem>
                            <asp:ListItem>بانک رفاه</asp:ListItem>
                            <asp:ListItem>بانک سپه</asp:ListItem>
                            <asp:ListItem>بانک مسکن</asp:ListItem>
                            <asp:ListItem>بانک اقتصاد نوین</asp:ListItem>
                            <asp:ListItem>بانک کشاورزی</asp:ListItem>
                            <asp:ListItem>بانک پاسارگاد</asp:ListItem>
                            <asp:ListItem>بانک توسعه تعاون</asp:ListItem>
                            <asp:ListItem>بانک انصار</asp:ListItem>
                            <asp:ListItem>پست بانک</asp:ListItem>
                            <asp:ListItem>بانک سینا</asp:ListItem>
                            <asp:ListItem>بانک سرمایه</asp:ListItem>
                            <asp:ListItem>بانک تات</asp:ListItem>
                            <asp:ListItem>بانک کار آفرین</asp:ListItem>
                            <asp:ListItem>بانک مهر</asp:ListItem>
                            <asp:ListItem>بانک دی</asp:ListItem>
                            <asp:ListItem>بانک شهر</asp:ListItem>
                            <asp:ListItem>بانک توسعه صادرات</asp:ListItem>
                            <asp:ListItem>بانک صنعت و معدن</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        شماره حساب:
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumAcc" runat="server" Style="font-weight: 700; text-align: center;
                            background-color: #FFFFCC; border: 1px solid #ccc;" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNumAcc"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        نام پرداخت کننده:
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="198px" class="font"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtName"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        نام خانوادگی پرداخت کننده:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFamily" runat="server" Width="198px" class="font"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFamily"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        مبلغ پرداختی:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" Width="198px" onKeyUp="javascript:moneyCommaSep(this);"
                            Style="text-align: left"></asp:TextBox>
                        &nbsp;ریال
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPrice"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        تاریخ پرداخت:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Width="198px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDate"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        شماره قرمز رنگ پرداخت:
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumRed" runat="server" Style="border: 1px solid #ccc; color: #FFFFFF;
                            font-weight: 700; text-align: center; background-color: #CC0000" Width="201px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNumRed"
                            ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                        ImageUrl="~/content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div style="margin-top: 5px; height: 100px; padding: 5px; background-color: #f6f6f6;
                        margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                        width: 520px;">
                        <div style="float: right; margin-top: 8px;">
                            <img src="../../content/images/Home/info.gif" />
                        </div>
                        <div style="float: right; margin-right: 5px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style11">
                                        آیا از ارسال اطلاعات بالا مطمئن هستید؟
                                    </td>
                                    <td class="style12">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAcceptToDelete" runat="server"
                                            ImageUrl="~/content/images/Home/AcceptIt.jpg" ValidationGroup="2" />
                                    </td>
                                    <td>
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelToDelete" runat="server"
                                            ImageUrl="~/content/images/Home/CancelIt.jpg" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="High"
                                            CaptchaLineNoise="Medium" />
                                        <asp:TextBox ID="txtCap" runat="server" Style="border-top: none; border-bottom: 1px solid #ccc;
                                            border-right: 1px solid #ccc; border-left: 1px solid #ccc; text-align: left;"
                                            Width="177px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCap"
                                            ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style12">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin-top: 50px; float: right;">
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
        <div style="width: 733px; border-bottom: 1px solid #ccc; height: 10px; float: right;">
        </div>
        <div style="width: 713px; border-bottom: 1px solid #ccc; float: right; text-align: center;
            background-color: #E8E8E8; padding: 10px; -moz-border-radius: 3px; color: #CC0000;">
            <asp:Label ID="lblCode" runat="server"></asp:Label>
        </div>
        <div style="width: 733px; float: right; background-color: #e0ebf0;">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <img alt="" src="../../content/images/Stage/Jiring/help.jpg" style="width: 35px;
                            height: 35px" />
                    </td>
                    <td>
                        پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت
                        فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین
                        بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت
                        آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
