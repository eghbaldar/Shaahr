<%@ Page Language="VB" MasterPageFile="~/Stage/Online/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Stage_Online_Default" Title="Untitled Page"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .txt
        {
            font-family: Tahoma;
            font-size: 11px;
            border: none;
            border-right: 1px solid #ccc;
        }
        .Title
        {
            background-color: #568ea4;
            width: 255px;
            height: 15px;
            -moz-border-radius: 4px;
            padding: 3px;
            color: White;
        }
        .Font
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .s1
        {
            font-family: Tahoma;
            font-size: 11px;
            width: 100%;
        }
        .s2
        {
            width: 30px;
        }
        .style12
        {
            width: 151px;
        }
        .style13
        {
            width: 100%;
        }
        .style15
        {
            width: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 744px;">
        <div style="width: 744px; height: 10px;">
            <div style="float: right;">
                <img src="../../content/images/Stage/Chat/OnlineIcon.jpg" /></div>
            <div style="float: right;">
                متن توضیحات
            </div>
        </div>
        <div style="width: 744px;">
            <img src="../../tablighOnline.jpg" />
        </div>
        <div style="width: 744px;">
            <%--            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
            <table class="style6">
                <tr>
                    <td>
                        <div style="float: right;">
                            <div style="float: right;">
                                <asp:CheckBox ID="Chk_Search" runat="server" Text="جستجوی پیشرفته" AutoPostBack="True" /></div>
                            <div style="float: right;">
                                <%-- <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                            <ProgressTemplate>
                                                <img src="../../content/images/Profile_View_Users/Loading_0.gif" /></ProgressTemplate>
                                        </asp:UpdateProgress>--%>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border: 1px solid #b8cad1; height: 100%; width: 724px; -moz-border-radius: 3px;
                            padding: 5px;" visible="false" id="Div_Search" runat="server">
                            <table class="style6">
                                <tr>
                                    <td class="style11">
                                        <table class="style6">
                                            <tr>
                                                <td class="style10">
                                                    نام :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFn_F" runat="server" class="txt" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    نام خانوادگی :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLn_F" runat="server" class="txt" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    نام انگلیسی :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFn_E" runat="server" class="txt" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    نام خانوادگی انگلیسی :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLn_E" runat="server" class="txt" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    نام مستعار :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAlias" runat="server" class="txt" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table class="style6">
                                            <tr>
                                                <td class="style12">
                                                    کشور :
                                                </td>
                                                <td>
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
                                                    <asp:DropDownList ID="cmbCountry" runat="server" AutoPostBack="True" class="stPersianField"
                                                        CssClass="Font" DataSourceID="ODS_Country" DataTextField="NameCountry" DataValueField="code"
                                                        Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    ایالت (استان) :
                                                </td>
                                                <td>
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
                                                    <asp:DropDownList ID="cmbState" runat="server" AutoPostBack="True" class="stPersianField"
                                                        CssClass="Font" DataSourceID="ODS_State" DataTextField="NameState" DataValueField="code"
                                                        Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    شهر :
                                                </td>
                                                <td>
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
                                                    <asp:DropDownList ID="cmbCity" runat="server" class="stPersianField" CssClass="Font"
                                                        DataSourceID="OSD_City" DataTextField="NameCity" DataValueField="code" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    تحصیلات :
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbEducation" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem>-</asp:ListItem>
                                                        <asp:ListItem>بی سواد</asp:ListItem>
                                                        <asp:ListItem>زیر دیپلم</asp:ListItem>
                                                        <asp:ListItem>دیپلم</asp:ListItem>
                                                        <asp:ListItem>فوق دیپلم</asp:ListItem>
                                                        <asp:ListItem>لیسانس</asp:ListItem>
                                                        <asp:ListItem>فوق لیسانس</asp:ListItem>
                                                        <asp:ListItem>دکتری</asp:ListItem>
                                                        <asp:ListItem>دکتری به بالا</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    تولد :
                                                </td>
                                                <td>
                                                    <div>
                                                        <div style="float: right;">
                                                            <asp:DropDownList ID="cmbDay" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                                Width="40px">
                                                                <asp:ListItem>-</asp:ListItem>
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
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
                                                        <div style="float: right; margin-right: 17px;">
                                                            <asp:DropDownList ID="cmbMonth" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                                Width="80px">
                                                                <asp:ListItem>-</asp:ListItem>
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
                                                        <div style="float: right; margin-right: 17px;">
                                                            <asp:DropDownList ID="cmbYears" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                                Width="46px">
                                                                <asp:ListItem>-</asp:ListItem>
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
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    جنسیت :
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbSex" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem Value="0">مرد</asp:ListItem>
                                                        <asp:ListItem Value="1">زن</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    وضعیت تاهل :
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbMarrid" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem Value="0">مجرد</asp:ListItem>
                                                        <asp:ListItem Value="1">متاهل</asp:ListItem>
                                                        <asp:ListItem Value="2">طلاق گرفته</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    دین:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbRegion" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem>-</asp:ListItem>
                                                        <asp:ListItem>اسلام</asp:ListItem>
                                                        <asp:ListItem>مسیحیت</asp:ListItem>
                                                        <asp:ListItem>زرتشتی</asp:ListItem>
                                                        <asp:ListItem>یهودیت</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    زبان خارجی :
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbLanuage" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem>-</asp:ListItem>
                                                        <asp:ListItem>انگلیسی</asp:ListItem>
                                                        <asp:ListItem>فرانسه</asp:ListItem>
                                                        <asp:ListItem>آلمانی</asp:ListItem>
                                                        <asp:ListItem>ایتالیایی</asp:ListItem>
                                                        <asp:ListItem>عربی</asp:ListItem>
                                                        <asp:ListItem>اسپانیایی</asp:ListItem>
                                                        <asp:ListItem>پرتقالی</asp:ListItem>
                                                        <asp:ListItem>اردو</asp:ListItem>
                                                        <asp:ListItem>مالایی</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    گروه سیاسی :
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbPoletic" runat="server" class="Font" Width="200px">
                                                        <asp:ListItem>-</asp:ListItem>
                                                        <asp:ListItem>سیاست بی سیاست</asp:ListItem>
                                                        <asp:ListItem>راستی</asp:ListItem>
                                                        <asp:ListItem>چپی</asp:ListItem>
                                                        <asp:ListItem>نه راست نه چپ</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    &nbsp;
                                                </td>
                                                <td style="text-align: left">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnSearch" runat="server"
                                                        ImageUrl="~/content/images/Stage/search/btnSearch.png" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div visible="false" style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                            margin-top: 2px; float: right; width: 736px; height: 100%; background-color: #f3fbff;"
                            id="Div_Jiring" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        کاربر محترم;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        شما برای جستجوی پیشرفته افراد آنلاین باید از سرویس لحظه ای زیر استفاده کنید.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        چون ممکن است شما فقط یک بار یا دوبار و یا به تعداد محدود از این امکان استفاده کنید
                                        ، این سرویس طوری طراحی شده است که فقط در هر جستجو مبلغ ناچیزی از موجودی شما کم شود
                                        بجای آنکه یک مبلغ زیاد برای مدت یک روزه یا دو روزه.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblJiring" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: Red;">
                                        توجه: پس از موافقت شما مبلغ بالا بلافاصه از موجودی شما کسر می شود و افراد جستجو
                                        شده برای شما به نمایش در می آیند.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: Red;">
                                        اگر تیک جعبه بالا برداشته شود سرویس دوباره فعال می شود بنابراین دقت کنید.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnKasrJiring" ImageUrl="~/content/images/Stage/Jiring/Accept.png"
                                            runat="server" />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="div_result" runat="server" visible="false">
                            <div style="padding-right: 5px; color: Gray; width: 735px; -moz-border-radius: 3px 3px 0px 0px;
                                height: 17px; background-color: White; float: right;">
                                نتیجه جستجو</div>
                            <div style="background-color: White; height: 100%; width: 775px; margin-top: 1px;
                                float: right;">
                                <asp:GridView ID="DG_citizen" runat="server" AutoGenerateColumns="False" GridLines="None"
                                    ShowHeader="False" AllowPaging="True" Width="735px">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="background-color: #f9f9f9; height: 100%; width: 735px; border-bottom: 1px solid #e1e1e1;">
                                                    <table class="style13">
                                                        <tr>
                                                            <td class="style15">
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                                                    Height="45px" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                                    OnCommand="Redirect" CommandArgument='<%# Eval("email","{0}") %>' Width="45px" />
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton3" runat="server"
                                                                    ImageUrl='<%# CheckOnilneImage(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                                    Visible='<%# CheckVisible(DataBinder.Eval(Container.DataItem,"email")) %>' />
                                                            </td>
                                                            <td>
                                                                <table class="style13">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblLocation" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                            <asp:Label ID="lblDateBirth" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        شهروندی پیدا نشده است .
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                            <div style="padding-right: 5px; color: Gray; width: 670px; -moz-border-radius: 0px 0px 3px 3px;
                                height: 17px; background-color: White; float: right;">
                                <asp:Label ID="lblCountFound" runat="server"></asp:Label></div>
                        </div>
                    </td>
                </tr>
            </table>
            <%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </div>
</asp:Content>
