<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false" CodeFile="MasolinShaahrDetail.aspx.vb" Inherits="Management_Admin_Shaahr_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" 
        Width="906px">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td class="style13">
                        <asp:Label ID="Title_PostLabel" runat="server" 
                            style="font-weight: 700; font-size: large; color: #6600CC" 
                            Text='<%# Eval("Title_Post") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Image ID="ImageButton1" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                    runat="server" Height="50px" Width="50px" />
                        <asp:Button ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("email","{0}") %>'
                                    OnCommand="GotoDetail"
                            style="font-size: 9px; font-family: Tahoma" Text="دیدن جزییات کاربر" />
                            
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>مسئولیت:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ResponsibiltyLabel" runat="server" 
                            Text='<%# Eval("Responsibilty") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <b>CV:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CVLabel" runat="server" Text='<%# Eval("CV") %>' />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_Authorities_RowTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

