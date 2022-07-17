<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="user_Default" %>

<%@ Register Src="../UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/Home/GuidMenu.ascx" TagName="GuidMenu" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/Home/Plus.ascx" TagName="Plus" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Root/TopTextLogo.ascx" TagName="TopTextLogo" TagPrefix="uc4" %>
<%@ Register Src="../UserControl/Root/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc5" %>
<%@ Register Src="../UserControl/Root/Footer_other.ascx" TagName="Footer" TagPrefix="uc6" %>
<%@ Register Src="../UserControl/ADS/ADS.ascx" TagName="ADS" TagPrefix="uc7" %>
<%@ Register Src="../UserControl/Home/Panel_BigUpdate.ascx" TagName="Panel_BigUpdate"
    TagPrefix="uc8" %>
<%@ Register Src="../UserControl/Profile/Panel_BigUpdateProfile.ascx" TagName="Panel_BigUpdateProfile"
    TagPrefix="uc9" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="SHORTCUT ICON" href="../content/images/Home/ShaahrFavorite.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>پروفایل</title>
    <link href="../content/css/Profile_View_Users/css.css" rel="stylesheet" type="text/css" />
    <!-- File Jquery Key -->

    <script src="../jquery.min.js" type="text/javascript"></script>

    <script src="../Content/js/yoxview/jquery.min.js" type="text/javascript"></script>

    <!-- Slide Up and Slide Down Desktop -->

    <script type="text/javascript">
            
		   $(function() {
		        $('#a1').click(function() {
				     $('.box').slideDown(1000); 
				     $('#a1').hide(); 
				     $('#a2').show();
		        });
		   });

		   $(function() {
		        $('#a2').click(function() {
				     $('.box').slideUp(1000);
				     $('#a1').show(); 
				     $('#a2').hide();
		        });
		   });
    </script>

    <!-- Module popup  -->

    <script type="text/javascript">
    
    function Close(){
		$('#mask').hide();
		$('.window').hide();
}


