<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="photos.aspx.vb" Inherits="user_photos" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function Visible(type)
        {
            if(type=='show')
                document.getElementById('DivVisible').style.display='inline';
        }
    </script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 46px;
        }
        .style3
        {
            width: 100%;
        }
        .sComment6
        {
            width: 100%;
        }
        .sComment7
        {
            width: 456px;
        }
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 76px;
        }
    </style>
    <style type="text/css">
        .TXT_
        {
            margin-top: 1px;
            font-family: Tahoma;
            font-size: 11px;
            border: 1px solid #b0b0b0;
            padding: 2px;
            resize: none;
        }
        .Div_TXT_
        {
            background-color: #CCCCCC;
            margin-right: 46px;
            margin-top: -4px;
            width: 519px;
            padding: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 538px;
        height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
        font-family: Tahoma; font-size: 11px;">
        <div class="DivTop">
            <asp:Label ID="lblTitleInformation" runat="server" Text="" Style="color: #284d57;
                font-family: Tahoma; font-size: 11px;"></asp:Label>
        </div>
        <div style="font-family: Tahoma; font-size: 11px;">
            <asp:DataList ID="Dl_Photos" runat="server" DataKeyField="code" DataSourceID="ODS_Photos"
                Width="545px">
                <ItemTemplate>
                    <table class="style5">
                        <tr>
                            <td class="style6">
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" CommandArgument='<%# Eval("Code","{0}") %>'
                                    Height="96px" href="#dialog2" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=127&H=96" %>'
                                    Style="border: 3px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                    border-radius: 4px;" name="modal" OnCommand="ShowPhoto" Width="127px" />
                            </td>
                            <td>
                                <table class="style5">
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
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                                CommandArgument='<%# Eval("Code","{0}") %>' ImageUrl="~/content/images/Profile_View_Users/Zoom.jpg"
                                                OnCommand="ShowPhoto" />
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnDownloadFile" runat="server"
                                                CommandArgument='<%# Eval("string_factor","{0}") %>' ImageUrl="~/content/images/Profile_View_Users/Download.jpg"
                                                OnCommand="DownloadFile" />
                                                
                                                   <asp:ImageButton 
                                                            ImageUrl="~/Content/images/Stage/Nazmie/hatDecetive2.png"
                                                            ToolTip="َگزارش به نظمیه" 
                                                          OnCommand="GotoToNazmie"
                                                           ForeColor="Transparent" AlternateText=""
                                                            CommandArgument='<%# Eval("code","{0}")+"|"+Eval("Email", "{0}") %>'
                                                            ID="ImageButton4" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:Label ID="Label3" runat="server" Style="color: #000000;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"detail")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS_Photos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.ProfilePhotosTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="string_factor" Type="String" />
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="code_album" QueryStringField="code" Type="Int64" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="string_factor" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
