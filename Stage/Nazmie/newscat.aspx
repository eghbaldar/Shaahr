<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="newscat.aspx.vb" Inherits="Stage_Nazmie_newscat" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style12
        {
            width: 25px;
        }
        .style13
        {
            width: 10px;
        }
        .style14
        {
            width: 3px;
        }
        .style15
        {
            width: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            اخبار نظمیه
        </div>
        <table class="style6">
            <tr>
                <td>
                    &nbsp;<table class="style6">
                        <tr>
                            <td class="style12">
                                <img alt="" src="../../content/images/MyShaahr/category_.png" style="width: 32px;
                                    height: 32px" />
                            </td>
                            <td>
                                طبقه بندی خبرهای نظمیه
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="CodeCategory" DataSourceID="ODS_CategoryNews" GridLines="None"
                        PageSize="5" ShowHeader="False" Width="739px">
                        <Columns>
                            <asp:TemplateField HeaderText="CodeCategory" InsertVisible="False" SortExpression="CodeCategory">
                                <ItemTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td class="style13">
                                                <img alt="" src="../../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("CodeCategory","newscat.aspx?IDcat={0}") %>' style="text-decoration: none;">
                                                    <asp:Label ID="Label2" runat="server" Style="color: #247C9D" Text='<%# Bind("NameCategory") %>'></asp:Label>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CodeCategory") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name_Category" SortExpression="NameCategory">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NameCategory") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS_CategoryNews" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_Category_NewsTableAdapter"
                        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_CodeCategory" Type="Int64" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NameCategory" Type="String" />
                            <asp:Parameter Name="Original_CodeCategory" Type="Int64" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="NameCategory" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style14">
                                <img alt="" src="../../content/images/MyShaahr/news.png" style="width: 32px; height: 32px" />
                            </td>
                            <td>
                                خبر های این دسته
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS"
                        GridLines="None" ShowHeader="False" Width="740px" PageSize="15" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField HeaderText="title" SortExpression="title">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lid_news" SortExpression="lid_news">
                                <ItemTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td class="style15">
                                                <img alt="" src="../../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("id","news.aspx?IDnews={0}") %>' style="text-decoration: none;">
                                                    <asp:Label ID="Label4" runat="server" Style="color: #247C9D" Text='<%# Bind("title") %>'></asp:Label>
                                                </a>&nbsp; (
                                                <asp:Label ID="Label3" runat="server" Style="color: #3399FF; font-size: 10px" Text='<%# Bind("date") %>'></asp:Label>
                                                )
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Style="color: #666666" Text='<%# Bind("lid_news") %>'></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lid_news") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="tarikh" SortExpression="tarikh">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="time" SortExpression="time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            خبری برای نمایش وجود ندارد.
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_NewsByCodeCategoryTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CodeCategory" QueryStringField="IDcat" Type="Int64" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
