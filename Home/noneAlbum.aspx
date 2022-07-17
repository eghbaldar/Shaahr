<%@ Page Language="VB" MasterPageFile="~/home/Home.master" AutoEventWireup="false"
    CodeFile="noneAlbum.aspx.vb" Inherits="home_noneAlbum" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Dropdownlist  -->
    <link href="../content/js/Dropdownlist/Styles/Selectbox.css" rel="stylesheet" type="text/css" />

    <script src="../content/js/Dropdownlist/Scripts/jquery-1.5.1.js" type="text/javascript"
        charset="utf-8"></script>

    <script type="text/javascript" src="../content/js/Dropdownlist/Scripts/jquery.selectbox-0.5.js"></script>

    <script type="text/javascript">
	    $(document).ready(function () {
	        $('.selectbox').selectbox();
	    });
    </script>

    <!-- End  -->
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 20px;
        }
        .style9
        {
            width: 73px;
        }
        .style10
        {
            width: 185px;
        }
        .style11
        {
            width: 162px;
        }
        .style12
        {
            width: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="2">
        <asp:View ID="V_Delete" runat="server">
            <div style="margin-top: 5px; height: 25px; padding: 5px; background-color: #f6f6f6;
                margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                width: 520px;">
                <div style="float: right; margin-top: 8px;">
                    <img src="../content/images/Home/info.gif" />
                </div>
                <div style="float: right; margin-right: 5px;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style11">
                                آیا با حذف تصویر موافق هستید؟
                            </td>
                            <td class="style12">
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAcceptToDelete" runat="server"
                                    ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelToDelete" runat="server"
                                    ImageUrl="~/content/images/Home/CancelIt.jpg" />
                            </td>
                        </tr>
                    </table>
                    &nbsp;</div>
                <div style="margin-top: 50px; float: right;">
                </div>
            </div>
        </asp:View>
        <asp:View ID="V_Trasfer" runat="server">
            <div style="margin-top: 5px; height: 25px; padding: 5px; background-color: #f6f6f6;
                margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                width: 520px;">
                <div style="float: right; margin-top: 8px;">
                    <img src="../content/images/Home/info.gif" />
                </div>
                <div style="float: right; margin-right: 5px;">
                    <table class="style6">
                        <tr>
                            <td class="style11">
                                آیا با انتقال تصویر موافق هستید؟
                            </td>
                            <td class="style12">
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAcceptToTransfer"
                                    runat="server" ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelToTransfer"
                                    runat="server" ImageUrl="~/content/images/Home/CancelIt.jpg" />
                            </td>
                        </tr>
                    </table>
                    &nbsp;</div>
                <div style="margin-top: 50px; float: right;">
                </div>
            </div>
        </asp:View>
        <asp:View ID="V_Photos" runat="server">
            <asp:DataList ID="Dl_Photos" runat="server" DataKeyField="code" DataSourceID="ODS_Photos"
                Width="745px">
                <ItemTemplate>
                    <table class="style6">
                        <tr>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style7">
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" Style="border: 3px solid #DFDFDF;
                                                padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;"
                                                CommandArgument='<%# Eval("code", "{0}")+"|"+Eval("for_who", "{0}") %>' Height="96px"
                                                href="#dialog2" ImageUrl='<%#"~/user/CropPhoto.aspx?P=" +Eval("string_factor", "{0}")+ "&W=127&H=96" %>'
                                                name="modal" OnCommand="ShowPhoto" Width="127px" />
                                        </td>
                                        <td>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCountComment" runat="server" Text='<%# CountComment(DataBinder.Eval(Container.DataItem,"Code")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCountLike" runat="server" Text='<%# CountLike(DataBinder.Eval(Container.DataItem,"Code")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="border: 1px solid #ccc; -moz-border-radius: 5px; width: 326px;">
                                                            <table class="style6">
                                                                <tr>
                                                                    <td class="style9">
                                                                        انتقال به آلبوم:
                                                                    </td>
                                                                    <td class="style10">
                                                                        <asp:DropDownList ID="Items" runat="server" class="selectbox" ClientIDMode="Static"
                                                                            DataSourceID="ODS_Album" DataTextField="AlbumName" DataValueField="Code" name="Items"
                                                                            Style="font-family: Tahoma; font-size: 11px">
                                                                        </asp:DropDownList>
                                                                        <asp:ObjectDataSource ID="ODS_Album" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Profile_AlbumTableAdapter"
                                                                            UpdateMethod="Update">
                                                                            <DeleteParameters>
                                                                                <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                            </DeleteParameters>
                                                                            <UpdateParameters>
                                                                                <asp:Parameter Name="Email" Type="String" />
                                                                                <asp:Parameter Name="AlbumName" Type="String" />
                                                                                <asp:Parameter Name="_date" Type="String" />
                                                                                <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                            </UpdateParameters>
                                                                            <SelectParameters>
                                                                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                                                            </SelectParameters>
                                                                            <InsertParameters>
                                                                                <asp:Parameter Name="Email" Type="String" />
                                                                                <asp:Parameter Name="AlbumName" Type="String" />
                                                                                <asp:Parameter Name="_date" Type="String" />
                                                                            </InsertParameters>
                                                                        </asp:ObjectDataSource>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnTransfer" OnCommand="Transfer"
                                                                            CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~/content/images/Home/Transfer.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" CommandArgument='<%# Eval("Code","{0}") %>'
                                                            ImageUrl="~/content/images/Profile_View_Users/Zoom.jpg" ToolTip="تصویر در پروفایل"
                                                            OnCommand="ShowPhoto" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDownloadFile" CommandArgument='<%# Eval("string_factor","{0}") %>'
                                                            ToolTip="دانلود تصویر" ImageUrl="~/content/images/Profile_View_Users/Download.jpg"
                                                            OnCommand="DownloadFile" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDelete" CommandArgument='<%# Eval("Code","{0}") %>'
                                                            ImageUrl="~/content/images/Home/Delete.png" OnCommand="DeletePhoto" ToolTip="حذف تصویر" />
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
                                <asp:Label ID="Label3" runat="server" Style="color: #000000;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"detail")) %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS_Photos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.ProfilePhotos_NotAlbumTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="string_factor" Type="String" />
                    <asp:Parameter Name="for_who" Type="String" />
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="string_factor" Type="String" />
                    <asp:Parameter Name="for_who" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
