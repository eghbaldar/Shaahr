<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false"
    CodeFile="Shaahrs.aspx.vb" Inherits="Management_Admin_Shaahr_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            color: #FF0000;
        }
        .style14
        {
            height: 31px;
            font-size: 20px;
        }
        .style15
        {
            color: #FFFFFF;
            font-size: 20px;
            background-color: #339933;
        }
        .style16
        {
            height: 35px;
        }
        .CMB
        {
            padding: 5px;
            font-size: 13px;
        }
        .style18
        {
            height: 30px;
        }
        .style21
        {
            height: 26px;
        }
        .style22
        {
            color: #FFFFFF;
            font-size: 20px;
            background-color: #666666;
        }
        .style23
        {
            width: 100px;
        }
        .style24
        {
            width: 170px;
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
                <table class="style1">
                    <tr>
                        <td class="style24">
                            تعداد شهر های فعال:
                        </td>
                        <td>
                            <asp:Label ID="lblShaahrEnable" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            تعداد شهرهای غیرفعال:</td>
                        <td>
                            <asp:Label ID="lblShaahrDisable" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            تعداد درخواست های بررسی نشده:
                        </td>
                        <td>
                            <asp:Label ID="lblShaahrNotConideration" runat="server" 
                                style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            تعداد شهرهای تعلیق:
                        </td>
                        <td>
                            <asp:Label ID="lblShaahrSuspension" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            تعداد شهروندان شهرها:
                        </td>
                        <td>
                            <asp:Label ID="lblShaahrCitizen" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
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
            <td class="style18">
                <span class="style15">شهر ها</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="cmbShaahrs" runat="server" AutoPostBack="True" Style="font-family: Tahoma;
                    font-size: 15px">
                    <asp:ListItem Value="1">شهر های فعال</asp:ListItem>
                    <asp:ListItem Value="2">شهرهای غیرفعال</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                تعداد رکورد ها:<asp:TextBox ID="txtRecords" runat="server" Width="83px">10</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Shaahrs" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Shaahrs" AllowPaging="True" BackColor="White" BorderColor="#3366CC"
                    BorderStyle="None" BorderWidth="1px">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="استان" SortExpression="CodeState">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#009933" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="زیر گروه" SortExpression="CodeCategory">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Underline="True" ForeColor="#990033" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" >
                            <ItemStyle BackColor="#FFFF66" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CuaseFundation" HeaderText="علت تاسیس" SortExpression="CuaseFundation" />
                        <asp:TemplateField HeaderText="شهردار" SortExpression="Funder">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
                            SortExpression="EnablePresedentNazmie" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کدپیگیری جیرینگ" SortExpression="CodePeygiriJiring" />
                        <asp:TemplateField HeaderText="بررسی نکرده ها؟!!">
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button11" runat="server" OnCommand="Req_EnableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو تایید می شود" />
                                            <asp:Button ID="Button12" runat="server" OnCommand="Req_DisableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو رد می شود" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" OnCommand="GotoDetailShaahrs" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" ImageUrl="~/Content/images/Home/EnterPanel.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Shaahrs" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.ShaahrsTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="EnableGovernor" SessionField="Governor" Type="String" />
                        <asp:SessionParameter Name="EnablePresedentNazmie" SessionField="Pre" Type="String" />
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
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td class="style13">
                *** شهر فعال: شهری است که هم تایید از شهرداری دارد و هم تایید از نظمیه سختمان ریاست
                جمهوری
            </td>
        </tr>
        <tr>
            <td class="style13">
                *** شهر غیر فعال: دو نوع است: 1:شهرهایی که بررسی نشده اند 2:شهرهایی که عدم تایید
                گرفته اند
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style14">
                <span class="style15">درخواست های بررسی نشده</span>
            </td>
        </tr>
        <tr>
            <td>
                <b>درخواست های تاسیس شهر بررسی نشده <span class="style13">(نظمیه ریاست جمهوری و شهرداری)</span></b>
            </td>
        </tr>
        <tr>
            <td>
            
            
            
            
            
            
            
            
            
            
            
            
            
                <asp:GridView ID="DG_ReqWaiting" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Wainting_2" ForeColor="#333333" GridLines="Horizontal" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="استان" SortExpression="CodeState">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#009933" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="زیر گروه" SortExpression="CodeCategory">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Underline="True" ForeColor="#990033" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                        <asp:BoundField DataField="CuaseFundation" HeaderText="علت تاسیس" SortExpression="CuaseFundation" />
                        <asp:TemplateField HeaderText="شهردار" SortExpression="Funder">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
                            SortExpression="EnablePresedentNazmie" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کدپیگیری جیرینگ" SortExpression="CodePeygiriJiring" />
                        <asp:TemplateField HeaderText="بررسی نکرده ها؟!!">
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="P_Presedent" Visible='<%# iif(Eval("EnablePresedentNazmie","{0}")=2,True,False) %>'
                                                runat="server">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style17">
                                                            <span class="style19">نظمیه ریاست جمهوری: </span>
                                                        </td>
                                                        <td>
                                                            <table class="style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="Button3" runat="server" OnCommand="Req_Presedent_YES" CommandArgument='<%# Eval("id","{0}") %>'
                                                                            Style="font-family: Tahoma" Text="تایید" />
                                                                        <asp:Button ID="Button4" OnCommand="Req_Presedent_NO" CommandArgument='<%# Eval("id","{0}") %>'
                                                                            runat="server" Style="font-family: Tahoma" Text="رد" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="P_Governor" Visible='<%# iif(Eval("EnableGovernor","{0}")=2,True,False) %>'
                                                runat="server">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style18">
                                                            <span class="style20">شهرداری: </span>
                                                        </td>
                                                        <td>
                                                            <table class="style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="Button5" runat="server" OnCommand="Req_Governor_YES" CommandArgument='<%# Eval("id","{0}") %>'
                                                                            Style="font-family: Tahoma" Text="تایید" />
                                                                        <asp:Button ID="Button6" runat="server" OnCommand="Req_Governor_NO" CommandArgument='<%# Eval("id","{0}") %>'
                                                                            Style="font-family: Tahoma" Text="رد" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:Button ID="Button1" runat="server" OnCommand="Req_EnableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو تایید می شود" />
                                            <asp:Button ID="Button2" runat="server" OnCommand="Req_DisableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو رد می شود" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/EnterPanel.gif" OnCommand="GotoDetailShaahrs" />
                                <asp:ImageButton ID="ImageButton3" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                    OnCommand="DeleteReq" CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <asp:ObjectDataSource ID="ODS_Wainting_2" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.RequestShaahr_WaitingTableAdapter">
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
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                *** شما میتوانید از ستون &quot; بررسی نکرده ها؟!! &quot; مجوز لازم را به درخواست
                کاربر بدهید.
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            <div style="background-color:#DDA290;">
                <table class="style1">
                    <tr>
                        <td>
                            <b>ارسال پیام تبریک به شهردار بابت تاسیس شهر</b></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style23">
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style23">
                                                                پست الکترونیکی شهردار:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtEmailMayor" runat="server"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                    ControlToValidate="txtEmailMayor" ErrorMessage="*" ValidationGroup="9"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style23">
                                                                پیام:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMsgInugrationMayor" runat="server" Height="39px" 
                                                                    style="font-family: Tahoma; font-size: 11px" TextMode="MultiLine" Width="600px">تبریک 
                                                                میگم، شما شهردار شدید. از این به بعد مسئولیت سنگینی در قبال شهروندانتان و همچنین 
                                                                ما دارید.</asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                    ControlToValidate="txtMsgInugrationMayor" ErrorMessage="*" ValidationGroup="9"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style23">
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Button ID="SendMSGforInugurate" runat="server" 
                                                                    style="font-family: Tahoma; font-size: 11px" Text="ارسال" ValidationGroup="9" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style21">
                <span class="style22">شهرهای تعلیق شده</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Shaahrs1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Suspension" ForeColor="#333333" GridLines="Horizontal"
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="استان" SortExpression="CodeState">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" 
                                    Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#009933" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="زیر گروه" SortExpression="CodeCategory">
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" 
                                    Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Underline="True" ForeColor="#990033" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                        <asp:BoundField DataField="CuaseFundation" HeaderText="علت تاسیس" SortExpression="CuaseFundation" />
                        <asp:TemplateField HeaderText="شهردار" SortExpression="Funder">
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" 
                                    Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
                            SortExpression="EnablePresedentNazmie" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کدپیگیری جیرینگ" SortExpression="CodePeygiriJiring" />
                        <asp:TemplateField HeaderText="بررسی نکرده ها؟!!">
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button15" runat="server" OnCommand="Req_EnableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو تایید می شود" />
                                            <asp:Button ID="Button16" runat="server" OnCommand="Req_DisableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو رد می شود" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" OnCommand="GotoDetailShaahrs" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" ImageUrl="~/Content/images/Home/EnterPanel.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Suspension" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_SuspentionTableAdapter" 
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
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                <span class="style15">آمار ها</span>
            </td>
        </tr>
        <tr>
            <td>
                <b>تفکیک وجود شهر بر اساس زیر گروه ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="cmbCategory" runat="server" AutoPostBack="True" CssClass="CMB"
                    DataSourceID="ODS_CategoryFavorits" DataTextField="title" DataValueField="code"
                    Style="font-family: Tahoma; font-size: 11px" Width="200px">
                    <asp:ListItem Value="1">استان اول</asp:ListItem>
                    <asp:ListItem Value="2">استان دوم</asp:ListItem>
                    <asp:ListItem Value="3">استان سوم</asp:ListItem>
                    <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                    <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmbFavorits" runat="server" CssClass="CMB" DataSourceID="ODS_Favorits"
                    DataTextField="title" DataValueField="code" Style="font-family: Tahoma; font-size: 11px"
                    Width="200px" AutoPostBack="True">
                    <asp:ListItem Value="1">استان اول</asp:ListItem>
                    <asp:ListItem Value="2">استان دوم</asp:ListItem>
                    <asp:ListItem Value="3">استان سوم</asp:ListItem>
                    <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                    <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_CategoryFavorits" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="DS_ShaahrTableAdapters.CMS_Favorits_CategoryTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="White" BorderWidth="2px" CellPadding="3" DataKeyNames="code" DataSourceID="ODS_Favortis"
                    GridLines="None" BorderStyle="Ridge" CellSpacing="1">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="code_category" HeaderText="code_category" SortExpression="code_category"
                            Visible="False" />
                        <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title">
                            <HeaderStyle Width="500px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Logo" HeaderText="Logo" SortExpression="Logo" Visible="False" />
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" Visible="False" />
                        <asp:TemplateField HeaderText="تعداد شهرهای زیر مجوعه">
                            <ItemTemplate>
                                <asp:Label ID="Label10" Text='<%# GetCountFavortis(DataBinder.Eval(Container.DataItem,"code")) %>'
                                    runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#9471DE" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Favortis" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.CMS_FavoritsTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="code_category" Type="Int64" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbCategory" Name="code_category" PropertyName="SelectedValue"
                            Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="code_category" Type="Int64" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ODS_Favorits" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.CMS_FavoritsTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="code_category" Type="Int64" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbCategory" Name="code_category" PropertyName="SelectedValue"
                            Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="code_category" Type="Int64" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Shaahrs0" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_ShaahrFavortis" ForeColor="#333333" GridLines="Horizontal"
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="استان" SortExpression="CodeState">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#009933" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="زیر گروه" SortExpression="CodeCategory">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Underline="True" ForeColor="#990033" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                        <asp:BoundField DataField="CuaseFundation" HeaderText="علت تاسیس" SortExpression="CuaseFundation" />
                        <asp:TemplateField HeaderText="شهردار" SortExpression="Funder">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
                            SortExpression="EnablePresedentNazmie" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کدپیگیری جیرینگ" SortExpression="CodePeygiriJiring" />
                        <asp:TemplateField HeaderText="بررسی نکرده ها؟!!">
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button13" runat="server" OnCommand="Req_EnableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو تایید می شود" />
                                            <asp:Button ID="Button14" runat="server" OnCommand="Req_DisableBoth" CommandArgument='<%# Eval("id","{0}") %>'
                                                OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma; font-size: 11px"
                                                Text="هردو رد می شود" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" OnCommand="GotoDetailShaahrs" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" ImageUrl="~/Content/images/Home/EnterPanel.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_ShaahrFavortis" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.ShaahrsWithFavortisTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbFavorits" Name="codecategory" PropertyName="SelectedValue"
                            Type="Int64" />
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
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
