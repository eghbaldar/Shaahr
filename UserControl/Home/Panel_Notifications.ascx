<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_Notifications.ascx.vb"
    Inherits="UserControl_Home_Panel_Notifications" %>
<style type="text/css">
    .UnderNot
    {
        float: right;
        width: 55px;
        font-family: Tahoma;
        font-size: 11px;
        color: red;
        font-weight: bold;
    }
    .notificationPanel
    {
        -moz-border-radius: 5px;
        border: 1px solid #ccc;
        padding-right: 5px;
        padding-left: 5px;
        left: 0px;
        padding-bottom: 5px;
        width: 150px;
        padding-top: 5px;
        position: absolute;
        top: 0px;
        height: 35px;
        background-color: #81a5b3;
        visibility: visible;
        margin: 5px;
    }
    .hiddenPanel
    {
        display: none;
        visibility: hidden;
    }
    .style4
    {
        width: 100%;
    }
    .style5
    {
        width: 2px;
    }
    .style6
    {
        width: 5px;
    }
</style>
<style type="text/css">
    .PageSS, PageS td
    {
        font-size: 11px;
        text-decoration: none;
        color: #537291;
        font-weight: bold;
    }
    .PageSS a
    {
        border: 1px dotted #ccc;
        padding: 1px;
        font-size: 11px;
        text-decoration: none;
        color: gray;
        padding: 1px;
    }
    .OrgBorder
    {
        border: 1px solid #ccc;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        float: right;
        margin-top: 4px;
        padding: 3px;
        width: 530px;
        margin-bottom: 4px;
    }
</style>
<div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="OrgBorder">
                <div style="float: right; width: 55px">
                    <div style="float: right;">
                        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnDataBindGrid" ImageUrl="~/content/images/Home/notifcation.png"
                            runat="server" />
                    </div>
                    <div style="-moz-border-radius: 5px; font-family: Tahoma; font-size: 10px; color: white;
                        background-color: #577D8A; float: right; margin-top: 2px; height: 10px; padding-bottom: 3px;
                        padding-right: 2px; padding-left: 3px;">
                        <asp:Label ID="lblCount" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; width: 50px;">
                        <asp:LinkButton ID="DeleteAll" Style="text-decoration: none; color: #2D8FD6; font-family: Tahoma;
                            font-size: 9px;" runat="server">(حذف همه)</asp:LinkButton>
                    </div>
                </div>
                <div style="float: right; width: 466px; padding: 2px">
                    <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Notifications"
                        GridLines="None" ShowHeader="False" Style="font-family: Tahoma; font-size: 11px"
                        Width="475px" AllowPaging="True">
                        <PagerStyle CssClass="PageSS" />
                        <Columns>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <ItemTemplate>

                                    <script type="text/javascript">
                                    function moveN(e)
                                    {
                                        var str=e.split('_');
                                        document.getElementById(e).style.display="none";
                                        document.getElementById('Div-Notification-Down_'+str[1]).style.display="inline";
                                    }
                                    function outN(e)
                                    {
                                        var str=e.split('_');                                        
                                        document.getElementById(e).style.display="none";
                                        document.getElementById('Div-Notification-Org_'+str[1]).style.display="inline";
                                    }
                                    </script>

                                    <div id='<%# "Div-Notification-Org_"+Eval("code","{0}") %>' onmousemove="return moveN(this.id);">
                                        <asp:Label ID="Label1" runat="server" Style="color: #666666" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                    </div>
                                    <div style="display: none;" id='<%# "Div-Notification-Down_"+Eval("code","{0}") %>'
                                        onmouseout="return outN(this.id);">
                                        <div style="background-color: #ccc;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" OnCommand="UpdateFlag" CommandArgument='<%# Eval( "code","{0}") %>'
                                                            Style="font-size: 13px; color: Black; text-decoration: none;" runat="server">×</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="ImageButton2" runat="server"
                                                            ToolTip="نمایش پست" CommandArgument='<%# Eval( "code","{0}") +"|"+ Eval("email","{0}") %>'
                                                            OnCommand="ShowLink" ImageUrl="~/content/images/Home/TOP.GIF" />
                                                        <asp:Label ID="Label2" runat="server" Text='<%# CountUpdate(DataBinder.Eval(Container.DataItem,"count"),DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS_Notifications" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Profile_NotificationsTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div id="Div_MSG" runat="server" class="UnderNot">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="imgResiveMSG" PostBackUrl="~/home/Menu/Fund/msg.aspx"
                                        ToolTip="پیام های خوانده نشده" ImageUrl="~/content/images/Home/msg_UnReadMsg.png"
                                        runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_ResiveMSG" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="Div_Relation" runat="server" class="UnderNot">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="imgRelation" PostBackUrl="~/home/Menu/MyRoom/requests.aspx"
                                        ToolTip="درخواست های تایید نشده" ImageUrl="~/content/images/Home/relation.png"
                                        runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Relation" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="Div_Inbox" runat="server" class="UnderNot">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="ImageButton4" PostBackUrl="~/home/Menu/Fund/msg.aspx"
                                        ToolTip="پیام های سیستمی" ImageUrl="~/content/images/Profile_View_Users/footerNav.png"
                                        runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lblMSG_system" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                            <ProgressTemplate>
                                <img src="../content/images/Profile_View_Users/Loading_0.gif" /></ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
