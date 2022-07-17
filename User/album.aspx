<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="album.aspx.vb" Inherits="user_album" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 120px;
        }
        .style7
        {
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="Pnl_Album">
        <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 540px;
            height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
            font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                آلبوم تصاویر
            </div>
            <div style="font-family: Tahoma; font-size: 11px;">
                <table class="style5">
                    <tr>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td class="style7">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgNotAlbum" Style="border: 3px solid #DFDFDF;
                                            padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;"
                                            runat="server" Height="96px" Width="127px" />
                                    </td>
                                    <td>
                                        <asp:DataList ID="DataList1" runat="server" DataSourceID="Ods_notAlbum" RepeatColumns="8"
                                            RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <asp:Image runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                    Height="40px" Style="border: 3px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px;
                                                    -webkit-border-radius: 4px; border-radius: 4px;" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=40&H=40" %>'
                                                    Width="40px" />
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:ObjectDataSource ID="Ods_notAlbum" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_Random_PictureNotAlbumTableAdapter"
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="for_who" Type="String" />
                                                <asp:Parameter Name="type" Type="Int32" />
                                                <asp:Parameter Name="string_factor" Type="String" />
                                                <asp:Parameter Name="_date" Type="String" />
                                                <asp:Parameter Name="time" Type="String" />
                                                <asp:Parameter Name="detail" Type="String" />
                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:Parameter Name="email" Type="String" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="for_who" Type="String" />
                                                <asp:Parameter Name="type" Type="Int32" />
                                                <asp:Parameter Name="string_factor" Type="String" />
                                                <asp:Parameter Name="_date" Type="String" />
                                                <asp:Parameter Name="time" Type="String" />
                                                <asp:Parameter Name="detail" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCountPicture" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCountComment" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCountLike" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="font-family: Tahoma; font-size: 11px;">
                <table class="style3">
                    <tr>
                        <td>
                            <asp:DataList ID="DataList2" runat="server" DataKeyField="Code" DataSourceID="ODS_Album"
                                RepeatColumns="4" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <table class="style3">
                                        <tr>
                                            <td>
                                                <asp:Label ID="AlbumNameLabel" runat="server" Style="color: Black;" Text='<%# Eval("AlbumName") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgNotAlbum" OnCommand="RedirectPhoto"
                                                    Style="border: 3px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                    border-radius: 4px;" CommandArgument='<%# Eval("code","{0}") %>' ImageUrl='<%# SetOrgAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    Height="88px" Width="115px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCountPicture" Text='<%# SetCountPicutreAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCountComment" Text='<%# SetlblCountCommentAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCountLike" Text='<%# SetlblCountLikeAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS_Album" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.tbl_Profile_AlbumTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="AlbumName" Type="String" />
                                    <asp:Parameter Name="_date" Type="String" />
                                    <asp:Parameter Name="Original_Code" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:Parameter Name="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="AlbumName" Type="String" />
                                    <asp:Parameter Name="_date" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
