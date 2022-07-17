<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Footer.ascx.vb" Inherits="UserControl_Root_Footer" %>
<style type="text/css">
    #footer
    {
    	float:right;
        padding: 5px;
        margin: 0px auto 0px auto;
        width: 954px;
        background-color: #06a96a;
        border-bottom: 10px solid #0a9f65;
        height: 100%;
        -moz-border-radius: 0px 0px 5px 5px;
    }
    .style3
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
                        <asp:HyperLink ID="HyperLink1" Style="color: #804d12; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Nazmie/">نظمیه</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink8" Style="color: #ffffff; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Nazmie/law.aspx?law=law">قوانین و مقررات</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink4" NavigateUrl="~/MyShaahr/News/news.aspx" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">اخبار شهر</asp:HyperLink>
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image10" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink2" Style="color: #804d12; text-decoration: none;" runat="server"
                            Target="_blank" NavigateUrl="~/Stage/Search/">جستجو</asp:HyperLink>&nbsp;&nbsp;
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image11" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink7" NavigateUrl="~/outscope/authenticate/" Style="color: #804d12;
                            text-decoration: none;" Target="_blank" runat="server">ورودی شهر</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" NavigateUrl="~/outscope/CreateAccount/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">ثبت نام</asp:HyperLink>
                    </div>
                    <div style="margin-top: 4px;">
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_split.png" />
                    </div>
                    <div>
                        <asp:HyperLink ID="HyperLink5" NavigateUrl="~/MyShaahr/About/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">درباره شهر</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink6" NavigateUrl="~/MyShaahr/Contact/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">تماس با ما</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink11" NavigateUrl="~/MyShaahr/Help/" Style="color: #ffffff;
                            text-decoration: none;" Target="_blank" runat="server">راهنما</asp:HyperLink>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink10" NavigateUrl="~/MyShaahr/Ads/" Style="color: #804d12;
                            text-decoration: none;" Target="_blank" runat="server">تبلیغات</asp:HyperLink>
                    </div>
                </div>
            </td>
            <td class="style3">
                <div style="height: 100px;">
                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnShaahr" runat="server"
                        ImageUrl="~/Content/images/footer/footer_mnu_shaahr.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image7" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_software.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image8" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_ebook.png" />
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image9" runat="server" ImageUrl="~/Content/images/footer/footer_mnu_charj.png" />
                </div>
            </td>
            <td>
                <asp:Image ForeColor="Transparent" AlternateText="" ID="Image6" runat="server" ImageUrl="~/Content/images/footer/footer_shaahr.png" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
