<%@ Control Language="VB" AutoEventWireup="false" CodeFile="GuidMenu.ascx.vb" Inherits="UserControl_Home_GuidMenu" %>
<link href="../content/css/Menu/Guid/default.css" media="screen" rel="stylesheet"
    type="text/css" />
<link href="../content/css/Menu/Guid/dropdown.css" media="screen" rel="stylesheet"
    type="text/css" />
<link href="../../content/css/Menu/Guid/default.css" media="screen" rel="stylesheet"
    type="text/css" />
<link href="../../content/css/Menu/Guid/dropdown.css" media="screen" rel="stylesheet"
    type="text/css" />
<link href="../../../content/css/Menu/Guid/default.css" media="screen" rel="stylesheet"
    type="text/css" />
<link href="../../../content/css/Menu/Guid/dropdown.css" media="screen" rel="stylesheet"
    type="text/css" />
<!--  -->
<div style="margin-top: 8px;">
    <table style="width: 100%;">
        <tr>
            <td style="width: 236px;">
                <div style="float: right;">
                    <asp:Panel ID="PnlGuidGuestIcon" runat="server" Visible="false">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image1" Style="-moz-border-radius: 2px;
                            -webkit-border-radius: 2px; border-radius: 2px;" runat="server" ImageUrl="~/content/images/Profile_View_Users/user.png" />
                    </asp:Panel>
                    <asp:Panel ID="PnlGuidUserIcon" runat="server" Visible="false">
                        <asp:ImageButton ForeColor="Transparent" AlternateText="" Style="-moz-border-radius: 2px;
                            -webkit-border-radius: 2px; border-radius: 2px;" ID="imgGuid" runat="server"
                            Height="24px" Width="24px" />
                    </asp:Panel>
                </div>
                <div style="float: right; font-size: 11px; margin-top: 6px;">
                    &nbsp;
                    <asp:LinkButton ID="lblGuidName" Style="font-family: Tahoma; font-size: 11px; color: Black;
                        text-decoration: none;" runat="server">LinkButton</asp:LinkButton>
                </div>
                <asp:Panel ID="PnlGuidUser" runat="server" Visible="false" Style="float: right;">
                    <div style="margin-top: 6px; float: right; font-size: 11px; font-family: Tahoma;">
                        &nbsp;&nbsp;(&nbsp;</div>
                    <div style="margin-top: 6px; float: right;">
                        <asp:LinkButton ID="btnSignOut" OnClick="btnSignOut_Click" runat="server" Font-Underline="False"
                            Style="font-family: Tahoma; font-size: 11px; color: #096D9E;">خروج</asp:LinkButton>
                    </div>
                    <div style="margin-top: 6px; float: right; font-size: 11px; font-family: Tahoma;">
                        &nbsp;)</div>
                </asp:Panel>
                <asp:Panel ID="PnlGuidGuest" runat="server" Visible="false" Style="float: right;">
                    <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;">
                        &nbsp;(</div>
                    <div style="margin-top: 5px; float: right;">
                        <asp:LinkButton ID="btnAuth" runat="server" Font-Underline="False" Style="font-family: Tahoma;
                            font-size: 11px; color: #096D9E;">ورود</asp:LinkButton></div>
                    <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;">
                        &nbsp;-&nbsp;</div>
                    <div style="margin-top: 5px; float: right;">
                        <asp:LinkButton ID="btnRegister" runat="server" Font-Underline="False" Style="font-family: Tahoma;
                            font-size: 11px; color: #096D9E;">ثبت نام</asp:LinkButton>
                    </div>
                    <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;">
                        )</div>
                </asp:Panel>
            </td>
            <td style="width: 206px;">
                <div style="margin-top: -3px;">
                    <ul class="dropdown2 dropdown2-horizontal">
                        <li class="dir2">
                            <asp:Label ID="lblGuidDate" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                margin-left: 10px;"></asp:Label>
                            <ul>
                                <li>
                                    <div style="width: 200px; height: 50px; -moz-border-radius: 3px; background-color: #f4f4f4;
                                        padding-top: 10px; text-align: left;">
                                        <div class="DMenu2">
                                            <asp:Label ID="lblGMT" Style="font-family: Tahoma; font-size: 11px;" runat="server"></asp:Label>
                                        </div>
                                        <div class="DMenu2">
                                            <asp:Label ID="lblMec" Style="font-family: Tahoma; font-size: 11px;" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </td>
            <td style="width: 140px;">
                <div style="margin-top: -5px; float: right; font-size: 11px; font-family: Tahoma;">
                    <div style="margin-top: 5px; float: right;">
                        <asp:Image ID="Image2" ImageUrl="~/content/images/Profile_View_Users/jiring.png"
                            runat="server" />
                    </div>
                    <asp:Panel ID="PnlGuidGuestJiring" runat="server" Visible="false" Style="width: 155px;
                        margin-top: 5px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" Style="text-decoration: none; color: #0d435e;"
                            NavigateUrl="~/Stage/Jiring/define.aspx">&nbsp;جیرینگ چیست؟</asp:HyperLink>
                    </asp:Panel>
                    <asp:Panel ID="PnlGuidUserJiring" runat="server" Visible="false" Style="width: 155px;
                        margin-top: 5px;">
                        &nbsp;<asp:HyperLink ID="hypGuidJiring" runat="server" NavigateUrl="~/Stage/Jiring/"
                            Style="text-decoration: none; color: black;" />
                    </asp:Panel>
                </div>
            </td>
            <td style="width: 165px;">
                <div style="margin-top: -5px; float: right; font-size: 11px; font-family: Tahoma;">
                    <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;">
                        <asp:Image ForeColor="Transparent" AlternateText="" ID="Image3" ImageUrl="~/content/images/Home/OnilneUser.gif"
                            runat="server" />
                    </div>
                    <div style="margin-top: 2px; float: right; font-size: 11px; font-family: Tahoma;">
                        <ul class="dropdown2 dropdown2-horizontal">
                            <li class="dir2">
                                <asp:LinkButton ID="hypGuidOnline" runat="server" Style="text-decoration: none; color: black;
                                    margin-right: 2px;" />
                                <ul>
                                    <li>
                                        <div style="width: 145px; height: 200px; -moz-border-radius: 3px; background-color: #f4f4f4;
                                            padding-top: 10px;">
                                            <div class="DMenu">
                                                <asp:Label ID="lblFriendsOnilne" runat="server"></asp:Label></div>
                                            <div class="DMenu">
                                                <asp:Label ID="lblShaahrOnline" runat="server"></asp:Label></div>
                                            <div class="DMenu">
                                                <asp:Label ID="lblStateOnline" runat="server"></asp:Label></div>
                                            <div class="DMenu">
                                                <asp:Label ID="lblCountCountry" runat="server"></asp:Label></div>
                                            <div class="DMenu">
                                                <asp:Image ForeColor="Transparent" AlternateText="" ID="Image9" ImageUrl="~/content/images/Stage/Chat/Green.png"
                                                    runat="server" />
                                                <asp:Label ID="lblAvaliable" runat="server"></asp:Label>
                                            </div>
                                            <div class="DMenu">
                                                <asp:Image ForeColor="Transparent" AlternateText="" runat="server" ID="Image91" ImageUrl="~/content/images/Stage/Chat/Orange.png" />
                                                <asp:Label ID="lblNotHere" runat="server"></asp:Label>
                                            </div>
                                            <div class="DMenu">
                                                <asp:Image ForeColor="Transparent" AlternateText="" runat="server" ID="Image92" ImageUrl="~/content/images/Stage/Chat/Red.png" />
                                                <asp:Label ID="lblBusy" runat="server"></asp:Label>
                                            </div>
                                            <div class="DMenu">
                                                <asp:Image ForeColor="Transparent" AlternateText="" runat="server" ID="Image93" ImageUrl="~/content/images/Stage/Chat/Gray.png" />
                                                <asp:Label ID="lblTransparent" runat="server"></asp:Label>
                                            </div>
                                            <div class="DMenu">
                                                <asp:Image ForeColor="Transparent" AlternateText="" runat="server" ID="Image94" ImageUrl="~/content/images/Stage/Chat/Yeshmi.png" />
                                                <asp:Label ID="lblNotNow" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="margin-top: -5px; float: right; font-size: 11px; font-family: Tahoma;">
                            <asp:Panel ID="PnlGuidStatus" runat="server" Visible="false">
                                <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;">
                                    <asp:Image ForeColor="Transparent" AlternateText="" ID="imgUserOnline" ImageUrl="~/content/images/Stage/Chat/user_green.jpg"
                                        runat="server" Height="18px" />
                                </div>
                                <div style="margin-top: 5px; float: right; font-size: 11px; font-family: Tahoma;
                                    padding-bottom: 2px;">
                                    <ul class="dropdown2 dropdown2-horizontal">
                                        <li class="dir2">
                                            <asp:HyperLink ID="hypStatusUser" runat="server" Style="text-decoration: none; margin-top: -2px;
                                                color: black;" />
                                            <ul>
                                                <li>
                                                    <div style="width: 149px; height: 121px; -moz-border-radius: 3px; background-color: #f4f4f4;
                                                        padding-top: 10px;">
                                                        <div class="DMenu">
                                                            <asp:Image ForeColor="Transparent" AlternateText="" ID="Image4" ImageUrl="~/content/images/Stage/Chat/Green.png"
                                                                runat="server" />
                                                            <asp:LinkButton ID="btnAvaliable" Style="margin-right: 2px;" runat="server">در دسترس هستم.</asp:LinkButton>
                                                        </div>
                                                        <div class="DMenu">
                                                            <asp:Image ForeColor="Transparent" AlternateText="" ID="Image5" ImageUrl="~/content/images/Stage/Chat/Orange.png"
                                                                runat="server" /><asp:LinkButton ID="btnNotHere" Style="margin-right: 2px;" runat="server">پشت سیستم نیستم.</asp:LinkButton>
                                                        </div>
                                                        <div class="DMenu">
                                                            <asp:Image ForeColor="Transparent" AlternateText="" ID="Image6" ImageUrl="~/content/images/Stage/Chat/red.png"
                                                                runat="server" /><asp:LinkButton ID="btnBusy" Style="margin-right: 2px;" runat="server">سرم شلوغه مزاحم نشوید.</asp:LinkButton>
                                                        </div>
                                                        <div class="DMenu">
                                                            <asp:Image ForeColor="Transparent" AlternateText="" ID="Image7" ImageUrl="~/content/images/Stage/Chat/gray.png"
                                                                runat="server" /><asp:LinkButton ID="btnTransparent" Style="margin-right: 2px;" runat="server">ناپدید شده ام.</asp:LinkButton>
                                                        </div>
                                                        <div class="DMenu">
                                                            <asp:Image ForeColor="Transparent" AlternateText="" ID="Image8" ImageUrl="~/content/images/Stage/Chat/Yeshmi.png"
                                                                runat="server" /><asp:LinkButton ID="btnNotNow" Style="margin-right: 2px;" runat="server">در حال حاضر نمی آیم.</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                </div>
                            </asp:Panel>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</div>
