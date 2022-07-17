<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="CategoryShaahrs.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                      "../../content/font/W_koodak.TTF" );
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            طبقه بندی های شهرها
        </div>
        <table class="style1">
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="code" DataSourceID="ODS_Category"
                        RepeatColumns="3" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div style="width: 200px; padding: 2px;">
                                <a href='<%# Eval("code","CategoryShaahrs.aspx?cdF={0}") %>' style="text-decoration: none;">
                                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Style="color: #0066CC" />
                                </a><a href='<%# Eval("code","CategoryShaahrs.aspx?cdF={0}") %>' style="text-decoration: none;
                                    color: Black;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# GetCount(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Category" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.tbl_CMS_Favorits_CategoryTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_code" Type="Int64" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="Logo" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="Original_code" Type="Int64" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="Logo" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 3px dotted #ccc;" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_Shaahr" RepeatColumns="15"
                        RepeatDirection="Horizontal" Width="28px">
                        <ItemTemplate>
                            <div style="border: 1px solid #ccc;">
                                <table class="style6">
                                    <tr>
                                        <td>
                                            <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                Height="33px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                OnCommand="GotoShaahr" Width="33px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Shaahr" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ByFavortisCodeTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="code_category" QueryStringField="cdF" Type="Int64" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
