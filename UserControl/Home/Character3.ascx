<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Character3.ascx.vb" Inherits="UserControl_Home_Character3" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        font-size: 11px;
    }
    .style2
    {
        width: 379px;
    }
    .style3
    {
        width: 207px;
    }
    .style4
    {
        font-size: 11px;
    }
    @font-face
    {
        font-family: koodak;
        src: url(            "../content/font/W_yekan Bold.TTF" );
    }
    .style5
    {
        width: 380px;
    }
    .style6
    {
        width: 608px;
        text-align: right;
    }
    .style7
    {
        width: 439px;
    }
    .style9
    {
        width: 558px;
    }
    .style11
    {
        width: 100%;
    }
    .style13
    {
        width: 520px;
    }
    .style14
    {
        font-size: 11px;
        color: #808080;
    }
</style>
<style type="text/css">
    .BtnShaahr
    {
        background-color: #f4f4f4;
        border: 1px solid #ccc;
        padding: 5px;
        color: Black;
        font-family: Tahoma;
        font-size: 11px;
        cursor: pointer;
        -moz-border-radius: 4px;
        text-align: left;
    }
    .style17
    {
        text-align: right;
    }
    .style18
    {
        text-align: right;
        width: 1614px;
    }
    .style19
    {
        text-align: right;
        width: 97px;
    }
    .style20
    {
        width: 580px;
    }
