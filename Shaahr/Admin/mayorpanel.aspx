<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="mayorpanel.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(            "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 81px;
        }
        .style4
        {
            width: 207px;
        }
        .style5
        {
            width: 56px;
        }
        .style6
        {
            width: 199px;
        }
        .style7
        {
            width: 79px;
        }
        .style9
        {
            width: 88px;
        }
        .style10
        {
            width: 161px;
        }
        .style11
        {
            color: #FF0000;
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
            <td>
                <table class="style1">
                    <tr>
                        <td class="style3">
                            نام شهر:
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                padding: 5px;" Width="600px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            توضیح کوتاه:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubName" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                padding: 5px;" Width="600px"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="background-color: #F8F8F8; width: 614px;">
                                <asp:RadioButtonList ID="rbFormat" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                    ValidationGroup="3">
                                    <asp:ListItem Selected="True" Value="rtl">قالب فارسی</asp:ListItem>
                                    <asp:ListItem Value="ltr">English Format</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="border-bottom: 1px solid #ccc; width: 604px; background-color: #f8f8f8;
                                text-align: left; padding: 5px;">
                                <asp:LinkButton ID="btnUpdateSubName" runat="server" Style="color: #587E8B; text-decoration: none;">ثبت 
                                اطلاعات</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            لوگو:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style4">
                                        <asp:FileUpload ID="FU_Logo" runat="server" />
                                    </td>
                                    <td class="style5">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnLogo" runat="server"
                                            ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultLogo" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="background-color: #F8F8F8; width: 614px;">
                                <asp:RadioButtonList ID="rbLogoAlign" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                    ValidationGroup="2">
                                    <asp:ListItem Selected="True" Value="0">سمت راست</asp:ListItem>
                                    <asp:ListItem Value="1">وسط</asp:ListItem>
                                    <asp:ListItem Value="2">سمت چپ</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 30 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین 50 پیکسل و&nbsp; 108 پیکسل - ارتفاع
                                بین 50&nbsp; پیکسل و 108 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image runat="server" ForeColor="Transparent" ID="imgLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Logo" runat="server" Style="color: #FF0000; direction: ltr;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            تصویر پیشانی:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style6">
                                        <asp:FileUpload ID="FU_Header" runat="server" />
                                    </td>
                                    <td class="style7">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnHeader" runat="server"
                                            ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultHeader" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 130 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین 892 پیکسل و&nbsp;&nbsp; 906 پیکسل
                                - ارتفاع بین&nbsp; 68&nbsp; پیکسل و&nbsp; 223 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image runat="server" ForeColor="Transparent" ID="imgHeader" runat="server" Width="645px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Header" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    &nbsp;<tr>
                        <td class="style3">
                            کادر تبلیغاتی:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style10">
                                        <asp:FileUpload ID="FU_Ads" runat="server" />
                                    </td>
                                    <td class="style9">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAds" runat="server"
                                            ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultAds" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 30 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین&nbsp; 742 پیکسل و&nbsp;740 پیکسل -
                                ارتفاع بین&nbsp; 62&nbsp; پیکسل و&nbsp; 68 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image runat="server" ForeColor="Transparent" ID="imgAds" runat="server" Height="60px"
                                Width="645px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Ads" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
            </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
        </tr>
    </table>
    </td> </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    </table>
</asp:Content>
