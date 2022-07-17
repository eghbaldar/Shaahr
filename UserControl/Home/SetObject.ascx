<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SetObject.ascx.vb" Inherits="UserControl_Home_SetObject" %>
<!-- -->

<script language="javascript" type="text/javascript">
 function OpenPage()
 {
    window.open('../stage/chat/')//,'_self','scrollbars=no,menubar=no,height=600,width=800,directories=no,resizable=no,toolbar=no,location=no,status=no');
 }

</script>

<asp:UpdatePanel ID="Up_SetObject" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="notification_album_update__header">
            <style type="text/css">
                .Font
                {
                    font-family: Tahoma;
                    font-size: 11px;
                }
                .Margin
                {
                    margin-top: 3px;
                }
            </style>
            <div style="width: 300px;">
                <img src="../content/images/Home/set_profile.png" onmousemove="return Action('dFriends');"
                    style="cursor: pointer;" />
                <img src="../content/images/Home/set_family.png" onmousemove="return Action('dFamilys');"
                    style="cursor: pointer;" />
                <img src="../content/images/Home/set_camera.png" onmousemove="return Action('dPhotos');"
                    style="cursor: pointer;" />
                <img src="../content/images/Home/set_post.png" onmousemove="return Action('dPost');"
                    style="cursor: pointer;" />
                <img src="../content/images/Home/set_link.png" onmousemove="return Action('dLinks');"
                    style="cursor: pointer;" />
                <img src="../content/images/Home/set_polling.png" onmousemove="return Action('dPolling');"
                    style="cursor: pointer;" />
            </div>
        </div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="Up_SetObject">
            <ProgressTemplate>
                <div style="padding-top: 4px; float: right;">
                    <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <script type="text/javascript">
            function Action(e)
            {
                document.getElementById('object').style.display="inline";/****/
                document.getElementById('dFriends').style.display="none";
                document.getElementById('dFamilys').style.display="none";
                document.getElementById('dPhotos').style.display="none";
                document.getElementById('dPost').style.display="none";
                document.getElementById('dLinks').style.display="none";
                document.getElementById('dPolling').style.display="none";
                document.getElementById('<%= dSuccess.ClientID %>').style.display="none";
                document.getElementById(e).style.display="inline";
                
            }
        </script>

        <div id="object" style="margin-top: 3px; display: none;">

            <script type="text/javascript">
                                            function OpenDetail(FnLn,Login,Type){                                         
                                            document.getElementById('DivDetail').style.display="inline";
                                            document.getElementById('DivName').innerHTML=FnLn;
                                            document.getElementById('DivLastLogin').innerHTML=Login;
                                            document.getElementById('DivTypeFriendFamily').innerHTML=Type;
                                            }
                                            function CloseDetail(){                                            
                                            document.getElementById('DivDetail').style.display="none";
                                            }
                                            function OpenDetail2(FnLn,Login,Type){                                            
                                            document.getElementById('DivDetail2').style.display="inline";
                                            document.getElementById('DivName2').innerHTML=FnLn;
                                            document.getElementById('DivLastLogin2').innerHTML=Login;
                                            document.getElementById('DivTypeFriendFamily2').innerHTML=Type;
                                            }
                                            function CloseDetail2(){                                            
                                            document.getElementById('DivDetail2').style.display="none";
                                            }
            </script>

            <div id="dFriends" style="display: none;">
                <div class="title">
                    لیست دوستان</div>
                <div style="margin-top: 5px">
                    <asp:DataList ID="Dl_Firends" runat="server" DataSourceID="ODS_Friends" RepeatColumns="8"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div style="padding: 2px;">
                                <div onmousemove="return OpenDetail('<%# Eval("name","{0}") %>','<%# LastLogin(DataBinder.Eval(Container.DataItem,"email")) %>','<%# GetTypeFamily(DataBinder.Eval(Container.DataItem,"email")) %>');"
                                    onmouseout="return CloseDetail();">
                                    <asp:Panel ID="Panel1" runat="server" Style="-moz-border-radius: 4px; padding: 4px;"
                                        BorderColor='<%# CheckOnilneImage(DataBinder.Eval(Container.DataItem,"email")) %>'
                                        BorderWidth="2" BorderStyle="Solid">
                                        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="ImageButton" runat="server"
                                            Height="48px" Width="48px" ImageUrl='<%#  "~/user/Crop.aspx?P=" +Eval("picpath", "{0}") + "&W=50&H=50" %>'
                                            OnCommand="RedirectToProfile" CommandArgument='<%# Eval("email","{0}") %>' />
                                    </asp:Panel>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:DataList>
                    <div style="padding: 5px;">
                        <asp:Label ID="lblEmptyFreinds" runat="server" Style="font-family: Tahoma; font-size: 11px;
                            color: #666666;" Text="ارتباطی وجود ندارد." Visible="False"></asp:Label>
                    </div>
                    <div id="DivDetail" style="display: none; font-family: Tahoma; font-size: 11px;">
                        <div id="DivName" style="padding: 5px; width: 519px; background-color: #f4f4f4;">
                        </div>
                        <div id="DivLastLogin" style="padding: 5px; width: 519px; background-color: #e7eff2;">
                        </div>
                        <div id="DivTypeFriendFamily" style="padding: 5px; width: 519px; background-color: #f4f4f4;">
                        </div>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ODS_Friends" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyFriendsTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div id="dFamilys" style="display: none;">
                <div class="title">
                    لیست بستگان</div>
                <div style="margin-top: 5px">
                    <asp:DataList ID="Dl_Familys" runat="server" DataSourceID="ODS_Familys" RepeatColumns="8"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div style="padding: 2px;">
                                <div onmousemove="return OpenDetail2('<%# Eval("name","{0}") %>','<%# LastLogin(DataBinder.Eval(Container.DataItem,"email")) %>','<%# GetTypeFamily(DataBinder.Eval(Container.DataItem,"email")) %>');"
                                    onmouseout="return CloseDetail2();">
                                    <asp:Panel ID="Panel2" runat="server" BorderColor='<%# CheckOnilneImage(DataBinder.Eval(Container.DataItem,"email")) %>'
                                        BorderStyle="Solid" BorderWidth="2" Style="-moz-border-radius: 4px; padding: 4px;">
                                        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="ImageButton7" runat="server"
                                            CommandArgument='<%# Eval("email","{0}") %>' Height="45px" ImageUrl='<%#  "~/user/Crop.aspx?P=" +Eval("picpath", "{0}") + "&W=45&H=45" %>'
                                            OnCommand="RedirectToProfile" Width="45px" />
                                    </asp:Panel>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:DataList>
                    <div id="DivDetail2" style="display: none; font-family: Tahoma; font-size: 11px;">
                        <div id="DivName2" style="padding: 5px; width: 519px; background-color: #f4f4f4;">
                        </div>
                        <div id="DivLastLogin2" style="padding: 5px; width: 519px; background-color: #e7eff2;">
                        </div>
                        <div id="DivTypeFriendFamily2" style="padding: 5px; width: 519px; background-color: #f4f4f4;">
                        </div>
                    </div>
                    <div style="padding: 5px;">
                        <asp:Label ID="lblEmptyFamilys" runat="server" Style="font-family: Tahoma; font-size: 11px;
                            color: #666666;" Text="ارتباطی وجود ندارد." Visible="False"></asp:Label>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ODS_Familys" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyFamilysTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div id="dPhotos" style="display: none;">
                <div class="title">
                    عکس های آلبوم نشده</div>
                <div style="width: 532px; height: 100%; font-family: Tahoma; font-size: 11px; padding: 2px;
                    margin-top: 5px;">
                    <asp:DataList ID="DL_NotAlbum" runat="server" DataSourceID="Ods_notAlbum" RepeatColumns="8"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnNoneAlbum" runat="server" Style="border: 3px solid #DFDFDF;
                                padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;"
                                Height="40px" ImageUrl='<%#"~/user/CropPhoto.aspx?P=" +Eval("string_factor", "{0}")+ "&W=40&H=40" %>'
                                Width="40px" OnClick="ImageButton1_Click" />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="Ods_notAlbum" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_Random_PictureNotAlbumTableAdapter"
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
                            <asp:Parameter Name="email" Type="String" />
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
                    <asp:Label ID="lblNotAlbum" runat="server"></asp:Label>
                    آلبوم ها</div>
                <div style="width: 532px; height: 100%; font-family: Tahoma; font-size: 11px; padding: 2px;">
                    <div style="padding: 5px; border: 1px solid #E3E3E3; -moz-border-radius: 3px; -webkit-border-radius: 3px;
                        border-radius: 3px; width: 516px; margin-top: 2px;">
                        <div style="color: #707070;">
                            <asp:Label ID="lblCountAlbum" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div style="margin-top: 5px; color: #707070;">
                            <asp:Label ID="lblCountPictureAlbum" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
                <div>
                    <asp:DataList ID="DL_Photo" runat="server" DataKeyField="Code" DataSourceID="ODS_Album"
                        RepeatColumns="4" RepeatDirection="Horizontal" Width="221px">
                        <ItemTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="AlbumNameLabel" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                            font-weight: bold; color: #284D57;" Text='<%# Eval("AlbumName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="imgNotAlbum" Style="border: 3px solid #DFDFDF; padding: 2px;
                                            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;" runat="server"
                                            OnCommand="RedirectPhoto" CommandArgument='<%# Eval("code","{0}") %>' Height="96px"
                                            ImageUrl='<%# SetOrgAlbum(DataBinder.Eval(Container.DataItem,"code")) %>' Width="114px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Album" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.tbl_Profile_AlbumTableAdapter"
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
                            <asp:Parameter Name="email" Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="AlbumName" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:Label ID="lblNotPhoto" runat="server" Style="font-family: Tahoma; font-size: 11px"></asp:Label>
                </div>
                <div style="padding-right: 5px; padding: 5px;">
                    <asp:ImageButton ID="btnRedirectAlbum" runat="server" ImageUrl="~/content/images/Home/Albums.jpg" /></div>
            </div>
            <div id="dPost" style="display: none;">
                <div class="title">
                    ارسال مطلب</div>
                <div style="margin-top: 5px">
                    <asp:TextBox ID="txtTitlePost" runat="server" Height="15px" Text="عنوان مطلب شما ..."
                        ForeColor="#999999" onfocus="if(this.value=='عنوان مطلب شما ...'){this.value='';}"
                        onblur="if(this.value==''){this.value='عنوان مطلب شما ...';}if(this.value=='عنوان مطلب شما ...')this.style.color='#999999';"
                        onmousedown="this.style.color='#000000';" Style="margin-top: 2px; border: solid #CCC thin;
                        font-family: Tahoma; font-size: 11px;" Width="525px"></asp:TextBox>
                    <asp:TextBox ID="txtPost" Text="متن شما ..." runat="server" Style="margin-top: 3px;
                        resize: none;" ForeColor="#999999" onfocus="if(this.value=='متن شما ...'){this.value='';}"
                        onblur="if(this.value==''){this.value='متن شما ...';}if(this.value=='متن شما ...')this.style.color='#999999';"
                        onmousedown="this.style.color='#000000';" Width="523px" TextMode="MultiLine"
                        Height="200px" Font-Names="tahoma" Font-Size="11px">
                    </asp:TextBox>
                    <asp:LinkButton ID="btnSendPost" Style="color: #58808C; font-family: koodak; font-size: 13px;
                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                </div>
            </div>
            <div id="dLinks" style="display: none;">
                <div class="title">
                    ارسال لینک</div>
                <div style="margin-top: 5px">
                    <asp:TextBox ID="txtLink" Text="Http://" runat="server" Style="text-align: left;
                        direction: ltr; margin-top: 3px;" Width="523px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                    <asp:TextBox ID="txtTextLink" Text="توضیحات لینک شما ..." runat="server" Style="margin-top: 3px;
                        resize: none; border: solid #CCC thin;" ForeColor="#999999" onfocus="if(this.value=='توضیحات لینک شما ...'){this.value='';}"
                        onblur="if(this.value==''){this.value='توضیحات لینک شما ...';}if(this.value=='توضیحات لینک شما ...')this.style.color='#999999';"
                        onmousedown="this.style.color='#000000';" Width="525px" TextMode="MultiLine"
                        Height="200px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                    <asp:LinkButton ID="btnSendLink" Style="color: #58808C; font-family: koodak; font-size: 13px;
                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                </div>
            </div>
            <div id="dPolling" style="display: none;">
                <div class="title">
                    ایجاد نظرسنجی</div>
                <div style="width: 532px; height: 100%; font-family: Tahoma; font-size: 11px; padding: 2px;
                    direction: rtl; margin-top: 5px;">
                    <asp:UpdatePanel ID="UP_Pooling" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:MultiView ID="MultiView_Polling" runat="server" ActiveViewIndex="0">
                                <asp:View ID="V_Step1_polling" runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 9px;">
                                                            <img alt="" src="../content/images/Home/question.jpeg" title="سوال نظرسنجی" style="width: 16px;
                                                                height: 16px" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtQuestion" runat="server" Style="border: 1px solid #96bfd5; padding: 2px;"
                                                                class="Font" Width="497px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 9px;">
                                                            <img src="../content/images/Home/detail.jpeg" title="جزییات نظرسنجی" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtDetail" runat="server" Width="497px" Height="111px" Style="border: 1px solid #b2cddc;
                                                                resize: none; padding: 2px;" class="Font" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 9px;">
                                                            <img src="../content/images/Home/count.jpeg" title="تعداد گزینه های نظرسنجی" />
                                                        </td>
                                                        <td>
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 10px;">
                                                                        <asp:ImageButton ID="btnUP" runat="server" ImageUrl="~/content/images/Home/up.jpg" />
                                                                    </td>
                                                                    <td style="width: 23px;">
                                                                        <asp:TextBox ID="txtCountOption" runat="server" class="Font" Style="border: 1px solid #b2cddc;
                                                                            text-align: center;" Width="30px">2</asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="btnDown" runat="server" ImageUrl="~/content/images/Home/down.jpg" />
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
                                                &nbsp;
                                                <asp:ImageButton ID="btnStep2_Polling" runat="server" ImageUrl="~/content/images/Home/CreatePolling.jpg"
                                                    ValidationGroup="1" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="color: Gray;
                                                    font-family: Tahoma; font-size: 11px;" ControlToValidate="txtQuestion" ErrorMessage="سوال نظرسنجی را وارد کنید"
                                                    ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="V_Step2_polling" runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:PlaceHolder ID="PnlOption" runat="server"></asp:PlaceHolder>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="btnBackPolling" runat="server" ImageUrl="~/content/images/Home/Back.jpg" />
                                                <asp:ImageButton ID="btnRegisterPolling" runat="server" ImageUrl="~/content/images/Home/RegisterPolling.jpg"
                                                    Style="height: 22px" />
                                                <asp:Label ID="lblEmptyField" runat="server" Style="color: Gray; font-family: Tahoma;
                                                    font-size: 11px;"></asp:Label>
                                                <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UP_Pooling">
                                                    <ProgressTemplate>
                                                        <img alt="" src="../content/images/Profile_View_Users/Loading_0.gif" style="width: 18px;
                                                            height: 17px" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View1" runat="server">
                                    <div style="margin-top: 5px; height: 15px; padding: 5px; background-color: #f6f6f6;
                                        border-bottom: 1px solid #CCCCCC; border-top: 1px solid #CCCCCC; width: 520px;">
                                        <div style="float: right;">
                                            <img src="../content/images/Home/info.gif" />
                                        </div>
                                        <div style="float: right; margin-right: 5px;">
                                            <span class="Font" style="color: gray">نظرسنجی شما با موفقیت انجام شد.</span>
                                        </div>
                                        &nbsp;&nbsp; [&nbsp;<asp:LinkButton ID="btnResetPolling" Style="color: #4A75AD; text-decoration: none;"
                                            runat="server">ایجاد نظرسنجی جدید</asp:LinkButton>&nbsp;]
                                    </div>
                                </asp:View>
                            </asp:MultiView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <asp:Panel ID="dSuccess" Style="display: none;" runat="server">
                <div style="margin-top: 5px; height: 15px; padding: 5px; background-color: #f6f6f6;
                    border-bottom: 1px solid #CCCCCC; border-top: 1px solid #CCCCCC; width: 520px;">
                    <div style="float: right;">
                        <img src="../content/images/Home/info.gif" />
                    </div>
                    <div style="float: right; margin-right: 5px;">
                        <span class="Font" style="color: gray">ارسال شما با موفقیت انجام شد.</span>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<style type="text/css">
    .title
    {
        background-color: #EFF4F7;
        width: 526px;
        height: 15px;
        font-family: Tahoma;
        border: 1px solid #D6E1E7;
        font-size: 10px;
        color: #587C8C;
        padding: 2px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
    }
</style>
