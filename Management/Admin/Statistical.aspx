<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Statistical.aspx.vb" Inherits="Management_Admin_Statistical" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.DataVisualization" Namespace="System.Web.UI.DataVisualization.Charting"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 31px;
        }
        .style14
        {
            width: 96px;
        }
        .style15
        {
            width: 50px;
        }
        .style16
        {
            width: 67px;
        }
        .style17
        {
            width: 19px;
        }
        .style18
        {
            width: 26px;
        }
        .style19
        {
            width: 87px;
        }
        .style20
        {
            width: 84px;
        }
        .style21
        {
            width: 62px;
        }
        .style22
        {
            width: 61px;
        }
        .style23
        {
            width: 69px;
        }
        .style24
        {
            width: 15px;
        }
        .style25
        {
            width: 25px;
        }
        .style26
        {
            width: 132px;
        }
        .style27
        {
            width: 18px;
            height: 31px;
        }
        .style28
        {
            height: 31px;
        }
        .style30
        {
            width: 74px;
            font-size: 10px;
        }
        .style31
        {
            height: 46px;
        }
        .style32
        {
            height: 29px;
        }
        .style33
        {
            width: 25px;
            height: 32px;
        }
        .style34
        {
            height: 32px;
        }
        .style35
        {
            color: #0033CC;
            font-weight: bold;
        }
        .style37
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; border: 2px dotted #ccc; padding: 3px;">
                    <table class="style1">
                        <tr>
                            <td class="style37">
                                <span class="style35">ثبت نام های امروز:</span>&nbsp;
                                <asp:Label ID="lblCountRegister" runat="server" 
                                    style="color: #FFFFFF; font-size: 25px; background-color: #0000FF"></asp:Label>
