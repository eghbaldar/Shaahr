<%@ Page Language="VB" MasterPageFile="~/home/Menu/MyRoom/Home.master" AutoEventWireup="false"
    CodeFile="CommonAlbums.aspx.vb" Inherits="home_Menu_MyRoom_CommonAlbums" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(    "../../../content/font/W_koodak.TTF" );
        }
        .font
        {
            color: #6C6C6C;
            font-family: koodak;
            font-size: 13px;
            padding-right: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            آلبوم های مشترک
        </div>
        <div style="float: right;">
            <asp:DataList ID="Dl_Album" runat="server" DataKeyField="Code" DataSourceID="ODS_Album"
                RepeatColumns="5" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="style3">
                        <tr>
                            <td>
                                <asp:Label ID="AlbumNameLabel" runat="server" Style="font-weight: 700; color: #284D57;"
                                    Text='<%# Eval("AlbumName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="border: 3px solid #ccc; padding: 2px; width: 121px;">
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgNotAlbum" runat="server"
                                        OnCommand="RedirectPhoto" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("Email","{0}") %>'
                                        ImageUrl='<%# SetOrgAlbum(DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'
                                        Height="89px" Width="120px" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Style="color: #666666" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS_Album" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Home_CommonAlbumTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
