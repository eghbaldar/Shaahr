<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Avatars.ascx.vb" Inherits="UserControl_Home_Avatars" %>
<asp:UpdatePanel ID="UP_Avatar" runat="server" UpdateMode="Conditional">
    <Triggers>
        <asp:PostBackTrigger ControlID="imgOrgAvatar" />
    </Triggers>
    <ContentTemplate>
        <table style="width: 100%; padding: 0; margin: 0;">
            <tr>
                <td>
                    <div style="height: 67px;">
                        <asp:ImageButton ForeColor="Transparent" AlternateText="" Style="border: 1px solid #f2f2f2;"
                            ID="imgOrgAvatar" runat="server" Height="66px" Width="66px" />
                    </div>
                </td>
                <td>
                    <div style="height: 63px; width: 124px;">
                        <asp:DataList ID="Dl_Avatars" runat="server" DataSourceID="ODS_Avatars" Height="47px"
                            RepeatColumns="4" RepeatDirection="Horizontal" Width="64px">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" CommandArgument='<%# Eval("ID","{0}") %>' OnCommand="SetAvatar"
                                    runat="server" ForeColor="Transparent" AlternateText="" Height="29px" ImageUrl='<%# Eval("PicPath", "~\content\images\profile\avatars\{0}") %>'
                                    Width="29px" />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UP_Avatar">
    <ProgressTemplate>
        <img src="../content/images/Profile_View_Users/Loading_0.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:ObjectDataSource ID="ODS_Avatars" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Profile_AvatarsTableAdapter">
    <SelectParameters>
        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="PicPath" Type="String" />
        <asp:Parameter Name="Flag" Type="Boolean" />
    </InsertParameters>
</asp:ObjectDataSource>
