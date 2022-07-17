<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false" CodeFile="newsCom.aspx.vb" Inherits="Management_Admin_newsCom" title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 71px;
        }
        .style15
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style13">
                دسته خبر:</td>
            <td>
                            <asp:DropDownList ID="cmb_Category" runat="server" DataSourceID="ODS_Category" DataTextField="Name_Category"
                                DataValueField="Code_Category" Style="font-family: Tahoma; font-size: 12px" Width="385px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Category" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_NewsTableAdapters.CMS_NewsCategoryTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Code_Category" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name_Category" Type="String" />
                                    <asp:Parameter Name="Original_Code_Category" Type="Int64" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name_Category" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
        </tr>
        <tr>
            <td class="style13">
                خبر برای کجا؟</td>
            <td>
                            <asp:RadioButtonList ID="rbType" runat="server">
                                <asp:ListItem Value="0">خبر سایت (اصلی)</asp:ListItem>
                                <asp:ListItem Value="1">خبر صفحه اول شهر (ساختمان مدیریتی)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
        </tr>
        <tr>
            <td class="style13">
                عنوان خبر:</td>
            <td>
                            <asp:TextBox ID="txtTitle" runat="server" Width="380px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtTitle" ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
        </tr>
        <tr>
            <td class="style13">
                خلاصه خبر:</td>
            <td>
                            <asp:TextBox ID="txtBreif" runat="server" Height="56px" TextMode="MultiLine" 
                                Width="380px"></asp:TextBox>
                            <span class="style15">از 20 کلمه تجاوز نکند.</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtBreif" ErrorMessage="تکمیل نشده است" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
        </tr>
        <tr>
            <td class="style13">
                خبر کامل:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ControlToValidate="FCKeditor" ErrorMessage="*" 
                                ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
            <td>
                            <FCKeditorV2:FCKeditor ID="FCKeditor" runat="server" 
                                BasePath="~/Management/content/fckeditor/" Height="500px">
                            </FCKeditorV2:FCKeditor>
                        </td>
        </tr>
        <tr>
            <td class="style13">
                تاریخ:</td>
            <td>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
                زمان:</td>
            <td>
                <asp:Label ID="lblTime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
                قابل نمایش:</td>
            <td>
                            <asp:CheckBox ID="chk" runat="server" Checked="True" />
                        </td>
        </tr>
        <tr>
            <td class="style13">
                گذارنده خبر:</td>
            <td>
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
                            <asp:ImageButton ID="btnInsertNews" runat="server" 
                                ImageUrl="~/Management/Content/Images/btnSend.jpg" ValidationGroup="2" />
                        </td>
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
</asp:Content>

