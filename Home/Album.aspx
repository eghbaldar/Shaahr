<%@ Page Language="VB" MasterPageFile="~/home/Home.master" AutoEventWireup="false"
    CodeFile="Album.aspx.vb" Inherits="home_Album" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Module -->

    <script type="text/javascript" src="../jquery-latest.pack.js"></script>

    <script type="text/javascript">
    
    function AlbumC(){

		//e.preventDefault();
		
		//Get the A tag
		var id = '#dialog1';
	
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
            height: 100%;
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
    </style>
    <!-- -->
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                                                               "../content/font/W_koodak.TTF" );
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 58px;
        }
    </style>
    <!-- Confirm -->

    <script src="../Content/js/confirm/impromptu/jquery-impromptu.2.6.min.js" type="text/javascript"></script>

    <link href="../content/js/confirm/impromptu/impromptu.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    function confirmDeleteResult(v,m,f)
    {
        if(v) //user clicked OK 
            $('#' + f.hidID).click();
    }  
    function CloseDialog()
    {
    $('#mask').hide();
	$('.window').hide();
      $('#dialog1').hide();
    }  
      
    </script>

    <!-- End -->
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="boxes">
        <div id="dialog1" class="window">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="border: 5px solid #858585; background-color: #ccc; width: 600px; height: 427px;
                        -moz-border-radius: 7px; margin-top: 100px; margin-right: -110px; padding: 2px;">
                        <div style="background-color: #096d9e; width: 595px; height: 30px; -moz-border-radius: 3px 3px 0px 0px;
                            padding: 2px 4px 0px 0px; float: right;">
                            <div style="float: right;">
                                <img src="../content/images/Home/Album.png" />&nbsp;</div>
                            <div style="color: #fff; margin-top: 5px;">
                                ایجاد آلبوم جدید</div>
                        </div>
                        <div style="margin-top: 2px; background-color: #EFF4F7; width: 595px; height: 17px;
                            float: right; padding: 2px 4px 0px 0px;">
                            <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                                <ProgressTemplate>
                                    <div style="float: right;">
                                        <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                                    </div>
                                    <div style="float: right; color: #000; padding-right: 4px;">
                                        در حال بارگزاری...</div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                        <div style="margin-top: 2px; background-color: #8ca9b1; width: 595px; height: 17px;
                            float: right; color: #fff; padding: 2px 4px 0px 0px;">
                            لیست آلبوم های موجود
                        </div>
                        <div style="margin-top: 2px; width: 599px; height: 320px; -moz-border-radius: 1px;
                            background-color: #fff; float: right;">
                            <asp:GridView ID="DG_Album" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                                Height="100%" DataSourceID="ObjectDataSource1" GridLines="None" ShowHeader="False"
                                Width="598px" AllowPaging="True" PageSize="5">
                                <PagerStyle CssClass="PageS" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Code" InsertVisible="False" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="border: 1px solid #9eb5bd;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 4px;">
                                                            <img src="../content/images/Home/Album.jpg" />
                                                        </td>
                                                        <td style="width: 515px;">
                                                            <table class="style6">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label Style="color: #1c4d5d; font-weight: bold;" ID="Label2" runat="server"
                                                                            Text='<%# Eval("AlbumName", "{0}") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Literal ID="Literal1" runat="server" Text='<%# CountPicture(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <a id="linkDelete" runat="server" href="#" title="حذف پست">
                                                                <asp:Image runat="server" ForeColor="Transparent" ID="Image1" ImageUrl="~/content/images/Profile_View_Users/closeObject.png"
                                                                    runat="server" Height="16px" />
                                                            </a>
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" Style="display: none;" ImageUrl="~/content/images/Profile_View_Users/close.jpg"
                                                                ID="btnDeleteObject" CommandArgument='<%# Eval("code","{0}") %>' OnCommand="DeleteAlbum"
                                                                runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                TypeName="DS_HomeProfileTableAdapters.tbl_Profile_AlbumTableAdapter" UpdateMethod="Update">
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
                        </div>
                        <div style="width: 599px; -moz-border-radius: 1px; padding-top: 5px; height: 17px;
                            float: right;">
                            <div style="float: right; width: 560px;">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 49px; color: #494949;">
                                            نام آلبوم:
                                        </td>
                                        <td>
                                            <asp:TextBox Style="font-family: Tahoma; font-size: 11px; padding: 1px;" ID="txtAlbumName"
                                                runat="server" Width="500px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="float: right; width: 30px;">
                                <asp:LinkButton ID="btnSendMessage" OnClick="btnSendMessage_Click" Style="color: #096D9E;
                                    font-family: koodak; font-size: 13px; text-decoration: none; margin-right: 2px;"
                                    runat="server">ارسال</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="mask">
        </div>
    </div>
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            آلبوم تصاویر
        </div>
        <div>
            <table class="style6">
                <tr>
                    <td class="style7">
                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgNotAlbum" runat="server"
                            Height="96px" Style="border: 3px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px;
                            -webkit-border-radius: 4px; border-radius: 4px;" Width="127px" />
                    </td>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="Ods_notAlbum" RepeatColumns="8"
                            RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <asp:Image runat="server" ForeColor="Transparent" Style="border: 3px solid #DFDFDF;
                                    padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;"
                                    ID="ImageButton1" runat="server" Height="40px" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=40&H=40" %>'
                                    Width="40px" />
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
                    </td>
                </tr>
            </table>
        </div>
        <hr style="width: 710px; border: 1px solid #ccc; border-bottom: 1px solid #fff; border-left: 1px solid #fff;
            border-right: 1px solid #fff;" />
        <div style="padding-right: 19px;">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCreateAlbum" runat="server"
                        ImageUrl="~/content/images/Home/CreateAlbum.jpg" />
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                        <ProgressTemplate>
                            <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <hr style="width: 710px; border: 1px solid #ccc; border-bottom: 1px solid #fff; border-left: 1px solid #fff;
            border-right: 1px solid #fff;" />
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="Dl_Album" runat="server" DataKeyField="Code" DataSourceID="ODS_Album"
                        RepeatColumns="5" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td>
                                        <asp:Label ID="AlbumNameLabel" runat="server" Style="font-weight: 700; color: #284D57;"
                                            Text='<%# Eval("AlbumName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgNotAlbum" Style="border: 3px solid #DFDFDF;
                                            padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;"
                                            runat="server" OnCommand="RedirectPhoto" CommandArgument='<%# Eval("code","{0}") %>'
                                            ImageUrl='<%# SetOrgAlbum(DataBinder.Eval(Container.DataItem,"code")) %>' Height="89px"
                                            Width="120px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountPicture" Text='<%# SetCountPicutreAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                            runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountComment" Text='<%# SetlblCountCommentAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                            runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCountLike" Text='<%# SetlblCountLikeAlbum(DataBinder.Eval(Container.DataItem,"code")) %>'
                                            runat="server"></asp:Label>
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
                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="AlbumName" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
