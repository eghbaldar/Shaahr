<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="J-transfer.aspx.vb" Inherits="Stage_Jiring_J_transfer" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 126px;
        }
        .style4
        {
            color: #666666;
        }
        .style5
        {
            width: 126px;
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            انتقال جیرینگ
        </div>
        <div style="width: 744px; padding: 5px; float: right;">
            <div style="float: right;">
                <img src="../../content/images/Stage/Jiring/trans-j.png" /></div>
            <div style="padding: 2px;">
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
        </div>
        <div style="width: 744px; float: right; padding: 5px;">
            <table class="style1">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width: 742px;">
                            <div style="width: 200px; float: right;">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:MultiView ID="MV" runat="server" ActiveViewIndex="0">
                                            <asp:View runat="server" ID="V_Users">
                                                <div style="border: 1px dotted #ccc; width: 720px; padding: 2px;">
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style4">
                                                                انتخاب کاربر برای انتقال جیرینگ
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:DataList ID="DG" runat="server" DataSourceID="ODS_My_Friends" RepeatColumns="4"
                                                                    RepeatDirection="Horizontal">
                                                                    <ItemTemplate>
                                                                        <div style="width: 172px;">
                                                                            <table style="width: 100%;">
                                                                                <tr>
                                                                                    <td style="width: 50px;">
                                                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton6" runat="server"
                                                                                            CommandArgument='<%# Eval("user","{0}") %>' Height="45px" ImageUrl='<%# GetAvatar(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                                                            OnCommand="SetSenderUser" Width="45px" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <asp:Label ID="lbl" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:ObjectDataSource ID="ODS_My_Friends" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyRelationshipTableAdapter">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                                        </SelectParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="user" Type="String" />
                                                        </InsertParameters>
                                                    </asp:ObjectDataSource>
                                                </div>
                                            </asp:View>
                                            <asp:View runat="server" ID="V_Transfer">
                                                <table class="style1">
                                                    <tr>
                                                        <td>
                                                            <div runat="server" id="Div_transferJ" style="float: right; border: 1px dotted #ccc;
                                                                margin-right: 3px; width: 713px; padding: 2px;">
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td class="style5">
                                                                            ارسال جیرینگ
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style5">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style3">
                                                                            نام کاربر:
                                                                        </td>
                                                                        <td>
                                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:TextBox ID="txtSender" runat="server" Style="border: none; width: 300px; font-family: Tahoma;
                                                                                        font-size: 11px;" ReadOnly="True"></asp:TextBox>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style3">
                                                                            مبلغ جیرینگ ارسالی:
                                                                        </td>
                                                                        <td>
                                                                            <div style="border: 1px solid #ccc; padding: 3px; width: 150px; color: Gray;">
                                                                                <asp:TextBox Style="border: none; width: 130px; text-align: center; font-family: Tahoma;
                                                                                    font-size: 11px; font-weight: bold;" ID="txtJiring" Text="جیرینگ..." ForeColor="#999999"
                                                                                    onfocus="if(this.value=='جیرینگ...'){this.value='';}" onblur="if(this.value==''){this.value='جیرینگ...';}if(this.value=='جیرینگ...')this.style.color='#999999';"
                                                                                    onmousedown="this.style.color='#000000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                                                    runat="server"></asp:TextBox>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style3">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="btnTransfer" ValidationGroup="1" Style="color: #096D9E; font-family: koodak;
                                                                                font-size: 13px; text-decoration: none; margin-right: 2px;" runat="server">ارسال 
                                                                            . . .</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table class="style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblWrong" runat="server" Style="color: #FF0000"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSender"
                                                                            ErrorMessage="کاربری انتخاب نشده است." ValidationGroup="1"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJiring"
                                                                            ErrorMessage="مبلغ جیرینگ را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtJiring"
                                                                            ErrorMessage="فرمت مبلغ را صحیح وارد کنید - در محدوده 0 تا 1000000" MaximumValue="1000000"
                                                                            MinimumValue="0" Type="Integer" ValidationGroup="1"></asp:RangeValidator>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                        </asp:MultiView>
                                        <div>
                                            <asp:Label ID="lblNotAllow" runat="server" Style="color: Red;"></asp:Label></div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
