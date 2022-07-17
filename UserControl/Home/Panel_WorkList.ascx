<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_WorkList.ascx.vb"
    Inherits="UserControl_Home_Panel_WorkList" %>
<style type="text/css">
    </style>
<div style="width: 210px; height: 100%; direction: rtl;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width: 100%; font-family: Tahoma; font-size: 11px;">
                <tr>
                    <td>
                        <div style="float: right;">
                            <asp:TextBox ID="txtTitle" runat="server" Width="177px" Style="font-family: Tahoma;
                                font-size: 11px; border: 1px solid #ccc;"></asp:TextBox>
                        </div>
                        <div style="margin-top: 0px; float: right;">
                            <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnInsertWork" runat="server"
                                ImageUrl="~/content/images/Home/addWork.png" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:GridView ID="DG_Work" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Qorklist"
                            CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False" Width="198px"
                            Style="font-size: 11px" AllowPaging="True">
                            <FooterStyle BackColor="#ccc" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="title" SortExpression="title">
                                    <ItemTemplate>
                                        <div style="float: right; width: 180px; height: 100%;">
                                            <asp:Label ID="Label1" runat="server" Style="font-size: 11px" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                        </div>
                                        <div style="float: right; width: 10px; height: 10px;">
                                            <asp:ImageButton ImageUrl="~/content/images/Home/deleteWork.jpg" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnCommand="DeleteWork" ID="ImageButton1" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="#e6e6e6" ForeColor="black" HorizontalAlign="right" />
                            <EmptyDataTemplate>
                                <span style="font-family: Tahoma; font-size: 11px;">کاری در لیست وجود ندارد</span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_Qorklist" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Profile_WorkListTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="_date" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
