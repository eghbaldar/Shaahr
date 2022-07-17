<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Detail-Post.aspx.vb" Inherits="Management_Admin_Detail_Post" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
    
        function Visible(type)
        {
            if(type=='show')
                document.getElementById('DivVisible').style.display='inline';
            if(type=='hide')
                document.getElementById('DivVisible').style.display='none';   
        }
    </script>

    <style type="text/css">
        .ss1
        {
            width: 29%;
            height: 221px;
        }
        .ss2
        {
            width: 100%;
        }
        .ss3
        {
            width: 59px;
        }
        .ss4
        {
            width: 410px;
        }
        .font
        {
            font-family: Tahoma;
            font-size: 11px;
            color: #457387;
        }
        .font2
        {
            font-family: Tahoma;
            font-size: 11px;
            color: #000000;
            text-decoration: none;
        }
        .sComment6
        {
            width: 100%;
        }
        .sComment7
        {
            width: 700px;
        }
        .style5
        {
            width: 100%;
        }
        .ss10
        {
            width: 232px;
            height: 15px;
        }
        .ss11
        {
            height: 15px;
            width: 245px;
        }
    </style>
    <!-- Polling --->
    <style type="text/css">
        dl, dt, dd
        {
            margin: 0;
            padding: 0;
        }
        dd
        {
            width: 216px;
            height: 41px;
            background: url(../../content/images/Profile_View_Users/bg_bar.gif) no-repeat 0 0;
            position: relative;
        }
        dd span
        {
            position: absolute;
            display: block;
            width: 200px;
            height: 25px;
            background: url(../../content/images/Profile_View_Users/bar.gif) no-repeat 0 0;
            top: 8px;
            left: 8px;
            overflow: hidden;
            text-indent: -8000px;
        }
        dd em
        {
            position: absolute;
            display: block;
            width: 200px;
            height: 25px;
            background: url(../../content/images/Profile_View_Users/bg_cover.gif) repeat-x;
            top: 0;
        }
        /* SINGLE PROGRESS BAR */.progressBar
        {
            width: 216px;
            height: 41px;
            background: url(../../content/images/Profile_View_Users/bg_bar.gif) no-repeat 0 0;
            position: relative;
        }
        .progressBar span
        {
            position: absolute;
            display: block;
            width: 200px;
            height: 25px;
            background: url(../../content/images/Profile_View_Users/bar.gif) no-repeat 0 0;
            top: 8px;
            left: 8px;
            overflow: hidden;
            text-indent: -8000px;
        }
        .progressBar em
        {
            position: absolute;
            display: block;
            width: 200px;
            height: 25px;
            background: url(../../content/images/Profile_View_Users/bg_cover.gif) repeat-x 0 0;
            top: 0;
        }
        .style13
        {
            width: 93px;
        }
        .style6
        {
            width: 54px;
        }
        .style14
        {
            width: 62px;
        }
    </style>
    <!-- End -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 100%;">
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td class="style13">
                            تعداد&nbsp; تکنظر:
                        </td>
                        <td>
                            <asp:Label ID="lblComment" runat="server" Style="color: #FF0000; font-weight: 700"
                                Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد لایک ها:
                        </td>
                        <td>
                            <asp:Label ID="lblLike" runat="server" Style="color: #FF0000; font-weight: 700" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            گیرنده:
                        </td>
                        <td>
                            <asp:Label ID="lblResives" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDelPost" runat="server" BackColor="#CC0000" BorderStyle="Solid"
                    BorderWidth="1px" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                    ForeColor="White" Style="font-family: Tahoma" Text="حذف این پست" />
                <asp:Button ID="btnEditPost" runat="server" BackColor="#006600" BorderStyle="Solid"
                    BorderWidth="1px" ForeColor="White" Style="font-family: Tahoma" Text="ویرایش این پست" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" BorderStyle="Dotted" Style="font-family: Tahoma"
                    Text="اخطار به این فرستنده" />
                <asp:Button ID="Button3" runat="server" BorderStyle="Dotted" Style="font-family: Tahoma"
                    Text="پیام به فرستنده" />
                <asp:Button ID="Button4" runat="server" BorderStyle="Dotted" Style="font-family: Tahoma"
                    Text="پیام به گیرنده" />
                <asp:Button ID="btnDelComments" runat="server" BorderStyle="Dotted" Style="font-family: Tahoma"
                    OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');" Text="حذف همه تکنظر ها" />
                <asp:Button ID="btnDelAllLikePost" runat="server" BorderStyle="Dotted" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                    Style="font-family: Tahoma; font-size: 11" Text="حذف همه لایک های پست" />
                <br />
                <br />
                <asp:Button ID="btnDelAllLikeCommetns" runat="server" BorderStyle="Dotted" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                    Style="font-family: Tahoma; font-size: 11" Text="حذف همه لایک های تکنظر ها" />
                <asp:Button ID="btnShow" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Text="مشاهده پست در پروفایل" />
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                            <asp:View ID="Show" runat="server">
                                <asp:DataList ID="Dl_UpdateNews" runat="server" DataSourceID="ODS_ProfileUpdateNews"
                                    Width="906px">
                                    <ItemTemplate>
                                        <div style="background-color: #f5f5f5; border: solid #dedede 1px; -moz-border-radius: 5px;
                                            -webkit-border-radius: 5px; margin-top: 5px;">
                                            <table class="ss2">
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td class="style6">
                                                                    <asp:Image ID="imgAvatar" runat="server" Height="80px" ImageUrl='<%# "~/user/Crop.aspx?P=" +Eval("PicPath", "{0}")+ "&W=90&H=90" %>'
                                                                        Style="border: solid 4px #b4b4b4; -moz-border-radius: 5px;" Width="80px" />
                                                                </td>
                                                                <td style="font-family: Tahoma; font-size: 11px">
                                                                    <table style="width: 100%;">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label3" runat="server" Style="font-family: Tahoma; font-size: 12px;
                                                                                    font-weight: 700; color: #457387" Text='<%# Eval("Name", "{0}") %>'></asp:Label>
                                                                                <asp:Label ID="lblCode_Object" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                تاریخ ارسال:<asp:Label ID="dateLabel" runat="server" Style="font-weight: 700; color: #457387;"
                                                                                    Text='<%# Eval("date") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                ساعت ارسال:<asp:Label ID="Label4" runat="server" Style="font-weight: 700; color: #457387;"
                                                                                    Text='<%# Eval("time", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                تعداد نظرات:<asp:Label ID="Label6" runat="server" Style="font-weight: 700; color: #457387;"
                                                                                    Text='<%# CountComment(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
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
                                                        <asp:Label ID="detailLabel" runat="server" Style="color: #25515D; font-family: Tahoma;
                                                            font-size: 11px" Text='<%# Eval("detail") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel2" runat="server" Visible='<%# IIF(Eval("type")=3,true,false) %>'>
                                                            <asp:DataList ID="DL_Polloing" runat="server" DataKeyField="code" DataSourceID="ODS_Polling"
                                                                Width="876px">
                                                                <ItemTemplate>
                                                                    <table style="width: 100%;">
                                                                        <tr>
                                                                            <td class="style6">
                                                                                <div style="-moz-border-radius: 3px; padding: 3px; height: 100%;">
                                                                                    <div style="float: right; width: 700px; height: 20px;">
                                                                                        <asp:Label ID="questionLabel" runat="server" Style="font-weight: 700; font-size: 12px;
                                                                                            font-family: Tahoma;" Text='<%# Eval("question") %>' />
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
                                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <div style="border: solid #ccc 1px; -moz-border-radius: 5px; width: 700px;">
                                                                                            <asp:DataList ID="Dl_option" runat="server" DataSourceID="ODS_ParticipatePolling"
                                                                                                RepeatColumns="3" RepeatDirection="Horizontal" Width="512px">
                                                                                                <ItemTemplate>
                                                                                                    <table style="width: 100%;">
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <asp:Literal ID="Literal2" runat="server" Text='<%# SetOption(DataBinder.Eval(Container.DataItem,"option"),DataBinder.Eval(Container.DataItem,"CodeOption"),DataBinder.Eval(Container.DataItem,"code_polling")) %>'></asp:Literal>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table style="width: 100%;">
                                                                                                                    <tr>
                                                                                                                        <td class="style7">
                                                                                                                            <dl>
                                                                                                                                <dd>
                                                                                                                                    <asp:Literal ID="Literal1" runat="server" Text='<%# SetPercent(DataBinder.Eval(Container.DataItem,"CodeOption"),DataBinder.Eval(Container.DataItem,"code_polling")) %>'></asp:Literal>
                                                                                                                                </dd>
                                                                                                                            </dl>
                                                                                                                            <dl>
                                                                                                                            </dl>
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("codeoption","{0}")+"|"+Eval("code_polling","{0}") %>'
                                                                                                                                ImageUrl='<%# IIF(Eval("tik")=1,"~\content\images\Profile_View_Users\Tik_Animation.gif","~\content\images\Profile_View_Users\NotTik.jpg") %>'
                                                                                                                                OnCommand="SetOption" Visible='<%# iif(Session("MY-UsErNaMe")="",False,True) %>' />
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </div>
                                                                                        <asp:ObjectDataSource ID="ODS_ParticipatePolling" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                                            OnSelecting="ODS_ParticipatePolling_Selecting" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_ShowPollingTableAdapter">
                                                                                            <SelectParameters>
                                                                                                <asp:Parameter Name="email" Type="String" />
                                                                                                <asp:ControlParameter ControlID="codePolling" Name="code_polling" PropertyName="Text"
                                                                                                    Type="Int64" />
                                                                                            </SelectParameters>
                                                                                        </asp:ObjectDataSource>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                                                    <ProgressTemplate>
                                                                                        <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                                                                                        نظر شما در حال ثبت شدن است...
                                                                                    </ProgressTemplate>
                                                                                </asp:UpdateProgress>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:DataList ID="Dl_user" runat="server" DataSourceID="ODS_UserParticipate" RepeatColumns="25"
                                                                                    RepeatDirection="Horizontal">
                                                                                    <ItemTemplate>
                                                                                        <asp:ImageButton ID="ImageButton31" runat="server" BorderColor="#CCCCCC" BorderWidth="1px"
                                                                                            CommandArgument='<%# Eval("email","{0}") %>' Height="25px" ImageUrl='<%# "~/user/Crop.aspx?P=" +Eval("PicPath", "{0}")+ "&W=25&H=25" %>'
                                                                                            OnCommand="RedirectFriend" Width="25px" />
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
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                            <asp:ObjectDataSource ID="ODS_Polling" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                                OldValuesParameterFormatString="original_{0}" OnSelecting="ODS_Polling_Selecting1"
                                                                SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_PollingByCodeObjectTableAdapter"
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
                                                                    <asp:Parameter Name="email" Type="String" />
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
                                                        <div style="direction: ltr;">
                                                            <a class="font2" href='<%# Eval("string_factor", "{0}") %>' target="_blank">
                                                                <asp:Label ID="Label5" runat="server" ForeColor="#3a88a4" Text='<%# Eval("string_factor", "{0}") %>'
                                                                    Visible='<%# IIF(Eval("type")=1,true,false) %>'></asp:Label>
                                                            </a>
                                                        </div>
                                                        <div style="direction: ltr;">
                                                            <asp:ImageButton ID="imgPic" runat="server" BorderColor="#CCCCCC" BorderWidth="2px"
                                                                class="font2" CommandArgument='<%# Eval("code", "{0}") %>' Height="195px" ImageUrl='<%#"~/user/CropPhoto.aspx?P=" + Eval("string_factor", "{0}")+ "&W=240&H=180" %>'
                                                                OnCommand="OpenPhoto" Visible='<%# IIF(Eval("type")=0,true,false) %>' Width="250px" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="background-color: #d8dfea;">
                                                            <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS_ShowLikePost" RepeatColumns="30"
                                                                RepeatDirection="Horizontal">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("username","{0}") %>'
                                                                        Height="25px" ImageUrl='<%# "~/user/Crop.aspx?P=" +Eval("PicPath", "{0}")+ "&W=30&H=30" %>'
                                                                        OnCommand="RedirectFriend_Whitout" Width="25px" />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                        <asp:ObjectDataSource ID="ODS_ShowLikePost" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="ShowUser_LikeUnlikePost" TypeName="DS_View_UsersTableAdapters.Profile_ShowUsersLikeUnlikePostTableAdapter">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblCode_Object" Name="code_object" PropertyName="Text"
                                                                    Type="Int64" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DataList ID="DL_Comment" runat="server" DataSourceID="ODS_Comments" Width="878px">
                                                            <ItemTemplate>
                                                                <div style="width: 44px; float: right; background-color: #ccc; margin-top: 1px;">
                                                                    <asp:ImageButton ID="imgAvatarComment" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                                                        Height="40px" ImageUrl='<%# "~/user/Crop.aspx?P=" +Eval("PicPath", "{0}")+ "&W=45&H=45" %>'
                                                                        OnCommand="RedirectFriend" />
                                                                </div>
                                                                <div style="background-color: #edeff4; border: solid 1px #e0e0e0; -moz-border-radius: 5px 0px 5px 0px;
                                                                    width: 830px; -webkit-border-radius: 0px 0px 0px 5px; float: right; padding: 0px;">
                                                                    <table class="sComment6">
                                                                        <tr>
                                                                            <td class="sComment7">
                                                                                <table class="sComment6">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="textLabel" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                                                                                Text='<%# Eval("text") %>' />
                                                                                            <asp:Label ID="codeComment" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="dateLabel0" runat="server" Style="font-family: Tahoma; font-size: 10px;
                                                                                                color: gray;" Text='<%# Eval("date") %>' />
                                                                                            <span style="font-family: Tahoma; font-size: 10px; color: gray;">ساعت:&nbsp;</span>
                                                                                            <asp:Label ID="TimeLabel" runat="server" Style="font-family: Tahoma; font-size: 10px;
                                                                                                color: gray" Text='<%# Eval("Time") %>' />
                                                                                            <asp:Label ID="lblUserLikeComment" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                                                                                font-weight: 700" Text='<%# UserLikeComment(DataBinder.Eval(Container.DataItem,"code")) %>'>
                                                                                            </asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <div style="padding: 4px; float: left;">
                                                                                    <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                                        ImageUrl="~/content/images/Profile_View_Users/close.jpg" OnClientClick="return confirm('مطمئن هستید؟');"
                                                                                        OnCommand="DeleteCommand" Style="margin-left: 0px" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:ObjectDataSource ID="ODS_Comments" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            OnSelecting="ODS_Comments_Selecting" SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Comments_CompleteTableAdapter">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="email" Type="String" />
                                                                <asp:ControlParameter ControlID="lblCode_Object" Name="Code_object" PropertyName="Text"
                                                                    Type="Int64" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:View>
                            <asp:View ID="Edit" runat="server">
                                <table class="style5">
                                    <tr>
                                        <td class="style14">
                                            عنوان:</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            <asp:TextBox ID="txtSubject" runat="server" Height="222px" 
                                                style="font-family: Tahoma; font-size: 11px" TextMode="MultiLine" Width="831px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            توضیحات:</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            <asp:TextBox ID="txtDetail" runat="server" Height="222px" TextMode="MultiLine" 
                                                Width="827px" style="font-family: Tahoma; font-size: 11px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnPost" runat="server" 
                                             OnClientClick="return confirm('آیا از ویرایش مطمئن هستید؟');"
                                                style="font-family: Tahoma; font-size: 11px" Text="ویرایش" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ODS_ProfileUpdateNews" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_UpdateNewsByCodeTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="code" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
