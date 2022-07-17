<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="threadSearch.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        .style7
        {
            width: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style3">
        <tr>
            <td>
                <asp:Label ID="lblSearch" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Code" DataSourceID="ODS_Search" ForeColor="#333333" GridLines="None"
                    ShowHeader="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                            Visible="False" />
                        <asp:TemplateField HeaderText="عنوان" SortExpression="Subject">
                            <ItemTemplate>
                                <table class="style3">
                                    <tr>
                                        <td class="style7">
                                            <p class="MsoNormal" style="color: #0066CC">
                                                ●</p>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton3" runat="server" 
                                                CommandArgument='<%# Eval("code","{0}") %>' OnCommand="GotoShowThread" 
                                                Style="text-decoration: none; color: #1093C7;" Text='<%# Bind("Subject") %>'></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="500px" />
                            <ItemStyle Width="449px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" Visible="False" />
                        <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Style="color: #808080" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Visit" HeaderText="Visit" SortExpression="Visit" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
                        <asp:TemplateField HeaderText="تاریخ" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Style="color: #808080" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Luck" HeaderText="Luck" SortExpression="Luck" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        موردی یافت نشده است.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Search" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrPost_SearchTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Visit" Type="Int32" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter Name="text" Type="String" />
                        <asp:Parameter Name="codeshaahr" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Visit" Type="Int32" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                    </InsertParameters>
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
    </table>
</asp:Content>
