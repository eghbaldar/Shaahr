<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Users-Jiring.aspx.vb" Inherits="Management_Admin_Users_Jiring" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style5
        {
            width: 141px;
        }
        .style4
        {
            color: #006600;
        }
        .style6
        {
            width: 55px;
        }
        .style3
        {
            color: #FF0000;
        }
        .style3
        {
            width: 97px;
        }
        .style13
        {
            width: 100%;
            border: 1px dotted #ccc;
        }
        .style14
        {
            width: 785px;
        }
        .style15
        {
            width: 141px;
            font-weight: bold;
        }
        .style16
        {
            width: 100%;
        }
        .style17
        {
            width: 92px;
        }
        .style18
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style19
        {
            font-size: 20px;
        }
        .style20
        {
            color: #FF0000;
            font-weight: bold;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <h1>
                    <blink>
                <asp:Label ID="lblFnLn" runat="server" ></asp:Label>
                </blink>
                </h1>
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
                <b style="color: #FF0000"><span class="style19">افزایش و یا کاهش دستی جیرینگ برای این
                    کاربر</span></b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="style16">
                    <tr>
                        <td class="style17">
                            مقدار جیرینگ:
                        </td>
                        <td>
                            <asp:TextBox ID="txtExtraJiring" runat="server" Width="88px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtExtraJiring"
                                ErrorMessage="*" ValidationGroup="5"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RadioButtonList ID="rbType" runat="server">
                                <asp:ListItem Value="1">افزایش</asp:ListItem>
                                <asp:ListItem Value="0">کاهش</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:Button ID="btnExtraJiring" OnClientClick="return confirm('مطمئن؟');" runat="server"
                                Style="font-size: 11px; font-family: Tahoma" Text="ثبت" ValidationGroup="5" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style5">
                        </td>
                    </tr>
                    <tr>
                        <td class="style20">
                            آمار جیرینگ , سرویس ها
                        </td>
                    </tr>
                    <tr>
                        <td class="style18">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style5">
                                        کل:<asp:Label ID="lblJiring" runat="server" Style="font-size: 20px"></asp:Label>
                                    </td>
                                    <td class="style6">
                                        جیرینگ
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                    <td class="style6">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        کل جیرینگ <span class="style4">افزایش</span> داده شده:
                                    </td>
                                    <td class="style6">
                                        <asp:Label ID="lblSumIncrease" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                                            height: 9px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        کل جیرینگ <span class="style3">کاهش</span> یافته شده:
                                    </td>
                                    <td class="style6">
                                        <asp:Label ID="lblSumDecrease" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                                            height: 9px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                    <td class="style6">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style15">
                                        فاکتور های کاربر:
                                    </td>
                                    <td class="style6">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataList ID="Dl" runat="server" DataSourceID="ODS" Width="905px">
                                <ItemTemplate>
                                    <table class="style13">
                                        <tr>
                                            <td class="style14">
                                                <table class="style13">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="SubjectLabel" runat="server" Style="color: #003399; font-size: 15px;"
                                                                Text='<%# Eval("Subject") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Style="color: #666666; font-style: italic"
                                                                Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# IIF(Eval("type")=0,"~\content\images\stage\jiring\decrease.jpg","~\content\images\stage\jiring\increase.jpg") %>' />
                                                <asp:Label ID="jiringLabel" runat="server" Text='<%# Eval("jiring") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_StageTableAdapters.Factor_Jiring_UsersTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnClear" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                ImageUrl="~/content/images/Stage/Jiring/ClearList.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>انتقال های جیرینگ این کاربر به&nbsp; کاربران دیگر</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_From" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_Transfer_From" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="از" SortExpression="From">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Style="font-weight: bold;" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"from")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="به" SortExpression="To">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Style="font-weight: bold;" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"to")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Jiring" HeaderText="مقدار جیرینگ" SortExpression="Jiring" />
                                    <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                                    <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                                    <asp:BoundField DataField="Percent_Jiring" HeaderText="درصد کم شده" SortExpression="Percent_Jiring" />
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    انتقالی ندارد
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:Button ID="btnDeleteTransferFrom" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                Text="پاکسازی انتقال های فوق" />
                            <asp:ObjectDataSource ID="ODS_Transfer_From" runat="server" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Profile_Jiring_Transfer_FromTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="from" QueryStringField="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="From" Type="String" />
                                    <asp:Parameter Name="_To" Type="String" />
                                    <asp:Parameter Name="Jiring" Type="String" />
                                    <asp:Parameter Name="_date" Type="String" />
                                    <asp:Parameter Name="time" Type="String" />
                                    <asp:Parameter Name="Percent_Jiring" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>انتقال جیرینگ دیگران به این کاربر</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_To" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_Transfer_To" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="از" SortExpression="From">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Style="font-weight: bold;" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"from")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="به" SortExpression="To">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Style="font-weight: bold;" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"to")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Jiring" HeaderText="مقدار جیرینگ" SortExpression="Jiring" />
                                    <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                                    <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                                    <asp:BoundField DataField="Percent_Jiring" HeaderText="درصد کم شده" SortExpression="Percent_Jiring" />
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    انتقالی ندارد
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:Button ID="btnDeleteTransferTo" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                Text="پاکسازی انتقال های فوق" />
                            <asp:ObjectDataSource ID="ODS_Transfer_To" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Profile_Jiring_Transfer_ToTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="_to" QueryStringField="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="From" Type="String" />
                                    <asp:Parameter Name="_To" Type="String" />
                                    <asp:Parameter Name="Jiring" Type="String" />
                                    <asp:Parameter Name="_date" Type="String" />
                                    <asp:Parameter Name="time" Type="String" />
                                    <asp:Parameter Name="Percent_Jiring" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>سرویس های کاربر</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_UserService" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ODS_UserService">
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                        SortExpression="id" Visible="False" />
                                    <asp:BoundField DataField="subject" HeaderText="نوع سرویس" SortExpression="subject" />
                                    <asp:BoundField DataField="start_date" HeaderText="تاریخ شروع سرویس" SortExpression="start_date" />
                                    <asp:BoundField DataField="end_date" HeaderText="تاریخ اتمام سرویس" SortExpression="end_date" />
                                    <asp:BoundField DataField="jiring" HeaderText="جیرینگ داده شده" SortExpression="jiring" />
                                    <asp:BoundField DataField="وضعیت" HeaderText="وضعیت" ReadOnly="True" SortExpression="وضعیت" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" OnCommand="EnableServiceUser" OnClientClick="return confirm('مطمئن؟');"
                                                CommandArgument='<%# Eval("id","{0}")+"|"+Eval("codeservice","{0}") %>' Style="font-size: 11px;
                                                font-family: Tahoma" Text="فعال" />
                                            <asp:Button ID="Button2" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                CommandArgument='<%# Eval("id","{0}")+"|"+Eval("codeservice","{0}") %>' OnCommand="DisibleServiceUser"
                                                OnClientClick="return confirm('مطمئن؟');" Text="غیر فعال" />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnCommand="DeleteServiceUser" OnClientClick="return confirm('مطمئن؟');" ImageUrl="~/Content/images/Home/Delete.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    سرویسی وجود ندارد.
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_UserService" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Profile_Jiring_ServiceTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ا<b>فزایش های جیرینگ توسط کاربر</b> (سه روش:&nbsp; پرداخت آنلاین بانکی (درگاه)&nbsp;
                            -&nbsp; پرداخت آنلاین بانکی (کارت به کارت)&nbsp; -&nbsp; پرداخت بصورت غیر مستقیم
                            (فیش بانکی)&nbsp; )
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                            بهد از اضافه شده باید جدول شخصیت سوم نیز آپدیت شود</td>
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
