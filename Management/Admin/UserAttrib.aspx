<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="UserAttrib.aspx.vb" Inherits="Management_Admin_UserAttrib" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style11
        {
            width: 115px;
        }
        .stPersianField
        {
            border: 1px solid #ccc;
            font-family: Tahoma;
            font-size: 11px;
        }
        .stEnglishField
        {
            border: 1px solid #ccc;
            font-family: Tahoma;
            font-size: 11px;
            text-align: left;
        }
        .selectbox
        {
            padding-right: 4px;
            font-family: Tahoma;
            font-size: 11px;
            width: 195px; /* Resize Width */
            height: 20px;
            text-align: right;
            background: url(  '../../content/js/Dropdownlist/images/bg_select.png' ) right 50%;
            cursor: pointer;
            border: 1px solid #D1E4F6;
            color: #333;
            border: 1px solid #d0d0d0;
            -moz-border-radius: 5px;
        }
        .style20
        {
            width: 102px;
        }
        .style21
        {
            width: 136px;
        }
        .style13
        {
            width: 100px;
        }
        .style14
        {
            width: 177px;
        }
        .style15
        {
            width: 365px;
        }
        .style16
        {
            text-align: left;
            font-weight: bold;
        }
        .style17
        {
            width: 103px;
        }
        .style18
        {
            color: #666666;
            font-size: 10px;
        }
        .style22
        {
            width: 114px;
        }
        .style23
        {
            width: 64px;
        }
        .style24
        {
            width: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <b>مشخصات اصلی</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style22">
                            نام کاربری:
                        </td>
                        <td>
                            <asp:TextBox ID="Username_org" runat="server" Style="text-align: left" Width="192px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="تایید" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            پست الکترونیکی اصلی:
                        </td>
                        <td>
                            <asp:Label ID="lblEmail_org" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            تاریخ عضویت:
                        </td>
                        <td>
                            <asp:Label ID="lblRegDate_org" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            مدت&nbsp; عضویت:
                        </td>
                        <td>
                            <asp:Label ID="lblDateReg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            کلمه عبور:
                        </td>
                        <td>
                            <asp:Label ID="lblPassword" runat="server" Style="font-weight: 700; font-size: 12px;
                                color: #006600"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            کلمه عبور جدید:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Width="188px"></asp:TextBox>
                            <asp:Button ID="Button3" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="تایید" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            اطلاعات لاگین این کاربر:
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            &nbsp;
                        </td>
                        <td>
                            <table class="style1" style="border-style: dashed">
                                <tr>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style23">
                                                    &nbsp;تاریخ ورود:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDateStart" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style23">
                                                    &nbsp; تاریخ خروج:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDateEnd" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style23">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnEnter" runat="server" Text="بگرد" Style="font-family: Tahoma;
                                                        font-size: 11px; margin-right: 0px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style23">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button4" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                        Text="حذف تمامی اطلاعات ورودی این کاربر" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UP_enter" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="DG_Enter" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    CellPadding="4" DataSourceID="ODS_Entering" ForeColor="#333333" GridLines="None">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                            SortExpression="ID" Visible="False" />
                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
                                                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                                                        <asp:BoundField DataField="dateStart" HeaderText="تاریخ ورود" SortExpression="dateStart" />
                                                        <asp:BoundField DataField="timeStart" HeaderText="زمان ورود" SortExpression="timeStart" />
                                                        <asp:BoundField DataField="dateEnd" HeaderText="تاریخ خروج" SortExpression="dateEnd" />
                                                        <asp:BoundField DataField="timeEnd" HeaderText="زمان خروج" SortExpression="timeEnd" />
                                                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                                                    </Columns>
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpUni">
                                            <ProgressTemplate>
                                                در حال بارگزاری ...
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:ObjectDataSource ID="ODS_Entering" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Profile_EnterStatisticalTableAdapter">
                                            <SelectParameters>
                                                <asp:QueryStringParameter DefaultValue="" Name="email" QueryStringField="email" Type="String" />
                                                <asp:Parameter DefaultValue=" " Name="datestart" Type="String" />
                                                <asp:Parameter DefaultValue=" " Name="dateend" Type="String" />
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
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            درجه شهروندی:
                        </td>
                        <td>
                            <table class="style1" style="border: thick dotted #FF6600;">
                                <tr>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style23">
                                                    درجه فعلی:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCurrentStart" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style23">
                                                    درجه جدید:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtNewStar" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style23">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnUpdateStar" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                        Text="ثبت" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="text-align: center; width: 207px; padding: 3px;">
                                            <div>
                                                <asp:Image ID="imgStar" runat="server" />
                                            </div>
                                            <div style="padding-top: 5px; padding-bottom: 2px; color: #2b6587;">
                                                <asp:Label ID="lblDegree" runat="server" Style="font-family: Tahoma; font-size: 11px;"></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
                            تعداد دوستان:
                        </td>
                        <td>
                            &nbsp;
                            <table class="style1">
                                <tr>
                                    <td class="style24">
                                        تعداد دوستان:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCountFriend" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        تعداد بستگان:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCountBastegan" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        همسر:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWife" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="Button6" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                            Text="صفحه ارتباطات" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style22">
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
                <b>آواتار ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="M_ShowAvatars" runat="server" ActiveViewIndex="0">
                    <asp:View ID="V_ShowAvatar" runat="server">
                        <asp:DataList ID="DL_Avatars" runat="server" DataSourceID="ODS_Avatars" Width="16px"
                            RepeatDirection="Horizontal" RepeatColumns="9">
                            <ItemTemplate>
                                <table class="style7">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton5" OnCommand="DeleteAvatar" CommandArgument='<%# Eval("ID","{0}") %>'
                                                runat="server" ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Panel1" BorderStyle="Solid" BorderColor='<%# BorderColorPanel(DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                BorderWidth="1" runat="server" Style="padding: 5px;">
                                                <asp:ImageButton ID="ImageButton2" runat="server" Height="80px" Width="80px" OnCommand="UpdateFlag"
                                                    CommandArgument='<%# Eval("ID","{0}") %>' ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("PicPath", "{0}")+ "&W=100&H=100" %>'
                                                    AlternateText="تصویر غیر قابل دسترسی" />
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_Avatars" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Profile_AvatarsTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="PicPath" Type="String" />
                                <asp:Parameter Name="Flag" Type="Boolean" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </asp:View>
                    <asp:View ID="V_Delete" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 162px;">
                                    آیا با حذف تصویر موافق هستید؟
                                </td>
                                <td style="width: 37px;">
                                    <asp:ImageButton ID="btnAcceptToDelete" runat="server" ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="btnCancelToDelete" runat="server" ImageUrl="~/content/images/Home/CancelIt.jpg" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                <b>اطلاعات فردی</b>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td class="style11">
                            نام:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtNameFN" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameFN"
                                ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <span style="color: Gray">فقط از حروف فارسی استفاده شود.</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            نام خانوادگی:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtFamilyFN" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFamilyFN"
                                ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <span style="color: Gray">فقط از حروف فارسی استفاده شود.</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            نام انگلیسی:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtNameEN" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNameEN"
                                ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <span style="color: Gray">فقط از حروف انگلیسی استفاده شود.</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            نام خانوادگی انگلیسی:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtFamilyEn" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFamilyEn"
                                ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <span style="color: Gray">فقط از حروف انگلیسی استفاده شود.</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            نام مستعار:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtAlias" runat="server" Style="border: 1px solid #ccc; font-family: Tahoma;
                                font-size: 11px" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            جنسیت:
                        </td>
                        <td class="style12">
                            <asp:DropDownList runat="server" Width="198px" ID="cmbSex" class="selectbox">
                                <asp:ListItem Value="0">مرد</asp:ListItem>
                                <asp:ListItem Value="1">زن</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            وضعیت تاهل:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbMarrid" runat="server" Width="198px" name="Items" class="selectbox">
                                <asp:ListItem Value="0">مجرد</asp:ListItem>
                                <asp:ListItem Value="1">متاهل</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            تاریخ تولد:
                        </td>
                        <td class="style12">
                            <div>
                                <div style="float: right;">
                                    <asp:DropDownList ID="cmbDay" runat="server" Style="font-size: 11px; font-family: Tahoma">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5&gt;</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div style="float: right; margin-right: 16px;">
                                    <asp:DropDownList ID="cmbMonth" runat="server" Style="font-size: 11px; font-family: Tahoma">
                                        <asp:ListItem Value="1">فروردین</asp:ListItem>
                                        <asp:ListItem Value="2">اردیبهشت</asp:ListItem>
                                        <asp:ListItem Value="3">خرداد</asp:ListItem>
                                        <asp:ListItem Value="4">تیر</asp:ListItem>
                                        <asp:ListItem Value="5">مرداد</asp:ListItem>
                                        <asp:ListItem Value="6">شهریور</asp:ListItem>
                                        <asp:ListItem Value="7">مهر</asp:ListItem>
                                        <asp:ListItem Value="8">آبان</asp:ListItem>
                                        <asp:ListItem Value="9">آذر</asp:ListItem>
                                        <asp:ListItem Value="10">دی</asp:ListItem>
                                        <asp:ListItem Value="11">بهمن</asp:ListItem>
                                        <asp:ListItem Value="12">اسفند</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div style="float: right; margin-right: 16px;">
                                    <asp:DropDownList ID="cmbYears" runat="server" Style="font-size: 11px; font-family: Tahoma">
                                        <asp:ListItem>1390</asp:ListItem>
                                        <asp:ListItem>1389</asp:ListItem>
                                        <asp:ListItem>1388</asp:ListItem>
                                        <asp:ListItem>1387</asp:ListItem>
                                        <asp:ListItem>1386</asp:ListItem>
                                        <asp:ListItem>1385</asp:ListItem>
                                        <asp:ListItem>1384</asp:ListItem>
                                        <asp:ListItem>1383</asp:ListItem>
                                        <asp:ListItem>1382</asp:ListItem>
                                        <asp:ListItem>1381</asp:ListItem>
                                        <asp:ListItem>1380</asp:ListItem>
                                        <asp:ListItem>1379</asp:ListItem>
                                        <asp:ListItem>1378</asp:ListItem>
                                        <asp:ListItem>1377</asp:ListItem>
                                        <asp:ListItem>1376</asp:ListItem>
                                        <asp:ListItem>1375</asp:ListItem>
                                        <asp:ListItem>1374</asp:ListItem>
                                        <asp:ListItem>1373</asp:ListItem>
                                        <asp:ListItem>1372</asp:ListItem>
                                        <asp:ListItem>1371</asp:ListItem>
                                        <asp:ListItem>1370</asp:ListItem>
                                        <asp:ListItem>1369</asp:ListItem>
                                        <asp:ListItem>1368</asp:ListItem>
                                        <asp:ListItem>1367</asp:ListItem>
                                        <asp:ListItem>1366</asp:ListItem>
                                        <asp:ListItem>1365</asp:ListItem>
                                        <asp:ListItem>1364</asp:ListItem>
                                        <asp:ListItem>1363</asp:ListItem>
                                        <asp:ListItem>1362</asp:ListItem>
                                        <asp:ListItem>1361</asp:ListItem>
                                        <asp:ListItem>1360</asp:ListItem>
                                        <asp:ListItem>1359</asp:ListItem>
                                        <asp:ListItem>1358</asp:ListItem>
                                        <asp:ListItem>1357</asp:ListItem>
                                        <asp:ListItem>1356</asp:ListItem>
                                        <asp:ListItem>1355</asp:ListItem>
                                        <asp:ListItem>1354</asp:ListItem>
                                        <asp:ListItem>1353</asp:ListItem>
                                        <asp:ListItem>1352</asp:ListItem>
                                        <asp:ListItem>1351</asp:ListItem>
                                        <asp:ListItem>1350</asp:ListItem>
                                        <asp:ListItem>1349</asp:ListItem>
                                        <asp:ListItem>1348</asp:ListItem>
                                        <asp:ListItem>1347</asp:ListItem>
                                        <asp:ListItem>1346</asp:ListItem>
                                        <asp:ListItem>1345</asp:ListItem>
                                        <asp:ListItem>1344</asp:ListItem>
                                        <asp:ListItem>1343</asp:ListItem>
                                        <asp:ListItem>1342</asp:ListItem>
                                        <asp:ListItem>1341</asp:ListItem>
                                        <asp:ListItem>1340</asp:ListItem>
                                        <asp:ListItem>1339</asp:ListItem>
                                        <asp:ListItem>1338</asp:ListItem>
                                        <asp:ListItem>1337</asp:ListItem>
                                        <asp:ListItem>1336</asp:ListItem>
                                        <asp:ListItem>1335</asp:ListItem>
                                        <asp:ListItem>1334</asp:ListItem>
                                        <asp:ListItem>1333</asp:ListItem>
                                        <asp:ListItem>1332</asp:ListItem>
                                        <asp:ListItem>1331</asp:ListItem>
                                        <asp:ListItem>1330</asp:ListItem>
                                        <asp:ListItem>1329</asp:ListItem>
                                        <asp:ListItem>1328</asp:ListItem>
                                        <asp:ListItem>1327</asp:ListItem>
                                        <asp:ListItem>1326</asp:ListItem>
                                        <asp:ListItem>1325</asp:ListItem>
                                        <asp:ListItem>1324</asp:ListItem>
                                        <asp:ListItem>1323</asp:ListItem>
                                        <asp:ListItem>1322</asp:ListItem>
                                        <asp:ListItem>1321</asp:ListItem>
                                        <asp:ListItem>1320</asp:ListItem>
                                        <asp:ListItem>1319</asp:ListItem>
                                        <asp:ListItem>1318</asp:ListItem>
                                        <asp:ListItem>1317</asp:ListItem>
                                        <asp:ListItem>1316</asp:ListItem>
                                        <asp:ListItem>1315</asp:ListItem>
                                        <asp:ListItem>1314</asp:ListItem>
                                        <asp:ListItem>1313</asp:ListItem>
                                        <asp:ListItem>1312</asp:ListItem>
                                        <asp:ListItem>1311</asp:ListItem>
                                        <asp:ListItem>1310</asp:ListItem>
                                        <asp:ListItem>1309</asp:ListItem>
                                        <asp:ListItem>1308</asp:ListItem>
                                        <asp:ListItem>1307</asp:ListItem>
                                        <asp:ListItem>1306</asp:ListItem>
                                        <asp:ListItem>1305</asp:ListItem>
                                        <asp:ListItem>1304</asp:ListItem>
                                        <asp:ListItem>1303</asp:ListItem>
                                        <asp:ListItem>1302</asp:ListItem>
                                        <asp:ListItem>1301</asp:ListItem>
                                        <asp:ListItem>1300</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            ساعت تولد:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtTimeBirth" runat="server" Style="border: 1px solid #ccc; font-family: Tahoma;
                                font-size: 11px" Width="39px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            دین:
                        </td>
                        <td class="style12">
                            <asp:Label ID="lblDin" runat="server"></asp:Label>
                            <asp:DropDownList ID="cmbDin" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox">
                                <asp:ListItem Value="1">-</asp:ListItem>
                                <asp:ListItem Value="2">اسلام</asp:ListItem>
                                <asp:ListItem Value="3">مسیحی</asp:ListItem>
                                <asp:ListItem Value="4">زرتشتی</asp:ListItem>
                                <asp:ListItem Value="5">یهودی</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            مذهب:
                        </td>
                        <td class="style12">
                            <asp:Label ID="lblMazhab" runat="server"></asp:Label>
                            <asp:DropDownList ID="cmbMazhab" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">شیعی</asp:ListItem>
                                <asp:ListItem Value="2">سنی</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            تحصیلات:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbTahsilat" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox" DataSourceID="ODS_Education" DataTextField="Education" DataValueField="Code_Education">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Education" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_EducationTableAdapter">
                                <InsertParameters>
                                    <asp:Parameter Name="Education" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            کشور:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbCountry" runat="server" Width="200px" class="stPersianField"
                                AutoPostBack="True" DataSourceID="ODS_Country" DataTextField="NameCountry" DataValueField="code">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Country" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_CountryTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="NameCountry" Type="String" />
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="NameCountry" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            استان (ایالت):
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbState" runat="server" Width="200px" class="stPersianField"
                                DataSourceID="ODS_State" DataTextField="NameState" DataValueField="code" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_State" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_StateTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="code_country" Type="Int64" />
                                    <asp:Parameter Name="NameState" Type="String" />
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmbCountry" Name="code_country" PropertyName="SelectedValue"
                                        Type="Int64" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="code_country" Type="Int64" />
                                    <asp:Parameter Name="NameState" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            شهر:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbCity" runat="server" Width="200px" class="stPersianField"
                                DataSourceID="OSD_City" DataTextField="NameCity" DataValueField="code">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="OSD_City" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_CityTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="code_state" Type="Int64" />
                                    <asp:Parameter Name="NameCity" Type="String" />
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmbState" Name="code" PropertyName="SelectedValue"
                                        Type="Int64" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="code_state" Type="Int64" />
                                    <asp:Parameter Name="NameCity" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            خارج از محدوده:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtNoneAddress" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            آدرس:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtAddress" runat="server" class="stPersianField" Width="198px"
                                Height="88px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            زبان خارجی:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbLanguage" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox" AutoPostBack="True">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">انگلیسی</asp:ListItem>
                                <asp:ListItem Value="2">فرانسه</asp:ListItem>
                                <asp:ListItem Value="3">آلمانی</asp:ListItem>
                                <asp:ListItem Value="4">ایتالیایی</asp:ListItem>
                                <asp:ListItem Value="5">عربی</asp:ListItem>
                                <asp:ListItem Value="6">اسپانیایی</asp:ListItem>
                                <asp:ListItem Value="7">پرتقالی</asp:ListItem>
                                <asp:ListItem Value="8">اردو</asp:ListItem>
                                <asp:ListItem Value="9">مالایی</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            سیاست:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbPoletic" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">سیاست بی سیاست</asp:ListItem>
                                <asp:ListItem Value="2">راستی</asp:ListItem>
                                <asp:ListItem Value="3">چپی</asp:ListItem>
                                <asp:ListItem Value="4">نه راست نه چپ</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            دودی:
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="cmbDodi" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                class="selectbox">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">سیگاری</asp:ListItem>
                                <asp:ListItem Value="2">قلیونی</asp:ListItem>
                                <asp:ListItem Value="3">متنفرم.. !!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            وب سایت:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtWebsite" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            وبلاگ:
                        </td>
                        <td class="style12">
                            <asp:TextBox ID="txtWeblog" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            &nbsp;
                        </td>
                        <td class="style12">
                            <asp:ImageButton ID="btnUpdateInfo" runat="server" ImageUrl="~/content/images/Home/Register.jpg" />
                        </td>
                        <td>
                            &nbsp;
                            <asp:Label ID="lblError" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <b>&nbsp;علاقمندی&nbsp; ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="float: right;">
                            <div style="float: right; width: 160px; height: 100%;">
                                <asp:DataList ID="Dl_Favorit" runat="server" DataKeyField="code" DataSourceID="ODS_Favorit_Category">
                                    <ItemTemplate>
                                        <div style="width: 159px; border: 1px solid #ccc; height: 50px;">
                                            <table class="style6">
                                                <tr>
                                                    <td class="style19">
                                                        <asp:ImageButton ID="ImageButton3" OnCommand="setSubSet" CommandArgument='<%# Eval("code","{0}") %>'
                                                            runat="server" Height="45px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\FavoritCategory\{0}") %>'
                                                            Width="45px" />
                                                    </td>
                                                    <td>
                                                        <table class="style6">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# CountFavorits(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            &nbsp;</div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_Favorit_Category" runat="server" DeleteMethod="Delete"
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                    TypeName="DS_SettingTableAdapters.Favorits_CategoryTableAdapter" UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="Logo" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="Logo" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div style="float: right; width: 582px; height: 100%; padding: 3px;">
                                <asp:DataList ID="DL_Favorits" runat="server" DataKeyField="code" DataSourceID="ODS_FavortisCat"
                                    Width="543px">
                                    <ItemTemplate>
                                        <div style="background-color: #fff; padding-right: 3px; padding-bottom: 3px; color: Gray;
                                            width: 577px; border-bottom: 1px solid #c9c9c9;">
                                            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                            <asp:Label ID="lblCodeCategory" runat="server" Text='<%# Eval("code") %>' Visible="False" />
                                        </div>
                                        <div style="padding: 3px;">
                                            <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_Favorits" DataKeyField="code"
                                                Width="270px" RepeatColumns="3" RepeatDirection="Horizontal">
                                                <ItemTemplate>
                                                    <asp:Panel BackColor='<%# BC_Panel(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                        ID="Panel2" runat="server" Style="border: 1px solid #ccc; width: 150px; height: 50px;
                                                        padding: 3px; margin-right: 3px; -moz-border-radius: 5px;">
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 24px;">
                                                                    <asp:ImageButton ID="ImageButton1" OnCommand="InsertOrDeleteFavorit" CommandArgument='<%# Eval("code","{0}") %>'
                                                                        runat="server" Height="47px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\Favorits\{0}") %>'
                                                                        Width="47px" />
                                                                </td>
                                                                <td>
                                                                    <table style="width: 100%;">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# CountFavoritsUsers(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:ObjectDataSource ID="ODS_Favorits" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.FavoritsTableAdapter"
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
                                                    <asp:SessionParameter Name="code_category" SessionField="FavoritCode" Type="Int64" />
                                                </SelectParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="code_category" Type="Int64" />
                                                    <asp:Parameter Name="title" Type="String" />
                                                    <asp:Parameter Name="Logo" Type="String" />
                                                    <asp:Parameter Name="detail" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_FavortisCat" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Favorit_CategoryTableAdapter"
                                    InsertMethod="Insert" UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="Logo" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="code" SessionField="FavoritCode" Type="Int64" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="Logo" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                        <div style="float: right;">
                            <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                <ProgressTemplate>
                                    <img src="../../../content/images/Profile_View_Users/Loading_0.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <b>ارتباطات</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6" __designer:mapid="412">
                    <tr __designer:mapid="4eb">
                        <td __designer:mapid="4ec">
                            <table class="style6" __designer:mapid="4ed">
                                <tr __designer:mapid="4ee">
                                    <td class="style20" __designer:mapid="4ef">
                                        ابتدایی:
                                    </td>
                                    <td class="style21" __designer:mapid="4f0">
                                        <asp:TextBox ID="txtSchool" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td __designer:mapid="4f2">
                                        &nbsp;
                                    </td>
                                    <td __designer:mapid="4f3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="4f4">
                                    <td class="style20" __designer:mapid="4f5">
                                        راهنمایی:
                                    </td>
                                    <td class="style21" __designer:mapid="4f6">
                                        <asp:TextBox ID="txtMiddle_school" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td __designer:mapid="4f8">
                                        &nbsp;
                                    </td>
                                    <td __designer:mapid="4f9">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="4fa">
                                    <td class="style20" __designer:mapid="4fb">
                                        دبیرستان:
                                    </td>
                                    <td class="style21" __designer:mapid="4fc">
                                        <asp:TextBox ID="txtHighShcool" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td __designer:mapid="4fe">
                                        &nbsp;
                                    </td>
                                    <td __designer:mapid="4ff">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="500">
                                    <td class="style20" __designer:mapid="501">
                                        پیش دانشگاهی:
                                    </td>
                                    <td class="style21" __designer:mapid="502">
                                        <asp:TextBox ID="txtPreUniversity" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td __designer:mapid="504">
                                        &nbsp;
                                    </td>
                                    <td __designer:mapid="505">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="506">
                                    <td class="style20" __designer:mapid="507">
                                        دانشگاه:
                                    </td>
                                    <td class="style21" __designer:mapid="508">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lblUniversity" runat="server" Style="color: #333333; font-style: italic;
                                                    font-size: 11px"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td __designer:mapid="50a">
                                        &nbsp;
                                    </td>
                                    <td __designer:mapid="50b">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr __designer:mapid="50c">
                        <td __designer:mapid="50d">
                            <asp:UpdatePanel ID="UpUni" runat="server">
                                <ContentTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="ChkUni" runat="server" AutoPostBack="True" Text="انتخاب جدید دانشگاه" />
                                                <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpUni">
                                                    <ProgressTemplate>
                                                        <img alt="" src="../../Content/images/Profile_View_Users/Loading_0.gif" style="width: 18px;
                                                            height: 17px" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="PnlUni" runat="server" Visible="False">
                                                    <div style="-moz-border-radius: 3px; border: 1px solid #ccc;">
                                                        <table class="style6">
                                                            <tr>
                                                                <td>
                                                                    <div style="-moz-border-radius: 3px; background-color: #D6E1E7; padding: 3px; color: gray;">
                                                                        انتخاب نوع دانشگاه</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:DataList ID="Dl_catUni" runat="server" DataKeyField="Code" DataSourceID="ODS_CatUni"
                                                                        RepeatColumns="8" RepeatDirection="Horizontal">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="ImageButton4" runat="server" Height="40px" OnCommand="University"
                                                                                CommandArgument='<%# Eval("code","{0}") %>' ImageUrl='<%# Eval("Logo", "~\Content\images\Shaahrs\University\UniversityCat\{0}") %>'
                                                                                Width="40px" ToolTip='<%# Eval("Name", "{0}") %>' />
                                                                            &nbsp;<br />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:ObjectDataSource ID="ODS_CatUni" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_Category_UniversityTableAdapter"
                                                                        UpdateMethod="Update">
                                                                        <DeleteParameters>
                                                                            <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                        </DeleteParameters>
                                                                        <UpdateParameters>
                                                                            <asp:Parameter Name="Name" Type="String" />
                                                                            <asp:Parameter Name="Logo" Type="String" />
                                                                            <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                        </UpdateParameters>
                                                                        <InsertParameters>
                                                                            <asp:Parameter Name="Name" Type="String" />
                                                                            <asp:Parameter Name="Logo" Type="String" />
                                                                        </InsertParameters>
                                                                    </asp:ObjectDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div style="-moz-border-radius: 3px; background-color: #D6E1E7; padding: 3px; color: gray;">
                                                                        انتخاب دانشگاه</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="DG_Uni" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                        DataSourceID="ODS_Uni" ForeColor="#333333" GridLines="None" ShowHeader="False"
                                                                        Width="720px">
                                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                                                                                SortExpression="code" Visible="False" />
                                                                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="color: #000; text-decoration: none;"
                                                                                        OnCommand="SetUniversity" CommandArgument='<%# Eval("code","{0}") %>' Text='<%# Bind("name") %>' />
                                                                                    <asp:Label ID="Label5" runat="server" Style="color: #999999" Text='<%# Bind("address") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="address" SortExpression="address">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" Visible="False" />
                                                                            <asp:TemplateField HeaderText="picture" SortExpression="picture" Visible="False">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"
                                                                                Visible="False" />
                                                                        </Columns>
                                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                        <EmptyDataTemplate>
                                                                            دانشگاهی وجود ندارد.
                                                                        </EmptyDataTemplate>
                                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#999999" />
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                    </asp:GridView>
                                                                    <asp:ObjectDataSource ID="ODS_Uni" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_UniversityTableAdapter">
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="CodeCategory" Type="Int64" />
                                                                        </SelectParameters>
                                                                        <InsertParameters>
                                                                            <asp:Parameter Name="name" Type="String" />
                                                                            <asp:Parameter Name="address" Type="String" />
                                                                            <asp:Parameter Name="LinkWebsite" Type="String" />
                                                                            <asp:Parameter Name="picture" Type="String" />
                                                                            <asp:Parameter Name="CodeCategory" Type="Int64" />
                                                                        </InsertParameters>
                                                                    </asp:ObjectDataSource>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr __designer:mapid="50f">
                        <td __designer:mapid="510">
                            <table style="width: 100%;" __designer:mapid="511">
                                <tr __designer:mapid="512">
                                    <td class="style13" __designer:mapid="513">
                                        شغل:
                                    </td>
                                    <td class="style14" __designer:mapid="514">
                                        <asp:TextBox ID="txtJob" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="516">
                                        <div style="direction: ltr;" __designer:mapid="517">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="518">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="519">
                                    <td class="style13" __designer:mapid="51a">
                                        آدرس محل کار:
                                    </td>
                                    <td class="style14" __designer:mapid="51b">
                                        <asp:TextBox ID="txtAddressJob" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="51d">
                                        <div style="direction: ltr;" __designer:mapid="51e">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="51f">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="520">
                                    <td class="style13" __designer:mapid="521">
                                        تلفن محل کار:
                                    </td>
                                    <td class="style14" __designer:mapid="522">
                                        <asp:TextBox ID="txtTellJob" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="524">
                                        <div style="direction: ltr;" __designer:mapid="525">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="526">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="527">
                                    <td class="style13" __designer:mapid="528">
                                        تلفن اضطراری:
                                    </td>
                                    <td class="style14" __designer:mapid="529">
                                        <asp:TextBox ID="txtTellEmergncy" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="52b">
                                        <div style="direction: ltr;" __designer:mapid="52c">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="52d">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="52e">
                                    <td class="style13" __designer:mapid="52f">
                                        نام شرکت:
                                    </td>
                                    <td class="style14" __designer:mapid="530">
                                        <asp:TextBox ID="txtCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="532">
                                        <div style="direction: ltr;" __designer:mapid="533">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="534">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="535">
                                    <td class="style13" __designer:mapid="536">
                                        محل شرکت:
                                    </td>
                                    <td class="style14" __designer:mapid="537">
                                        <asp:TextBox ID="txtAddressCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="539">
                                        <div style="direction: ltr;" __designer:mapid="53a">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="53b">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="53c">
                                    <td class="style13" __designer:mapid="53d">
                                        درباره شرکت:
                                    </td>
                                    <td class="style14" __designer:mapid="53e">
                                        <asp:TextBox ID="txtAboutCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="540">
                                        <div style="direction: ltr;" __designer:mapid="541">
                                        </div>
                                    </td>
                                    <td class="style16" __designer:mapid="542">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="543">
                                    <td class="style13" __designer:mapid="544">
                                        وب سایت شرکت:
                                    </td>
                                    <td class="style14" __designer:mapid="545">
                                        <asp:TextBox ID="txtWebsiteJob" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="547">
                                        &nbsp;
                                    </td>
                                    <td class="style16" __designer:mapid="548">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="549">
                                    <td class="style13" __designer:mapid="54a">
                                        وضعیت ایمیل اصلی:
                                    </td>
                                    <td class="style14" __designer:mapid="54b">
                                        <asp:RadioButton ID="rbEmailShow" runat="server" GroupName="1" Text="نمایش برای عموم" />
                                        <br __designer:mapid="54d" />
                                        <asp:RadioButton ID="rbDontShowEmail" runat="server" GroupName="1" Text="غیر قابل نمایش برای عموم" />
                                    </td>
                                    <td class="style15" __designer:mapid="54f">
                                        &nbsp;
                                    </td>
                                    <td class="style16" __designer:mapid="550">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="551">
                                    <td class="style13" __designer:mapid="552">
                                        ایمیل فرعی:
                                    </td>
                                    <td class="style14" __designer:mapid="553">
                                        <asp:TextBox ID="txtSecondEmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="555">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td class="style16" __designer:mapid="556">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="557">
                                    <td class="style13" __designer:mapid="558">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="559">
                                        <asp:TextBox ID="txtYahoo" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="55b">
                                        : Yahoo
                                    </td>
                                    <td class="style16" __designer:mapid="55c">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="55d">
                                    <td class="style13" __designer:mapid="55e">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="55f">
                                        <asp:TextBox ID="txtGmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="561">
                                        : Gmail
                                    </td>
                                    <td class="style16" __designer:mapid="562">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="563">
                                    <td class="style13" __designer:mapid="564">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="565">
                                        <asp:TextBox ID="txtFacebook" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="567">
                                        : Facebook
                                    </td>
                                    <td class="style16" __designer:mapid="568">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="569">
                                    <td class="style13" __designer:mapid="56a">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="56b">
                                        <asp:TextBox ID="txtTwitter" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="56d">
                                        : Twitter
                                    </td>
                                    <td class="style16" __designer:mapid="56e">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="56f">
                                    <td class="style13" __designer:mapid="570">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="571">
                                        <asp:TextBox ID="txtHotmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="573">
                                        : Hotmail
                                    </td>
                                    <td class="style16" __designer:mapid="574">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="575">
                                    <td class="style13" __designer:mapid="576">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="577">
                                        <asp:TextBox ID="txtooVoo" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="579">
                                        : ooVoo
                                    </td>
                                    <td class="style16" __designer:mapid="57a">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="57b">
                                    <td class="style13" __designer:mapid="57c">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="57d">
                                        <asp:TextBox ID="txtSkype" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15" __designer:mapid="57f">
                                        : Skype
                                    </td>
                                    <td class="style16" __designer:mapid="580">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr __designer:mapid="581">
                                    <td class="style13" __designer:mapid="582">
                                        &nbsp;
                                    </td>
                                    <td class="style14" __designer:mapid="583">
                                        &nbsp;
                                        <asp:ImageButton ID="btnUpdateContact" runat="server" ImageUrl="~/content/images/Home/Register.jpg" />
                                    </td>
                                    <td class="style15" __designer:mapid="585">
                                        &nbsp;
                                    </td>
                                    <td class="style16" __designer:mapid="586">
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
            <td>
                <b>اطلاعات ظاهری</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6" __designer:mapid="187">
                    <tr>
                        <td class="style17">
                            قد:
                        </td>
                        <td>
                            <asp:TextBox ID="txtHeight" runat="server" class="stEnglishField" Width="40px"></asp:TextBox>
                            <span class="style18">سانتیمتر</span><asp:RangeValidator ID="RangeValidator2" runat="server"
                                ControlToValidate="txtHeight" ErrorMessage="قد در محدوده نمی باشد" MaximumValue="300"
                                MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            وزن:
                        </td>
                        <td>
                            <asp:TextBox ID="txtWeight" runat="server" class="stEnglishField" Width="40px"></asp:TextBox>
                            <span class="style18">کیلوگرم</span><asp:RangeValidator ID="RangeValidator1" runat="server"
                                ControlToValidate="txtWeight" ErrorMessage="وزن در محدوده نمی باشد" MaximumValue="300"
                                MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            اخلاق:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbMorality" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">جدی</asp:ListItem>
                                <asp:ListItem Value="2">شوخ طبع</asp:ListItem>
                                <asp:ListItem Value="3">دوستانه</asp:ListItem>
                                <asp:ListItem Value="4">شلوغ</asp:ListItem>
                                <asp:ListItem Value="5">تیزهوش</asp:ListItem>
                                <asp:ListItem Value="6">گوشه گیر</asp:ListItem>
                                <asp:ListItem Value="7">خشک</asp:ListItem>
                                <asp:ListItem Value="8">بداخلاق</asp:ListItem>
                                <asp:ListItem Value="9">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رفتار:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbBehaviour" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">مهربان</asp:ListItem>
                                <asp:ListItem Value="2">آرام</asp:ListItem>
                                <asp:ListItem Value="3">خونسرد</asp:ListItem>
                                <asp:ListItem Value="4">قاطع</asp:ListItem>
                                <asp:ListItem Value="5">مدعی</asp:ListItem>
                                <asp:ListItem Value="6">عصبانی</asp:ListItem>
                                <asp:ListItem Value="7">پرخاشگرانه</asp:ListItem>
                                <asp:ListItem Value="8">تهاجمی</asp:ListItem>
                                <asp:ListItem Value="9">پرجنب و جوش</asp:ListItem>
                                <asp:ListItem Value="10">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            نوع پوشش:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbCover" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">سنگین</asp:ListItem>
                                <asp:ListItem Value="2">راحت</asp:ListItem>
                                <asp:ListItem Value="3">معمولی</asp:ListItem>
                                <asp:ListItem Value="4">کت و شلواری (مجلسی)</asp:ListItem>
                                <asp:ListItem Value="5">چادری (حجاب برتر)</asp:ListItem>
                                <asp:ListItem Value="6">اسپرت</asp:ListItem>
                                <asp:ListItem Value="7">مد روز (متغییر)</asp:ListItem>
                                <asp:ListItem Value="8">مارکدار</asp:ListItem>
                                <asp:ListItem Value="9">جین</asp:ListItem>
                                <asp:ListItem Value="10">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ پوست:
                        </td>
                        <td>

                            <script type="text/javascript">
                        function sett(st){document.getElementById('div_skin').innerHTML=st;}
                        function gett(){document.getElementById('div_skin').innerHTML='';}
                            </script>

                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 150px;">
                                                <a onmousemove="return sett('بسیار روشن (سفید)');" onmouseout="return gett();">
                                                    <asp:ImageButton ID="img_color_skin_1" runat="server" ImageUrl="~/Content/images/Home/color_skin_1.gif" />
                                                </a><a onmousemove="return sett('زیتون پوستی یا مدیترانه ای یا آُسیایی (مایل به زرد)');"
                                                    onmouseout="return gett();">
                                                    <asp:ImageButton ID="img_color_skin_2" runat="server" ImageUrl="~/Content/images/Home/color_skin_2.gif" />
                                                </a><a onmousemove="return sett('سبزه (برنزه روشن)');" onmouseout="return gett();">
                                                    <asp:ImageButton ID="img_color_skin_3" runat="server" ImageUrl="~/Content/images/Home/color_skin_3.gif" />
                                                </a><a onmousemove="return sett('قهوه ای روشن (برنزه تیره)');" onmouseout="return gett();">
                                                    <asp:ImageButton ID="img_color_skin_4" runat="server" ImageUrl="~/Content/images/Home/color_skin_4.gif" />
                                                </a><a onmousemove="return sett(' قهوه ای تیره (سیاه – تیره)');" onmouseout="return gett();">
                                                    <asp:ImageButton ID="img_color_skin_5" runat="server" ImageUrl="~/Content/images/Home/color_skin_5.gif" />
                                                </a>
                                                <div id="div_skin" style="width: 250px; height: 10px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel5">
                                                    <ProgressTemplate>
                                                        <img src="../../Content/images/Profile_View_Users/Loading_0.gif" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            اندام:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbOrgan" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">چاق</asp:ListItem>
                                <asp:ListItem Value="2">لاغر</asp:ListItem>
                                <asp:ListItem Value="3">معمولی</asp:ListItem>
                                <asp:ListItem Value="4">ورزشکاری</asp:ListItem>
                                <asp:ListItem Value="5">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            وضعیت مو:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbStatusH" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">صاف</asp:ListItem>
                                <asp:ListItem Value="2">فر</asp:ListItem>
                                <asp:ListItem Value="3">بی مو</asp:ListItem>
                                <asp:ListItem Value="4">کم مو</asp:ListItem>
                                <asp:ListItem Value="5">پر پشت</asp:ListItem>
                                <asp:ListItem Value="6">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ مو:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbHcolor" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">مشکی</asp:ListItem>
                                <asp:ListItem Value="2">قهوه ای</asp:ListItem>
                                <asp:ListItem Value="3">بور</asp:ListItem>
                                <asp:ListItem Value="4">طلایی</asp:ListItem>
                                <asp:ListItem Value="5">جو گندمی</asp:ListItem>
                                <asp:ListItem Value="6">سفید</asp:ListItem>
                                <asp:ListItem Value="7">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ چشم:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbEyesColor" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">مشکی</asp:ListItem>
                                <asp:ListItem Value="2">قهوه ای </asp:ListItem>
                                <asp:ListItem Value="3">آبی</asp:ListItem>
                                <asp:ListItem Value="4">سبز</asp:ListItem>
                                <asp:ListItem Value="5">خاکستری</asp:ListItem>
                                <asp:ListItem Value="6">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="btnUpdateOutward" runat="server" ImageUrl="~/content/images/Home/Register.jpg" />
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
