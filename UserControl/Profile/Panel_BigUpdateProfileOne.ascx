<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_BigUpdateProfileOne.ascx.vb"
    Inherits="UserControl_Profile_Panel_BigUpdateProfileOne" %>
<!-- Tabs -->
<style type="text/css">
    .PageS, PageS td
    {
        font-size: 11px;
        text-decoration: none;
        color: #687680;
        font-weight: bold;
        background-color: #E4E4E4;
    }
    .PageS a
    {
        font-size: 11px;
        text-decoration: none;
        color: #A9A9A9;
        background-color: #E9E9E9;
        padding: 1px;
    }
</style>
<style type="text/css">
    .font2
    {
        font-family: Tahoma;
        font-size: 11px;
        color: #000000;
        text-decoration: none;
    }
    .style2
    {
        width: 100%;
        font-family: Tahoma;
        font-size: 11px;
    }
    .style3
    {
        width: 20px;
    }
    .sComment6
    {
        width: 100%;
    }
    .sComment7
    {
        width: 456px;
    }
</style>
<!-- End -->
<style type="text/css">
    #tooltip
    {
        font-family: Tahoma;
        font-size: 11px;
        -moz-border-radius: 5px;
        position: absolute;
        background: #49707e;
        padding: 5px;
        color: #fff;
        display: none;
        width: 150px;
    }
</style>

<script type="text/javascript">
    function alert2(e)
    {
        alert(e);
    }
</script>

<!-- Silde -->

<script src="../Content/js/yoxview/jquery.min.js" type="text/javascript"></script>

<%--<script type="text/javascript" language="javascript" src="../Content/js/yoxview/yox.js"></script>--%>

<script type="text/javascript" language="javascript" src="../Content/js/yoxview/yoxview-init.js"></script>

<script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $(".yoxview").yoxview({
                    videoSize: { maxwidth: 720, maxheight: 560 }
                });
            });
</script>

<script type="text/javascript">
		            $(document).ready(function(){
		                $(".yoxview").yoxview();
		            });
</script>

