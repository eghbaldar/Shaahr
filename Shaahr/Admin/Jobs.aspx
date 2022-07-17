<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="Jobs.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .padding
        {
            /*padding: 5px 10px 0px 20px; */
        }
        .style3
        {
            height: 25px;
        }
        @font-face
        {
            font-family: koodak;
            src: url(       "./../../content/font/W_koodak.TTF" );
        }
        .style4
        {
            width: 94px;
        }
        .style5
        {
            width: 98px;
        }
        .style8
        {
            width: 98px;
            height: 15px;
        }
        .style9
        {
            height: 15px;
        }
        .style10
        {
            width: 99px;
        }
        .style11
        {
            width: 103px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView" runat="server">
        <asp:View ID="V_Presedent" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" BorderColor="#DEDEDE" BorderStyle="Solid"
                            StaticMenuItemStyle-ItemSpacing="0" BorderWidth="1px" DynamicHorizontalOffset="2"
                            Font-Names="tahoma" Font-Size="12px" ForeColor="#577F8B" Orientation="Horizontal"
                            StaticSubMenuIndent="10px" CssClass="padding">
                            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" CssClass="padding" />
                            <DynamicHoverStyle BackColor="#3BA4C1" ForeColor="black" CssClass="padding" />
                            <DynamicMenuStyle BackColor="#D9E4E8" CssClass="padding" BorderColor="#929DA3" BorderStyle="Solid"
                                BorderWidth="1px" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" CssClass="padding" />
                            <StaticHoverStyle BackColor="#EAEAEA" ForeColor="black" CssClass="padding" />
                            <Items>
                                <asp:MenuItem Text="میز کار" Value="میز کار">
                                    <asp:MenuItem Text="میز پستی" Value="میز پستی"></asp:MenuItem>
                                    <asp:MenuItem Text="اخبار" Value="اخبارپ"></asp:MenuItem>
                                    <asp:MenuItem Text="نظرسنجی" Value="نظرسنجی"></asp:MenuItem>
                                    <asp:MenuItem Text="صندوق پیام" Value="صندوق پیام"></asp:MenuItem>
                                    <asp:MenuItem Text="حقوق" Value="حقوق"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                                <asp:MenuItem Text="مدیریت نظمیه" Value="New Item">
                                    <asp:MenuItem Text="بررسی گزارشات کاربران" Value="بررسی گزارشات کاربران"></asp:MenuItem>
                                    <asp:MenuItem Text="بررسی درخواست تاسیس شهر" Value="بررسی درخواست تاسیس شهر"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                                <asp:MenuItem Text="ساختمان استانداری" Value="New Item">
                                    <asp:MenuItem Text="استانداران" Value="استانداران"></asp:MenuItem>
                                    <asp:MenuItem Text="معاونین استانداران" Value="معاونین استانداران"></asp:MenuItem>
                                    <asp:MenuItem Text="اخطار به ساختمان استانداری" Value="اخطار به ساختمان استانداری">
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                                <asp:MenuItem Text="پست ها" Value="پست ها">
                                    <asp:MenuItem Text="بررسی پست ها" Value="بررسی پست ها">
                                        <asp:MenuItem Text="استانداری ها" Value="استانداری ها"></asp:MenuItem>
                                        <asp:MenuItem Text="شهر ها" Value="شهر ها"></asp:MenuItem>
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                                <asp:MenuItem Text="ارتباط" Value="ارتباط">
                                    <asp:MenuItem Text="مدیریت سایت" Value="مدیریت سایت"></asp:MenuItem>
                                </asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </td>
                </tr>
                <tr>
                    <td>
                        quick-menu
                    </td>
                </tr>
                <tr>
                    <td style="font-family: koodak; font-size: 14px;">
                        وضعیت استان ها
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td style="width: 7px; background-color: #8CC07E;">
                                    &nbsp;
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style4">
                                                رتبه استان:
                                            </td>
                                            <td style="font-family: koodak; font-size: 12px;">
                                                1
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                محدوده:
                                            </td>
                                            <td>
                                                خراسان شمالی - خراسان جنوبی خراسان رضوی - گلستان - گیلان مازندران - سمنان
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                تعداد شهرها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                تعداد شهروندان:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                تعداد پست ها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                <asp:LinkButton ID="LinkButton1" Style="text-decoration: none; color: #048DB1;" runat="server">مشاهده 
                                                جزییات</asp:LinkButton>
                                                <img alt="" src="../../Content/images/Home/Reply.png" style="width: 13px; height: 13px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 3px dotted #ccc;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td style="width: 7px; background-color: #8DDDE9;">
                                    &nbsp;
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style8">
                                                رتبه استان:
                                            </td>
                                            <td style="font-family: koodak; font-size: 12px;">
                                                2
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style8">
                                                محدوده:
                                            </td>
                                            <td class="style9">
                                                آذربایجان شرقی - آذربایجان غربی اردبیل - زنجان - کردستان - همدان قزوین - لرستان
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                تعداد شهرها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                تعداد شهروندان:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                تعداد پست ها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                <asp:LinkButton ID="LinkButton2" runat="server" Style="text-decoration: none; color: #048DB1;">مشاهده 
                                                جزییات</asp:LinkButton>
                                                <img alt="" src="../../Content/images/Home/Reply.png" style="width: 13px; height: 13px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 3px dotted #ccc;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td style="width: 7px; background-color: #F7F56D;">
                                    &nbsp;
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style10">
                                                رتبه استان:
                                            </td>
                                            <td style="font-family: koodak; font-size: 12px;">
                                                3
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                محدوده:
                                            </td>
                                            <td>
                                                اصفهان - قم - مرکزی - خوزستان ایلام
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                تعداد شهرها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                تعداد شهروندان:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                تعداد پست ها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                <asp:LinkButton ID="LinkButton3" runat="server" Style="text-decoration: none; color: #048DB1;">مشاهده 
                                                جزییات</asp:LinkButton>
                                                <img alt="" src="../../Content/images/Home/Reply.png" style="width: 13px; height: 13px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 3px dotted #ccc;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td style="width: 7px; background-color: #F5AB69;">
                                    &nbsp;
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style11">
                                                رتبه استان:
                                            </td>
                                            <td style="font-family: koodak; font-size: 12px;">
                                                4
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                محدوده:
                                            </td>
                                            <td>
                                                تهران - کرج
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد شهرها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد شهروندان:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد پست ها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                <asp:LinkButton ID="LinkButton4" runat="server" Style="text-decoration: none; color: #048DB1;">مشاهده 
                                                جزییات</asp:LinkButton>
                                                <img alt="" src="../../Content/images/Home/Reply.png" style="width: 13px; height: 13px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 3px dotted #ccc;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td style="width: 7px; background-color: #E57CC9;">
                                    &nbsp;
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style11">
                                                رتبه استان:
                                            </td>
                                            <td style="font-family: koodak; font-size: 12px;">
                                                5
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                محدوده:
                                            </td>
                                            <td>
                                                سیستان و بلوچستان - کرمان یزد - هرمزگان - فارس - بوهشهر چهارمحال و بختیاری 
                                                موهکلیویه و بویراحمر
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد شهرها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد شهروندان:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                تعداد پست ها:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style11">
                                                <asp:LinkButton ID="LinkButton5" runat="server" Style="text-decoration: none; color: #048DB1;">مشاهده 
                                                جزییات</asp:LinkButton>
                                                <img alt="" src="../../Content/images/Home/Reply.png" style="width: 13px; height: 13px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
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
        </asp:View>
        <asp:View ID="V_Assistants_Presedent" runat="server">
            assis pre
        </asp:View>
        <asp:View ID="V_Governor" runat="server">
            governor
        </asp:View>
        <asp:View ID="V_Assistants_Governor" runat="server">
            assis gover
        </asp:View>
    </asp:MultiView>
</asp:Content>
