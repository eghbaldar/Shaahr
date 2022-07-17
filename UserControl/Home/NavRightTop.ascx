<%@ Control Language="VB" AutoEventWireup="false" CodeFile="NavRightTop.ascx.vb"
    Inherits="UserControl_Home_NavRightTop" %>
<style type="text/css">
    .HeadTop
    {
        float: right;
        width: 131px;
        margin-right: 3px;
        background-color: #EFF4F7;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        height: 17px;
        border: 1px solid #D6E1E7;
        padding: 3px;
        color: Gray;
    }
</style>
<div style="width: 145px; height: 100%; float: right; padding-top: 4px;">
    <div class="HeadTop">
        دسترسی فوری
    </div>
    <div style="float: right; width: 52px; padding-top: 4px; padding-right: 2px;">
        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="imgAvatar" runat="server"
            Height="51px" Width="51px" />
    </div>
    <div style="float: right; width: 90px;">
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image3" runat="server" ImageUrl="~/content/images/Home/premission.jpeg" />
                </td>
                <td>
                    <asp:HyperLink ID="btnPermission" NavigateUrl="~/home/Menu/Setting/permisson.aspx"
                        Style="text-decoration: none; font-size: 10px; font-family: Tahoma;" runat="server">حق دسترسی</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image1" ImageUrl="~/content/images/Home/setting.jpg"
                        runat="server" />
                </td>
                <td>
                    <asp:HyperLink ID="btnSetting" NavigateUrl="~/home/Menu/Setting/attrib.aspx" Style="text-decoration: none;
                        font-family: Tahoma; font-size: 10px;" runat="server">تنظیمات</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="Image2" runat="server" ImageUrl="~/content/images/Home/back.png" />
                </td>
                <td>
                    <asp:HyperLink ID="btnGotoHome" runat="server" NavigateUrl="~/home/" Style="text-decoration: none;
                        font-family: Tahoma; font-size: 10px;">خانه</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</div>
