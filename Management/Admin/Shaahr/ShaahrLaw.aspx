<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false" CodeFile="ShaahrLaw.aspx.vb" Inherits="Management_Admin_Shaahr_Default" title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 46px;
        }
        .style14
        {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>قوانین</b></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="cmbLaw" runat="server" 
                                        style="font-family:Tahoma;font-size:12px;padding:5px;width:300px;" 
                                        AutoPostBack="True">
                                        <asp:ListItem Value="0">دپارتمان ریاست جمهوری</asp:ListItem>
                                        <asp:ListItem Value="1">استان اول</asp:ListItem>
                                        <asp:ListItem Value="2">استان دوم</asp:ListItem>
                                        <asp:ListItem Value="3">استان سوم</asp:ListItem>
                                        <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                                        <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                                        <asp:ListItem Value="6">تاسیس شهر</asp:ListItem>
                                        <asp:ListItem Value="7">شهرها</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="DGLaw" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="ODS" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                        Width="898px">
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="ID" Visible="False" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" 
                                                Visible="False" />
                                            <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title" />
                                            <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" 
                                                Visible="False" />
                                            <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                                            <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                
                                                    <asp:Button ID="Button2"
                                                    OnCommand="Delete"
                                                    CommandArgument='<%# Eval("id","{0}") %>'
                                                    OnClientClick="return confirm('sure?');"
                                                     runat="server" BackColor="Red" ForeColor="White" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="حذف" />
                                                        
                                                    <asp:Button ID="Button3" runat="server" 
                                                     OnCommand="Edit"
                                                    CommandArgument='<%# Eval("id","{0}") %>'
                                                        style="font-size: 11px; font-family: Tahoma" Text="ویرایش" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            رکوردی وجود ندارد.
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_LawTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cmbLaw" Name="type" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="text" Type="String" />
                                            <asp:Parameter Name="time" Type="String" />
                                            <asp:Parameter Name="_date" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="PnlEdit" runat="server" BackColor="#FFFF99" Visible="False">
                                        <b>ویاریش<br />
                                        </b>
                                        <table class="style1">
                                            <tr>
                                                <td class="style14">
                                                    گروه:</td>
                                                <td>
                                                    <asp:DropDownList ID="cmbLawEdit" runat="server" 
                                                        style="font-family:Tahoma;font-size:12px;padding:5px;width:300px;">
                                                        <asp:ListItem Value="0">دپارتمان ریاست جمهوری</asp:ListItem>
                                                        <asp:ListItem Value="1">استان اول</asp:ListItem>
                                                        <asp:ListItem Value="2">استان دوم</asp:ListItem>
                                                        <asp:ListItem Value="3">استان سوم</asp:ListItem>
                                                        <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                                                        <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                                                        <asp:ListItem Value="6">تاسیس شهر</asp:ListItem>
                                                        <asp:ListItem Value="7">شهرها</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style14">
                                                    عنوان:</td>
                                                <td>
                                                    <asp:TextBox ID="txtTitleEdit" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Width="700px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ControlToValidate="txtTitleEdit" ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style14">
                                                    قانون:</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                        ControlToValidate="txtLawEdit" ErrorMessage="RequiredFieldValidator" 
                                                        ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style14">
                                                    &nbsp;</td>
                                                <td>
                                                    <FCKeditorV2:FCKeditor ID="txtLawEdit" runat="server" 
                                                        BasePath="~/Management/content/fckeditor/" Height="500px">
                                                    </FCKeditorV2:FCKeditor>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style14">
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="btnUpdate" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="ارسال" ValidationGroup="2" />
                                                    <asp:Button ID="Button4" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="لـــــــــــغو" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <b>درج قوانین</b></td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            گروه:</td>
                        <td>
                                    <asp:DropDownList ID="cmbLawInsert" runat="server" 
                                style="font-family:Tahoma;font-size:12px;padding:5px;width:300px;">
                                        <asp:ListItem Value="0">دپارتمان ریاست جمهوری</asp:ListItem>
                                        <asp:ListItem Value="1">استان اول</asp:ListItem>
                                        <asp:ListItem Value="2">استان دوم</asp:ListItem>
                                        <asp:ListItem Value="3">استان سوم</asp:ListItem>
                                        <asp:ListItem Value="4">استان چهارم</asp:ListItem>
                                        <asp:ListItem Value="5">استان پنجم</asp:ListItem>
                                        <asp:ListItem Value="6">تاسیس شهر</asp:ListItem>
                                        <asp:ListItem Value="7">شهرها</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            عنوان:</td>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Width="700px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtTitle" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            قانون:</td>
                        <td>
                            &gt;&gt;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtLaw" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            <FCKeditorV2:FCKeditor ID="txtLaw" runat="server" 
                                BasePath="~/Management/content/fckeditor/" Height="500px">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnInsert" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" 
                                ValidationGroup="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

