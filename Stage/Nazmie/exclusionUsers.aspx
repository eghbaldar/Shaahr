<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="exclusionUsers.aspx.vb" Inherits="Stage_Nazmie_exclusionUsers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 36px;
        }
        .style8
        {
            width: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            کاربران اخراج شده
        </div>
        <div style="width: 737px; padding: 5px; float: right;">
            <div style="float: right;">
                <img src="../../content/images/Stage/Nazmie/UsersExclusion.png" />
            </div>
            <div style="padding: 2px;">
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                <div style="padding: 5px; color: #0d6d87;">
                    <asp:Label ID="lblReportUser" runat="server"></asp:Label></div>
                <div style="padding-right: 5px; color: #0d6d87;">
                    <asp:Label ID="lblReportDetective" runat="server"></asp:Label></div>
            </div>
        </div>
        <div style="width: 737px; padding: 5px; float: right;">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataSourceID="ODS" GridLines="None" PageSize="20" ShowHeader="False" Width="737px"
                CellPadding="4" ForeColor="#333333">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField HeaderText="PicPath" SortExpression="PicPath">
                        <ItemTemplate>
                            <div style="border: 1px solid #ccc; padding: 2px; -moz-border-radius: 8px;">
                                <table class="style6">
                                    <tr>
                                        <td class="style7">
                                            <asp:Image ID="Image1"  runat="server"
                                    ForeColor="Transparent"
                                    runat="server" Height="50px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=50&H=50" %>'
                                                Width="50px" />
                                        </td>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td class="style8">
                                                        نام&nbsp; کاربری:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text='<%# GetUserName(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style8">
                                                        تاریخ&nbsp; اخراج:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("DateStart", "{0}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            دلیل:
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("cuase", "{0}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    کاربری برای نمایش وجود ندارد.
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_User_ExclusionTableAdapter">
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
