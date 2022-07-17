<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Footer_Other.ascx.vb"
    Inherits="UserControl_Root_Footer" %>
<style type="text/css">
    #footer
    {
        font-family: Tahoma;
        font-size: 11px;
        padding: 5px;
        margin: 0px auto 0px auto;
        width: 954px;
        background-color: #66a7b4;
        height: 100%;
        border-bottom: 10px solid #5F9EAA;
        -moz-border-radius: 0px 0px 5px 5px;
    }
    .sFooter3
    {
        width: 389px;
    }
</style>
<div id="footer">
    <table style="width: 100%;">
        <tr>
            <td style="padding: 2px;">
                <div style="height: 100px;">
                    <div>
                        <asp:HyperLink ID="HyperLink1" Style="color: #24606c; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Nazmie/">نظمیه</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink8" Style="color: #ffffff; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Nazmie/law.aspx?law=law">قوانین و مقررات</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink4" NavigateUrl="~/MyShaahr/News/news.aspx" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">اخبار شهر</asp:HyperLink>
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image10" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split_other.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink2" Style="color: #24606c; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Search/">جستجو</asp:HyperLink>&nbsp;&nbsp;
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image11" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split_other.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink7" NavigateUrl="~/outscope/authenticate/" Style="color: #24606c;
                            text-decoration: none;" Target="_blank" runat="server">ورودی شهر</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" NavigateUrl="~/outscope/CreateAccount/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">ثبت نام</asp:HyperLink>
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image13" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split_other.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink5" NavigateUrl="~/MyShaahr/About/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">درباره شهر</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink6" NavigateUrl="~/MyShaahr/Contact/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">تماس با ما</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink11" NavigateUrl="~/MyShaahr/Help/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">راهنما</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink10" NavigateUrl="~/MyShaahr/Ads/" Style="color: #24606c;
                            text-decoration: none;" Target="_blank" runat="server">تبلیغات</asp:HyperLink>
                    </div>
                </div>
            </td>
            <td class="sFooter3">
                <div style="height: 100px;">
                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnShaahr" runat="server"
                        ImageUrl="~/Content/images/footer/footer_mnu_shaahr_other.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image7" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_software_other.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image8" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_ebook_other.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image9" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_charj_other.png" />
                </div>
            </td>
            <td>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Content/images/footer/footer_shaahr_other.png" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td class="sFooter3">
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>
