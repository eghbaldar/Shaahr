<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="UsersServices.aspx.vb" Inherits="Stage_Jiring_UsersServices" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Module popup  -->

    <script type="text/javascript" src="../../jquery-latest.pack.js"></script>

    <script type="text/javascript">
function Close(){
		$('#mask').hide();
		$('.window').hide();
}

function Modal(){

		//e.preventDefault();
		
		//Get the A tag
		var id = '#dialog2';
	
		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		//transition effect		
		$('#mask').fadeIn(1000);	
		$('#mask').fadeTo("slow",0.8);	
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		//Set the popup window to center
		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
	
		//transition effect
		$(id).fadeIn(2000); 
	

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
            background-color: #000;
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
    <!-- End Module popup  -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="boxes">
                <div id="dialog2" class="window">
                    <div style="background-color: #f4f4f4; border: 3px solid #838383; -moz-border-radius: 5px;
                        width: 397px; height: 350px; margin-top: -100px; padding: 3px;">
                        <div style="width: 430px; padding: 2px;">
                            <div style="float: right; width: 210px">
                                <a href="#" class="close" />
                                <img src="../../content/images/Profile_View_Users/close.jpg" border="0" /></a></div>
                            <div style="float: right; width: 155px; font-size: 12px; font-weight: bold;">
                                حذف سرویس انتخاب شده</div>
                            <div style="float: right; width: 60px; margin-top: 2px;">
                                <img src="../../content/images/Stage/Jiring/shaahrLogo.gif" /></div>
                        </div>
                        <div style="width: 390px; padding: 2px; border: 1px solid #636363; float: right;
                            margin-top: 4px; height: 322px;">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        کاربر محترم;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        با حذف این سرویس از کلیه خدماتی که این سرویس به شما ارئه می دهد منع می شوید.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        آیا از حذف آن مطمئن هستید؟
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <asp:LinkButton ID="BtnDelete" runat="server" Style="color: green; text-decoration: none;">بله , مطمئن هستم.</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <a href="#" class="close" style="color: Red; text-decoration: none;">خیر , پشیمان شده
                                            ام.</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="mask">
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="DivTopContext" style="width: 737px;">
                <div class="DivTop" style="width: 729px;">
                    سرویس های فعال
                </div>
                <div style="width: 733px; padding: 5px; float: right;">
                    <div style="float: right;">
                        <img src="../../content/images/Stage/Jiring/service.png" /></div>
                    <div style="padding: 2px;">
                        سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                        های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                        سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                        های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
                </div>
                <div style="width: 733px; float: right; padding: 5px;">
                    <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="ODS" ForeColor="#333333" GridLines="None" Width="732px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="subject" HeaderText="نوع سرویس" SortExpression="subject">
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="start_date" HeaderText="تاریخ شروع" SortExpression="start_date">
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="end_date" HeaderText="تاریخ انقضا" SortExpression="end_date">
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="مبلغ جیرینگ" SortExpression="Jiring">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Jiring") %>'></asp:Label>
                                    <img src="../../content/images/Stage/Jiring/JiringSymbol.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="حذف سرویس" SortExpression="subject">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/content/images/Stage/Jiring/remove.png"
                                        OnCommand="DeleteService" CommandArgument='<%# eval("id","{0}") %>' ID="ImageButton1"
                                        runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            سرویسی فعالی وجود ندارد.
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#f3f3f3" Font-Bold="True" ForeColor="#0e4d6a" BorderColor="#cccccc"
                            BorderStyle="Solid" BorderWidth="1" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_StageTableAdapters.UsersServicesTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
