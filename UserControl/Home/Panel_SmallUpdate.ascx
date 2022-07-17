<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_SmallUpdate.ascx.vb"
    Inherits="UserControl_Home_Panel_SmallUpdate" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        font-family: Tahoma;
        font-size: 11px;
    }
    .style2
    {
        direction: rtl;
        width: 180px;
    }
</style>
<div style="width: 210px; height: 100%; direction: ltr;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
        DataSourceID="ODS" GridLines="None" PageSize="2" ShowHeader="False" Width="210px"
        AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style2">
                                            <a href='<%# RedirectPost(Eval("code","{0}") + "|" + Eval("email","{0}"))%>' target="_blank"
                                                style="color: #0a6585; text-decoration: none;">
                                                <asp:Label ID="Label2" runat="server" Text='<%# ControlDetail(DataBinder.Eval(Container.DataItem,"detail")) %>'>
                                                </asp:Label>
                                            </a>
                                        </td>
                                        <td>
                                            <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="ImageButton1" runat="server"
                                                Height="45px" Style="border: 3px solid #ccc; -moz-border-radius: 5px;" ImageUrl='<%# Eval("picpath", "~\content\images\profile\avatars\{0}") %>'
                                                Width="45px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("date", "{0}") %>' Style="font-size: 10px;
                                    color: #666666"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="TakNazar" runat="server" Text='<%# Text(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Panel_SmallUpdateTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="email" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
