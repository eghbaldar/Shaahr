<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Jiring.aspx.vb" Inherits="Management_Admin_Jiring" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 81px;
        }
        .style14
        {
            width: 101px;
        }
        .style15
        {
            width: 127px;
        }
        .style16
        {
            width: 134px;
        }
        .style17
        {
            height: 15px;
        }
        .style18
        {
            background-color: #CC0000;
        }
        .style19
        {
            color: #FFFFFF;
        }
        .style20
        {
            color: #FF0000;
            font-weight: bold;
            font-size: 30px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style21
        {
            font-size: 12px;
            font-style: italic;
            font-weight: bold;
        }
        .style24
        {
            background-color: #99CCFF;
        }
        .style25
        {
            width: 127px;
            background-color: #99CCFF;
        }
        .style26
        {
            font-size: 12px;
            font-weight: bold;
            background-color: #CCFFCC;
        }
        .style27
        {
            font-size: 12px;
            font-weight: bold;
            background-color: #000000;
        }
        .style28
        {
            color: #FF0000;
        }
        .style29
        {
            width: 251px;
        }
        .style30
        {
            color: #993333;
            font-size: 15px;
            background-color: #99CC00;
        }
        .style31
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style32
        {
            font-size: 15px;
            background-color: #FF0000;
        }
        .style33
        {
            color: #000000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>جزییات و تعاریف جیرینگی </b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkShowDefineJiring" runat="server" AutoPostBack="True" Text="نمایش تعاریف و ویرایش" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlDefineJiring" runat="server" Visible="False" BorderStyle="Dotted">
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:GridView ID="DG_DefineJiring" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    DataSourceID="ODS_ShowDefineJiring" ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                            SortExpression="ID" Visible="False" />
                                        <asp:BoundField DataField="Subject" HeaderText="موضوع" SortExpression="Subject" />
                                        <asp:BoundField DataField="Text" HeaderText="متن" SortExpression="Text" />
                                        <asp:BoundField DataField="Date" HeaderText="تاریخ درج" SortExpression="Date" />
                                        <asp:BoundField DataField="Username" HeaderText="نام کاربری گذارنده" SortExpression="Username" />
                                        <asp:CheckBoxField DataField="flag" HeaderText="وضعیت نمایش" SortExpression="flag" />
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                    OnCommand="ShowEditDefineJiring" Style="font-size: 11px; font-family: Tahoma"
                                                    Text="ویرایش" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                    OnCommand="DeleteDefineJiring" OnClientClick="return confirm('مطمئن؟ ');" ImageUrl="~/Content/images/Home/Delete.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
                                <asp:Panel ID="PnlDefineJiringEdit" runat="server" Visible="False">
                                    <table class="style1">
                                        <tr>
                                            <td class="style13">
                                                موضوع:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEditSubject"
                                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEditSubject" runat="server" Style="font-size: 11px; font-family: Tahoma;
                                                    text-align: right" Width="820px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                متن:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEditText"
                                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEditText" runat="server" Height="251px" Style="text-align: right;
                                                    font-family: Tahoma; font-size: 11px" TextMode="MultiLine" Width="820px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                وضعیت نمایش:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RbStatusEditDefine" runat="server">
                                                    <asp:ListItem Value="1">نمایش</asp:ListItem>
                                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                <asp:Button ID="btnUpdateDefine" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                    Text="ثبت" ValidationGroup="1" />
                                            </td>
                                            <td>
                                                <asp:ObjectDataSource ID="ODS_ShowDefineJiring" runat="server" InsertMethod="Insert"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.CMS_DefineJiringTableAdapter">
                                                    <InsertParameters>
                                                        <asp:Parameter Name="Subject" Type="String" />
                                                        <asp:Parameter Name="Text" Type="String" />
                                                        <asp:Parameter Name="_Date" Type="String" />
                                                        <asp:Parameter Name="Username" Type="String" />
                                                        <asp:Parameter Name="flag" Type="Boolean" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkInsertDefineJiring" runat="server" AutoPostBack="True" Text="درج تعریف جدید" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Panel ID="Pnl_InsertDefine" runat="server" Visible="False" BorderColor="#0033CC"
                    BorderStyle="Dotted">
                    <table class="style1">
                        <tr>
                            <td class="style14">
                                موضوع:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsertSubject"
                                    ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertSubject" runat="server" Style="font-size: 11px; font-family: Tahoma;
                                    text-align: right" Width="820px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                متن:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInsertText"
                                    ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertText" runat="server" Height="251px" Style="text-align: right;
                                    font-family: Tahoma; font-size: 11px" TextMode="MultiLine" Width="820px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                وضعیت نمایش:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbStatusInsertDefine" runat="server">
                                    <asp:ListItem Selected="True" Value="1">نمایش</asp:ListItem>
                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                <asp:Button ID="btnInsertDefine" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="2" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <span class="style20">مدیریت سرویس ها</span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style26">
                <span style="color: Red;">نکات زیر برای موقعی است که فاکتور به سرویس مربوط باشد در غیر
                    این صورت&nbsp; نیازی به تذکرات زیر نست.<br />
                    توجه توجه:<br />
                    جدول مورد نظر نقش پدر برای جدول سرویس ها را دارد، در واقع:<br />
                    1: اگر قصد اضافه کردن سرویسی را دارید، ایتدا باید برای آن فاکتروی تعریف کرده&nbsp;
                    و سپس سرویس مورد نظر در قسمت 2 درج کنید<br />
                    نکته:&nbsp; در جدول&nbsp; فاکتور فیلد&nbsp; Code بصورت اتوماتیک درج می شود ولی هنگام
                    درج سرویس فیلد Code جدول سرویس بصورت دستی باید درج شود(این کد باید از معادل آن از
                    جدول فاکتور که قبلا درج کردید برداشته شود<br />
                    2: اگر قصد ویرایش دادید باید بدانید که فیلد کد&nbsp; جدول سرویس ها&nbsp; به فیلد
                    کد جدول فاکتور ها وابسته است
                    <br />
                    3:اگر قصد حذف سرویس&nbsp; یا فاکتوری که مربوط به سرویس می شود را دارید هر دو باید
                    حذف شود.<br />
                    <br />
                </span>
                <blink style="color: Red;">
                ********<br />
                Admin محترم لطفا برای تغییرات در این بخش&nbsp; خودسر عمل نکنید<br />
                ********
               </blink>
            </td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCFFCC">
                <div style="background-color: Black; padding: 5px; -moz-border-radius: 3px; color: White;">
                    <b>نمایش ، اضافه ، ویرایش و ... فاکتور ها </b>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                --------------&gt;&nbsp; <b>نمایش جدول فاکتور ها </b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_Factor_jiring" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.CMS_Factor_JiringTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="TimePeriod" Type="String" />
                        <asp:Parameter Name="Type" Type="Boolean" />
                        <asp:Parameter Name="jiring" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="DG_FactorJiring" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Factor_jiring" ForeColor="#333333" GridLines="None" Width="898px">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="کد فاکتور(بصورت Identity)" InsertVisible="False"
                            ReadOnly="True" SortExpression="Code" />
                        <asp:BoundField DataField="Subject" HeaderText="موضوع" SortExpression="Subject" />
                        <asp:BoundField DataField="TimePeriod" HeaderText="دوره" SortExpression="TimePeriod" />
                        <asp:TemplateField HeaderText="افزایشی/کاهشی" SortExpression="Type">
                            <ItemTemplate>
                                <asp:Image ID="Image2" ImageUrl='<%# IIF(Eval("type")=0,"~\content/images/stage/jiring/decrease.jpg","~\content/images/stage/jiring/increase.jpg") %>'
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="jiring" HeaderText="جیرینگ" SortExpression="jiring" />
                        <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="flag">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# IIF(Eval("flag")=0,"عدم نمایش","نمایش") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="ShowEditFactorJiring" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ویرایش" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="DeleteFactorJiring" OnClientClick="return confirm('مطمئن؟ ');" ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlFactorJiring" runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Panel ID="PnlUpdateFactor" runat="server" Visible="False" BorderStyle="Dotted">
                                    <table class="style1">
                                        <tr>
                                            <td class="style25">
                                                <div style="padding: 5px;">
                                                    کد&nbsp; فاکتور:
                                                </div>
                                            </td>
                                            <td class="style24">
                                                <div style="padding: 5px;">
                                                    <blink>
                                                    <asp:Label ID="lblEditCodeFactor" runat="server" Style="font-weight: 700; font-size: 15px"></asp:Label>
                                                    </blink>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                موضوع:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEditSubjectFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                    Width="228px"></asp:TextBox>
                                                &nbsp;بیش از 9 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                                    runat="server" ControlToValidate="txtEditSubjectFactor" ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                دوره:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEditPeriodFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                    Width="402px"></asp:TextBox>
                                                &nbsp;بیش از 15 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                    runat="server" ControlToValidate="txtEditPeriodFactor" ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                افزایشی/کاهشی:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RbEditTypeFactor" runat="server">
                                                    <asp:ListItem Value="1">افزایشی (برنگ سبز)</asp:ListItem>
                                                    <asp:ListItem Value="0">کاهشی(برنگ قرمز)</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                جیرینگ:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEditFactorJiring" runat="server" Width="55px"></asp:TextBox>
                                                &nbsp;واحد جیرینگ<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                    ControlToValidate="txtEditFactorJiring" ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                وضعیت نمایش:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RbStatusEditFactor" runat="server">
                                                    <asp:ListItem Value="1">نمایش</asp:ListItem>
                                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style15">
                                                <asp:Button ID="btnEditFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                    Text="ثبت" ValidationGroup="3" />
                                                <asp:Button ID="btnEditFactorCancel" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                                    Text="لغو" ValidationGroup="3" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkInsertFactorJiring" runat="server" AutoPostBack="True" Text="درج فاکتور جدید" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Pnl_InsertFactor" runat="server" BorderColor="#0066FF" BorderStyle="Dotted"
                    Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style16">
                                موضوع:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertSubjectFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    ValidationGroup="4" Width="228px"></asp:TextBox>
                                &nbsp;بیش از 9 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                    runat="server" ControlToValidate="txtInsertSubjectFactor" ErrorMessage="*" ValidationGroup="4"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                دوره:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertPeriodFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Width="402px"></asp:TextBox>
                                &nbsp;بیش از 15 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                    runat="server" ControlToValidate="txtInsertPeriodFactor" ErrorMessage="*" ValidationGroup="4"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                افزایشی/کاهشی:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbInsertTypeFactor" runat="server">
                                    <asp:ListItem Value="1" Selected="True">افزایشی (برنگ سبز)</asp:ListItem>
                                    <asp:ListItem Value="0">کاهشی(برنگ قرمز)</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                جیرینگ:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertFactorJiring" runat="server" Width="55px"></asp:TextBox>
                                &nbsp;واحد جیرینگ<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                    ControlToValidate="txtInsertFactorJiring" ErrorMessage="*" ValidationGroup="4"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                <asp:Button ID="btnInsertFactor" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="4" Width="31px" />
                                <asp:Button ID="btnInsertFactorCancel" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="لغو" ValidationGroup="3" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <div style="background-color: Black; padding: 5px; -moz-border-radius: 3px; color: White;">
                    <span class="style27">نمایش ، اضافه ، ویرایش و ... سرویس ها</span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                --------------&gt;&nbsp; <b>نمایش جدول سرویس ها</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                نکته: کد های جدول زیر 100% معادل کدی در جدول فاکتور بالا دارند (باید داشته باشد)
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style31">
                <span class="style30">موقع ویرایش دقت کنید کد سرویس در جدول فاکتور وجود داشته باشد</span>
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style31">
                <span class="style32">موقع حذف کردن ابتدا فاکتور سرویس را جذف نموده و سپس خود سرویس
                    را.</span>
            </td>
        </tr>
        <tr>
            <td style="color: Red; font-size: 20px;">
                
                          <div style="padding:10px;"> 
                          <blink>
                          نکته بسار مهم: اگه قصد حذف سرویسی را دارید دقت کنید که کاربری در حال استفاده از 
                آن نباشد. 
                </blink>
                          </div>  
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_JrinigService" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataSourceID="ODS_Services" Width="890px" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="کد سرویس" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" />
                        <asp:BoundField DataField="Subject" HeaderText="عنوان" SortExpression="Subject" />
                        <asp:BoundField DataField="Detail" HeaderText="توضیحات" SortExpression="Detail" />
                        <asp:BoundField DataField="Month" HeaderText="دوره(چند ماهه)" SortExpression="Month" />
                        <asp:TemplateField HeaderText="رایگان/جیرینگی" SortExpression="Free">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Free") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# IIF(Eval("free")=0,"جیرینگی","رایگان") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Jiring" HeaderText="جیرینگ" SortExpression="Jiring" />
                        <asp:BoundField DataField="Discount" HeaderText="تخفیف" SortExpression="Discount" />
                        <asp:BoundField DataField="Type" HeaderText="همنوعان" SortExpression="Type" />
                        <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="Flag">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Flag") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# IIF(Eval("flag")=0,"عدم نمایش","نمایش") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="ShowEditServiceJiring" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ویرایش" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟ ');"
                                    OnCommand="DeleteServiceJiring" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Services" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.CMS_Jiring_ServiceTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="Month" Type="Int32" />
                        <asp:Parameter Name="Free" Type="Boolean" />
                        <asp:Parameter Name="Jiring" Type="String" />
                        <asp:Parameter Name="Type" Type="Int32" />
                        <asp:Parameter Name="Flag" Type="Boolean" />
                        <asp:Parameter Name="Discount" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Panel ID="PnlEditService" runat="server" BorderStyle="Dotted" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style29">
                                کد سرویس:<br />
                                <span class="style28">توجه: این کد باید از جدول فاکتور گرفته&nbsp; شود (قبلا باید فاکتوری
                                    برای این سرویس درج شده باشد)</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditCodeService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                عنوان سرویس:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditSubjectService" runat="server" Width="228px" Style="font-size: 11px;
                                    font-family: Tahoma"></asp:TextBox>
                                &nbsp;بیش از 9 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                    runat="server" ControlToValidate="txtEditSubjectFactor" ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                توضیحات:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditDetailService" runat="server" Width="629px" Height="155px"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                دوره (ماه):
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditMonthService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                رایگان/جیرینگی:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbEditFreeService" runat="server">
                                    <asp:ListItem Value="1">رایگان</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="0">جیرینگی</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                جیرینگ:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditJiringService" runat="server" Width="88px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                همنوعان:<br />
                                <span class="style28">توجه: این فیلد وقتی کاربرد دارد که برای یک سرویس چندین ماه قائل
                                    شویم در این صورت باید این فیلد برای آن سرویس ها ثابت باشد.</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditTypeService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                وضعیت نمایش:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbEditFlagService" runat="server">
                                    <asp:ListItem Value="1">نمایش</asp:ListItem>
                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                تخفیف:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditDiscountService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                <asp:Button ID="btnUpdateService" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="4" Width="31px" />
                                <asp:Button ID="btnEditServiceCancel" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="لغو" ValidationGroup="3" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:CheckBox ID="ChkInsertService" runat="server" AutoPostBack="True" Text="درج سرویس جدید" />
            </td>
        </tr>
        <tr>
            <td>
                <blink>
                <a href="LearningCreateService.htm" target="_blank" style="color:Blue;text-decoration:none;">
                    آموزش اضافه کردن سرویس جدید
                </a>
                </blink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlInsertService" runat="server" BorderColor="#0066FF" BorderStyle="Dotted"
                    Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style29">
                                کد سرویس:<br />
                                <span class="style28">توجه: این کد باید از جدول فاکتور گرفته&nbsp; شود (قبلا باید فاکتوری
                                    برای این سرویس درج شده باشد)</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCodeService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                عنوان سرویس:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertSubjectService" runat="server" Style="font-size: 11px;
                                    font-family: Tahoma" Width="228px"></asp:TextBox>
                                &nbsp;بیش از 9 کلمه نشود.<asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                    runat="server" ControlToValidate="txtEditSubjectFactor" ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                توضیحات:
                            </td>
                            <td>
                                <asp:TextBox ID="txtDetailService" runat="server" Height="155px" TextMode="MultiLine"
                                    Width="629px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                دوره (ماه):
                            </td>
                            <td>
                                <asp:TextBox ID="txtMonthService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                رایگان/جیرینگی:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbFreeService" runat="server">
                                    <asp:ListItem Value="1">رایگان</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="0">جیرینگی</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                جیرینگ:
                            </td>
                            <td>
                                <asp:TextBox ID="txtJiringService" runat="server" Width="88px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                همنوعان:<br />
                                <span class="style28">توجه: این فیلد وقتی کاربرد دارد که برای یک سرویس چندین ماه قائل
                                    شویم در این صورت باید این فیلد برای آن سرویس ها ثابت باشد.</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTypeService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                وضعیت نمایش:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbShowService" runat="server">
                                    <asp:ListItem Value="1">نمایش</asp:ListItem>
                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                تخفیف:
                            </td>
                            <td>
                                <asp:TextBox ID="txtDiscountService" runat="server" Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style29">
                                <asp:Button ID="btnInsertService" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="4" Width="31px" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCFF99">
                <b>&nbsp;مدیریبت انتقال جیرینگ کاربران</b>
            </td>
        </tr>
        <tr>
            <td class="style17">
                &nbsp;
                <asp:CheckBox ID="ChkShowTransfer" runat="server" AutoPostBack="True" Text="نمایش انتقال ها" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Jiring_Transfer" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="ODS_Jiring_Transfer" GridLines="Horizontal"
                    Visible="False" BackColor="White" BorderColor="#336666" 
                    BorderStyle="Double" BorderWidth="3px">
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="ارسال کننده" SortExpression="From">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"from")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="دریافت کننده" SortExpression="To">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"to")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Jiring" HeaderText="مقدار جیرینگ" SortExpression="Jiring" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:BoundField DataField="Percent_Jiring" HeaderText="درصد کم شده" SortExpression="Percent_Jiring" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button6" runat="server" CommandArgument='<%# Eval("from","{0}") %>'
                                    OnCommand="ShowProfileJiring" OnClientClick="return confirm('مطمئن؟');" Style="font-family: Tahoma;
                                    font-size: 11px" Text="جزییات جیرینگ ارسال کننده" />
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                    OnCommand="DeleteTransferUser" />
                                <br />
                                <asp:Button ID="Button7" runat="server" CommandArgument='<%# Eval("to","{0}") %>'
                                    OnCommand="ShowProfileJiring" OnClientClick="return confirm('مطمئن؟');" Style="font-size: 11px;
                                    font-family: Tahoma" Text="جزییات جیرینگ دریافت کننده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Jiring_Transfer" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Jiring_TransferTableAdapter">
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
                <asp:Button ID="btnDeleteAllTransfer" runat="server" OnClientClick="return confirm('مطمئن؟');"
                    Style="font-family: Tahoma; font-size: 11px" Text="پاکسازی" />
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCFFFF">
                <b>&nbsp;مدیریت سرویس های خریداری شده کاربران</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_ShowService" runat="server" AutoPostBack="True" Text="نمایش سرویس ها" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Service" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_UsersServices" ForeColor="#333333" GridLines="None" Visible="False"
                    Width="916px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="codeservice" HeaderText="codeservice" SortExpression="codeservice"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="subject" HeaderText="سرویس" SortExpression="subject" />
                        <asp:BoundField DataField="start_date" HeaderText="تاریخ شروع" SortExpression="start_date" />
                        <asp:BoundField DataField="end_date" HeaderText="تاریخ پایان" SortExpression="end_date" />
                        <asp:BoundField DataField="jiring" HeaderText="مقدار جیرینگ" SortExpression="jiring" />
                        <asp:BoundField DataField="وضعیت" HeaderText="وضعیت" ReadOnly="True" SortExpression="وضعیت" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <div style="width: 100px;">
                                    <asp:Button ID="Button5" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                        CommandArgument='<%# Eval("email","{0}") %>' OnCommand="ShowProfileJiring" OnClientClick="return confirm('مطمئن؟');"
                                        Text="فعالیت های جیرینگی کاربر" />
                                    <asp:Button ID="Button4" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                        OnClientClick="return confirm('مطمئن؟');" OnCommand="ShowProfile" Style="font-size: 9px;
                                        font-family: Tahoma" Text="مشاهده کاربر" Width="65px" />
                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                        ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                        OnCommand="DeleteBuyService" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_UsersServices" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Jiring_ServiceTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDeleteAllService" runat="server" OnClientClick="return confirm('مطمئن؟');"
                    Style="font-family: Tahoma; font-size: 11px" Text="پاکسازی کل سرویس ها" />
                <br />
                <asp:Button ID="btnDeleteExpireService" runat="server"  OnClientClick="return confirm('مطمئن؟');"
                    style="font-size: 11px; font-family: Tahoma" 
                    Text="پاک سازی سرویس های منقضی شده" />
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b>مدیریت و &nbsp; بررسی پرداخت های انجام شده توسط کاربران</b> (سه روش)
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: #2C5DA2; padding: 5px; color: White;">
                    پرداخت آنلاین بانکی (درگاه)
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp; در دست طراحی
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: #2C5DA2; padding: 5px; color: White;">
                    پرداخت آنلاین بانکی (کارت به کارت)
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_ShowJiringCard" runat="server" AutoPostBack="True" Text="نمایش واریز ها" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Jiring_Card" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Jiring_Card" ForeColor="#333333" GridLines="None" Visible="False">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="تاریخ ارسال" SortExpression="Date" />
                        <asp:BoundField DataField="Time" HeaderText="زمان" SortExpression="Time" />
                        <asp:BoundField DataField="To" HeaderText="به شماره حساب" SortExpression="To" />
                        <asp:BoundField DataField="CodePeygiri" HeaderText="کد پیگیری" SortExpression="CodePeygiri" />
                        <asp:BoundField DataField="CardNum" HeaderText="شماره کارت" SortExpression="CardNum" />
                        <asp:BoundField DataField="Name" HeaderText="نام پرداخت کننده" SortExpression="Name" />
                        <asp:TemplateField HeaderText="توضیحات" SortExpression="detail">
                            <ItemTemplate>
                                <div style="width: 230px;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="width: 170px;">
                                    <asp:Button ID="Button4" runat="server" OnCommand="ShowProfileJiring" CommandArgument='<%# Eval("email","{0}") %>'
                                        OnClientClick="return confirm('مقدار جیرینگ واریزی را کپی کنید تا دوباره بازنگردید؟');"
                                        Style="font-size: 9px; font-family: Tahoma" Text="جیرینگ کاربر" Width="65px" />
                                    <asp:Button ID="Button5" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                        OnClientClick="return confirm('مطمئن؟');" OnCommand="ShowProfile" Style="font-size: 9px;
                                        font-family: Tahoma" Text="مشاهده کاربر" Width="65px" />
                                    <asp:ImageButton ID="ImageButton3" runat="server" OnCommand="DeleteJiringCard" OnClientClick="return confirm('مطمئن؟');"
                                        CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/Content/images/Home/Delete.png" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Jiring_Card" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Profile_Jiring_Card_AllTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_To" Type="String" />
                        <asp:Parameter Name="CodePeygiri" Type="String" />
                        <asp:Parameter Name="CardNum" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDeleteAllCard" runat="server" OnClientClick="return confirm('مطمئن؟');"
                    Style="font-family: Tahoma; font-size: 11px" Text="پاکسازی" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: #2C5DA2; padding: 5px; color: White;">
                    پرداخت بصورت غیر مستقیم (فیش بانکی)
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_ShowJiringFish" runat="server" AutoPostBack="True" Text="نمایش واریز ها" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Jiring_Fish" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Jiring_Fish" ForeColor="#333333" GridLines="None" Visible="False">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Bank" HeaderText="نام بانک" SortExpression="Bank" />
                        <asp:BoundField DataField="NumAcc" HeaderText="شماره حساب" SortExpression="NumAcc" />
                        <asp:BoundField DataField="Name" HeaderText="نام پرداخت کننده" SortExpression="Name" />
                        <asp:BoundField DataField="Family" HeaderText="نام خانوادگی پرداخت کننده" SortExpression="Family" />
                        <asp:BoundField DataField="Price" HeaderText="مبلغ پرداختی" SortExpression="Price" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ پرداخت" SortExpression="Date" />
                        <asp:BoundField DataField="RedNum" HeaderText="شماره قرمز رنگ پرداخت" SortExpression="RedNum" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="width: 170px;">
                                    <asp:Button ID="Button5" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                        OnClientClick="return confirm('مقدار جیرینگ واریزی را کپی کنید تا دوباره بازنگردید؟');"
                                        OnCommand="ShowProfileJiring" Style="font-size: 9px; font-family: Tahoma" Text="جیرینگ کاربر"
                                        Width="65px" />
                                    <asp:Button ID="Button4" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                        OnClientClick="return confirm('مطمئن؟');" OnCommand="ShowProfile" Style="font-size: 9px;
                                        font-family: Tahoma" Text="مشاهده کاربر" Width="65px" />
                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                        ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                        OnCommand="DeleteJiringFish" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Jiring_Fish" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_JiringTableAdapters.Profile_Jiring_Fish_AllTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Bank" Type="String" />
                        <asp:Parameter Name="NumAcc" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Family" Type="String" />
                        <asp:Parameter Name="Price" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="RedNum" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDeleteAllFish" runat="server" OnClientClick="return confirm('مطمئن؟');"
                    Style="font-family: Tahoma; font-size: 11px" Text="پاکسازی" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <span class="style18"><span class="style19">نکته مهم که باید اضافه شود:</span><br
                    class="style19" />
                    <span class="style19">با یک کلیک مبلغ (بعد از تایید ارسال مبلغ) به حساب کاربر منتقل
                        شود +&nbsp; رکورد تایید شده و متمایز از سایر رکورد ها باشد</span></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
