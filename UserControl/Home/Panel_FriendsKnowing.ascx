<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_FriendsKnowing.ascx.vb"
    Inherits="UserControl_Home_Panel_FriendsKnowing" %>
<style type="text/css">
    #tooltip
    {
        font-family: Tahoma;
        font-size: 11px;
        -moz-border-radius: 5px;
        position: absolute;
        background: #49707e;
        padding: 5px;
        color: #fff;
        display: none;
        width: 150px;
    }
</style>
<div style="width: 210px; height: 100%; direction: rtl;">
    <asp:DataList ID="DL" runat="server" DataSourceID="ODS_FriendsKnowing" Width="215px">
        <ItemTemplate>
            <asp:Panel runat="server" ID="PnlVisble" Visible='<%# Visible(DataBinder.Eval(Container.DataItem,"email")) %>'>
                <table style="width: 100%; font-size: 11px; font-family: Tahoma;">
                    <tr>
                        <td style="width: 2px;">
                            <asp:ImageButton  ForeColor="Transparent" 
                        AlternateText="" ID="imgAvatars" CommandArgument='<%# Eval("Email","{0}") %>' OnCommand="Redirect"
                                ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>' runat="server"
                                Height="45px" Width="45px" />
                        </td>
                        <td>
                            <table style="width: 100%; font-size: 11px; font-family: Tahoma;">
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Email","{0}") %>' OnCommand="Redirect"
                                            Text='<%# SetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>' Style="color: Black;
                                            text-decoration: none;" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Style="color: gray;" 
                                        Text='<%# SetCount(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a class="tooltip" title='<%# SetUser(DataBinder.Eval(Container.DataItem,"Email")) %>'>
                                            <asp:ImageButton  ForeColor="Transparent" 
                        AlternateText="" ImageUrl="~/content/images/Home/3Dot.png" ID="ImageButton1" runat="server" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="ODS_FriendsKnowing" runat="server" SelectMethod="FriendsKnowing"
        TypeName="HomeProfile">
        <SelectParameters>
            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
