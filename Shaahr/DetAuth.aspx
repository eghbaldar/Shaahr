<%@ Page Language="VB" MasterPageFile="~/Shaahr/Home2.master" AutoEventWireup="false"
    CodeFile="DetAuth.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url("../../content/font/W_koodak.TTF" );
        }
        .style4
        {
            width: 182px;
        }
        .style5
        {
            width: 98px;
        }
        .style6
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="DetailPersonal" Width="731px">
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style4">
                                                <div style="-moz-border-radius: 5px; background-color: #ccc; padding: 5px;">
                                                    <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=190&H=190" %>'
                                                        runat="server" Height="170px" Width="180px" Style="-moz-border-radius: 5px;" />
                                                </div>
                                            </td>
                                            <td>
                                                <div style="border: 6px solid #E0E0E0; -moz-border-radius: 5px; width: 527px;">
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td class="style5">
                                                                            نام:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style5">
                                                                            متولد:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# GetAge(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style5">
                                                                            مدت شهروندی:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text='<%# GetTime(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <hr style="border-top: 1px solid #CCCCCC; border-bottom: 0; border-left: 0; border-right: 0;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td class="style6">
                                                                            عنوان:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style6">
                                                                            دوره:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Priode_ResponsibiltyLabel" runat="server" Text='<%# Eval("Priode_Responsibilty") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style6">
                                                                            مدت دوره:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Time_ResponsibiltyLabel" runat="server" Text='<%# Eval("Time_Responsibilty") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style6">
                                                                            تاریخ شروع دوره:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Date_Start_ResponsibiltyLabel" runat="server" Text='<%# Eval("Date_Start_Responsibilty") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style6">
                                                                            تاریخ پایان دوره:
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Date_End_ResponsibiltyLabel" runat="server" Text='<%# Eval("Date_End_Responsibilty") %>' />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: koodak; font-size: 15px;">
                                    سوابق
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="CVLabel" runat="server" Text='<%# Eval("CV") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: koodak; font-size: 15px;">
                                    مسئولیت جاری
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ResponsibiltyLabel" runat="server" Text='<%# Eval("Responsibilty") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="DetailPersonal" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Detail_Auth_ByEmailTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 15px;">
                مسئولیت های پیشین
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="ODS_Resume" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:CheckBoxField DataField="Which" HeaderText="Which" SortExpression="Which" Visible="False" />
                        <asp:TemplateField HeaderText="نوع مسئولیت" SortExpression="Type">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="250px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
                        <asp:BoundField DataField="Title_Post" HeaderText="Title_Post" SortExpression="Title_Post"
                            Visible="False" />
                        <asp:BoundField DataField="CV" HeaderText="CV" SortExpression="CV" Visible="False" />
                        <asp:BoundField DataField="Responsibilty" HeaderText="Responsibilty" SortExpression="Responsibilty"
                            Visible="False" />
                        <asp:BoundField DataField="Time_Responsibilty" HeaderText="مدت دوره" SortExpression="Time_Responsibilty">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Priode_Responsibilty" HeaderText="دوره" SortExpression="Priode_Responsibilty">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date_Start_Responsibilty" HeaderText="تاریخ شروع دوره"
                            SortExpression="Date_Start_Responsibilty">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date_End_Responsibilty" HeaderText="تاریخ پایان دوره"
                            SortExpression="Date_End_Responsibilty">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" Visible="False" />
                        <asp:BoundField DataField="picpath" HeaderText="picpath" SortExpression="picpath"
                            Visible="False" />
                        <asp:ImageField>
                            <HeaderStyle Width="200px" />
                        </asp:ImageField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        سابقه ای وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                    <HeaderStyle BackColor="#DEDEDE" Font-Bold="false" ForeColor="#567D8C" BorderColor="#cccccc"
                        BorderStyle="Solid" BorderWidth="1px" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Resume" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Resume_AuthTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 15px;">
                پست ها
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
