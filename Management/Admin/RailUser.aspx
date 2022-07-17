<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="RailUser.aspx.vb" Inherits="Management_Admin_RailUser" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 119px;
        }
        .style14
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #FF0000;
        }
        .style15
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #006600;
        }
        .style16
        {
            width: 77px;
        }
        .style17
        {
            width: 149px;
        }
        .style18
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style19
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام کاربر:
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server" Style="font-weight: 700; font-size: 30px;
                                color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد توییخ های کاربر:
                        </td>
                        <td>
                            <asp:Label ID="CountRails" runat="server" Style="font-weight: 700; font-size: 20px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            وضعیت پروفایل کاربر:
                        </td>
                        <td>
                            <div style="background-color: yellow; padding: 10px; -moz-border-radius: 3px; color: black;
                                border: 2px solid #ccc; width: 100px;">
                                <asp:Label ID="lblStatusProfile" runat="server"></asp:Label>
                            </div>
                            برای تغییر وضعیت بسته/باز بودن کاربر به انتهای صفحه مراجعه کنید.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            اگر کاربر داراری <span class="style14">3</span> توبیخ شود ----&gt; تعلیق <span class="style15">
                                یک</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            اگر کاربر داراری <span class="style14">4</span> توبیخ شود ----&gt; تعلیق <span class="style15">
                                دو</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            اگر کاربر داراری <span class="style14">5</span> توبیخ شود ----&gt; تعلیق <span class="style15">
                                سه</span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b>توبیخ دادن: </b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_RailUser" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_RailUser" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                        <asp:TemplateField HeaderText="عنوان جرم" SortExpression="CodeCrime">
                            <ItemTemplate>
                                <div style="border: 3px solid #AEBF80; padding: 3px; -moz-border-radius: 7px; width: 100px;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# CheckTypeLaw(DataBinder.Eval(Container.DataItem,"CodeCrime")) %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="cuase" HeaderText="دلیل توبیخ" SortExpression="cuase" />
                        <asp:BoundField DataField="date" HeaderText="زمان" SortExpression="date" />
                        <asp:BoundField DataField="ByHow" HeaderText="توسط" SortExpression="ByHow" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteRailUser" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnClientClick="return confirm('مطمئن؟');" ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        توبیخی برای این کاربر وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_RailUser" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_RailUsersTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="CodeCrime" Type="Int64" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="ByHow" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                درج توبیخ برای این کاربر:
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style16">
                            کد عنوان جرم:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbInsertRail" runat="server" DataSourceID="ODS_Law_Type" DataTextField="subject"
                                DataValueField="code" Style="font-family: Tahoma; font-size: 11px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Law_Type" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Law_TypeTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="type" Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="subject" Type="String" />
                                    <asp:Parameter Name="detail" Type="String" />
                                    <asp:Parameter Name="_date" Type="String" />
                                    <asp:Parameter Name="type" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            دلیل توبیخ:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertCuase" runat="server" Height="208px" TextMode="MultiLine"
                                Width="770px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsertCuase"
                                ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Button ID="btnInsertRail" runat="server" Style="font-size: 11px; font-family: Tahoma;
                                height: 21px" Text="ثبت" ValidationGroup="1" />
                        </td>
                        <td>
                            <blink>
                            <asp:Label ID="WrongSuspention" runat="server" style="color: #FF0000"></asp:Label>
                            </blink>
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
                <b>تعلیق&nbsp; کابران:</b>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Suspention" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_SuspentionUsers" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                        <asp:TemplateField HeaderText="نوع تعلیق" SortExpression="type">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetTypeSuspention(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="type" HeaderText="نوع تعلیق" SortExpression="type" Visible="False" />
                        <asp:BoundField DataField="DateStart" HeaderText="تاریخ شروع" SortExpression="DateStart" />
                        <asp:BoundField DataField="DateEnd" HeaderText="تاریخ پایان" SortExpression="DateEnd" />
                        <asp:BoundField DataField="cuase" HeaderText="دلیل تعلیق" SortExpression="cuase" />
                        <asp:CheckBoxField DataField="flag" HeaderText="قابل نمایش برای سایر کاربران" SortExpression="flag" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ID","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                    OnCommand="DeleteSuspention" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        تعلیقی برای این کاربر وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_SuspentionUsers" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_SuspensionUsersTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="ByHow" Type="String" />
                        <asp:Parameter Name="DateStart" Type="String" />
                        <asp:Parameter Name="DateEnd" Type="String" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td class="style19">
                <blink>به کادر قرمز رنگ زیر توجه کنید</blink>
            </td>
        </tr>
        <tr>
            <td>
                <b>درج تعلیق: </b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style17">
                            درجه تعلیق:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbSuspentionType" runat="server" Style="font-family: Tahoma;
                                font-size: 11px">
                                <asp:ListItem Value="0">تعلق یک (یک هفته)</asp:ListItem>
                                <asp:ListItem Value="1">تعلیق دو (یک ماه)</asp:ListItem>
                                <asp:ListItem Value="2">تعلیق سه (اخراج)</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            تاریخ شروع:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSuspentionDateS" runat="server" Style="font-family: Tahoma; font-size: 11px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSuspentionDateS"
                                ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            تاریخ پایان:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSuspentionDateE" runat="server" Style="font-family: Tahoma; font-size: 11px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSuspentionDateE"
                                ErrorMessage="حتـــــــــــــــــــــــــــما باید محاسبه و نوشته شود.********************"
                                ValidationGroup="2"></asp:RequiredFieldValidator>
                            <br />
                            <blink>
                            <span style="color:Blue;font-size:13px;">
                            توجه بسیار بسیار مهم:
                            (تاریخ پایان) حتما باید براساس نوع تعلیق حساب شده و در کادر مریوطه نوشته شود.
                            </span>
                                                        </blink>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            &nbsp;
                        </td>
                        <td>
                            تعلیق یک:&nbsp; فاصله بین دو تاریخ باید <span class="style18">یک هفته </span>باشد<br />
                            تعلیق دو :&nbsp; فاصله بین دو تاریخ باید <span class="style18">یک ماه </span>باشد<br />
                            تعلیق سه:&nbsp; <span class="style18">اخراج</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            دلیل:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSuspentionCuase" runat="server" Height="208px" TextMode="MultiLine"
                                Width="770px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSuspentionCuase"
                                ErrorMessage="این دلیل برای کاربر به نمایش در می آید ، درست نوشته شود" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            نمایش برای سایر&nbsp; کاربران:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RbSuspention" runat="server">
                                <asp:ListItem Value="1">نمایش داده شود</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">عدم نمایش</asp:ListItem>
                            </asp:RadioButtonList>
                            
                            <span style="color:Red;">
                            با این مشخصه کاربران در قسمت (کاربران اخراج شده) می توانند لیست کاربران اخراج شده را مشاهده کنند.
                            </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnInsertSuspention" runat="server" Style="font-size: 11px; font-family: Tahoma;
                    height: 21px" Text="ثبت" ValidationGroup="2" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="background-color: Red; padding: 10px; -moz-border-radius: 3px; color: White;">
                    <table class="style1">
                        <tr>
                            <td>
                                بعد از تعلیق ، پروفایل کاربر بسته می شود اگر قصد برون آوردن کاربر را از حالت بسته
                                شده پروفایلش را دارید&nbsp; یعنی همه تعلیق های او را پاک کردید یا کلا می خواهید
                                دیگر پروفایلش بسته نباشد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                لطفا دگمه زیر را فشار دهید
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnExitBand" runat="server" Text="بیرون از آمدن از حالت تعلیق" Style="font-family: Tahoma;
                                    font-size: 11px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
