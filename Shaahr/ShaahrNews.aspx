<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="ShaahrNews.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style3">
        <tr>
            <td>
                <div style="border: 3px solid #E9E9E9; -moz-border-radius: 5px;" >
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_AllNews"
                        GridLines="None" ShowHeader="False" AllowPaging="True" Width="731px" CellPadding="4"
                        ForeColor="#333333">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="CodeShaahr" HeaderText="CodeShaahr" SortExpression="CodeShaahr"
                                Visible="False" />
                            <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                <ItemTemplate>
                                    <div style="width: 600px; padding: 1px;">
                                        <asp:LinkButton ID="LinkButton2" OnCommand="GotoNews" CommandArgument='<%# Eval("id","{0}") %>'
                                            Style="color: #247C9D; text-decoration: none;" Text='<%# Bind("subject") %>'
                                            runat="server" />
                                        (<asp:Label ID="Label3" runat="server" Style="font-weight: 700" Text='<%# Bind("visit") %>'></asp:Label>)</div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="visit" SortExpression="visit"></asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS_AllNews" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrNews_AllTableAdapter">
                        <SelectParameters>
                            <asp:Parameter Name="codeshaahr" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CodeShaahr" Type="Int64" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="text" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="visit" Type="Int64" />
                            <asp:Parameter Name="flag" Type="Boolean" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS_NewsByID" Width="737px">
                    <ItemTemplate>
                        <table class="style3">
                            <tr>
                                <td>
                                    <div style="background-color: #E9E9E9; color: Black; padding: 4px; border: 1px solid #DEDEDE;">
                                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' Style="font-weight: 700" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="color: Black; padding: 4px; border: 1px solid #DEDEDE;">
                                        <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="background-color: #E9E9E9; color: Black; padding: 4px; border: 1px solid #DEDEDE;">
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Style="color: #003399" />
                                        (<asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' Style="color: #0066CC" />)
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODS_NewsByID" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrNews_ByIDTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="iN" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeShaahr" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="visit" Type="Int64" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
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
