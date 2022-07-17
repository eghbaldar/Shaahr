<%@ Page Language="VB" MasterPageFile="~/home/Home.master" AutoEventWireup="false"
    CodeFile="Photos.aspx.vb" Inherits="home_PhotoAlbum" Title="Untitled Page" %>

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

    <script language="javascript" type="text/javascript">
    function OpenFileUpload()
    { 
     document.getElementById('<%= PhotoUpload.ClientID%>').click();
    }    
    </script>

    <!-- End  -->
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                      "../content/font/W_koodak.TTF" );
        }
        .style7
        {
            width: 100%;
        }
        .style6
        {
            width: 72px;
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
    <div style="width: 738px; height: 55px; border-bottom: 1px solid #ccc; padding-right: 7px;">
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnUploadPhoto" runat="server"
                        ImageUrl="~/content/images/Home/UploadPhoto_InThisAlbum.jpg" />
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="BtnAlbumDelete" runat="server"
                        ImageUrl="~/content/images/Home/DeleteAlbum.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAlbumName_" runat="server" Style="font-size: 13px;"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
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
                </div>
                <div style="margin-top: 50px; float: right;">
                </div>
            </div>
        </asp:View>
        <asp:View ID="V_Transfer" runat="server">
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
                    <table class="style7">
                        <tr>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style6">
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" 
                                                CommandArgument='<%# Eval("code", "{0}")+"|"+Eval("for_who", "{0}") %>' Height="96px"
                                                href="#dialog2" Style="border: 3px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px;
                                                -webkit-border-radius: 4px; border-radius: 4px;" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=127&H=96" %>'
                                                name="modal" OnCommand="ShowPhoto" Width="127px" />
                                        </td>
                                        <td>
                                            <table class="style7">
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
                                                        <div style="border: 1px solid #ccc; -moz-border-radius: 5px; width: 329px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td class="style9">
                                                                        انتقال به آلبوم:
                                                                    </td>
                                                                    <td style="width: 200px;">
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
                                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnTransfer" runat="server"
                                                                            OnCommand="Transfer" CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~/content/images/Home/Transfer.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                                            CommandArgument='<%# Eval("Code","{0}") %>' ToolTip="تصویر در پروفایل" ImageUrl="~/content/images/Profile_View_Users/Zoom.jpg"
                                                            OnCommand="ShowPhoto" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton5" runat="server"
                                                            CommandArgument='<%# Eval("Code","{0}") %>' ToolTip="تصویر در خانه" ImageUrl="~/content/images/Profile_View_Users/Zoom2.jpg"
                                                            OnCommand="RedirectPhoto" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDownloadFile" runat="server"
                                                            CommandArgument='<%# Eval("string_factor","{0}") %>' ToolTip="دانلود تصویر" ImageUrl="~/content/images/Profile_View_Users/Download.jpg"
                                                            OnCommand="DownloadFile" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDelete" CommandArgument='<%# Eval("Code","{0}") %>'
                                                            OnCommand="DeletePhoto" runat="server" ToolTip="حذف تصویر" ImageUrl="~/content/images/Home/Delete.png" />
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
            <asp:Label ID="lblNotPhoto" runat="server"></asp:Label>
            <asp:ObjectDataSource ID="ODS_Photos" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.ProfilePhotosTableAdapter">
                <DeleteParameters>
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="code_album" QueryStringField="code" Type="Int64" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="V_UploadPhoto" runat="server">
            <div style="width: 738px; height: 100%; border-bottom: 1px solid #ccc; padding-right: 7px;">
                <table class="style7">
                    <tr>
                        <td>
                            <asp:FileUpload ID="PhotoUpload" runat="server" Style="display: none;" />
                            <a href="javascript:void(0)" onclick="OpenFileUpload()" style="font-family: koodak;
                                font-size: 12px; color: #0992C0; text-decoration: none; margin-right: 2px; text-shadow: 0.2em 0.2em #DFDFDF;">
                                ( فایل خود را از اینجا انتخاب کنید ) </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 30px;">
                                        آلبوم :
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:Label ID="lblAlbumName" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPhoto" Text="توضیحات تصویر شما ..." runat="server" Style="margin-top: 3px;
                                padding: 2px; border: solid #adbfc5 thin;" ForeColor="#999999" onfocus="if(this.value=='توضیحات تصویر شما ...'){this.value='';}"
                                onblur="if(this.value==''){this.value='توضیحات تصویر شما ...';}if(this.value=='توضیحات تصویر شما ...')this.style.color='#999999';"
                                onmousedown="this.style.color='#000000';" Width="729px" TextMode="MultiLine"
                                Height="60px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btnSendPhoto" Style="color: #096D9E; font-family: koodak; font-size: 13px;
                                text-decoration: none; margin-right: 2px;" runat="server">ارسال</asp:LinkButton>
                            /
                            <asp:LinkButton ID="btnCancelUpload" Style="color: #000; font-family: koodak; font-size: 13px;
                                text-decoration: none; margin-right: 2px;" runat="server">لغو</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="V_deleteAlbum" runat="server">
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
                                آیا با حذف این آلبوم موافق هستید؟
                            </td>
                            <td class="style12">
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDeleteAlbum" runat="server"
                                    ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelDeleteAlbum"
                                    runat="server" ImageUrl="~/content/images/Home/CancelIt.jpg" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 50px; float: right;">
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
