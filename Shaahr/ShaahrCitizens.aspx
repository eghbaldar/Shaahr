<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="ShaahrCitizens.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style3">
        <tr>
            <td>
                <div id="Div" runat="server">
                <asp:ObjectDataSource ID="ODS_Users" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Profile_ShaahrsTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="code_shaahr" Type="Int64" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS_Users" RepeatDirection="Horizontal"
                    RepeatColumns="7">
                    <ItemTemplate>
                        <div style="padding: 3px; background-color: #EDEDED; -moz-border-radius: 5px; border: 1px solid #ccc;">
                            <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    Style="margin-top: 2px; -moz-border-radius: 5px" OnCommand="RedirectUser"
                                CommandArgument='<%# Eval("email","{0}") %>' ID="imgFriends" runat="server" Height="95px"
                                ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=100&H=100" %>'
                                Width="95px" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