<!-- End -->
<div id="object" style="margin-top: 7px;">
    <asp:DataList ID="Dl_UpdateNews" runat="server" DataSourceID="ODS_ProfileUpdateNews"
        Width="549px">
        <ItemTemplate>
            <div style="background-color: #f5f5f5; border: solid #ccc 1px; -moz-border-radius: 5px;
                width: 543px; -webkit-border-radius: 5px; margin-top: 5px;">
                <table class="style2">
                    <tr>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style3">
                                        <asp:Image ForeColor="Transparent" AlternateText="" ID="imgAvatar" runat="server"
                                            Height="40px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath","{0}")+"&W=45&H=45" %>'
                                            Style="-moz-border-radius: 5px;" Width="40px" />
                                    </td>
                                    <td style="width: 500px;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Style="font-family: Tahoma; font-size: 12px;
                                                        color: #457387" Text='<%# PostName(DataBinder.Eval(Container.DataItem,"Email"),DataBinder.Eval(Container.DataItem,"For_who")) %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblCode_Object" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                                    (<asp:Label ID="Label4" runat="server" Text='<%# Eval("time", "{0}") %>'></asp:Label>
                                                    )
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email", "{0}") %>' Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <div style="float: left; margin-top: 0px; margin-right: 2px; height: 15px; padding-bottom: 30px;
                                            display: none;">
                                            <a id="linkDelete" runat="server" href="#" title="حذف پست" style="text-decoration: none;">
                                                <span id="Span1" style="font-size: 24px; color: #A6A6A6;" runat="server" visible='<%# iif(session("MY-UsErNaMe")="" Or session("MY-UsErNaMe")<> Eval("email","{0}") ,false,true) %>'>
                                                    × </span></a>
                                            <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnDeleteObject" Style="display: none;"
                                                CommandArgument='<%# Eval("code","{0}") %>' OnCommand="DeleteObject" runat="server" />
                                        </div>
                                           <asp:ImageButton 
                                                            ImageUrl="~/Content/images/Stage/Nazmie/hatDecetive.png"
                                                            ToolTip="َگزارش به نظمیه" 
                                                          OnCommand="GotoToNazmie"
                                                           ForeColor="Transparent" AlternateText=""
                                                            CommandArgument='<%# Eval("code","{0}")+"|"+Eval("Email", "{0}") %>'
                                                            ID="ImageButton4" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="font-weight: normal;">
                                <asp:Label ID="detailLabel" runat="server" Style="color: #25515D; font-family: Tahoma;
                                    font-size: 11px" Text='<%# Eval("detail") %>' />
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# IIF(Eval("type")=3,true,false) %>'>
                                <asp:DataList ID="DL_Polloing" runat="server" DataKeyField="code" DataSourceID="ODS_Polling"
                                    Width="464px">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table>
                                                    <tr>
                                                        <td class="style6">
                                                            <div style="-moz-border-radius: 3px; padding: 3px; height: 100%;">
                                                                <div style="float: right; width: 490px; height: 20px;">
                                                                    <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' Style="font-weight: 700;
                                                                        font-size: 12px; font-family: Tahoma;" />
                                                                    <asp:Label ID="codePolling" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="pictureLabel" runat="server" Text='<%# Eval("picture") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-family: Tahoma; font-size: 11px">
                                                            <div style="border: solid #ccc 1px; -moz-border-radius: 5px; width: 525px;">
                                                                <asp:DataList ID="Dl_option" runat="server" DataSourceID="ODS_ParticipatePolling"
                                                                    Width="395px" RepeatDirection="Vertical">
                                                                    <ItemTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Literal ID="Literal1" Text='<%# SetPercent(DataBinder.Eval(Container.DataItem,"CodeOption"),DataBinder.Eval(Container.DataItem,"code_polling"),DataBinder.Eval(Container.DataItem,"option")) %>'
                                                                                        runat="server"></asp:Literal>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ForeColor="Transparent" AlternateText="" OnCommand="SetOption" CommandArgument='<%# Eval("codeoption","{0}")+"|"+Eval("code_polling","{0}") %>'
                                                                                        Visible='<%# iif(Session("MY-UsErNaMe")="",False,True) %>' ImageUrl='<%# IIF(Eval("tik")=1,"~\content\images\Profile_View_Users\Tik_Animation.gif","~\content\images\Profile_View_Users\NotTik.jpg") %>'
                                                                                        ID="ImageButton2" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                            <div>
                                                                <asp:DataList ID="Dl_user" runat="server" DataSourceID="ODS_UserParticipate" RepeatColumns="15"
                                                                    RepeatDirection="Horizontal">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton3" ForeColor="Transparent" AlternateText="" runat="server"
                                                                            BorderColor="#CCCCCC" BorderWidth="1px" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                                            Height="25px" ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("PicPath", "{0}")+ "&W=25&H=25" %>'
                                                                            Width="25px" />
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <asp:ObjectDataSource ID="ODS_UserParticipate" runat="server" InsertMethod="Insert"
                                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_UserParticipatePollingTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="codePolling" Name="code_polling" PropertyName="Text"
                                                                            Type="Int64" />
                                                                    </SelectParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="email" Type="String" />
                                                                        <asp:Parameter Name="picpath" Type="String" />
                                                                    </InsertParameters>
                                                                </asp:ObjectDataSource>
                                                            </div>
                                                            <asp:ObjectDataSource ID="ODS_ParticipatePolling" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_ShowPollingTableAdapter"
                                                                OnSelecting="ODS_ParticipatePolling_Selecting">
                                                                <SelectParameters>
                                                                    <asp:Parameter Name="email" Type="String" />
                                                                    <asp:ControlParameter ControlID="codePolling" Name="code_polling" PropertyName="Text"
                                                                        Type="Int64" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel33" ID="UpdateProgress1"
                                                                runat="server">
                                                                <ProgressTemplate>
                                                                    <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                                                                    نظر شما در حال ثبت شدن است...</ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_Polling" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_PollingByCodeObjectTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="code_object" Type="Int64" />
                                        <asp:Parameter Name="question" Type="String" />
                                        <asp:Parameter Name="picture" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                        <asp:Parameter Name="flag" Type="Boolean" />
                                        <asp:Parameter Name="cause_disible" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCode_Object" Name="code_object" PropertyName="Text"
                                            Type="Int64" />
                                        <asp:ControlParameter ControlID="lblEmail" Name="email" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="code_object" Type="Int64" />
                                        <asp:Parameter Name="question" Type="String" />
                                        <asp:Parameter Name="picture" Type="String" />
                                        <asp:Parameter Name="detail" Type="String" />
                                        <asp:Parameter Name="flag" Type="Boolean" />
                                        <asp:Parameter Name="cause_disible" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                            <asp:Label ID="Label1" runat="server" class="font2" Text='<%# Eval("string_factor", "{0}") %>'
                                Visible='<%# IIF(Eval("type")=2,true,false) %>'></asp:Label>
                            <div style="text-align: left; padding-left: 3px;">
                                <a href='<%# Eval("string_factor", "{0}") %>' target="_blank" class="font2">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("string_factor", "{0}") %>'
                                        Visible='<%# IIF(Eval("type")=1,true,false) %>' ForeColor="#3a88a4"></asp:Label>
                                </a>
                            </div>
                            <div id="Div1" style="text-align: center; background-color: #ECECEC; width: 536px;
                                border-top: 4px solid #e5e5e5; background-image: url('../Content/images/Profile_View_Users/bgPicture.png');
                                background-repeat: repeat-x; border-bottom: 4px solid #e5e5e5;" runat="server"
                                visible='<%# IIF(Eval("type")=0,true,false) %>'>
                                <div class="yoxview">
                                    <a href='<%# "../Content/images/Profile/Photo/"+Eval("string_factor", "{0}") %>'>
                                        <asp:Image ID="imgPic" runat="server" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=512&H=260" %>'
                                            Visible='<%# IIF(Eval("type")=0,true,false) %>' />
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel43" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButton7" runat="server" Text='<%# ChangeIconLikePost(Eval("code")) %>'
                                                    Style="text-decoration: none;" Visible='<%# iif(session("MY-UsErNaMe")="",false,true) %>'
                                                    OnCommand="SetLikeUnlikePost" CommandArgument='<%# Eval("code","{0}") %>'>
                                                                                                                                                          
                                                </asp:LinkButton>
                                            </td>
                                            <td>
                                                <ul id="megaMenu2">
                                                    <li><a id="A1" href="#" runat="server" visible='<%# VisibleNegahPost(Eval("code")) %>'>
                                                        ...</a><!-- Begin Home Item -->
                                                        <div class="dropdown_2columns">
                                                            <!-- Begin 2 columns container -->
                                                            <div>
                                                                <asp:GridView ID="DG_LikePost" runat="server" DataSourceID="ODS_ShowLikePost" AutoGenerateColumns="False"
                                                                    GridLines="None" ShowHeader="False">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="FnLn" SortExpression="FnLn">
                                                                            <ItemTemplate>
                                                                                <a href='<%# "http://shaahr.com/user/?="+Eval("Username") %>' style="font-size: 12px;
                                                                                    text-shadow: 0 0 #ccc; color: Black;">
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FnLn") %>'></asp:Label>
                                                                                </a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <asp:ObjectDataSource ID="ODS_ShowLikePost" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_ShowUsersLikeUnlikePostTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblCode_Object" Name="code_object" PropertyName="Text"
                                                                            Type="Int64" />
                                                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td>
                                                <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel43" ID="UpdateProgress22"
                                                    runat="server">
                                                    <ProgressTemplate>
                                                        <img src="../content/images/Profile_View_Users/Loading_0.gif" /></ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel123" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel351" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div>
                                                <asp:DataList ID="DL_Comment" runat="server" DataSourceID="ODS_Comments" Width="540px"
                                                    OnItemDataBound="DL_Comment_ItemDataBound">
                                                    <ItemTemplate>
                                                        <div style="width: 35px; float: right; margin-top: 1px;">
                                                            <asp:ImageButton ID="imgAvatarComment" runat="server" OnCommand="RedirectFriend"
                                                                CommandArgument='<%# Eval("email","{0}") %>' Height="30px" Width="30px" ImageUrl='<%# "~/user/Crop.aspx?P=" +Eval("picpath", "{0}")+ "&W=30&H=30" %>' />
                                                        </div>
                                                        <div style="background-color: #edeff4; border: 1px solid #E6E6E6; width: 498px; -moz-border-radius: 3px;
                                                            -webkit-border-radius: 3px; border-radius: 3px; margin-bottom: 2px; float: right;
                                                            padding: 0px;">
                                                            <table class="sComment6">
                                                                <tr>
                                                                    <td class="sComment7">
                                                                        <table class="sComment6">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="textLabel" runat="server" ToolTip='<%# Eval("date") %>' Style="font-family: Tahoma;
                                                                                        font-size: 11px" Text='<%# Eval("text") %>' />
                                                                                    <asp:Label ID="codeComment" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:LinkButton ID="LinkButton71" runat="server" Text='<%# UserLikeComment(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                                                                    Style="text-decoration: none;" Visible='<%# iif(session("MY-UsErNaMe")="",false,true) %>'
                                                                                                    OnCommand="SetLikeUnlikeComment" CommandArgument='<%# Eval("code","{0}") %>'>
                                                                                                </asp:LinkButton>
                                                                                            </td>
                                                                                            <td>
                                                                                                <ul id="megaMenu2">
                                                                                                    <li><a id="A2" href="#" runat="server" visible='<%# VisibleNegahComment(Eval("code")) %>'>
                                                                                                        ...</a><!-- Begin Home Item -->
                                                                                                        <div class="dropdown_2columns">
                                                                                                            <!-- Begin 2 columns container -->
                                                                                                            <div>
                                                                                                                <asp:GridView ID="DG_LikePost" runat="server" DataSourceID="ODS_ShowLikeComment"
                                                                                                                    AutoGenerateColumns="False" GridLines="None" ShowHeader="False">
                                                                                                                    <Columns>
                                                                                                                        <asp:TemplateField HeaderText="FnLn" SortExpression="FnLn">
                                                                                                                            <ItemTemplate>
                                                                                                                                <a href='<%# "http://shaahr.com/user/?="+Eval("Username") %>' style="font-size: 12px;
                                                                                                                                    text-shadow: 0 0 #ccc; color: Black;">
                                                                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FnLn") %>'></asp:Label>
                                                                                                                                </a>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                    </Columns>
                                                                                                                </asp:GridView>
                                                                                                                <asp:ObjectDataSource ID="ODS_ShowLikeComment" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                                                                    SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_ShowUsersLikeUnlikeCommentTableAdapter">
                                                                                                                    <SelectParameters>
                                                                                                                        <asp:ControlParameter ControlID="codeComment" Name="code_comment" PropertyName="Text"
                                                                                                                            Type="Int64" />
                                                                                                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                                                                                                    </SelectParameters>
                                                                                                                </asp:ObjectDataSource>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# SpecialDate(DataBinder.Eval(Container.DataItem,"date")) %>'
                                                                                        Style="font-family: Tahoma; color: #BBBDC1; font-size: 10px" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <div style="padding: 4px; float: left;">
                                                                            <asp:LinkButton CommandArgument='<%# Eval("code","{0}") %>' OnCommand="DeleteCommand"
                                                                                Visible='<%# iif(Eval("Email")=Session("MY-UsErNaMe"),"True","False") %>' ID="LinkButton8"
                                                                                Style="text-decoration: none; color: #577F8B; font-size: 16px; font-weight: bold;"
                                                                                runat="server">
                                                                            ×
                                                                            </asp:LinkButton>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="ODS_Comments" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Home_CommentsTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblCode_Object" Name="Code_object" PropertyName="Text"
                                                            Type="Int64" />
                                                        <asp:ControlParameter ControlID="lbl_status_Comment" DefaultValue="0" Name="index"
                                                            PropertyName="Text" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                            <div>
                                                <asp:Panel ID="PnlComment" Visible='<%# iif(Session("MY-UsErNaMe")="","false","true") %>'
                                                    runat="server" Style="background-color: #ccc; margin-right: 48px; margin-top: -4px;
                                                    width: 485px; padding: 2px;">
                                                    <asp:TextBox Style="margin-top: 1px; border: 1px solid #a8a8a8; font-family: Tahoma;
                                                        resize: none; padding: 1px; font-size: 11px;" ID="txtPutComment" runat="server"
                                                        Width="481px" Text="نظر شما..." ForeColor="#999999" onfocus="if(this.value=='نظر شما...'){this.value='';}"
                                                        TextMode="MultiLine" Height="20px" onblur="if(this.value==''){this.value='نظر شما...';}if(this.value=='نظر شما...')this.style.color='#999999';"
                                                        onmousedown="this.style.color='#000000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}" />
                                                    <asp:Panel ID="PnlbtnComment" runat="server" Style="display: none;">
                                                        <asp:LinkButton ID="btnSendPost" OnCommand="SendCommand" Style="color: #58808C; font-family: koodak;
                                                            font-size: 13px; text-decoration: none; margin-right: 2px;" CommandArgument='<%# Eval("code","{0}") %>'
                                                            runat="server">ارسال . . .</asp:LinkButton>
                                                    </asp:Panel>
                                                </asp:Panel>
                                                <div style="height: 24px;">
                                                    <div style="float: right; -moz-border-radius: 2px; background-color: #a8a8a8; margin-top: 2px;
                                                        margin-right: 48px; width: 77px; height: 13px; font-family: Tahoma; font-size: 11px;
                                                        color: White; padding: 3px;">
                                                        <asp:LinkButton ID="LinkButton1" OnCommand="ShowAllComment" CommandArgument='<%# Eval("code","{0}") %>'
                                                            Style="text-decoration: none; color: White;" runat="server">نمایش کل نظرات</asp:LinkButton>
                                                    </div>
                                                    <div style="float: right; -moz-border-radius: 2px; background-color: #a8a8a8; margin-top: 2px;
                                                        margin-right: 2px; width: 77px; height: 13px; font-family: Tahoma; font-size: 11px;
                                                        color: White; padding: 3px; color: #1a5267;">
                                                        <asp:Label ID="CountCommrnt" runat="server" Text='<%# "نظرات: "+"<b>"+Eval("CountC","{0}")+"</b>" %>'></asp:Label>
                                                    </div>
                                                    <div style="float: right; padding-top: 5px; font-family: Tahoma; font-size: 11px;
                                                        padding-right: 2px;">
                                                        <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel351" ID="UpdateProgress2"
                                                            runat="server">
                                                            <ProgressTemplate>
                                                                <img src="../content/images/Profile_View_Users/Loading_0.gif" /></ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:Label ID="lbl_status_Comment" runat="server" Text="0" Visible="False"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="ODS_ProfileUpdateNews" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Home_UpdateNewsOneTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:QueryStringParameter Name="code_object" QueryStringField="code" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