&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style35">ثبت نام شدگان براساس تفکیک تاریخی:</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                <asp:DataList ID="DL_Statistical0" runat="server" DataSourceID="ODS_Register_Tafkik" RepeatColumns="4"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div style="border: 1px solid #ccc; padding: 2px;">
                            <table class="style1">
                                <tr>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style30">
                                                    تاریخ:
                                                </td>
                                                <td>
                                                    <asp:Label ID="dateLabel" runat="server" Style="font-weight: 700; font-size: 10px"
                                                        Text='<%# Eval("regdate") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style30">
                                                    تعداد ثبت نام کنندگان:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Column1Label" runat="server" Style="font-size: 10px" Text='<%# Eval("Column1") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Column2Label" runat="server" Text='<%# Percent(DataBinder.Eval(Container.DataItem,"Column2")) %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_Register_Tafkik" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="DS_CMS_StatisticalTableAdapters.All_RegisterTableAdapter">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style32">
            </td>
        </tr>
        <tr>
            <td>
                <img alt="" src="../Content/Images/btn0.gif" style="width: 28px; height: 24px" />
                <b>آمار بازدید</b>
            </td>
        </tr>
        <tr>
            <td class="style35">
                تفکیک بازدید:
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_All_Statictical" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.All_StatisticalTableAdapter">
                </asp:ObjectDataSource>
                <asp:DataList ID="DL_Statistical" runat="server" 
                    DataSourceID="ODS_All_Statictical" RepeatColumns="4"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div style="border: 1px solid #ccc; padding: 2px;">
                            <table class="style1">
                                <tr>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style30">
                                                    تاریخ:
                                                </td>
                                                <td>
                                                    <asp:Label ID="dateLabel" runat="server" Style="font-weight: 700; font-size: 10px"
                                                        Text='<%# Eval("date") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style30">
                                                    تعداد بازدید:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Column1Label" runat="server" Style="font-size: 10px" Text='<%# Eval("Column1") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Column2Label" runat="server" Text='<%# Percent(DataBinder.Eval(Container.DataItem,"Column2")) %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="DeleteAllStatistical" runat="server" OnClientClick="return confirm('sure?');"
                    Style="font-family: Tahoma; font-size: 11px" Text="حذف همه ی باردید ها" />
                <asp:Button ID="DeleteTodayStatistical" runat="server" OnClientClick="return confirm('sure?');"
                    Style="font-family: Tahoma; font-size: 11px" Text="حذف بازدید های امروز" />
                <br />
                <asp:Button ID="DeleteStatisticalByDate" runat="server" OnClientClick="return confirm('sure?');"
                    Style="font-family: Tahoma; font-size: 11px" Text="حذف براساس تاریخ روبرو:" />
                <asp:TextBox ID="txtDateStatistical" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style27">
                            <img alt="" src="../Content/Images/btn1.gif" style="width: 28px; height: 24px" />
                        </td>
                        <td class="style28">
                            <b>تعداد Login ، تعداد مهمان ها و بازدید از بخش های مختلف سایت </b>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                (0)<br />
                اطلاعات آنلاین :
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style20">
                            افراد&nbsp; لاگین کرده:
                        </td>
                        <td class="style21">
                            <asp:Label ID="lblCountLogged" runat="server" Style="font-size: 13px; font-weight: 700"
                                Text="0"></asp:Label>
                        </td>
                        <td class="style22">
                            افراد مهمان:
                        </td>
                        <td class="style23">
                            <asp:Label ID="lblCountGuest" runat="server" Style="font-size: 13px; font-weight: 700"
                                Text="0"></asp:Label>
                        </td>
                        <td class="style24">
                            =
                        </td>
                        <td>
                            <asp:Label ID="lblOnline" runat="server" Style="font-weight: 700; color: #FF0000"
                                Text="0"></asp:Label>
                        </td>
                    </tr>
                </table>
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
                (1)
                <br />
                لاگین های امروز مورخ :&nbsp;
                <asp:Label ID="lblToday" runat="server" Style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                تعداد لاگین های امروز :&nbsp;
                <asp:Label ID="lblCOuntToday" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                لیست لاگین های امروز:
                <asp:CheckBox ID="chkShowLoginToday" runat="server" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Today" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Today" ForeColor="#333333" GridLines="None" AllowPaging="True"
                    PageSize="20" Visible="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email">
                            <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP">
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateStart" HeaderText="تاریخ ورود" SortExpression="dateStart" />
                        <asp:BoundField DataField="timeStart" HeaderText="زمان ورود" SortExpression="timeStart" />
                        <asp:BoundField DataField="dateEnd" HeaderText="تاریخ خروج" SortExpression="dateEnd" />
                        <asp:BoundField DataField="timeEnd" HeaderText="زمان خروج" SortExpression="timeEnd" />
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="ShowUser" CommandArgument='<%# Eval("Email","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="مشاهده کاربر" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteStatistical" OnClientClick="return confirm('آیا از حذف این لاگین مطمئن هستید؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        کاربر لاگین کرده ای وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Today" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="Select_ByDateToday" TypeName="DS_CMS_StatisticalTableAdapters.Profile_EnterStatisticalTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="dateStart" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="dateStart" Type="String" />
                        <asp:Parameter Name="timeStart" Type="String" />
                        <asp:Parameter Name="dateEnd" Type="String" />
                        <asp:Parameter Name="timeEnd" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                (2)
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;جستجوی افراد لاگین کرده (کل) براساس :
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            ایمیل:
                        </td>
                        <td class="style14">
                            <asp:TextBox ID="txtEmail" runat="server" Width="132px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            تاریخ ورود:
                        </td>
                        <td class="style16">
                            <asp:TextBox ID="txtDate" runat="server" Width="132px"></asp:TextBox>
                        </td>
                        <td class="style17">
                            IP :
                        </td>
                        <td>
                            <asp:TextBox ID="txtIP" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="بگرد" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                موارد یافت شده:
                <asp:Label ID="lblCountSearch" runat="server" Style="color: #FF0000; font-weight: 700">0</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:GridView ID="DG_Today_Search" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email">
                            <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP">
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateStart" HeaderText="تاریخ ورود" SortExpression="dateStart" />
                        <asp:BoundField DataField="timeStart" HeaderText="زمان ورود" SortExpression="timeStart" />
                        <asp:BoundField DataField="dateEnd" HeaderText="تاریخ خروج" SortExpression="dateEnd" />
                        <asp:BoundField DataField="timeEnd" HeaderText="زمان خروج" SortExpression="timeEnd" />
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" OnCommand="ShowUser" CommandArgument='<%# Eval("Email","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="مشاهده کاربر" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" OnCommand="DeleteStatistical" OnClientClick="return confirm('آیا از حذف این لاگین مطمئن هستید؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                (3)
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;آمار جزئی تر از بخش های مختلف سایت:
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <b>&nbsp;امروز </b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp; تفکیکی :
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Today_tafkik"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" GridLines="Horizontal" ShowHeader="False">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField HeaderText="part" SortExpression="part">
                            <ItemTemplate>
                                <asp:Label ID="TextBox1" runat="server" Text='<%# GetPartName(DataBinder.Eval(Container.DataItem,"part")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Today_tafkik" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_TafkikTodayTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="_date" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:RadioButtonList ID="Rb_PartToday" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">بازدید کل از صفحات سایت</asp:ListItem>
                    <asp:ListItem Value="1">بازدید های صفحه نخست</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_TodayPart" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_TodayStatistical"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_TodayStatistical" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_TodayByPartTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:ControlParameter ControlID="Rb_PartToday" Name="part" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="Part" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                موارد یافت شده:
                <asp:Label ID="lblTodayPart" runat="server" Style="color: #FF0000; font-weight: 700"
                    Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <b>کل</b>
            </td>
        </tr>
        <tr>
            <td>
                تفکیکی:
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_tafkik"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" GridLines="Horizontal" ShowHeader="False">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField HeaderText="part" SortExpression="part">
                            <ItemTemplate>
                                <asp:Label ID="TextBox2" runat="server" Text='<%# GetPartName(DataBinder.Eval(Container.DataItem,"part")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_tafkik" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_TafkikTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="Rb_Part" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">بازدید کل از صفحات سایت</asp:ListItem>
                    <asp:ListItem Value="1">بازدید های صفحه نخست</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Part" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Statistical"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Statistical" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_PartTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Rb_Part" Name="part" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="Part" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                موارد یافت شده:<asp:Label ID="lblPart" runat="server" Style="font-weight: 700; color: #FF0000"
                    Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <b>جستجو</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style18">
                            تاریخ:
                        </td>
                        <td class="style19">
                            <asp:TextBox ID="txtDateTafkik" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnSearchTafkik" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="بگرد" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Search_tafkik" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Search_tafkik"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" GridLines="Horizontal" ShowHeader="False">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField HeaderText="part" SortExpression="part">
                            <ItemTemplate>
                                <asp:Label ID="TextBox3" runat="server" Text='<%# GetPartName(DataBinder.Eval(Container.DataItem,"part")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_Search_tafkik" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_TafkikTodayTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtDateTafkik" Name="_date" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="Rb_Tafkik" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">بازدید کل از صفحات سایت</asp:ListItem>
                    <asp:ListItem Value="1">بازدید های صفحه نخست</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Search" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_SearchStatistical"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_SearchStatistical" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_StatisticalTableAdapters.CMS_Statistical_TodayByPartTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtDateTafkik" Name="_date" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="Rb_Tafkik" Name="part" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="Part" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style33">
                        </td>
                        <td class="style34">
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img alt="" src="../Content/Images/btn2.gif" style="width: 28px; height: 24px" />
                        </td>
                        <td>
                            <b>گزارش تعداد پست ها ، عکس ها ، لینک ها&nbsp; ، مطالب گذاشته شده و ... </b>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                (0)&nbsp; کل پست های گذاشته شده در شهر دات کام:
                <asp:Label ID="lblCountPost" runat="server" Style="font-weight: 700; color: #FF0000"
                    Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                (1)&nbsp; کل تعداد پست های&nbsp; گذاشته شده&nbsp; امروز:
                <asp:Label ID="lblCountPostToday" runat="server" Style="font-weight: 700; color: #FF0000"
                    Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                (3) با انتخاب:
            </td>
        </tr>
        <tr>
            <td>
                تاریخ:
                <asp:TextBox ID="txtDatePost" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RBL_TypePost" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">عکس ها</asp:ListItem>
                    <asp:ListItem Value="1">لینک ها</asp:ListItem>
                    <asp:ListItem Value="2">مطالب
                    </asp:ListItem>
                    <asp:ListItem Value="3">نظر سنجی ها</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                موارد یافت شده:
                <asp:Label ID="lblCountPostBy" runat="server" Style="font-weight: 700; color: #FF0000"
                    Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style32">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style17">
                            <img alt="" src="../Content/Images/btn3.gif" style="width: 28px; height: 24px" />
                        </td>
                        <td>
                            <b>گزارش حجم سرور </b>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style26">
                            <asp:Chart ID="Charting" runat="server" BorderlineColor="" Height="163px" Palette="None"
                                Width="159px" ImageType="Jpeg">
                                <Series>
                                    <asp:Series BorderColor="DarkSlateGray" ChartType="Doughnut" MarkerBorderColor="Transparent"
                                        MarkerColor="Transparent" MarkerImageTransparentColor="Transparent" Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" BackHatchStyle="Percent90"
                                        BackImageTransparentColor="DarkGray">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_Free" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_Full" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