</style>
<div style="width: 688px; height: 100%; font-family: Tahoma; font-size: 11px; direction: ltr;">
    <asp:MultiView ID="Mv_Bikari" runat="server">
        <asp:View ID="V_Moarefi_Users" runat="server">
            <table class="style1">
                <tr style="text-align: right;">
                    <td style="font-family: koodak; font-size: 20px;">
                        معرفی کاربران، با علایق مشترک
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <div style="width: 560px; text-align: right;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Character3_Introduction"
                                GridLines="None" ShowHeader="False" Width="557px">
                                <Columns>
                                    <asp:TemplateField HeaderText="name" SortExpression="name">
                                        <ItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style7">
                                                        <table class="style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("name", "{0}") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label43" runat="server" Text='<%# MaleOrFamale(DataBinder.Eval(Container.DataItem,"sex")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# MarridOrSingle(DataBinder.Eval(Container.DataItem,"Marrid_Single")) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# DateBirth(DataBinder.Eval(Container.DataItem,"dateBirth")) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Favorit(DataBinder.Eval(Container.DataItem,"title")) %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="imgAvatar" ForeColor="Transparent" AlternateText="" runat="server"
                                                            Height="80px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=100&H=100" %>'
                                                            Style="border: solid 3px #b4b4b4; -moz-border-radius: 5px; cursor: auto;" Width="80px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style7">
                                                        <asp:Button ID="Button2" Text="ممنون از معرفیت" OnCommand="Thanks" CssClass="BtnShaahr"
                                                            runat="server" />
                                                        <asp:Button ID="ButtonShaahr" Text="مشاهده پروفایل" OnCommand="GotoProfile" CommandArgument='<%# Eval("email","{0}") %>'
                                                            CssClass="BtnShaahr" runat="server" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="dateBirth" HeaderText="dateBirth" ReadOnly="True" SortExpression="dateBirth"
                                        Visible="False" />
                                    <asp:CheckBoxField DataField="sex" HeaderText="sex" SortExpression="sex" Visible="False" />
                                    <asp:CheckBoxField DataField="Marrid_Single" HeaderText="Marrid_Single" SortExpression="Marrid_Single"
                                        Visible="False" />
                                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" Visible="False" />
                                    <asp:BoundField DataField="code_favorit" HeaderText="code_favorit" SortExpression="code_favorit"
                                        Visible="False" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                                    <asp:BoundField DataField="PicPath" HeaderText="PicPath" SortExpression="PicPath"
                                        Visible="False" />
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Character3_Introduction" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_Character3TableAdapters.Character3_Introduction_UsersLikeMeTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </td>
                    <td>
                        <asp:Image ID="Image27" runat="server" ImageUrl="~/Content/images/Character3/Character/nish-khand.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_Moarefi_Shaahrs" runat="server">
            <table class="style1">
                <tr style="text-align: right;">
                    <td class="style9" style="font-family: koodak; font-size: 20px;">
                        معرفی شهر مورد علاقه
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ODS_Shaahrs"
                            Width="557px">
                            <ItemTemplate>
                                <table class="style11" style="text-align: right; font-size: 11px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="style11" style="text-align: right; font-size: 11px;">
                                                <tr>
                                                    <td class="style13">
                                                        <table class="style11" style="text-align: right; font-size: 11px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="codecategoryLabel" runat="server" Text='<%# GetCategory(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="visitLabel" runat="server" Text='<%# GetVisit(DataBinder.Eval(Container.DataItem,"visit")) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="subnameLabel" runat="server" Style="color: #474747" Text='<%# Eval("subname") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <div style="background-color: #f9f9f9; border: 2px solid #ECECEC; -moz-border-radius: 5px;
                                                            padding: 5px;">
                                                            <asp:ImageButton ID="ImageButton1" ForeColor="Transparent" AlternateText="" runat="server"
                                                                CommandArgument='<%# Eval("id","{0}") %>' Height="80px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                                OnCommand="GotoShaahr" Width="80px" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:Button ID="ButtonShaahr" Text="ممنون از معرفیت" OnCommand="Thanks" CssClass="BtnShaahr"
                                                runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_Shaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Character3_ShaahrsTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>
                        <asp:Image ID="Image28" runat="server" ImageUrl="~/Content/images/Character3/Character/nish-khand.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_Elame_Tavalod" runat="server">
            <asp:DataList ID="DL_BirthDay0" runat="server" DataSourceID="OSD_BirthDay" Style="text-align: left"
                Width="694px">
                <ItemTemplate>
                    <asp:Panel ID="PnlVisible0" runat="server" Visible='<%# PnlBirthDay(DataBinder.Eval(Container.DataItem,"_date")) %>'>
                        <table class="style11">
                            <tr>
                                <td class="style17">
                                    <table class="style11">
                                        <tr>
                                            <td class="style20" style="text-align: right">
                                                (<asp:Label ID="Label48" runat="server" Style="font-family: koodak; font-size: 18px;
                                                    color: #0081AD;" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                &nbsp; ( یادآوری تولد
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <table class="style11">
                                        <tr>
                                            <td class="style18">
                                                <table class="style11">
                                                    <tr>
                                                        <td class="style17">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style17">
                                                            <asp:Label ID="Label49" runat="server" Text='<%# TextBirth(DataBinder.Eval(Container.DataItem,"_date"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Button ID="ButtonShaahrBirth0" runat="server" CssClass="BtnShaahr" OnCommand="Thanks"
                                                                Text="ممنون از یادآوریت" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style17">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="style19">
                                                <asp:ImageButton ID="ImageButton34" ForeColor="Transparent" AlternateText="" runat="server"
                                                    Height="80px" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                    Style="border: solid 3px #b4b4b4; -moz-border-radius: 5px; cursor: auto;" Width="80px" />
                                            </td>
                                            <td class="style17">
                                                <asp:Image ForeColor="Transparent" AlternateText="" ID="Image32" runat="server" ImageUrl="~/Content/images/Character3/Character/kheyli_shad.png"
                                                    Height="93px" Width="97px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="OSD_BirthDay" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyFriends_BirthDayTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
    <asp:MultiView ID="Mv_Ejbari" runat="server" Visible="False">
        <asp:View ID="V_M1" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_welcome.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="Button1" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    خوش آمد گویی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/images/Character3/Character/nish-khand.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_jiring.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton2" Text="ادامه ..." CssClass="BtnShaahr" runat="server"
                                Style="margin-top: 107px; margin-left: 2px;" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    بخش جیرینگ (واحد پولی)
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M3" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_online.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton3" Text="ادامه ..." Style="margin-top: 107px; margin-left: 2px;"
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    افراد آنلاین شهر
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M4" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_status.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton4" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    وضعیت شهروندی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M5" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_search.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton5" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    جستجو در شهر
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M6" runat="server" EnableTheming="False">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_zehn.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton6" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    در ذهن من
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M7" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_avatar.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton7" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    آوتارهای من
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M8" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_degree.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton8" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    درجه شهروندی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M9" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_visited.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton9" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    بازدید کنندگان خانه
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image9" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M10" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_menu.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton10" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    منوی اصلی خانه
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M11" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_UpdateTo.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton11" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    بروزرسانی لحظه ای
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M12" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_UpdateOrg.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton12" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    بروزرسانی اصلی پایین صفحه
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M13" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_event.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton13" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    رویدادهای کشور و روز
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M14" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_knowing.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton14" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    افراد آشنا
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image14" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M15" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_shaahrs.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton31" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    َشهرها
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image29" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M16" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_work.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton15" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    لیست کارها
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M17" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_leftMenu.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton16" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    منوی سمت چب
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image16" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_M18" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="background-image: url('../Content/images/Character3/Compulsory/ch_ejbari_HelpUs.png');
                            height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton17" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    امیدوار هستم در شهر اوقات خوبی را داشته باشید...
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    کاربر محترم جناب آقای علیمحمد اقبالدار ورود شما را به جمع همشهری های این شهر تبریک
                                    عرض می کنم. اسم من کایکو است امیدورام بتوانیم دوستان خوبی برای هم شویم . در ادامه
                                    معرفی با بخش های مختلف سایت آشنا خواهی شد هم می توانید آنها را دیدن کنید و هم می
                                    توانید از آنهابگزرید
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image17" runat="server" ImageUrl="~/Content/images/Character3/Character/shad.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_F" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton18" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    تبریک بابت دوستی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_AcceptFriend" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image18" runat="server" ImageUrl="~/Content/images/Character3/Character/ghalb.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_S" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton32" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    تبریک بابت پیوستن به شهر
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblJoinToShaahr" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image30" runat="server" ImageUrl="~/Content/images/Character3/Character/nish-khand.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_CS" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton33" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    تبریک بابت ایجاد و تاسیس شهر
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblMayor" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    طریقه دسترسی به پنل مدیریتی:
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    منو&gt;اتاق کار من&gt;پنل مدیریتی مسئولیت ها
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image31" runat="server" ImageUrl="~/Content/images/Character3/Character/kheyli_shad.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_CF" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton19" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    نارحت شدن بابت قطع ارتباط دوستی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_DeleteFreind" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image19" runat="server" ImageUrl="~/Content/images/Character3/Character/narahat.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_NT" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton20" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    توبیخ شدن توسط نظمیه
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_RailUser" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image20" runat="server" ImageUrl="~/Content/images/Character3/Character/DastBeChane.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_IJ" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton22" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    افزایش جیرینگ
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_IncreaseJiring" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image22" runat="server" ImageUrl="~/Content/images/Character3/Character/kheyli_shad.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_DJ" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton21" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    کاهش جیرینگ
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblDecreaseJiring" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image21" runat="server" ImageUrl="~/Content/images/Character3/Character/Narahat_Jedi.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_FF" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton23" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    اعلام پرشدن صندوق پستی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_FullFund" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image23" runat="server" ImageUrl="~/Content/images/Character3/Character/gij.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_LV" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <div style="height: 133px; width: 253px; background-repeat: no-repeat;">
                            <asp:Button ID="ImageButton24" Style="margin-top: 107px; margin-left: 2px;" Text="ادامه ..."
                                CssClass="BtnShaahr" runat="server" />
                        </div>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    خیلی وقته نیومدی
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lbl_OverMonth" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image24" runat="server" ImageUrl="~/Content/images/Character3/Character/shad.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:MultiView ID="Mv_Etefaghi" runat="server" Visible="False">
    </asp:MultiView>
    <asp:MultiView ID="Mv_FogheEjbari" runat="server" Visible="False">
        <asp:View ID="V_Polling" runat="server">
            <table class="style1">
                <tr>
                    <td class="style5">
                        <asp:MultiView ID="M_Polling" runat="server" ActiveViewIndex="0">
                            <asp:View ID="V_Question" runat="server">
                                <table style="width: 537px; text-align: right;">
                                    <tr style="font-family: koodak; font-size: 14px;">
                                        <td>
                                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="background-color: #F0F7FA; direction: rtl; -moz-border-radius: 5px; border: 1px solid #ccc;">
                                                <asp:RadioButtonList ID="rbOptionPoll" runat="server" AutoPostBack="True">
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDateTimeCountVotePoll" runat="server" Style="color: #666666; font-size: 10px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="ImageButton26" Text="بدون نظر" CssClass="BtnShaahr" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="V_Vote" runat="server">
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="DG_Vote" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Vote"
                                                GridLines="None" ShowHeader="False" Width="530px">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Column1" SortExpression="Column1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%#  Perect(DataBinder.Eval(Container.DataItem,"Column1"),DataBinder.Eval(Container.DataItem,"option")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="option" SortExpression="option" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("option") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:Button ID="ImageButton25" Text="ادامه ..." CssClass="BtnShaahr" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <div style="background-color: #F6F6F6; padding: 2px; color: #567D8C; -moz-border-radius: 3px;
                                                width: 526px; margin-bottom: 2px; margin-top: 2px; border-top: 1px solid #D8D8D8;
                                                border-top: 1px solid #D8D8D8; text-align: right;">
                                                <asp:Label ID="lblCountAllVoter" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <asp:ObjectDataSource ID="ODS_Vote" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_Character3TableAdapters.PollVoteTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCodePollForDG" Name="codepoll" PropertyName="Text"
                                            Type="Int64" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="_option" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                                <asp:Label ID="lblCodePollForDG" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblCodePoll" runat="server" Visible="False"></asp:Label>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                    <td>
                        <asp:Image ID="Image25" runat="server" ImageUrl="~/Content/images/Character3/Character/soal.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_News" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:Panel ID="PnlPicNews" runat="server" Style="height: 133px; width: 253px;">
                            <asp:Label ID="lblcodenews" runat="server" Visible="False"></asp:Label>
                        </asp:Panel>
                    </td>
                    <td class="style2">
                        <table style="width: 297px;">
                            <tr style="font-family: koodak; font-size: 20px;">
                                <td>
                                    <asp:Label ID="lblTitleNews" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblLidDetailNews" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="lblDateTimeNews" runat="server" Style="color: #666666; font-size: 10px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Button ID="ImageButton27" Text="ادامه ..." CssClass="BtnShaahr" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image26" runat="server" ImageUrl="~/Content/images/Character3/Character/adi.png" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</div>