function Modal(str){
        $('#dialog').hide();
        $('#dialog2').hide();
        $('#dialog3').hide();
        $('#dialog4').hide();
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
        .BigPanel
        {
            background-color: #f5f5f5;
            border: solid #dedede 1px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-top: 5px;
        }
        .TXT
        {
            margin-top: 1px;
            font-family: Tahoma;
            font-size: 11px;
            border: 1px solid #b0b0b0;
            padding: 2px;
            resize: none;
        }
        .Div_TXT
        {
            background-color: #CCCCCC;
            margin-right: 46px;
            margin-top: -4px;
            width: 489px;
            padding: 3px;
        }
    </style>
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                                                                                                 "../content/font/W_koodak.TTF" );
        }
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
        	direction:rtl;
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
        .DivContent
        {
            border: 1px solid #E5E5E5;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            padding: 2px;
            width: 39px;
        }
    </style>

    <script type="text/javascript">
        function Hidden()
        {
            document.getElementById('boxes').sytle.display='none';
            /* document.getElementById('boxesZ').sytle.display='none'; */
        }
    </script>

    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                                        "../content/font/W_koodak.TTF" );
        }
        .MoreDiv
        {
            background-color: #ececec;
            padding: 4px;
            margin-top: -200px;
            width: 492px;
            height: 400px;
            border: 3px solid #b5b5b5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .MoreFrame
        {
            width: 488px;
            height: 17px;
            padding: 2px;
            font-family: Tahoma;
            font-size: 11px;
            color: #4F4F4F;
        }
        .MoreDownFrame
        {
            text-align: center;
            border: 1px solid #B5B5B5;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 488px;
            height: 375px;
            overflow: auto;
        }
        .PicFrame
        {
            border: 2px solid #ccc;
            padding: 2px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            margin-top: 2px;
            margin-left: 1px;
            margin-right: 1px;
            border-radius: 5px;
        }
    </style>
    <!-- End -->
    <style type="text/css">
        .style1
        {
            width: 29%;
            height: 221px;
        }
        .style2
        {
            width: 100%;
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
            width: 456px;
        }
    </style>

    <script language="javascript" type="text/javascript">
    function OpenFileUpload()
    { 
     document.getElementById('<%= PhotoUpload.ClientID%>').click();
    }    
    </script>

    <style type="text/css">
        /* قاب دیالوگی که کاربر اشتباه پیام می فرستد یا به درستی */.Dialog_Context
        {
            border: 5px solid #858585;
            background-color: #ccc;
            width: 600px;
            height: 32px;
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
            border-radius: 7px;
            margin-top: -200px;
            margin-right: -70px;
            padding: 2px;
        }
        /*  دیالوگی که کاربر اشتباه پیام می فرستد  به درستی */.Dialog_
        {
            background-color: red;
            width: 595px;
            height: 30px;
            -moz-border-radius: 3px 3px 0px 0px;
            -moz-border-radius: 3px 3px 0px 0px;
            -webkit-border-radius: 3px 3px 0px 0px;
            border-radius: 3px;
            padding: 2px 4px 0px 0px;
            color: White;
        }
    </style>
    <!-- Like Menu -->
    <link href="../Content/js/LikeMenu/menu.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="boxes">
        <div id="dialog2" class="window">
            <div style="border: 5px solid #858585; background-color: #ccc; width: 600px; height: 255px;
                -moz-border-radius: 7px; margin-top: -200px; margin-right: -110px; padding: 2px;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="background-color: #096d9e; width: 595px; height: 20px; -moz-border-radius: 3px 3px 0px 0px;
                            padding: 2px 4px 0px 0px;">
                            <div style="float: right;">
                                <img src="../content/images/Profile_View_Users/comment.png" />&nbsp;</div>
                            <div>
                                <asp:Label ID="lblTitleMessage" runat="server" Style="color: White; font-family: Tahoma;
                                    font-size: 13px;"></asp:Label></div>
                        </div>
                        <div style="margin-top: 2px; background-color: #8ca9b1; width: 595px; height: 17px;
                            padding: 2px 4px 0px 0px;">
                            <asp:Label ID="lblDateMessage" Style="font-family: Tahoma; font-size: 11px; color: #3a5962;"
                                runat="server"></asp:Label>
                        </div>
                        <div style="margin-top: 2px; background-color: #8ca9b1; width: 595px; height: 17px;
                            padding: 2px 4px 0px 0px;">
                            <asp:Label ID="lblToMessage" Style="font-family: Tahoma; font-size: 11px; color: #223f47;"
                                runat="server"></asp:Label>
                        </div>
                        <div style="margin-top: 2px; width: 595px; height: 25px; -moz-border-radius: 1px;">
                            <asp:TextBox ID="txtSubjectMessage" runat="server" Width="595" Text="عنوان پیام ..."
                                onfocus="if(this.value=='عنوان پیام ...'){this.value='';}" onblur="if(this.value==''){this.value='عنوان پیام ...';}if(this.value=='عنوان پیام ...')this.style.color='#999999';"
                                onmousedown="this.style.color='#000000';" TextMode="MultiLine" Height="15px"
                                Style="font-family: Tahoma; font-size: 11px;">
                            </asp:TextBox>
                        </div>
                        <div style="margin-top: -4px; width: 595px; -moz-border-radius: 1px; padding: 0px;">
                            <asp:TextBox ID="txtMessage" runat="server" Text="متن شما ..." onfocus="if(this.value=='متن شما ...'){this.value='';}"
                                onblur="if(this.value==''){this.value='متن شما ...';}if(this.value=='متن شما ...')this.style.color='#999999';"
                                onmousedown="this.style.color='#000000';" Width="595" TextMode="MultiLine" Height="135px"
                                Style="font-family: Tahoma; font-size: 11px;">
                            </asp:TextBox>
                            <asp:LinkButton ID="btnSendMessage" Style="color: #096D9E; font-family: koodak; font-size: 13px;
                                text-decoration: none; margin-right: 2px;" runat="server">ارسال</asp:LinkButton>
                            / <a href="#" class="close" style="color: gray; font-family: koodak; font-size: 13px;
                                text-decoration: none; margin-right: 2px;">لغو </a>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div id="dialog3" class="window">
            <div class="Dialog_Context">
                <div class="Dialog_" style="background-color: Green;">
                    <table>
                        <tr>
                            <td>
                                <a href="#" class="close">
                                    <img src="../content/images/Profile_View_Users/Tik_0.png" border="0" /></a>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblTitleMessageAfterSend" runat="server" Style="font-family: Tahoma;
                                            font-size: 13px;"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="dialog4" class="window">
            <div class="Dialog_Context">
                <div class="Dialog_">
                    <table>
                        <tr>
                            <td>
                                <a href="#" class="close">
                                    <img src="../content/images/Profile_View_Users/deny.png" border="0" /></a>
                            </td>
                            <td>
                                <asp:Label ID="lblErrorSendMessage" Text="دو مشخصه عنوان و متن پیام باید پر شوند."
                                    runat="server" Style="color: #fff; font-family: Tahoma; font-size: 13px;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="dialog5" class="window">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:MultiView ID="MultiMore" runat="server" ActiveViewIndex="0">
                        <asp:View ID="V_More_Friends" runat="server">
                            <div class="MoreDiv">
                                <div class="MoreFrame">
                                    <div style="float: right; width: 488px;">
                                        <div style="float: right; width: 472px;">
                                            لیست دوستان
                                        </div>
                                        <div style="float: right;">
                                            <a href="#" class="close">
                                                <img src="../Content/images/Profile_View_Users/close.jpg" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="MoreDownFrame">
                                    <asp:DataList ID="DL_Friends_More" runat="server" DataSourceID="ODS_Friends_More"
                                        RepeatColumns="6" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="PicFrame">
                                                <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                                    Style="margin-top: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                    border-radius: 4px;" ID="imgFriends" runat="server" Height="66px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=70&H=70" %>'
                                                    Width="66px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_Friends_More" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Friend_View_MoreUsersTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="email" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_More_Familys" runat="server">
                            <div class="MoreDiv">
                                <div class="MoreFrame">
                                    <div style="float: right; width: 488px;">
                                        <div style="float: right; width: 472px;">
                                            لیست بستگان
                                        </div>
                                        <div style="float: right;">
                                            <a href="#" class="close">
                                                <img src="../Content/images/Profile_View_Users/close.jpg" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="MoreDownFrame">
                                    <asp:DataList ID="DL_Family_More" runat="server" DataSourceID="ODS_Family_More" RepeatColumns="6"
                                        RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="PicFrame">
                                                <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                                    Style="margin-top: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                    border-radius: 4px;" ID="imgFriends" runat="server" Height="66px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=70&H=70" %>'
                                                    Width="66px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_Family_More" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Family_view_MoreUsersTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="email" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_More_Commons" runat="server">
                            <div class="MoreDiv">
                                <div class="MoreFrame">
                                    <div style="float: right; width: 488px;">
                                        <div style="float: right; width: 472px;">
                                            لیست افراد مشترک
                                        </div>
                                        <div style="float: right;">
                                            <a href="#" class="close">
                                                <img src="../Content/images/Profile_View_Users/close.jpg" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="MoreDownFrame">
                                    <asp:DataList ID="DataList3" runat="server" DataSourceID="ODS_ProfileCommonMoreFriends"
                                        Width="79px" RepeatColumns="6" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="PicFrame">
                                                <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                                    Style="margin-top: 2px;" ID="imgFriends" runat="server" Height="66px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=45&H=45" %>'
                                                    Width="66px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_ProfileCommonMoreFriends" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Common_Friend_view_MoreUsersTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="email" Type="String" />
                                            <asp:Parameter Name="otherEmail" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="V_More_Shaahrs" runat="server">
                            <div class="MoreDiv">
                                <div class="MoreFrame">
                                    <div style="float: right; width: 488px;">
                                        <div style="float: right; width: 472px;">
                                            لیست شهرها
                                        </div>
                                        <div style="float: right;">
                                            <a href="#" class="close">
                                                <img src="../Content/images/Profile_View_Users/close.jpg" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="MoreDownFrame">
                                    <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="ODS_UsersMoreShaahrs"
                                        Width="79px" RepeatColumns="6" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="PicFrame">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" OnCommand="GotoShaahr"
                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                    runat="server" Height="66px" Width="66px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_UsersMoreShaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Users_MoreShaahrsTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="email" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div id="mask">
    </div>
    <div id="body">
        <div id="header">
            <!--Start Header-->
            <div id="Guid">
                <uc2:GuidMenu ID="GuidMenu1" runat="server" />
            </div>
            <div id="headerPic">
                <asp:Image ForeColor="Transparent" ID="imgHeader" runat="server" />
            </div>
            <div id="Nav">
                <uc4:TopTextLogo ID="TopTextLogo1" runat="server" />
                <div id="searchNav">
                    <uc1:FindUsers ID="FindUsers1" runat="server" />
                </div>
                <div id="Offer">
                    <uc3:Plus ID="Plus" runat="server" />
                </div>
            </div>
        </div>
        <!-- End Heeader -->
        <div id="master">
            <div id="RightMaster">
                <div id="avatars">
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ForeColor="Transparent" ID="imgAvatar_1" runat="server" Height="72px"
                                                Width="94px" BorderColor="#CCCCCC" BorderWidth="1px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ForeColor="Transparent" ID="imgAvatar_2" runat="server" Height="72px"
                                                Width="94px" BorderColor="#CCCCCC" BorderWidth="1px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ForeColor="Transparent" ID="imgAvatar_3" runat="server" Height="72px"
                                                Width="94px" BorderColor="#CCCCCC" BorderWidth="1px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:ImageButton ForeColor="Transparent" OnClick="imgBigAvatars_Click" ID="imgBigAvatars"
                                    runat="server" Height="72px" Width="94px" BorderColor="#CCCCCC" BorderWidth="1px" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="ads_panel">
                    <uc7:ADS ID="ADS1" runat="server" />
                    <div id="panels">
                        <div id="Pnl_friend" runat="server" class="PnlContent">
                            <div class="Pnl_Header">
                                لیست دوستان</div>
                            <div style="margin-top: 2px;">
                                <asp:DataList ID="DL_Friends" runat="server" DataSourceID="ODS_ProfileFriends" Width="79px"
                                    RepeatColumns="4" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="DivContent">
                                            <asp:ImageButton AlternateText="" OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                                Style="margin-top: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                border-radius: 4px;" ID="imgFriends" runat="server" Height="39px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=45&H=45" %>'
                                                Width="39px" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div style="font-family: Tahoma; font-size: 10px; color: Gray;">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="btnMORE_Friends" Style="text-decoration: none; color: Gray;"
                                            runat="server"> بیشتر ...</asp:LinkButton>
                                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel5">
                                            <ProgressTemplate>
                                                <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:ObjectDataSource ID="ODS_ProfileFriends" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Friend_View_UsersTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter Name="email" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <div id="Pnl_Family" runat="server" class="PnlContent">
                            <div class="Pnl_Header">
                                لیست بستگان</div>
                            <div style="margin-top: 2px;">
                                <asp:DataList ID="DL_Family" runat="server" DataSourceID="ODS_Family" Width="79px"
                                    RepeatColumns="4" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="DivContent">
                                            <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                                Style="margin-top: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                border-radius: 4px;" ID="imgFriends" runat="server" Height="39px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=45&H=45" %>'
                                                Width="39px" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_Family" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Family_view_UsersTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="email" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div style="font-family: Tahoma; font-size: 10px; color: Gray;">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="btnMORE_Family" Style="text-decoration: none; color: Gray;" runat="server"> 
                                        بیشتر ...</asp:LinkButton>
                                        <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel7">
                                            <ProgressTemplate>
                                                <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div id="Pnl_common" runat="server" class="PnlContent">
                            <div class="Pnl_Header" style="margin-top: 2px;">
                                لیست افراد مشترک</div>
                            <asp:DataList ID="DL_Common_Friend" runat="server" DataSourceID="ODS_ProfileCommonFriends"
                                Width="79px" RepeatColumns="4" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <div class="DivContent">
                                        <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("user","{0}") %>'
                                            Style="margin-top: 2px;" ID="imgFriends" runat="server" Height="39px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=45&H=45" %>'
                                            Width="39px" />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS_ProfileCommonFriends" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Profile_Common_Friend_view_UsersTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="otherEmail" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <div style="font-family: Tahoma; font-size: 10px; color: Gray;">
                                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="btnMORE_Common" Style="text-decoration: none; color: Gray;" runat="server"> 
                                        بیشتر ...</asp:LinkButton>
                                        <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel10">
                                            <ProgressTemplate>
                                                <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div id="Pnl_shaahr" runat="server" class="PnlContent">
                            <div class="Pnl_Header" style="margin-top: 2px;">
                                لیست شهر ها</div>
                            <div style="margin-top: 2px;">
                                <asp:DataList ID="DL_Shaahrs" runat="server" DataKeyField="ID" DataSourceID="ODS_UsersShaahrs"
                                    Width="79px" RepeatColumns="4" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="DivContent">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" OnCommand="GotoShaahr"
                                                CommandArgument='<%# Eval("id","{0}") %>' ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                runat="server" Height="39px" Width="39px" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <asp:ObjectDataSource ID="ODS_UsersShaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Users_ShaahrsTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter Name="email" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <div style="font-family: Tahoma; font-size: 10px; color: Gray;">
                                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="btnMORE_Shaahr" Style="text-decoration: none; color: Gray;" runat="server"> 
                                        بیشتر ...</asp:LinkButton>
                                        <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel11">
                                            <ProgressTemplate>
                                                <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="CenterMaster">
                <div>
                    <asp:Label ID="lblFnLn" Style="font-family: koodak; font-size: 20px; color: #444444;"
                        runat="server"></asp:Label>
                </div>
                <div id="think">
                    <h1 style="font-weight: normal; font-size: 11px;">
                        <asp:Label ID="lbThink" runat="server" Text=""></asp:Label>
                    </h1>
                </div>
                <div id="desktop">
                    <div style="float: right;">
                        <div style="float: right; padding-left: 4px;">
                            <a>
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ForeColor="Transparent" ID="SendMessage" runat="server" ImageUrl="~/content/images/Profile_View_Users/message.png" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </a>
                        </div>
                        <a id="a1" href="###" style="text-decoration: none; padding-left: 2px;">
                            <asp:Image ForeColor="Transparent" ID="imgDownBilboard" ImageUrl="~/content/images/Profile_View_Users/mnu_DownBild.png"
                                runat="server" ToolTip="بیلبورد : مکانی برای گذاشتن عکس , لینک و مطلبتان" />
                        </a><a id="a2" href="###" style="text-decoration: none; display: none; padding-left: 3px;">
                            <asp:Image ForeColor="Transparent" ID="imgUpBilboard" ImageUrl="~/content/images/Profile_View_Users/mnu_UpBild.png"
                                runat="server" ToolTip="بیلبورد : مکانی برای گذاشتن عکس , لینک و مطلبتان" />
                        </a><a>
                            <asp:ImageButton ForeColor="Transparent" ID="btnMnuProfile" OnClick="btnMnuInfo_Click"
                                runat="server" ImageUrl="~/content/images/Profile_View_Users/mnu_profile.png" />
                        </a><a>
                            <asp:ImageButton ForeColor="Transparent" ID="btnMnuComminction" runat="server" OnClick="btnMnuContact_Click"
                                ImageUrl="~/content/images/Profile_View_Users/mnu_comminaction.png" />
                        </a><a>
                            <asp:ImageButton ForeColor="Transparent" ID="btnMnuAlbum" runat="server" OnClick="btnMnuAlbum_Click"
                                ImageUrl="~/content/images/Profile_View_Users/mnu_Album.png" />
                        </a><a>
                            <asp:ImageButton ForeColor="Transparent" ID="btnMnuPost" runat="server" OnClick="btnMnuPost_Click"
                                ImageUrl="~/content/images/Profile_View_Users/mnu_Post.png" />
                        </a><a>
                            <asp:ImageButton ForeColor="Transparent" ID="btnMnuPolling" runat="server" OnClick="btnMnuPolling_Click"
                                ImageUrl="~/content/images/Profile_View_Users/mnu_polling.png" />
                        </a>
                        <asp:UpdateProgress ID="UpdateProgress6" runat="server" AssociatedUpdatePanelID="UpdatePanel6">
                            <ProgressTemplate>
                                <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <div id="Div_Panel_text" runat="server">
                            <div class="box" style="margin-top: 4px; height: 152px;">
                                <div class="DivTop">
                                    مطلب</div>
                                <div class="box_content">
                                    <asp:TextBox ID="txtTitlePost" runat="server" Height="15px" Text="عنوان مطلب شما ..."
                                        ForeColor="#999999" onfocus="if(this.value=='عنوان مطلب شما ...'){this.value='';}"
                                        onblur="if(this.value==''){this.value='عنوان مطلب شما ...';}if(this.value=='عنوان مطلب شما ...')this.style.color='#999999';"
                                        onmousedown="this.style.color='#000000';" Style="margin-top: 2px; border: solid #CCC thin;
                                        padding: 3px; font-family: Tahoma; font-size: 11px;" Width="540px"></asp:TextBox>
                                    <asp:TextBox ID="txtPost" Text="متن شما ..." runat="server" Style="margin-top: 3px;
                                        padding: 3px;" ForeColor="#999999" onfocus="if(this.value=='متن شما ...'){this.value='';}"
                                        onblur="if(this.value==''){this.value='متن شما ...';}if(this.value=='متن شما ...')this.style.color='#999999';"
                                        onmousedown="this.style.color='#000000';" Width="538px" TextMode="MultiLine"
                                        Height="69px" Font-Names="tahoma" Font-Size="11px">
                                    </asp:TextBox>
                                    <asp:LinkButton ID="btnSendPost" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div id="Div_Panel_Link" runat="server">
                            <div class="box" style="margin-top: 4px; height: 126px;">
                                <div class="DivTop">
                                    لینک</div>
                                <div class="box_content">
                                    <asp:TextBox ID="txtLink" Text="Http://" runat="server" Style="text-align: left;
                                        direction: ltr; margin-top: 3px;" Width="544px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                                    <asp:TextBox ID="txtTextLink" Text="توضیحات لینک شما ..." runat="server" Style="margin-top: 3px;
                                        padding: 3px; border: solid #CCC thin;" ForeColor="#999999" onfocus="if(this.value=='توضیحات لینک شما ...'){this.value='';}"
                                        onblur="if(this.value==''){this.value='توضیحات لینک شما ...';}if(this.value=='توضیحات لینک شما ...')this.style.color='#999999';"
                                        onmousedown="this.style.color='#000000';" Width="540px" TextMode="MultiLine"
                                        Height="47px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                                    <asp:LinkButton ID="btnSendLink" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div id="Div_Panel_Photo" runat="server">
                            <div class="box" style="margin-top: 4px; height: 126px;">
                                <div class="DivTop">
                                    عکس</div>
                                <div class="box_content">
                                    <div style="direction: ltr; margin-top: 2px; text-align: right;">
                                        <asp:FileUpload ID="PhotoUpload" runat="server" Style="display: none;" />
                                        <a href="javascript:void(0)" onclick="OpenFileUpload()" style="font-family: koodak;
                                            font-size: 12px; color: #0992C0; text-decoration: none; margin-right: 2px; text-shadow: 0.2em 0.2em #DFDFDF;">
                                            . . . فایل خود را انتخاب کنید</a>
                                    </div>
                                    <asp:TextBox ID="txtPhoto" Text="توضیحات تصویر شما ..." runat="server" Style="margin-top: 3px;
                                        padding: 3px; border: solid #CCC thin;" ForeColor="#999999" onfocus="if(this.value=='توضیحات تصویر شما ...'){this.value='';}"
                                        onblur="if(this.value==''){this.value='توضیحات تصویر شما ...';}if(this.value=='توضیحات تصویر شما ...')this.style.color='#999999';"
                                        onmousedown="this.style.color='#000000';" Width="540px" TextMode="MultiLine"
                                        Height="44px" Font-Names="tahoma" Font-Size="11px"></asp:TextBox>
                                    <asp:LinkButton ID="btnSendPhoto" Style="color: #58808C; font-family: koodak; font-size: 13px;
                                        text-decoration: none; margin-right: 2px;" runat="server">ارسال . . .</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="update" runat="server">
                    <uc9:Panel_BigUpdateProfile ID="Panel_BigUpdateProfile1" runat="server" />
                </div>
            </div>
            <div id="LeftMaster">
                <uc5:LeftMenu ID="LeftMenu1" runat="server" />
            </div>
        </div>
        <uc6:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>
