<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="default.aspx.vb" Inherits="Shaahr_Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 88px;
        }
        @font-face
        {
            font-family: koodak;
            src: url(           "../../content/font/W_koodak.TTF" );
        }
        .style5
        {
            width: 491px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            پنل مدیریتی مسئولیت ها
        </div>
        <asp:MultiView ID="MultiView" runat="server">
            <asp:View ID="V_NoEnter" runat="server">
                <div style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde; padding: 10px;
                    margin-top: 2px; width: 724px; height: 20px; background-color: #f3fbff; color: #577F8B;"
                    runat="server">
                    برای شما مسئولیتی وجود ندارد.
                </div>
            </asp:View>
            <asp:View ID="V_Enter" runat="server">
                <table class="style1">
                    <tr>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style3">
                                        <div style="-moz-border-radius: 5px; background-color: #ccc; padding: 5px;">
                                            <asp:Image  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImgAvatar" runat="server" Height="90px" Width="100px" />
                                        </div>
                                    </td>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style3" style="font-family: koodak; font-size: 15px; color: #969696;">
                                                    مشخصات
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    ورود کرده:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFnLn" runat="server" Style="font-weight: 700"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    آخرین تاریخ ورود:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblLastLogin" runat="server" Style="color: #0066CC"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: koodak; font-size: 15px;">
                            <table class="style1">
                                <tr>
                                    <td style="font-family: Koodak; font-size: 15px;">
                                        مسئولیت جاری
                                    </td>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <img alt="" src="../../Content/images/Shaahrs/Root/EnterPanel.png" style="width: 130px;
                                            height: 25px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_ResumeCurrent" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:CheckBoxField DataField="Which" HeaderText="Which" SortExpression="Which" Visible="False" />
                                    <asp:TemplateField HeaderText="نوع مسئولیت" SortExpression="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label></ItemTemplate>
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
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" runat="server" CommandArgument='<%# Eval("type","{0}")+"|"+Eval("email","{0}") %>'
                                                ImageUrl="~/Content/images/Home/EnterPanel.gif" OnCommand="GotoJob" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="200px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    <div style="width: 715px; border: 2px solid #ccc; padding: 4px; -moz-border-radius: 5px;">
                                        مسئولیت کشوری برای شما وجود ندارد.
                                    </div>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                                <HeaderStyle BackColor="#D4E9CA" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                                    Font-Bold="false" ForeColor="#54B051" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_ResumeCurrent" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Resume_Auth_CurrentTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: koodak; font-size: 15px;">
                            سوابق مسئولیت
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_Resume" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:CheckBoxField DataField="Which" HeaderText="Which" SortExpression="Which" Visible="False" />
                                    <asp:TemplateField HeaderText="نوع مسئولیت" SortExpression="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label></ItemTemplate>
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
                                    <div style="width: 715px; border: 2px solid #ccc; padding: 4px; -moz-border-radius: 5px;">
                                        سابقه ی مسئولیتی برای شما وجود ندارد.
                                    </div>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                                <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                                    Font-Bold="false" ForeColor="#567D8C" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Resume" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Resume_AuthTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: koodak; font-size: 15px; color: black;">
                            مدیریت شهرها
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="ID" DataSourceID="ODS_ShaahrOwner" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:BoundField DataField="CodeState" HeaderText="استان" SortExpression="CodeState"
                                        Visible="False">
                                        <HeaderStyle Width="90px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="استان" SortExpression="CodeCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="نام شهر" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                            <br />
                                            <br />
                                            <img src="../../Content/images/MyShaahr/PLUS.GIF" />
                                            <asp:Label ID="Label6" runat="server" Style="font-weight: normal;" Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="249px" />
                                        <ItemStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CuaseFundation" HeaderText="CuaseFundation" SortExpression="CuaseFundation"
                                        Visible="False" />
                                    <asp:BoundField DataField="Funder" HeaderText="Funder" SortExpression="Funder" Visible="False" />
                                    <asp:TemplateField HeaderText="تاییدیه ها" SortExpression="EnableGovernor">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGovernor" runat="server" Text='<%# "شهرداری: "+GetGovernorPresedent(DataBinder.Eval(Container.DataItem,"EnableGovernor")) %>'></asp:Label><br>
                                            </br>
                                            <asp:Label ID="lblPresedent" runat="server" Text='<%# "ریاست جمهوری: "+GetGovernorPresedent(DataBinder.Eval(Container.DataItem,"EnablePresedentNazmie")) %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="[?]" SortExpression="CuaseGovernor">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CuaseGovernor") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            [?]
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="تایید/عدم تایید ریاست جمهوری"
                                        SortExpression="EnablePresedentNazmie" Visible="False" />
                                    <asp:TemplateField SortExpression="Time">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Time") %>'></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" SortExpression="Date" Visible="False">
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کد پیگیری جیرینگ" 
                                        SortExpression="CodePeygiriJiring" Visible="False" />
                                    <asp:TemplateField SortExpression="Suspention">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" Visible='<%# VisibleSuspention(DataBinder.Eval(Container.DataItem,"EnableGovernor"),DataBinder.Eval(Container.DataItem,"EnablePresedentNazmie")) %>'
                                                runat="server" Style="font-weight: 700; font-size: 11px" Text='<%# iif(Eval("Suspention","{0}")=True,"تعلیق","فعال") %>'> </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="95px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                Visible='<%# VisibleSuspention(DataBinder.Eval(Container.DataItem,"EnableGovernor"),DataBinder.Eval(Container.DataItem,"EnablePresedentNazmie")) %>'
                                                ImageUrl="~/Content/images/Home/EnterPanel.gif" OnCommand="GotoGovernor" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="width: 723px; border: 2px solid #ccc; padding: 4px; -moz-border-radius: 5px;">
                                        شهری برای شما وجود ندارد.
                                    </div>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                                <HeaderStyle BackColor="#efd295" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                                    Font-Bold="false" ForeColor="#C44429" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_ShaahrOwner" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_OwnerTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ID" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CodeState" Type="String" />
                                    <asp:Parameter Name="CodeCategory" Type="Int64" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="CuaseFundation" Type="String" />
                                    <asp:Parameter Name="Funder" Type="String" />
                                    <asp:Parameter Name="EnableGovernor" Type="String" />
                                    <asp:Parameter Name="CuaseGovernor" Type="String" />
                                    <asp:Parameter Name="EnablePresedentNazmie" Type="String" />
                                    <asp:Parameter Name="Time" Type="String" />
                                    <asp:Parameter Name="_Date" Type="String" />
                                    <asp:Parameter Name="CodePeygiriJiring" Type="String" />
                                    <asp:Parameter Name="Suspention" Type="Boolean" />
                                    <asp:Parameter Name="Original_ID" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Funder" SessionField="MY-UsErNaMe" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CodeState" Type="String" />
                                    <asp:Parameter Name="CodeCategory" Type="Int64" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="CuaseFundation" Type="String" />
                                    <asp:Parameter Name="Funder" Type="String" />
                                    <asp:Parameter Name="EnableGovernor" Type="String" />
                                    <asp:Parameter Name="CuaseGovernor" Type="String" />
                                    <asp:Parameter Name="EnablePresedentNazmie" Type="String" />
                                    <asp:Parameter Name="Time" Type="String" />
                                    <asp:Parameter Name="_Date" Type="String" />
                                    <asp:Parameter Name="CodePeygiriJiring" Type="String" />
                                    <asp:Parameter Name="Suspention" Type="Boolean" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
