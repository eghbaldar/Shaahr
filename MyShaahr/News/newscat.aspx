<%@ Page Language="VB" MasterPageFile="~/MyShaahr/News/Home.master" AutoEventWireup="false"
    CodeFile="newscat.aspx.vb" Inherits="MyShaahr_newscat" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style9
        {
            width: 1px;
        }
        .style10
        {
            width: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            خبر های این دسته
        </div>
        <table class="style6">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS"
                        GridLines="None" ShowHeader="False" Width="740px" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="title_news" SortExpression="title_news">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title_news") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lid_news" SortExpression="lid_news">
                                <ItemTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td class="style9">
                                                <img alt="" src="../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("id","news.aspx?IDnews={0}") %>' style="text-decoration: none;">
                                                    <asp:Label ID="Label1" runat="server" Style="color: #247C9D" Text='<%# Bind("title_news") %>'></asp:Label>
                                                </a>&nbsp; (
                                                <asp:Label ID="Label3" runat="server" Style="color: #3399FF; font-size: 10px" Text='<%# Bind("tarikh") %>'></asp:Label>
                                                )
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style9">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Style="color: #666666" Text='<%# Bind("lid_news") %>'></asp:Label>
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
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("tarikh") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="time" SortExpression="time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_MyShaahrTableAdapters.News_By_CategoryTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="code" QueryStringField="IDcat" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="title_news" Type="String" />
                            <asp:Parameter Name="lid_news" Type="String" />
                            <asp:Parameter Name="news" Type="String" />
                            <asp:Parameter Name="tarikh" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="Flag" Type="Boolean" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Code_Category" Type="Int64" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
