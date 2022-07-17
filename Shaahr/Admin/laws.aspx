<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="laws.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(               "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            قوانین ساختمان مدیریتی
        </div>
        <table class="style1">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style3">
                                <img src="../../Content/images/Shaahrs/Root/law.png" />
                            </td>
                            <td>
                                <div style="padding: 2px;">
                                    سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                                    های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                                    سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                                    های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <uc1:ButtonShaahr ID="btnLawPresedent" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan1" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan2" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan3" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan4" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan5" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawEstablishShaahr" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawShaahr" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="DgLaw" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="ODS" ForeColor="#333333" GridLines="None" DataKeyNames="id">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title">
                                <HeaderStyle Width="625px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                            <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                            <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Style="text-decoration: none;
                                        color: #0089AA;" CommandName="Select" Text="مشاهده"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Font-Underline="False" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            موردی یافت نشد.
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#1490B4" ForeColor="#ffffff" />
                        <HeaderStyle BackColor="#D6E1E7" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                            Font-Bold="false" ForeColor="#567D8C" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_LawTableAdapter">
                        <SelectParameters>
                            <asp:Parameter Name="type" Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="text" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS_Show" Width="735px">
                        <ItemTemplate>
                            <div style="border: 2px solid #ccc; -moz-border-radius: 4px; padding: 4px;">
                                <asp:Label Text='<%# Eval("text") %>' runat="server" ID="textLabel" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Show" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.ShaahrLaw_ByIDTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DgLaw" Name="id" PropertyName="SelectedValue" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="text" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
