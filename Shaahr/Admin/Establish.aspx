<%@ Page Language="VB" MasterPageFile="~/Shaahr/admin/Home.master" AutoEventWireup="false"
    CodeFile="Establish.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1" %>
<%@ Register Src="../../UserControl/Root/Captcha.ascx" TagName="Captcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(             "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 17px;
        }
        .style4
        {
            color: #FF0000;
        }
        .style5
        {
            width: 270px;
        }
        .style6
        {
            width: 80px;
            direction: ltr;
        }
        .style7
        {
            width: 80px;
            color: #FF0000;
            text-align: left;
        }
        .style8
        {
            color: #999999;
        }
        .CMB
        {
            padding: 5px;
            font-size: 13px;
        }
        .style10
        {
            width: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            در خواست تاسیس شهر
        </div>
        <div style="width: 733px; padding: 5px; float: right;">
            <div style="float: right;">
                <img src="../../Content/images/Shaahrs/Root/addShaahr.png" />
            </div>
            <div style="padding: 2px;">
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
        </div>
        <div style="width: 735px; float: right; padding: 5px;">
            <table class="style1">
                <tr>
                    <td>
                        <div style="border: 1px solid #ccc; padding: 3px;">
                            <cc1:DelayedSubmitExtender ID="DisableButtonExtender1" runat="server" Timeout="1"
                                TargetControlID="txtSearch" />
                            <table class="style1">
                                <tr>
                                    <td>
                                        <b>بررسی نام شهر :</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td class="style5">
                                                    <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" Style="font-family: Tahoma;
                                                        font-size: 12px" Width="300px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style10">
                                                                <asp:Image runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                                    ImageUrl="~/Content/images/Shaahrs/Root/find.png" />
                                                            </td>
                                                            <td>
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
                                        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="txtSearch" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:GridView ID="DG_Search" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    DataSourceID="ODS_Search" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:BoundField DataField="name" HeaderText="نام شهر" SortExpression="name">
                                                            <HeaderStyle HorizontalAlign="Right" Width="375px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="شهردار" SortExpression="funder">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Right" Width="150px" />
                                                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="استان" SortExpression="CodeState">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# GetState(DataBinder.Eval(Container.DataItem,"codestate")) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Right" Width="150px" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="زیر گروه" SortExpression="CodeCategory">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# GetFav(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Right" Width="150px" />
                                                            <ItemStyle HorizontalAlign="Right" ForeColor="Red" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span style="color: Gray;">شهری وجود ندارد.</span>
                                                    </EmptyDataTemplate>
                                                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                                                    <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                                                        Font-Bold="false" ForeColor="#567D8C" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="ODS_Search" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Search_Shaahr_Request_FundationShaahrTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txtSearch" DefaultValue="" Name="name" PropertyName="Text"
                                                            Type="String" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="name" Type="String" />
                                                        <asp:Parameter Name="funder" Type="String" />
                                                        <asp:Parameter Name="codestate" Type="String" />
                                                        <asp:Parameter Name="codecategory" Type="Int64" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                    <ProgressTemplate>
                                                        <img src="../../Content/images/Profile_View_Users/Loading_0.gif" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>درخواست تاسیس شهر</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                            <asp:View ID="V_request" runat="server">
                                <table class="style1">
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            :استان
                                        </td>
                                        <td>
                                            &nbsp;<asp:DropDownList ID="cmbState" runat="server" CssClass="CMB" Style="font-family: Tahoma;
                                                font-size: 11px" Width="200px">
                                                <asp:ListItem Value="1">استان اول</asp:ListItem>
                                                <asp:ListItem Value="2">استان دوم</asp:ListItem>
                                                <asp:ListItem Value="3">استان سوم</asp:ListItem>
                                                <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                                                <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HyperLink ID="HyperLink1" Target="_blank" Style="color: Blue; text-decoration: none;"
                                                NavigateUrl="~/MyShaahr/Help/?Type=Shaahr&Ostan=Ostan" runat="server">(اطلاعات 
                                            استان ها)</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            :زیر گروه
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table class="style1">
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
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
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
                                                                <asp:DropDownList ID="cmbFavorits" runat="server" CssClass="CMB" DataSourceID="ODS_Favorits"
                                                                    DataTextField="title" DataValueField="code" Style="font-family: Tahoma; font-size: 11px"
                                                                    Width="200px">
                                                                    <asp:ListItem Value="1">استان اول</asp:ListItem>
                                                                    <asp:ListItem Value="2">استان دوم</asp:ListItem>
                                                                    <asp:ListItem Value="3">استان سوم</asp:ListItem>
                                                                    <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                                                                    <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="style8">در صورت نبودن زیرگروه مورد نظر به پیامی آنرا به مدیریت کل شهر اطلاع
                                                                    دهید تا زیر گروه شما در لیست قرار بگیری.</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                        <ProgressTemplate>
                                                            <img src="../../Content/images/Profile_View_Users/Loading_0.gif" />
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            نام پیشنهادی:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtName" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="300px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                                                ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            <asp:Label ID="lblName" runat="server" Style="color: #FF0000"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            &nbsp;
                                        </td>
                                        <td class="style8">
                                            نام شهر حداکثر باید دارای چهار کلمه باشد.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            &nbsp;
                                        </td>
                                        <td class="style8">
                                            نام شهر خود را قبل از ثبت در قسمت &quot;بررسی نام شهر&quot; بررسی کنید.، شهرهای
                                            با نام مشابه ثبت نخواهد شد.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            :علت تاسیس
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCause" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                Width="630px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            :شهردار
                                        </td>
                                        <td>
                                            <asp:Label ID="lblFunder" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            :ارزش تاسیس
                                        </td>
                                        <td>
                                            <asp:MultiView ID="MultiViewJiring" runat="server">
                                                <asp:View ID="V_WithJiring" runat="server">
                                                    <div style="background-color: #D6E1E7; padding: 5px; -moz-border-radius: 3px; color: #567E8A;
                                                        width: 250px;">
                                                        <table class="style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblWithJiring" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table class="style1">
                                                                        <tr>
                                                                            <td style="color: #000000">
                                                                                بعد از درخواست شما مبلغ از حساب شما کسر خواهد شد.
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </asp:View>
                                                <asp:View ID="V_WithoutJiring" runat="server">
                                                    <div style="background-color: #D6E1E7; padding: 5px; -moz-border-radius: 3px; color: red;
                                                        width: 220px;">
                                                        تاسیس شهر تا اطلاع&nbsp; بعدی رایگان می باشد.
                                                    </div>
                                                </asp:View>
                                            </asp:MultiView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <uc1:Captcha ID="Captcha" runat="server" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnInsert" runat="server" ForeColor="Transparent" ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg"
                                                ValidationGroup="1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblNotEnough" runat="server" Style="color: #FF0000"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="V_OK" runat="server">
                                <div id="Div1" style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                                    padding: 10px; margin-top: 2px; width: 716px; height: 20px; background-color: #f3fbff;
                                    color: #577F8B;" runat="server">
                                    <asp:Label ID="lblOk_Nok" runat="server" Text="Label"></asp:Label>
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width: 729px; float: right; background-color: #e0ebf0;">
                            <table class="style1">
                                <tr>
                                    <td class="style3">
                                        <img alt="" src="../../content/images/Stage/Jiring/help.jpg" style="width: 35px;
                                            height: 35px" />
                                    </td>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <b>قبل از هرگونه اقدامی به دستورالعمل زیر توجه کنید:
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    1: ابتدا نام شهر پیشنهادی خود را در محل مورد نظر جستجو کرده و از نبود شهری مشابه
                                                    مطئمن شوید.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    2: اگه&nbsp; مقداری از طرف مدیریت سایت برای تاسیس شهر تعیین شده است آنرا واریز کرده
                                                    و کدپیگری را در مکان مخصوص قرار دهید.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    3: اطلاعات را بدقت پر کنید و منتظر تایید بمانید.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4">
                                                    نکته: نام شهر پس از تایید نهایی مسئولین تغییر نخواهد کرد.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4">
                                                    نکته: درخواست شما توسط دو حوزه بررسی خواهد شد.&nbsp;&nbsp;&nbsp; الف: استانداری
                                                    حوزه&nbsp;&nbsp; ب: نظمیه ساختمان ریاست جمهوری
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
        </div>
    </div>
</asp:Content>
