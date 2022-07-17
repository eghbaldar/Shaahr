<%@ Page Language="VB" MasterPageFile="~/MyShaahr/News/Home.master" AutoEventWireup="false"
    CodeFile="news.aspx.vb" Inherits="MyShaahr_news" Title="Untitled Page" %>

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
            width: 19px;
        }
        .style11
        {
            color: #333333;
        }
        .style7
        {
            width: 14px;
        }
        .style8
        {
            width: 20px;
        }
        .style12
        {
            width: 25px;
        }
        .style13
        {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            خبر های شهر دات کام
        </div>
        <table class="style6">
            <tr>
                <td>
                    <table class="style6">
                        <tr>
                            <td class="style10">
                                <img alt="" src="../content/images/MyShaahr/news.png" style="width: 32px; height: 32px" />
                            </td>
                            <td class="style11">
                                خبر های برگزاری شهر دات کام
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_News"
                        GridLines="None" ShowHeader="False" Width="740px" AllowPaging="True" PageSize="5">
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
                                                <img alt="" src="../../Content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                            </td>
                                            <td>
                                                <h1 style="font-weight: normal;">
                                                    <a href='<%# Eval("id","news.aspx?IDnews={0}") %>' style="text-decoration: none;">
                                                        <asp:Label ID="Label1" runat="server" Style="color: #247C9D" Text='<%# Bind("title_news") %>'></asp:Label>
                                                    </a>&nbsp; (
                                                    <asp:Label ID="Label3" runat="server" Style="color: #3399FF; font-size: 10px" Text='<%# Bind("tarikh") %>'></asp:Label>
                                                    )
                                                </h1>
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
                                                <h1 style="font-weight: normal;">
                                                    <asp:Label ID="Label2" runat="server" Style="color: #666666" Text='<%# Bind("lid_news") %>'></asp:Label>
                                                </h1>
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
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="ODS_News" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="DS_MyShaahrTableAdapters.TopNewsTableAdapter">
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
        <table class="style6">
            <tr>
                <td>
                    <div style="border: 1px solid #e7e7e7; width: 732px;">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" Width="733px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td class="style7">
                                                        <img alt="" src="../content/images/MyShaahr/note.gif" style="width: 16px; height: 16px" />
                                                    </td>
                                                    <td>
                                                        <h1 style="font-weight: normal;">
                                                            <asp:Label ID="title_newsLabel" runat="server" Style="font-size: 13px" Text='<%# Eval("title_news") %>' />
                                                        </h1>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="border: 2px solid #bad1e5; padding: 5px; -moz-border-radius: 5px;">
                                                <h1 style="font-weight: normal;">
                                                    <asp:Label ID="newsLabel" runat="server" Text='<%# Eval("news") %>' Style="color: #3e3e3e;" />
                                                </h1>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td class="style8">
                                                        <img alt="" src="../content/images/MyShaahr/date.png" style="width: 18px; height: 19px" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="tarikhLabel" runat="server" Style="color: #276F8A" Text='<%# Eval("tarikh") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style8">
                                                        <img alt="" src="../content/images/MyShaahr/time.png" style="width: 16px; height: 16px" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="timeLabel" runat="server" Style="color: #1D95B6" Text='<%# Eval("time", "{0}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style6">
                        <tr>
                            <td class="style12">
                                <img alt="" src="../../Content/images/MyShaahr/category_.png" style="width: 32px;
                                    height: 32px" />
                            </td>
                            <td>
                                طبقه بندی خبرهای شهر دات کام
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="Code_Category" DataSourceID="ODS_CategoryNews" GridLines="None"
                        PageSize="5" ShowHeader="False" Width="739px">
                        <Columns>
                            <asp:TemplateField HeaderText="Code_Category" InsertVisible="False" SortExpression="Code_Category">
                                <ItemTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td class="style13">
                                                <img alt="" src="../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("Code_Category","newscat.aspx?IDcat={0}") %>' style="text-decoration: none;">
                                                    <asp:Label ID="Label2" runat="server" Style="color: #247C9D" Text='<%# Bind("Name_Category") %>'></asp:Label>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Code_Category") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name_Category" SortExpression="Name_Category">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_Category") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS_CategoryNews" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_MyShaahrTableAdapters.CMS_NewsCategoryTableAdapter">
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="DS_MyShaahrTableAdapters.CMS_NewsTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="IDnews" Type="Int64" />
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
    </div>
</asp:Content>
