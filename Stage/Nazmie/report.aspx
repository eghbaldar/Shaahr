<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="report.aspx.vb" Inherits="Stage_Nazmie_report" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style7
        {
            width: 116px;
        }
        .style8
        {
            width: 100%;
        }
        .style9
        {
            width: 59px;
        }
        .style10
        {
            idth: 93px;
        }
        .style11
        {
            width: 115px;
        }
        .style12
        {
            width: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            گزارش تخلف کاربران
        </div>
        <div style="width: 733px; padding: 5px; float: right;">
            <div style="float: right;">
                <img src="../../content/images/Stage/Nazmie/Report_.png" />
            </div>
            <div style="padding: 2px;">
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                <div style="padding: 5px; color: #0d6d87;">
                    <asp:Label ID="lblReportUser" runat="server"></asp:Label></div>
                <div style="padding-right: 5px; color: #0d6d87;">
                    <asp:Label ID="lblReportDetective" runat="server"></asp:Label></div>
            </div>
        </div>
        <asp:MultiView ID="MultiView_Orjinal" runat="server" ActiveViewIndex="0">
            <asp:View ID="V" runat="server">
                <div style="float: right; border-top: 4px solid #e8e8e8; padding-top: 4px;">
                    <table class="style8">
                        <tr>
                            <td class="style12">
                                <img src="../../content/images/Stage/Nazmie/Report_User.png" />
                            </td>
                            <td>
                                <img src="../../content/images/Stage/Nazmie/Report_text_user.png" />
                            </td>
                        </tr>
                    </table>
                    <table class="style6">
                        <tr>
                            <td class="style7">
                                نوع تخلف:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbCrimeUser" Style="font-family: Tahoma; font-size: 11px;
                                    border: 1px solid #ccc;" runat="server" DataSourceID="ODS_Crime" DataTextField="subject"
                                    DataValueField="code" Height="22px" ValidationGroup="1">
                                </asp:DropDownList>
                                (<a target="_blank" style="color: Blue; text-decoration: none;" href="law.aspx?law=crime">توضیحات
                                    کامل تخلفات</a>)
                                <asp:ObjectDataSource ID="ODS_Crime" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_CrimeTableAdapter">
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
                            <td class="style7">
                            </td>
                            <td>
                                <asp:MultiView ID="MultiView" runat="server">
                                    <asp:View ID="V_User" runat="server">
                                        <table class="style8">
                                            <tr>
                                                <td class="style9">
                                                    نام کاربری:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblUsername" runat="server" Style="font-weight: 700; color: #005791"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="V_OutUser" runat="server">
                                        <table class="style8">
                                            <tr>
                                                <td class="style10">
                                                    نام و نام خانوادگی:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFnLn" runat="server" Width="202px" Style="font-family: Tahoma;
                                                        font-size: 11px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFnLn"
                                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style10">
                                                    پست الکترونیکی:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmailOut" runat="server" Style="text-align: left" Width="202px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailOut"
                                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailOut"
                                                        ErrorMessage="فرمت پست الکترونیکی خود را اصلاح کنید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ValidationGroup="1"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                آدرس صفحه تخلف:
                            </td>
                            <td>
                                <asp:TextBox ID="txtLink" runat="server" Width="607px" Style="text-align: left; border: 1px solid #ccc;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLink"
                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                سطح تخلف:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbLevelUser" runat="server" Height="22px" Style="font-family: Tahoma;
                                    font-size: 11px">
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>بد</asp:ListItem>
                                    <asp:ListItem>خیلی بد</asp:ListItem>
                                    <asp:ListItem>فاجعه</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="style8">
                        <tr>
                            <td>
                                علت شکایت:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtCuase" runat="server" Height="98px" Style="font-family: Tahoma;
                                    border: 1px solid #ccc; font-size: 12px; background-color: #E6F0FF;" TextMode="MultiLine"
                                    Width="728px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCuase"
                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnUser" ValidationGroup="1" Style="color: #096D9E; font-family: koodak;
                                    font-size: 16px; text-decoration: none; margin-right: 2px;" runat="server">ارسال</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; border-top: 4px solid #e8e8e8; padding-top: 4px; width: 746px;">
                    <table class="style8">
                        <tr>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <img src="../../content/images/Stage/Nazmie/Report_%20Detective.png" />
                            </td>
                            <td>
                                <img src="../../content/images/Stage/Nazmie/Report_text_detective.png" />
                            </td>
                        </tr>
                    </table>
                    <asp:MultiView ID="MultiView_Detective" runat="server" ActiveViewIndex="0">
                        <asp:View ID="V_Detective_OK" runat="server">
                            <table class="style6">
                                <tr>
                                    <td class="style11">
                                        نوع تخلف:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbCrimeDetective" runat="server" DataSourceID="ODS_Crime"
                                            DataTextField="subject" DataValueField="code" Height="22px" Style="font-family: Tahoma;
                                            font-size: 11px; border: 1px solid #ccc;" ValidationGroup="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        &nbsp;آدرس صفحه تخلف:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLinkDetective" runat="server" Style="text-align: left; border: 1px solid #ccc;"
                                            Width="607px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLinkDetective"
                                            ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        سطح تخلف:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbLevelDetective" runat="server" Height="22px" Style="font-family: Tahoma;
                                            font-size: 11px">
                                            <asp:ListItem>متوسط</asp:ListItem>
                                            <asp:ListItem>بد</asp:ListItem>
                                            <asp:ListItem>خیلی بد</asp:ListItem>
                                            <asp:ListItem>فاجعه</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        &nbsp;
                                    </td>
                                    <td>
                                        علت شکایت:
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCuaseDetective" runat="server" Height="98px" Style="font-family: Tahoma;
                                            border: 1px solid #ccc; font-size: 12px; background-color: #E6F0FF;" TextMode="MultiLine"
                                            Width="607px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCuaseDetective"
                                            ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        <asp:LinkButton ID="btnDetective" ValidationGroup="2" Style="color: #096D9E; font-family: koodak;
                                            font-size: 16px; text-decoration: none; margin-right: 2px;" runat="server">ارسال</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="V_Detective_NOK" runat="server">
                            <div style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde; margin-top: 2px;
                                width: 743px; height: 100%; background-color: #f3fbff;" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <img src="../../content/images/Home/stop.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شما عضو کارگاهان نظمیه نمی باشید.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </asp:View>
            <asp:View ID="V_Success" runat="server">
                <div style="float: right; margin-top: 5px; border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                    width: 737px; height: 100%; background-color: #f3fbff;" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img src="../../content/images/Home/Accept.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                اعلام تخلف شما بدرستی برای نظمیه فرستاده شد.لطفا منتظر بمانید .
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
