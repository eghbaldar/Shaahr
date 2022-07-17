<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Character3.aspx.vb" Inherits="Management_Admin_Character3" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            color: #0000FF;
            font-weight: bold;
        }
        .hr
        {
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
            border-bottom: 2px solid #ccc;
        }
        .style14
        {
            width: 130px;
        }
        .style15
        {
            width: 130px;
            font-weight: bold;
        }
        .style16
        {
            width: 233px;
        }
        .style17
        {
            color: #CC0000;
        }
        .style18
        {
            color: #009900;
            font-weight: bold;
        }
        .style20
        {
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .style21
        {
            color: #FF0000;
        }
        .style22
        {
            color: #0000FF;
            font-weight: bold;
            height: 87px;
            font-size: xx-large;
        }
        .style23
        {
            color: #FF0000;
            height: 66px;
            font-size: medium;
            font-weight: bold;
        }
        .style24
        {
            width: 109px;
        }
        .style25
        {
            width: 109px;
            font-weight: bold;
        }
        .style26
        {
            height: 35px;
            text-align: center;
        }
        .style27
        {
            font-size: x-large;
            font-weight: bold;
            color: #FFFF00;
            background-color: #000000;
        }
        .style28
        {
            font-size: x-large;
            font-weight: bold;
            color: #FFFFFF;
            background-color: #000000;
        }
        .style29
        {
            font-size: x-large;
            font-weight: bold;
            color: #FF0000;
            background-color: #FFFFFF;
        }
        .style19
        {
            width: 64px;
        }
        .style30
        {
            color: #FFFFFF;
        }
        .style31
        {
            background-color: #CC0000;
        }
        .style32
        {
            width: 19px;
        }
        .style33
        {
            width: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <div style="border: 5px dotted #FEA71C; padding: 3px;">
                    <table class="style1">
                        <tr>
                            <td>
                                <b>فعالیت های شخصیت سوم</b>
                            </td>
                        </tr>
                        <tr>
                            <td class="style30">
                                <span class="style31">××× فعالیت های بیکاری:
                            </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style12">
                                            1</td>
                                        <td>
                                            نشان دادن هیچ چیزی ( خالی بودن )</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            2</td>
                                        <td>
                                            معرفی افراد شبیه به کاربر (سرویس جیرینگی)</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style20">&nbsp;××× فعالیت های اجباری: </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style32">
                                            1</td>
                                        <td>
                                            معرفی قسمت های سایت (صفحه خانه)</td>
                                    </tr>
                                    <tr>
                                        <td class="style32">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style20">&nbsp;××× فعالیت های اتفاقی:
                            </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style33">
                                            1</td>
                                        <td>
                                            تبریک بابت ایجاد&nbsp; دوستی</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            2</td>
                                        <td>
                                            نارحت شدن بابت قطع دوستی</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            3</td>
                                        <td>
                                            نارحت شدن بابت توبیخ توسط نظمیه</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            4</td>
                                        <td>
                                            خوشحال شدن بابت افزایش جیرینگ</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            5</td>
                                        <td>
                                            نارحت شدن بابت کاهش جیرینگ</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            6</td>
                                        <td>
                                            اعلام پر شدن صندوق پستی</td>
                                    </tr>
                                    <tr>
                                        <td class="style33">
                                            7</td>
                                        <td>
                                            اگر کاربر بیش از یک ماه به سایت سر نزد با او حال و احوال می کنید</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style30">
                                <span class="style31">&nbsp;××× فعالیت های فوق اجباری:
                            </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style19">
                                            1:&nbsp; Type=0
                                        </td>
                                        <td>
                                            نظرسنجی
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style19">
                                            2:&nbsp; Type=1
                                        </td>
                                        <td>
                                            قرار دادن&nbsp; هرنوع متنی اعم از خبر،اعلام اعیاد و سوگواری های، اطلاعیه های مهم
                                            و ....
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style19">
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
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <hr class="hr" />
                <hr class="hr" />
                <hr class="hr" />
            </td>
        </tr>
        <tr>
            <td class="style22">
                فعالیت های&nbsp; فوق اجباری
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 2px solid #1AA211;">
                    <table class="style1">
                        <tr>
                            <td>
                                ×××برگزاری&nbsp; نظرسنجی:
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style15">
                                            درج نظرسنجی:
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            عنوان نظرسنجی:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTitle" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="400px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            سوال - توضیح :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDetail" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="700px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            گزینه ها:
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <table class="style1" style="border-style: dotted">
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="AddOption" runat="server" Style="font-size: 10px" Text="&lt;&lt;&lt;&lt;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtOption" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                                    Width="300px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:ListBox ID="lstOption" runat="server" Height="157px" Style="font-family: Tahoma;
                                                                    font-size: 12px" Width="303px"></asp:ListBox>
                                                                <asp:Button ID="btnClearList" runat="server" Style="font-family: Tahoma" Text="پاکسازی گزینه ها" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            <asp:Button ID="btnInsertPolling" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                Text="ثبت " />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
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
                                <b>نظرسنجی های موجود:</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:GridView ID="DG_Polling" runat="server" AutoGenerateColumns="False" CellPadding="3"
                                    DataKeyNames="Code" DataSourceID="ODS_Polling" GridLines="None" BackColor="White"
                                    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" AllowPaging="True">
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="کدنظرسنجی(کد عمل)" InsertVisible="False" SortExpression="Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Style="font-weight: 700; text-align: center;
                                                    color: #FFFFFF" Text='<%# Bind("Code") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemStyle BackColor="#CC0000" BorderStyle="Dotted" Font-Size="Medium" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title" />
                                        <asp:BoundField DataField="detail" HeaderText="سوال (توضیح)" SortExpression="detail" />
                                        <asp:BoundField DataField="date" HeaderText="تاریخ درج" SortExpression="date" />
                                        <asp:BoundField DataField="time" HeaderText="زمان درج" SortExpression="time" />
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeletePoll" CommandArgument='<%# Eval("code","{0}") %>'
                                                    OnClientClick="return confirm('مطمئن؟');" ImageUrl="~/Content/images/Home/Delete.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="نظرسنجی های برگزار شده:" Visible="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text=""></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تعداد شرکت کنندگان">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# GetCountVoter(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    Style="font-weight: 700; font-size: small;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" OnCommand="GotoToDetailPolling" CommandArgument='<%# Eval("Code","{0}") %>'
                                                    runat="server" Style="font-family: Tahoma; font-size: 11px" Text="مشاهده جزییات نظرسنجی" />
                                                <br />
                                                دیدن نتیجه و مشاهده شرکت کنندگان
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <EmptyDataTemplate>
                                        نظرسنجی وجود ندارد.
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                </asp:GridView>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ObjectDataSource ID="ODS_Option" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Character3TableAdapters.Character3_PollingOptionTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CodePoll" Type="Int64" />
                                        <asp:Parameter Name="_Option" Type="String" />
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DG_Polling" Name="codepoll" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="CodePoll" Type="Int64" />
                                        <asp:Parameter Name="_Option" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                                <asp:GridView ID="DG_Option" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                                    DataKeyNames="Code" DataSourceID="ODS_Option">
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    <Columns>
                                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                                            SortExpression="Code" Visible="False" />
                                        <asp:BoundField DataField="CodePoll" HeaderText="CodePoll" SortExpression="CodePoll"
                                            Visible="False" />
                                        <asp:BoundField DataField="Option" HeaderText="گزینه ها" SortExpression="Option" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteOption" CommandArgument='<%# Eval("code","{0}") %>'
                                                    OnClientClick="return confirm('مطمئن؟');" ImageUrl="~/Content/images/Home/Delete.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <EmptyDataTemplate>
                                        گزینه ای وجود ندارد.
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                &nbsp;<asp:ObjectDataSource ID="ODS_Polling" runat="server" DeleteMethod="Delete"
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                    TypeName="DS_CMS_Character3TableAdapters.Character3_PollingTableAdapter" UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                        <asp:Parameter Name="_date" Type="String" />
                                        <asp:Parameter Name="time" Type="String" />
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="title" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                        <asp:Parameter Name="_date" Type="String" />
                                        <asp:Parameter Name="time" Type="String" />
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
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 2px solid #1AA211;">
                    <table class="style1">
                        <tr>
                            <td>
                                ×××اعلام خبرهای مهم:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style25">
                                            درج خبرها:
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            عنوان:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTitleNews" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="400px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            توضیح:
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLidDetailNews" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="700px" Height="123px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            توضیح کامل:
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <FCKeditorV2:FCKeditor ID="txtDetailNews" runat="server" BasePath="~/Management/content/fckeditor/"
                                                Height="500px">
                                            </FCKeditorV2:FCKeditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            تصویر سمت چب:
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadNews" runat="server" />
                                            ابعاد عکس:</span><br class="style21" />
                                            <br class="style21" />
                                            <img alt="" src="../../Content/images/Character3/Root/sizePicNews.png" style="width: 208px;
                                                height: 123px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style24">
                                            <asp:Button ID="btnInsertNews" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                Text="ثبت " />
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
                                <b>خبرهای موجود:</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="DG_News" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                    DataKeyNames="Code" DataSourceID="ODS_Character3_News" GridLines="None" AllowPaging="True">
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="کد خبر(کد عمل)" InsertVisible="False" SortExpression="Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Style="font-weight: 700; font-size: large;
                                                    color: #FFFFFF" Text='<%# Bind("Code") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemStyle BackColor="Red" BorderStyle="Dotted" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
                                        <asp:BoundField DataField="Lid_Detail" HeaderText="توضیح کوتاه" SortExpression="Lid_Detail"
                                            Visible="False" />
                                        <asp:TemplateField SortExpression="PicPath">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" Width="100" Height="70" ImageUrl='<%# Eval("picpath","~\Content\images\Character3\Compulsory\News\{0}") %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                                    OnCommand="DeleteNews" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" Visible="False" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" OnCommand="GotoToDetailNews" CommandArgument='<%# Eval("Code","{0}") %>'
                                                    runat="server" Style="font-family: Tahoma; font-size: 11px" Text="مشاهده جزییات " />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <EmptyDataTemplate>
                                        خبری وجود ندارد.
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_Character3_News" runat="server" DeleteMethod="Delete"
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                    TypeName="DS_CMS_Character3TableAdapters.CMS_Character3_TextureTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Title" Type="String" />
                                        <asp:Parameter Name="Lid_Detail" Type="String" />
                                        <asp:Parameter Name="Detail" Type="String" />
                                        <asp:Parameter Name="PicPath" Type="String" />
                                        <asp:Parameter Name="_Date" Type="String" />
                                        <asp:Parameter Name="Time" Type="String" />
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Title" Type="String" />
                                        <asp:Parameter Name="Lid_Detail" Type="String" />
                                        <asp:Parameter Name="Detail" Type="String" />
                                        <asp:Parameter Name="PicPath" Type="String" />
                                        <asp:Parameter Name="_Date" Type="String" />
                                        <asp:Parameter Name="Time" Type="String" />
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
                </div>
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
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="border: medium inset #CC6699">
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style26">
                            <span class="style29">*** </span><span class="style28">&nbsp;</span><span class="style27">ست
                            </span><b style="font-size: x-large">&nbsp; کردن کارهای فوق اجباری
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td style="border: thick dotted #FF0000">
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>لیست کارهای فوق اجباری: <b>لیست کارهای فوق اجباری:</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            فعال: قابل مشاهده برای شخصیت سوم و کاربران<br />
                            غیر فعال: غیر قابل نمایش
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_Complusory" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code"
                                DataSourceID="ODS_Character3_Compulsory">
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="کد کار فوق اجباری" InsertVisible="False"
                                        ReadOnly="True" SortExpression="Code" Visible="False" />
                                    <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="flag">
                                        <ItemTemplate>
                                            <asp:Literal ID="Literal1" Text='<%# EnableDisibleCompulsory(DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                runat="server"></asp:Literal>
                                            <asp:Button ID="Button2" OnCommand="Enable_Complusory" CommandArgument='<%# Eval("code","{0}") %>'
                                                runat="server" Text="فعال" Style="font-size: 10px; font-family: Tahoma" />
                                            <asp:Button ID="Button3" OnCommand="Disible_Complusory" CommandArgument='<%# Eval("code","{0}") %>'
                                                runat="server" Text="غیر فعال" Style="font-family: Tahoma; font-size: 10px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="نوع عمل" SortExpression="type">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# TypeNameService(DataBinder.Eval(Container.DataItem,"type")) %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle BackColor="#FFFF99" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="کد مربوط به عمل" SortExpression="codeObj">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Style="font-weight: 700; font-size: large"
                                                Text='<%# Bind("codeObj") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("codeObj") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" OnCommand="DeleteCharacter3_Complusory"
                                                CommandArgument='<%# Eval("code","{0}") %>' OnClientClick="return confirm('مطمئن؟');"
                                                ImageUrl="~/Content/images/Home/Delete.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    فعالیتی ثبت نشده است.
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Character3_Compulsory" runat="server" DeleteMethod="Delete"
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                TypeName="DS_CMS_Character3TableAdapters.Profile_Character3_CompulsoryTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="flag" Type="Boolean" />
                                    <asp:Parameter Name="type" Type="Int32" />
                                    <asp:Parameter Name="codeObj" Type="Int64" />
                                    <asp:Parameter Name="Original_Code" Type="Int64" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="flag" Type="Boolean" />
                                    <asp:Parameter Name="type" Type="Int32" />
                                    <asp:Parameter Name="codeObj" Type="Int64" />
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
                            <b>اضافه کردن کاری در لیست اجرای کارهای فوق اجباری:</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            دقت کنید در جدول فوق نباید دو کدعمل یکسان از یک نوع عمل وجود داشته&nbsp; باشد.
                        </td>
                    </tr>
                    <tr>
                        <td class="style23">
                            ادمین عزیز برای هر کاره فوق اجباری زمانی تعیین کنید و پس از آن زمان آن کار را پاک
                            و یا غیر فعال کنید.
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style16">
                                        <span class="style18">کد مربوط به عمل:</span><br />
                                        ا<span class="style17">ین کد قبلا ثبت شده </span>
                                        <br class="style17" />
                                        <span class="style17">مثلا اگر قصد اضافه کردن کار&nbsp; &quot;نظرسنجی&quot; را دارید
                                            ابتدا نظرسنجی را اضافه کرده و سپس آن کد را از جدول نظرسنجی یافته و در این قسمت وارد
                                            میکنید</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCodeObj" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        <span class="style18">نوع عمل:</span><br />
                                        <span class="style17">نظرسنجی با کد 0 (صفر)</span><br class="style17" />
                                        <span class="style17">اخبار با کد 1 (یک)</span>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbType" runat="server">
                                            <asp:ListItem Value="0" Selected="True">نظرسنجی - 0</asp:ListItem>
                                            <asp:ListItem Value="1">مطالی متنی مانند اخبار - 1</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        وضعیت فعال/غیرفعال:
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbEnable" runat="server">
                                            <asp:ListItem Value="1" Selected="True">فعال</asp:ListItem>
                                            <asp:ListItem Value="0">غیرفعال</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                    <td style="margin-right: 40px">
                                        <asp:Button ID="btnInsertComplusory" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                            Text="ثبت" Width="500px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
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
                            &nbsp;
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
                <hr class="hr" />
                <hr class="hr" />
                <hr class="hr" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
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
