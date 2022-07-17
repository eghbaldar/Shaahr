<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_InhabitShaahr.ascx.vb"
    Inherits="UserControl_Home_Panel_InhabitShaahr" %>
<asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
    DataSourceID="ODS_Shaahrs" GridLines="None" ShowHeader="False" Width="210px">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
            SortExpression="ID" Visible="False" />
        <asp:BoundField DataField="CodeState" HeaderText="CodeState" SortExpression="CodeState"
            Visible="False" />
        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
            Visible="False" />
        <asp:TemplateField HeaderText="Name" SortExpression="Name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <table class="style9">
                    <tr>
                        <td class="style10">
                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" OnCommand="GotoShaahr"
                                CommandArgument='<%# Eval("id","{0}") %>' ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                runat="server" Height="50px" Width="50px" />
                        </td>
                        <td>
                            <div style="width: 150px; height: 40px;">
                                <table class="style11">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name", "{0}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CuaseFundation" HeaderText="CuaseFundation" SortExpression="CuaseFundation"
            Visible="False" />
        <asp:BoundField DataField="Funder" HeaderText="Funder" SortExpression="Funder" Visible="False" />
        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
            Visible="False" />
        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
            Visible="False" />
        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
            SortExpression="EnablePresedentNazmie" Visible="False" />
        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" Visible="False" />
        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="CodePeygiriJiring" SortExpression="CodePeygiriJiring"
            Visible="False" />
        <asp:CheckBoxField DataField="Suspention" HeaderText="Suspention" SortExpression="Suspention"
            Visible="False" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="ODS_Shaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetData" 
    TypeName="DS_ShaahrTableAdapters.Users_ShaahrsHomeTableAdapter">
    <SelectParameters>
        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:LinkButton ID="LinkMore" runat="server" Style="font-family: Tahoma; font-size: 10px;
    color: #577F8B; text-decoration: none;" Visible="False">شهرهای بیشتر....</asp:LinkButton>
