<%@ Page Language="VB" MasterPageFile="~/home/Menu/MyRoom/Home.master" AutoEventWireup="false"
    CodeFile="obj.aspx.vb" Inherits="home_Menu_MyRoom_obj" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 10px;
        }
        .MyBorder
        {
            margin-bottom: 2px;
            border: 1px solid #E5E5E5;
            margin-top: 2px;
            padding: 3px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
    </style>
    <style type="text/css">
        .PageS, PageS td
        {
            font-size: 11px;
            text-decoration: none;
            color: #687680;
            font-weight: bold;
        }
        .PageS a
        {
            font-size: 11px;
            text-decoration: none;
            color: #A9A9A9;
            padding: 1px;
        }
    </style>
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                   "../../../content/font/W_koodak.TTF" );
        }
        .style12
        {
            width: 717px;
        }
        .Add
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 2px solid #E5E5E5;
            width: 720px;
            background-color: #F9F9F9;
            margin-top: 3px;
            padding: 5px;
        }
        .style10
        {
            width: 759px;
        }
        .style11
        {
            width: 804px;
        }
        .style8
        {
            width: 761px;
        }
        .Font
        {
            font-family: Tahoma;
            font-size: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <table class="style6">
        <tr>
            <td class="style7">
                <img src="../../../content/images/Profile_View_Users/post_post.png" />
            </td>
            <td>
                <asp:LinkButton ID="btnMyText" Style="text-decoration: none; color: Black;" runat="server">مطالب 
                من 
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img src="../../../content/images/Profile_View_Users/post_photo.png" />
            </td>
            <td>
                <asp:LinkButton ID="btnMyPhoto" Style="text-decoration: none; color: Black;" runat="server">عکس 
                های من 
                
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img src="../../../content/images/Profile_View_Users/post_link.png" />
            </td>
            <td>
                <asp:LinkButton ID="btnMyLink" Style="text-decoration: none; color: Black;" runat="server">لینک 
                های من 
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img src="../../../content/images/Profile_View_Users/post_polling.png" />
            </td>
            <td>
                <asp:LinkButton ID="btnMyPolling" Style="text-decoration: none; color: Black;" runat="server">نظر 
                سنجی های من</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img src="../../../content/images/Profile_View_Users/post_album.jpg" />
            </td>
            <td>
                <a href="../../Album.aspx" style="text-decoration: none; color: Black;">آلبوم ها</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            <asp:Label ID="lbl" class="DivText" runat="server"></asp:Label>
        </div>
        <asp:MultiView ID="MultiView" runat="server">
            <asp:View ID="V_Text" runat="server">
                <table class="style6">
                    <tr>
                        <td>
                            <div class="Add">
                                <asp:TextBox ID="txtTitlePost" runat="server" Height="15px" Text="عنوان مطلب شما ..."
                                    ForeColor="#999999" onfocus="if(this.value=='عنوان مطلب شما ...'){this.value='';}"
                                    onblur="if(this.value==''){this.value='عنوان مطلب شما ...';}if(this.value=='عنوان مطلب شما ...')this.style.color='#999999';"
                                    onmousedown="this.style.color='#000000';" Style="margin-top: 2px; border: solid #BDBDBD thin;
                                    font-family: Tahoma; font-size: 11px;" Width="717px"></asp:TextBox>
                                <asp:TextBox ID="txtPost" Text="متن شما ..." runat="server" Style="margin-top: 3px;
                                    resize: none; border: 1px solid #BDBDBD;" ForeColor="#999999" onfocus="if(this.value=='متن شما ...'){this.value='';}"
                                    onblur="if(this.value==''){this.value='متن شما ...';}if(this.value=='متن شما ...')this.style.color='#999999';"
                                    onmousedown="this.style.color='#000000';" Width="717px" TextMode="MultiLine"
                                    Height="100px" Font-Names="tahoma" Font-Size="11px">
                                </asp:TextBox>
                                <asp:LinkButton ID="btnSendPost" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                    text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_Text" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="code" DataSourceID="ODS_Text" GridLines="None" PageSize="30" ShowHeader="False"
                                Width="735px">
                                <PagerStyle CssClass="PageS" />
                                <Columns>
                                    <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                                        <ItemTemplate>
                                            <div class="MyBorder">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style12">
                                                            <img alt="" src="../../../content/images/Profile_View_Users/post_post.png" style="width: 16px;
                                                                height: 15px" />&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" runat="server"
                                                                    ForeColor="Transparent" CommandArgument='<%# Eval("code","{0}")+"|0" %>' ImageUrl="~/content/images/Profile_View_Users/close.jpg"
                                                                    OnCommand="DeleteOBJ" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                OnCommand="ShowText" Style="text-decoration: none; color: Black;" Text='<%# Eval("detail", "{0}") %>'></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            <asp:Label ID="Label4" runat="server" Style="color: #044A97" Text='<%# "تعداد نظر ها: "+CountComment(DataBinder.Eval(Container.DataItem,"code")) %>'>
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            <asp:Label ID="Label5" runat="server" Style="color: #666666" Text='<%# "تعداد لایک ها: "+CountLike(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    مطلبی برای نمایش وجود ندارد.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="ODS_Text" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.MyTextTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_Link" runat="server">
                <table class="style6">
                    <tr>
                        <td>
                            <div class="Add">
                                <div style="margin-top: 5px">
                                    <asp:TextBox ID="txtLink" Text="Http://" runat="server" Style="text-align: left;
                                        border: solid #BDBDBD thin; direction: ltr; margin-top: 3px;" Width="717px" Font-Names="tahoma"
                                        Font-Size="11px"></asp:TextBox>
                                    <asp:TextBox ID="txtTextLink" Text="توضیحات لینک شما ..." runat="server" Style="margin-top: 3px;
                                        resize: none; border: solid #BDBDBD thin;" ForeColor="#999999" onfocus="if(this.value=='توضیحات لینک شما ...'){this.value='';}"
                                        onblur="if(this.value==''){this.value='توضیحات لینک شما ...';}if(this.value=='توضیحات لینک شما ...')this.style.color='#999999';"
                                        onmousedown="this.style.color='#000000';" Width="717px" TextMode="MultiLine"
                                        Height="100px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                                    <asp:LinkButton ID="btnSendLink" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_Link" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="code" DataSourceID="ODS_link" GridLines="None" PageSize="30" ShowHeader="False"
                                Width="739px">
                                <PagerStyle CssClass="PageS" />
                                <Columns>
                                    <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                                        <ItemTemplate>
                                            <div class="MyBorder">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style10">
                                                            <img alt="" src="../../../content/images/Profile_View_Users/post_link.png" style="width: 16px;
                                                                height: 15px" />&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" runat="server"
                                                                    ForeColor="Transparent" CommandArgument='<%# Eval("code","{0}")+"|1" %>' ImageUrl="~/content/images/Profile_View_Users/close.jpg"
                                                                    OnCommand="DeleteOBJ" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                OnCommand="ShowText" Style="text-decoration: none; color: Black;" Text='<%# Eval("detail", "{0}") %>'></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            <asp:Label ID="Label6" runat="server" Style="color: #044A97" Text='<%# "تعداد نظر ها: "+CountComment(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            <asp:Label ID="Label7" runat="server" Style="color: #666666" Text='<%# "تعداد لایک ها: "+CountLike(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    لینکی برای نمایش وجود ندارد.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="ODS_link" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.MyLinkTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_Photo" runat="server">
                <table class="style6">
                    <tr>
                        <td>
                            <div class="Add">
                                <asp:ImageButton ID="btnGotoAlbum" runat="server" ForeColor="Transparent" ImageUrl="~/Content/images/Home/Albums.jpg"
                                    runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="DG_Photo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="code" DataSourceID="ODS_Photo" GridLines="None" PageSize="30" ShowHeader="False"
                                Width="739px">
                                <PagerStyle CssClass="PageS" />
                                <Columns>
                                    <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                                        <ItemTemplate>
                                            <div class="MyBorder">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style11">
                                                            <img alt="" src="../../../content/images/Profile_View_Users/post_photo.png" style="width: 16px;
                                                                height: 16px" />&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ForeColor="Transparent"
                                                                    runat="server" CommandArgument='<%# Eval("code","{0}")+"|2" %>' ImageUrl="~/content/images/Profile_View_Users/close.jpg"
                                                                    OnCommand="DeleteOBJ" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                OnCommand="ShowText" Style="text-decoration: none; color: Black;" Text='<%# Eval("detail", "{0}") %>'></asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            <asp:Label ID="Label8" runat="server" Style="color: #044A97" Text='<%# "تعداد نظر ها: "+CountComment(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            <asp:Label ID="Label9" runat="server" Style="color: #666666" Text='<%# "تعداد لایک ها: "+CountLike(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    عکسی برای نمایش وجود ندارد.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="ODS_Photo" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.MyPhotoTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_Polling" runat="server">
                <%-- <asp:UpdatePanel ID="UP_Pooling" runat="server">
                <ContentTemplate>--%>
                <table class="style6">
                    <tr>
                        <td>
                            <asp:GridView ID="DG_Polling" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="code" DataSourceID="ODS_Polling" GridLines="None" PageSize="30"
                                ShowHeader="False" Width="739px">
                                <PagerStyle CssClass="PageS" />
                                <Columns>
                                    <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                                        <ItemTemplate>
                                            <div class="MyBorder">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style8">
                                                            <img alt="" src="../../../content/images/Profile_View_Users/post_polling.png" style="width: 16px;
                                                                height: 15px" />&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent"
                                                                    runat="server" CommandArgument='<%# Eval("code","{0}")+"|3" %>' ImageUrl="~/content/images/Profile_View_Users/close.jpg"
                                                                    OnCommand="DeleteOBJ" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style8">
                                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                OnCommand="ShowText" Style="text-decoration: none; color: Black;" Text='<%# Eval("detail", "{0}") %>'></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style8">
                                                            <asp:Label ID="Label2" runat="server" Style="color: #044A97" Text='<%# "تعداد نظر ها: "+CountComment(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style8">
                                                            <asp:Label ID="Label3" runat="server" Style="color: #666666" Text='<%# "تعداد لایک ها: "+CountLike(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    نظر سنجی برای نمایش وجود ندارد.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                <asp:ObjectDataSource ID="ODS_Polling" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.MyPollingTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_Delete" runat="server">
                <div style="padding: 3px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 162px;">
                                آیا با حذف موافق هستید؟
                            </td>
                            <td style="width: 37px;">
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
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
