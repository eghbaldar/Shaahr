<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="GroupMsg.aspx.vb" Inherits="Management_Admin_GroupMsg" Title="Untitled Page" %>

<%@ Register Src="../UserControl/CMS_FilteringUsers.ascx" TagName="CMS_FilteringUsers"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            color: #0000FF;
            font-size: 25px;
        }
        .style16
        {
            width: 57px;
        }
        .style17
        {
            width: 63px;
        }
        .style18
        {
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>ارسال پیام&nbsp; گروهای سیستمی</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                ::::::::: <span class="style13">ارسال به همه</span>
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 3px dotted #FF9595; color: red; font-size: 12px; padding: 5px;
                    -moz-border-radius: 10px; padding: 10px;">
                    <span style="font-weight: bold;">نکات در مورد ارسال به همه</span>
                    <br />
                    <br />
                    ***** ممکن است کمی طول بکشد لطفا صبور باشید و تا پایان منتظر بمانید
                    <br />
                    <br />
                    ***** لطفا این عمل را در زمانی انجام دهید که سرعت اینترنت شما بالا باشد
                    <br />
                    <br />
                    ***** از باز کردن صفحه جدید و یا دانلود فایل دیگر خودداری کنید
                    <br />
                    <br />
                    ********** علت تذکرات بالا این است که که پیام شما باید برای کل کاربران ارسال شود
                    و بدلیل تعداد بالای کاربران ممکن است در اثر رعایت نکردن نکات بالا و قطع شدن و ناقض
                    ماندن ارسال اطلاعات ، پبام شما به بضعی ها برسد و به بعضی ها نرسد، بنابراین نکات
                    بالا را رعایت کنید.
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<table class="style1">
                    <tr>
                        <td class="style16">
                            موضوع پیام:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Width="333px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMsg"
                                ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            متن پیام:
                        </td>
                        <td>
                            <asp:TextBox ID="txtMsg" runat="server" Height="162px" Style="font-family: Tahoma;
                                font-size: 11px" TextMode="MultiLine" Width="741px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject"
                                ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSendMSG" runat="server" OnClientClick="return confirm('مطمئن هستید؟');"
                                Style="font-family: Tahoma; font-size: 11px" Text="ارسال" ValidationGroup="1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSendGroupMsg" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                ::::::::: <span class="style13">ارسال با فیلترینگ</span>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:CMS_FilteringUsers ID="CMS_FilteringUsers" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="background-color: Red; text-align: center; color: White; -moz-border-radius: 6px;
                    padding: 3px;">
                    <blink>مدیر عزیز: ابتدا در بخش فیلترینگ بالا کاربران مورد نظر خود 
                را بیاب و سپس مطلب مورد نظر را ارسال کن در غیر این صورت ممکن است پیام خالی ارسال 
                شود.</blink>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style4">
                    <tr>
                        <td class="style17">
                            موضوع پیام:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubjectByFilter" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Width="333px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMsgByFilter"
                                ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            متن پیام:
                        </td>
                        <td>
                            <asp:TextBox ID="txtMsgByFilter" runat="server" Height="162px" Style="font-family: Tahoma;
                                font-size: 11px" TextMode="MultiLine" Width="741px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSubjectByFilter"
                                ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSendMSGByFilter" runat="server" Text="ارسال" OnClientClick="return confirm('حتما حتما حتما حتما ...... مطمئن شوید که قبل از تاید کاربران مورد نظر را انتخاب کرده اید.');"
                                Style="font-family: Tahoma; font-size: 11px" ValidationGroup="2" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:Label ID="lblSendGroupMsgByFilter" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <b>حذف پیام های یکماه <span class="style18">(از یک ماه گذشته - برای کم کردن حجم 
                دیتابیس)</span></b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCountMsgExpire" runat="server" 
                    style="font-size: 15px; color: #FF0000; font-weight: 700;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_ShowMsgExpire" runat="server" AutoPostBack="True" 
                    Text="نمایش پیام های از یکماه گذشته" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_MsgExpire" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="ODS_MsgExpire" ForeColor="#333333" 
                    GridLines="None" Visible="False">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:BoundField DataField="subject" HeaderText="موضوع" 
                            SortExpression="subject" />
                        <asp:BoundField DataField="message" HeaderText="پیام" 
                            SortExpression="message" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پیامی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_MsgExpire" runat="server" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DS_CMS_SendGroupMSGTableAdapters.GroupsMessages_ExpireTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="cur_sal" Type="String" />
                        <asp:Parameter Name="cur_mah" Type="String" />
                        <asp:Parameter Name="cur_roz" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="DeleteMsgExpire" runat="server" 
                OnClientClick="return confirm('مطمئن؟');"
                    style="font-family: Tahoma; font-size: 11px" Text="حذف پیام ها" />
            </td>
        </tr>
    </table>
</asp:Content>
