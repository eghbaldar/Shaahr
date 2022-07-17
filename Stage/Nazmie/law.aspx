<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="law.aspx.vb" Inherits="Stage_Nazmie_raw" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server" />
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="DivTopContext" style="width: 737px;">
    <div class="DivTop" style="width: 729px;">
        قوانین
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS"
        GridLines="None" ShowHeader="False" Width="737px">
        <Columns>
            <asp:TemplateField HeaderText="subject" SortExpression="subject">
                <ItemTemplate>
                    <div style="padding: 4px; border: 2px solid #f1f1f1; background-color: #f8f8f8; -moz-border-radius: 5px;
                        margin-top: 2px;">
                        <table class="style6">
                            <tr>
                                <td class="style2">
                                    <img src='<%# SetImg(DataBinder.Eval(Container.DataItem,"type")) %>' />
                                </td>
                                <td class="style7">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                                </td>
                                <td>
                                    &nbsp; <a href='<%# Eval("code","law-com.aspx?law={0}") %>' style="border: none;">
                                        <img src="../../content/images/Stage/Nazmie/Next.gif" border="0" /></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            قانونی برای نمایش وجود ندارد.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_Law_ByTypeTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="type" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
</asp:Content> 