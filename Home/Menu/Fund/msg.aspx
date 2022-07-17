<%@ Page Language="VB" MasterPageFile="~/home/Menu/Fund/Home.master" AutoEventWireup="false"
    CodeFile="msg.aspx.vb" Inherits="home_Menu_Fund_msg" Title="Untitled Page" %>

<%@ Register Src="MSG_Backup.ascx" TagName="MSG_Backup" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Module popup  -->

    <script type="text/javascript" src="../../../jquery-latest.pack.js"></script>

    <script type="text/javascript">
function Close(){
		$('#mask').hide();
		$('.window').hide();
}

function Modal(str){

		//e.preventDefault();
		//Get the A tag
		var id = '#'+str ;
	
		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		//transition effect		
		$('#mask').fadeIn(500);	
		$('#mask').fadeTo("slow",0.8);	
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		//Set the popup window to center
		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
	
		//transition effect
		$(id).fadeIn(500); 
	

	//if close button is clicked
	$('.window .close').click(function (e) {
		//Cancel the link behavior
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
	});		
	
	//if mask is clicked
	$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});			

}



    </script>

    <style type="text/css">
        #mask
        {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 9000;
            background-color: #7a7a7a;
            display: none;
        }
        #boxes .window
        {
            position: absolute;
            left: 0;
            top: 0;
            width: 440px;
            height: 200px;
            display: none;
            z-index: 9999;
            padding: 20px;
        }
        #boxes #dialog
        {
            width: 375px;
            height: 203px;
            padding: 10px;
            background-color: #ffffff;
        }
        #boxes #dialog1
        {
            width: 375px;
            height: 203px;
        }
        #dialog1 .d-header
        {
            background: url(images/login-header.png) no-repeat 0 0 transparent;
            width: 375px;
            height: 150px;
        }
        #dialog1 .d-header input
        {
            position: relative;
            top: 60px;
            left: 100px;
            border: 3px solid #cccccc;
            height: 22px;
            width: 200px;
            font-size: 15px;
            padding: 5px;
            margin-top: 4px;
        }
        #dialog1 .d-blank
        {
            float: left;
            background: url(images/login-blank.png) no-repeat 0 0 transparent;
            width: 267px;
            height: 53px;
        }
        #dialog1 .d-login
        {
            float: left;
            width: 108px;
            height: 53px;
        }
        #boxes #dialog2
        {
            background: url(images/notice.png) no-repeat 0 0 transparent;
            width: 326px;
            height: 229px;
            padding: 50px 0 20px 25px;
        }
    </style>

    <script type="text/javascript">
        function Hidden()
        {
            document.getElementById('boxes').sytle.display='none';
        }
    </script>

    <!-- End -->
    <style type="text/css">
        .subMnu
        {
            width: 120px;
            height: 15px;
            background-color: #dfdfdf;
            float: right;
            margin-right: 3px;
            border: 2px solid #ccc;
            padding: 2px;
            text-align: center;
        }
        .link
        {
            text-decoration: none;
            color: black;
        }
        .link:hover
        {
            color: White;
        }
        .subMnu:hover
        {
            background-color: Gray;
        }
        .style12
        {
            width: 35px;
        }
        .style13
        {
            width: 14px;
        }
        .style14
        {
            width: 429px;
        }
        .style15
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="boxes">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <div id="dialog2" class="window">
                    <div runat="server" id="txtMSG" style="width: 592px; height: 100%; background-color: #fff;
                        margin-top: -200px; margin-right: -110px; -moz-border-radius: 8px; padding: 8px;">
                        <div style="width: 588px; height: 20px; float: right;">
                            <a href="#" class="close">
                                <img src="../../../content/images/Profile_View_Users/close.jpg" border="0" />
                            </a>
                        </div>
                        <div style="width: 590px; float: right; height: 200px; overflow: auto;">
                            <asp:Label ID="tMSG" runat="server" Style="font-family: Tahoma; font-size: 11px;"></asp:Label>
                        </div>
                    </div>
                </div>
                <div id="dialog3" class="window">
                    <div runat="server" id="Div2" style="width: 592px; height: 20px; background-color: #f4f4f4;
                        border: 4px solid #668d9b; margin-top: -150px; margin-right: -70px; -moz-border-radius: 5px;
                        padding: 8px;">
                        <div style="float: right; width: 200px">
                            آیا از حذف این پیام مطمئن هستید؟</div>
                        <div style="width: 388px; float: right; text-align: left;">
                            <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="btnDeleteOneOnOne"
                                ImageUrl="~/content/images/Home/btnDelete.jpg" ID="ImageButton4" runat="server" />
                            <a href="#" class="close" />
                            <img src="../../../content/images/Home/btnCancel.jpg" border="0" /></a>
                        </div>
                    </div>
                </div>
                <div id="dialog4" class="window">
                    <div runat="server" id="Div3" style="width: 592px; height: 20px; background-color: #f4f4f4;
                        border: 4px solid #668d9b; margin-top: -150px; margin-right: -70px; -moz-border-radius: 5px;
                        padding: 8px;">
                        <div style="float: right; width: 200px">
                            آیا از حذف این پیام مطمئن هستید؟</div>
                        <div style="width: 388px; float: right; text-align: left;">
                            <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="btnDeleteGroup"
                                ImageUrl="~/content/images/Home/btnDelete.jpg" ID="ImageButton5" runat="server" />
                            <a href="#" class="close" />
                            <img src="../../../content/images/Home/btnCancel.jpg" border="0" /></a>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="mask">
    </div>
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            صندوق پیام
        </div>
        <div style="width: 732px; padding: 3px; height: 25px;">
            <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/content/images/Home/msg_SendMsg.jpg"
                ID="btnSendMsg" Style="height: 22px" />
            <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/content/images/Home/msg_SendMsgGroup.jpg"
                ID="btnSendMsgGroup" />
            <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/content/images/Home/backup.png"
                ID="btnBackup" />
        </div>
        <div style="width: 731px; padding: 3px; height: 25px; background-color: #dfdfdf;
            border-top: 1px solid #ccc;">
            <div class="subMnu">
                <asp:LinkButton ID="btnResiveMsg" class="link" runat="server" Text="پیام های دریافتی" /></div>
            <div class="subMnu">
                <asp:LinkButton ID="btnMsgSend" class="link" runat="server" Text="پیام های ارسالی" /></div>
            <div class="subMnu">
                <asp:LinkButton ID="btnMsgResiveGroup" class="link" runat="server" Text="پیام های گروهی دریافتی" /></div>
            <div class="subMnu">
                <asp:LinkButton ID="btnMsgSenderGroup" class="link" runat="server" Text="پیام های گروهی ارسالی" /></div>
        </div>
        <div style="width: 742px; padding: 3px; height: 100%;">
            <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="V_Resive" runat="server">
                            <div style="width: 740px; padding: 3px; height: 17px; padding-bottom: 10px;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #316b87; width: 11px;">
                                            کل:
                                        </td>
                                        <td style="width: 22px;">
                                            <asp:Label ID="lblCountMsg" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 13px;">
                                            <img src="../../../content/images/Home/msg_ReadMsg.jpg" />
                                        </td>
                                        <td style="color: #316b87; width: 107px;">
                                            پیام های خوانده شده:
                                        </td>
                                        <td style="width: 4px;">
                                            <asp:Label ID="lblCountRead" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 11px;">
                                            <img src="../../../content/images/Home/msg_UnReadMsg.png" />
                                        </td>
                                        <td style="color: #316b87; width: 107px;">
                                            پیام های خوانده نشده:
                                        </td>
                                        <td style="width: 45px;">
                                            <asp:Label ID="lblCountUnRead" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <div style="background-color: #f4f4f4; width: 340px; height: 12px; border: 4px solid #ccc;
                                                -moz-border-radius: 4px;">
                                                <asp:Literal ID="litProgress" runat="server"></asp:Literal>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde; margin-top: 2px;
                                width: 731px; height: 100%; background-color: #f3fbff;" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: Red;">
                                            <asp:Label ID="lblCapacityInbox" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblExtra" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:GridView ID="DG_ReciveMSG" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_MSG_Recive"
                                    GridLines="None" ShowHeader="False" Width="735px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="name" SortExpression="name">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="border-bottom: 1px solid #c9c9c9;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ReplyMSG" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    ImageUrl="~/content/images/Home/Reply.png" ToolTip="ارسال پیام برای فرستنده"
                                                                    ID="ImageButton2" runat="server" />
                                                            </td>
                                                            <td style="width: 47px;">
                                                                <asp:CheckBox ID="Chk_Recive" runat="server" Style="font-size: 1px; color: #fff;"
                                                                    Text='<%# Eval("ID", "{0}") %>' />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                                    Height="40px" Width="40px" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                                    ImageUrl='<%#  "~/user/Crop.aspx?P=" +Eval("picpath","{0}")+ "&W=45&H=45" %>' />
                                                            </td>
                                                            <td style="width: 201px;">
                                                                <table style="width: 100%;">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label2" Style="font-size: 12px; font-weight: bold; color: #3a3a3a;"
                                                                                runat="server" Text='<%# Eval("name", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label3" Style="color: #818181;" runat="server" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="width: 376px;">
                                                                <asp:LinkButton ID="btnShowMSG" OnCommand="ShowMSG_Recive" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    Text='<%# CheckSubject(DataBinder.Eval(Container.DataItem,"subject"),DataBinder.Eval(Container.DataItem,"ID")) %>'
                                                                    Style="color: #818181; text-decoration: none;" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ShowDialogDeleteOneOnOneRecive"
                                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                    ToolTip="حذف پیام" ID="ImageButton3" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <br />
                                        شما پیامی ندارید.
                                        <br />
                                        <br />
                                        <br />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_MSG_Recive" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Message_ResiveTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <div id="Div_Delete_Selected_Recive" runat="server" style="width: 728px; padding: 3px;
                                    height: 25px; background-color: #dfdfdf; border-top: 1px solid #ccc;">
                                    <div class="subMnu">
                                        <asp:LinkButton ID="btnDeleteReciveMsg" OnCommand="ShowDialogDeleteGroup_Recive"
                                            class="link" runat="server" Text="حذف پیام" /></div>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_Send" runat="server">
                            <div style="width: 728px; padding: 3px; height: 17px; border-bottom: 1px solid #ccc;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #316b87; width: 11px;">
                                            کل:
                                        </td>
                                        <td style="width: 22px;">
                                            <asp:Label ID="lblCountMsgSend" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 13px;">
                                            <img src="../../../content/images/Home/msg_ReadMsg.jpg" />
                                        </td>
                                        <td style="color: #316b87; width: 90px;">
                                            پیام های باز شده:
                                        </td>
                                        <td style="width: 4px;">
                                            <asp:Label ID="lblCountDeliverd" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 11px;">
                                            <img src="../../../content/images/Home/msg_UnReadMsg.png" />
                                        </td>
                                        <td style="color: #316b87; width: 90px;">
                                            پیام های باز نشده:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCountNotDeliverd" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:GridView ID="DG_SendMSG" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_MSG_Sender"
                                    GridLines="None" ShowHeader="False" Width="734px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="name" SortExpression="name">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="border-bottom: 1px solid #c9c9c9;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ReplyMSG" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    ImageUrl="~/content/images/Home/Reply.png" ToolTip="ارسال پیام برای فرستنده"
                                                                    ID="ImageButton2" runat="server" />
                                                            </td>
                                                            <td style="width: 47px;">
                                                                <asp:CheckBox ID="Chk_Send" runat="server" Style="font-size: 1px; color: #fff;" Text='<%# Eval("ID", "{0}") %>' />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                                    OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>' Height="40px"
                                                                    Width="40px" ImageUrl='<%#  "~/user/Crop.aspx?P=" +Eval("picpath","{0}")+ "&W=45&H=45" %>' />
                                                            </td>
                                                            <td style="width: 201px;">
                                                                <table style="width: 100%;">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label2" Style="font-size: 12px; font-weight: bold; color: #3a3a3a;"
                                                                                runat="server" Text='<%# Eval("name", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label3" Style="color: #818181;" runat="server" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="width: 376px;">
                                                                <asp:LinkButton ID="btnShowMSG" OnCommand="ShowMSG_Send" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    Text='<%# Eval("subject","{0}") %>' Style="color: black; text-decoration: none;"
                                                                    runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ShowDialogDeleteOneOnOneSend"
                                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                    ToolTip="حذف پیام" ID="ImageButton3" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <br />
                                        شما پیامی ارسال نکرده اید.<br />
                                        <br />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_MSG_Sender" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Message_SendTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div id="Div_Delete_Selected_Send" runat="server" style="width: 728px; padding: 3px;
                                height: 25px; background-color: #dfdfdf; border-top: 1px solid #ccc;">
                                <div class="subMnu">
                                    <asp:LinkButton ID="btnDeleteSendMsg" OnCommand="ShowDialogDeleteGroup_Send" class="link"
                                        runat="server" Text="حذف پیام" /></div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_ResiveGroup" runat="server">
                            <div style="width: 727px; padding: 3px; height: 17px; border-bottom: 1px solid #ccc;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #316b87; width: 11px;">
                                            کل:
                                        </td>
                                        <td style="width: 22px;">
                                            <asp:Label ID="lblCountReciveGroup" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 13px;">
                                            <img src="../../../content/images/Home/msg_ReadMsg.jpg" />
                                        </td>
                                        <td style="color: #316b87; width: 107px;">
                                            پیام های خوانده شده:
                                        </td>
                                        <td style="width: 4px;">
                                            <asp:Label ID="lblReadReciveGroup" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 11px;">
                                            <img src="../../../content/images/Home/msg_UnReadMsg.png" />
                                        </td>
                                        <td style="color: #316b87; width: 107px;">
                                            پیام های خوانده نشده:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblUnReadReciveGroup" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde; margin-top: 2px;
                                width: 733px; height: 100%; background-color: #f3fbff;" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            صندوق پیام های گروهی دریافتی ظرفیت گنجایش 10 پیام را دارد و در صورت پر بودن آن پیام
                                            جدیدی وارد صندوق نخواهد شد.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:GridView ID="DG_ReciveMSG_Group" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="ODS_ReciveGroup" GridLines="None" ShowHeader="False" Width="735px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="name" SortExpression="name">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="border-bottom: 1px solid #c9c9c9;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ReplyMSG" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    ImageUrl="~/content/images/Home/Reply.png" ToolTip="ارسال پیام برای فرستنده"
                                                                    ID="ImageButton2" runat="server" />
                                                            </td>
                                                            <td style="width: 47px;">
                                                                <asp:CheckBox ID="Chk_Recive" runat="server" Style="font-size: 1px; color: #fff;"
                                                                    Text='<%# Eval("ID", "{0}") %>' />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" OnCommand="RedirectFriend"
                                                                    CommandArgument='<%# Eval("email","{0}") %>' runat="server" Height="40px" Width="40px"
                                                                    ImageUrl='<%#  "~/user/Crop.aspx?P=" +Eval("picpath","{0}")+ "&W=45&H=45" %>' />
                                                            </td>
                                                            <td style="width: 201px;">
                                                                <table style="width: 100%;">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label2" Style="font-size: 12px; font-weight: bold; color: #3a3a3a;"
                                                                                runat="server" Text='<%# Eval("name", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label3" Style="color: #818181;" runat="server" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="width: 376px;">
                                                                <asp:LinkButton ID="btnShowMSG" OnCommand="ShowMSG_Recive" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    Text='<%# CheckSubject(DataBinder.Eval(Container.DataItem,"subject"),DataBinder.Eval(Container.DataItem,"ID")) %>'
                                                                    Style="color: #818181; text-decoration: none;" runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ShowDialogDeleteOneOnOneRecive"
                                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                    ToolTip="حذف پیام" ID="ImageButton3" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <br />
                                        شما پیام گروهی ندارید.
                                        <br />
                                        <br />
                                        <br />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_ReciveGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Message_Resive_GroupTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <div id="Div_Delete_Selected_Recive_Group" runat="server" style="width: 728px; padding: 3px;
                                    height: 25px; background-color: #dfdfdf; border-top: 1px solid #ccc;">
                                    <div class="subMnu">
                                        <asp:LinkButton ID="LinkButton1" OnCommand="ShowDialogDeleteGroup_ReciveGroup" class="link"
                                            runat="server" Text="حذف پیام" /></div>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_SendGroup" runat="server">
                            <div style="width: 740px; padding: 3px; height: 17px; border-bottom: 1px solid #ccc;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="color: #316b87; width: 16px;">
                                            کل:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCountSendGroup" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:GridView ID="DG_SendMSG_Group" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_SendGroup"
                                    GridLines="None" ShowHeader="False" Width="746px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="name" SortExpression="name">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="border-bottom: 1px solid #c9c9c9; height: 100%;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td class="style13">
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ReplyMSG" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    ImageUrl="~/content/images/Home/Reply.png" ToolTip="ارسال پیام برای فرستنده"
                                                                    ID="ImageButton2" runat="server" />
                                                            </td>
                                                            <td style="width: 47px;">
                                                                <asp:CheckBox ID="Chk_SendGroup" runat="server" Style="font-size: 1px; color: #fff;"
                                                                    Text='<%# Eval("ID", "{0}") %>' />
                                                            </td>
                                                            <td style="width: 201px;">
                                                                <asp:Label ID="Label3" runat="server" Style="color: #818181;" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                                            </td>
                                                            <td class="style14">
                                                                <asp:LinkButton ID="btnShowMSG" OnCommand="ShowMSG_Send" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    Text='<%# Eval("subject","{0}") %>' Style="color: black; text-decoration: none;"
                                                                    runat="server" />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="ShowDialogDeleteOneOnOneSend"
                                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                    ToolTip="حذف پیام" ID="ImageButton3" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="float: right; width: 700px; height: 100%; padding: 3px;">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# ReciveUsers(DataBinder.Eval(Container.DataItem,"other_email")) %>'></asp:Label></div>
                                                    <br />
                                                    <br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <br />
                                        شما پیامی گروهی ارسال نکرده اید.<br />
                                        <br />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_SendGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Message_Send_GroupTableAdapter"
                                    InsertMethod="Insert">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="other_Email" Type="String" />
                                        <asp:Parameter Name="_date" Type="String" />
                                        <asp:Parameter Name="subject" Type="String" />
                                        <asp:Parameter Name="message" Type="String" />
                                        <asp:Parameter Name="type" Type="Int32" />
                                        <asp:Parameter Name="deliverd" Type="Boolean" />
                                        <asp:Parameter Name="flag" Type="Boolean" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div id="Div_Delete_Selected_Send_Group" runat="server" style="width: 738px; padding: 3px;
                                height: 25px; background-color: #dfdfdf; border-top: 1px solid #ccc;">
                                <div class="subMnu">
                                    <asp:LinkButton ID="LinkButton2" OnCommand="ShowDialogDeleteGroup_SendGroup" class="link"
                                        runat="server" Text="حذف پیام" /></div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_Sender" runat="server">
                            <div style="width: 728px; padding: 3px; height: 17px; border-bottom: 1px solid #ccc;
                                float: right; color: #316b87;">
                                ارسال تک پیام
                            </div>
                            <div runat="server" id="Div_Sender">
                                <div style="width: 200px; float: right;">
                                    <asp:MultiView ID="MV_Send_TakMSG" runat="server" ActiveViewIndex="0">
                                        <asp:View runat="server" ID="V_UserTakMSG">
                                            <div style="width: 724px;">
                                                <asp:ObjectDataSource ID="ODS_My_Friends" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyRelationshipTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="user" Type="String" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                                <asp:DataList ID="DL_User_TakMSG" runat="server" DataSourceID="ODS_My_Friends" RepeatColumns="4"
                                                    RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="width: 160px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td class="style12">
                                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton6" runat="server"
                                                                            CommandArgument='<%# Eval("user","{0}") %>' Height="45px" ImageUrl='<%# GetAvatar(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                                            OnCommand="SetSenderUser" Width="45px" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblNotAllow" runat="server" Style="color: Red;"></asp:Label>
                                            </div>
                                        </asp:View>
                                        <asp:View runat="server" ID="V_SendTakMSG">
                                            <div style="width: 724px; float: right;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <div style="float: right; width: 720px;">
                                                                <div style="float: right;">
                                                                    <asp:TextBox ID="txtSender" onfocus="if(this.value=='گیرنده . . .'){this.value='';}"
                                                                        onblur="if(this.value==''){this.value='گیرنده . . .';}if(this.value=='گیرنده . . .')this.style.color='#999999';"
                                                                        onmousedown="this.style.color='#000000';" Style="border: none; font-family: Tahoma;
                                                                        font-size: 11px;" ReadOnly="true" Text="گیرنده . . ." runat="server" Width="634px">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <div style="float: right; width: 86px; color: Blue;">
                                                                    <asp:LinkButton ID="btnGotoSelectUser" Style="text-decoration: none;" runat="server">(انتخاب کاربر جدید)</asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtSubject" onfocus="if(this.value=='عنوان پیام . . .'){this.value='';}"
                                                                onblur="if(this.value==''){this.value='عنوان پیام . . .';}if(this.value=='عنوان پیام . . .')this.style.color='#999999';"
                                                                onmousedown="this.style.color='#000000';" Text="عنوان پیام . . ." Style="border: 1px solid #ccc;
                                                                padding: 2px; font-family: Tahoma; font-size: 11px;" runat="server" Width="718px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtMessage" runat="server" onfocus="if(this.value=='پیام . . .'){this.value='';}"
                                                                onblur="if(this.value==''){this.value='پیام . . .';}if(this.value=='پیام . . .')this.style.color='#999999';"
                                                                onmousedown="this.style.color='#000000';" Text="پیام . . ." Style="border: 1px solid #ccc;
                                                                padding: 2px; font-family: Tahoma; font-size: 11px; resize: none;" Height="227px"
                                                                TextMode="MultiLine" Width="718px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="float: right;">
                                                                <asp:LinkButton ID="brnSendMSG" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                                                    text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblWrong" Style="color: red;" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_SenderGroup" runat="server">
                            <div style="width: 728px; padding: 3px; height: 17px; border-bottom: 1px solid #ccc;
                                float: right; color: #316b87;">
                                ارسال پیام گروهی
                            </div>
                            <div runat="server" id="Div_SenderGroup">
                                <div style="width: 200px; float: right;">
                                    <div>
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_My_Friends"
                                            AllowPaging="True" GridLines="None" ShowHeader="False" Width="200px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="user" SortExpression="user">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("user") %>'></asp:TextBox></EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td class="style12">
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="SetSenderUsers"
                                                                        CommandArgument='<%# Eval("user","{0}") %>' ImageUrl='<%# GetAvatar(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                                        ID="ImageButton6" runat="server" Height="45px" Width="45px" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div>
                                        <asp:Label ID="lblNotAllowGroup" runat="server" Style="color: Red;"></asp:Label></div>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyRelationshipTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="user" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </div>
                                <div style="width: 542px; float: right;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:ListBox ID="LstUsers" Style="border: none; font-family: Tahoma; font-size: 11px;"
                                                    runat="server" Width="531px"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSubject_Group" runat="server" onblur="if(this.value==''){this.value='عنوان پیام . . .';}if(this.value=='عنوان پیام . . .')this.style.color='#999999';"
                                                    onfocus="if(this.value=='عنوان پیام . . .'){this.value='';}" onmousedown="this.style.color='#000000';"
                                                    Style="border: 1px solid #ccc; font-family: Tahoma; padding: 2px; font-size: 11px;"
                                                    Text="عنوان پیام . . ." Width="503px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtMessage_Group" runat="server" Height="227px" onblur="if(this.value==''){this.value='پیام . . .';}if(this.value=='پیام . . .')this.style.color='#999999';"
                                                    onfocus="if(this.value=='پیام . . .'){this.value='';}" onmousedown="this.style.color='#000000';"
                                                    Style="border: 1px solid #ccc; font-family: Tahoma; font-size: 11px; padding: 2px;
                                                    resize: none;" Text="پیام . . ." TextMode="MultiLine" Width="503px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right;">
                                                    <asp:LinkButton ID="brnSendMSG_Group" Style="color: #58808C; font-family: koodak;
                                                        font-size: 13px; text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                                </div>
                                                <div visible="false" style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                                                    margin-top: 2px; float: right; width: 500px; height: 100%; background-color: #f3fbff;"
                                                    id="Div_Jiring" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                کاربر محترم;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                شما برای فرستادن پیام به بیش از 10 نفر باید از سرویس لحظه ای ما استفاده کنید.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                پس از موافقت شما , شما می توانید تا 100 نفر پیام گروهی ارسال کنید.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblJiring" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: Red;">
                                                                توجه: پس از موافقت شما مبلغ بالا بلافاصه از موجودی شما کسر می شود و پیام بلافاضله
                                                                برای اشخاص مشخص شده ارسال می شود بنابراین در پر کردن بخش ها دقت لازم را بعمل بیاورید..
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <br />
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnKasrJiring" ImageUrl="~/content/images/Stage/Jiring/Accept.png"
                                                                    runat="server" />
                                                                <br />
                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblWrongGroup" runat="server" Style="color: red;"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_Success" runat="server">
                            <div id="Div1" style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
                                margin-top: 2px; width: 732px; height: 100%; background-color: #f3fbff;" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <img src="../../../content/images/Home/Accept.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: Red;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            پیام شما با موفقیت ارسال گردید.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="width: 731px; padding: 1px; height: 100%; float: right;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <div style="border-bottom: 1px solid #bdd1de; border-top: 1px solid #bdd1de;">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 40px;">
                                        <img src="../../../content/images/Profile_View_Users/Copyright.png" />
                                    </td>
                                    <td>
                                        پیام های مدیریتی شهردات کام
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="DG_InboxSystem" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_InboxSystem"
                            GridLines="None" ShowHeader="False" Width="733px">
                            <Columns>
                                <asp:TemplateField HeaderText="date" SortExpression="date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table class="style15">
                                            <tr>
                                                <td style="width: 8px;">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="DeleteMSGSystem"
                                                        CommandArgument='<%# Eval("ID","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                        ID="ImageButton7" runat="server" />
                                                </td>
                                                <td style="width: 6px;">
                                                    <img alt="" src="../../../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="btnShowMSGSystem" OnCommand="ShowMSGSystem" CommandArgument='<%# Eval("ID","{0}") %>'
                                                        Text='<%# Bind("subject") %>' Style="font-weight: bold; color: Black; text-decoration: none;"
                                                        runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("date") %>' Style="color: #2a6489;"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# "(ساعت:"+Eval("time","{0}")+")" %>'
                                                        Style="color: #7e7e7e;"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="time" SortExpression="time">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="subject" SortExpression="subject">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("subject") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                شما پیامی ندارید.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_InboxSystem" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Profile_InboxSystemTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="_date" Type="String" />
                                <asp:Parameter Name="time" Type="String" />
                                <asp:Parameter Name="subject" Type="String" />
                                <asp:Parameter Name="message" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border-bottom: 1px solid #E3ACA8; border-top: 1px solid #E3ACA8; padding: 5px;
                            color: #CA8785;">
                            پیام های سیستمی بعد از یک ماه خود به خود حذف می گردند.
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:UpdateProgress ID="UpdateProgress8" runat="server">
        <ProgressTemplate>
            <div style="width: 200px; float: right; padding: 4px;">
                <div style="width: 25px; float: right;">
                    <img src="../../../Content/images/Profile_View_Users/Loading_0.gif" />
                </div>
                <div style="width: 170px; float: right;">
                    در حال بارگزاری ...
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <uc1:MSG_Backup ID="MSG_Backup1" runat="server" Visible=false />
</asp:Content>

