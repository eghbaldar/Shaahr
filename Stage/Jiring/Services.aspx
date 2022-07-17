<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="Services.aspx.vb" Inherits="Stage_Jiring_Services" Title="Untitled Page" %>

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


function Modal2(){

		//e.preventDefault();
		
		//Get the A tag
		var id = '#dialog3';
	
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
    <style type="text/css">
        .header
        {
            background-color: #f4f4f4;
            color: #0e4d6a;
            height: 20px;
        }
        @font-face
        {
            font-family: titr;
            src: url(                      "./../../content/font/BTitrBd.ttf" );
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <div id="boxes">
                <div id="dialog2" class="window">
                    <div style="background-color: #f4f4f4; border: 3px solid #838383; -moz-border-radius: 5px;
                        width: 397px; height: 350px; margin-top: -100px; padding: 3px;">
                        <div style="width: 430px; padding: 2px;">
                            <div style="float: right; width: 250px">
                                <a href="#" class="close" />
                                <img src="../../content/images/Profile_View_Users/close.jpg" border="0" /></a></div>
                            <div style="float: right; width: 115px; font-size: 12px; font-weight: bold;">
                                فعالسازی سرویس</div>
                            <div style="float: right; width: 60px; margin-top: 2px;">
                                <img src="../../content/images/Stage/Jiring/shaahrLogo.gif" /></div>
                        </div>
                        <div style="width: 390px; padding: 2px; border: 1px solid #636363; float: right;
                            margin-top: 4px; height: 322px;">
                            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                                <asp:View ID="V_Free" runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblServicNotJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: Red;">
                                                <blink>
                                        کاربر محترم این سرویس تا اطلاع ثانوی برای همگان آزاد و بدون جیرینگ تعیین شده 
                                        است.
                                    </blink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblTimeServiceNotJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDiscountNotJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDetailServiceNotJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnEnableService" ImageUrl="~/content/images/Stage/Jiring/EnableService.png"
                                                    runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="V_NotFree" runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblServicJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblTimeServiceJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDiscountJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblJiringJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblFullJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDetailServiceJiring" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnBuyService" ImageUrl="~/content/images/Stage/Jiring/EnableService.png"
                                                    runat="server" />
                                                <asp:Panel ID="PnlKasreMojodi" runat="server" Visible="false">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                کاربر عزیز موجودی شما برای خرید و فعالسازی این سرویس کافی نمی باشد لطفا برای افزایش
                                                                موجودی خود از لینک زیر اقدام فرمائید و دوباره برای خریدن این سرویس تلاش کنید.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="pay.aspx" style="text-decoration: none; color: #163d68;">افزایش موجودی</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="V_Exists" runat="server">
                                    <table>
                                        <tr style="font-weight: bold; color: Red; text-align: center;">
                                            <td>
                                                کاربر محترم این سرویس برای شما فعال می باشد.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                شما می توانید جزییات را در بخش سرویس های فعال خود مشاهده کنید . برای دسترسی سریعتر
                                                به این بخش از لینک زیر استفاده کنید.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="UsersServices.aspx" style="text-decoration: none; color: #0e4d6a;">سرویس های
                                                    فعال</a>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                    </div>
                </div>
                <div id="dialog3" class="window">
                    <div style="background-color: #f4f4f4; border: 3px solid #838383; -moz-border-radius: 5px;
                        width: 397px; height: 350px; margin-top: -100px; padding: 3px;">
                        <div style="width: 430px; padding: 2px;">
                            <div style="float: right; width: 250px">
                                <a href="#" class="close" />
                                <img src="../../content/images/Profile_View_Users/close.jpg" border="0" /></a></div>
                            <div style="float: right; width: 115px; font-size: 12px; font-weight: bold;">
                                توضیحات سرویـــس</div>
                            <div style="float: right; width: 60px; margin-top: 2px;">
                                <img src="../../content/images/Stage/Jiring/shaahrLogo.gif" /></div>
                        </div>
                        <div style="width: 390px; padding: 2px; border: 1px solid #636363; float: right;
                            margin-top: 4px; height: 322px;">
                            <asp:Label ID="lblDetailService" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="mask">
    </div>
    <div class="DivTopContext" style="width: 737px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="DivTop" style="width: 729px;">
                    خرید سرویس های جیرینگی
                </div>
                <div style="width: 733px; float: right;">
                    <div style="width: 733px; height: 50px; margin-top: 3px;">
                        <div style="float: right;">
                            <img src="../../content/images/Stage/Jiring/MyJiring.jpg" />
                        </div>
                        <div style="float: right; height: 50px;">
                            <table class="style1">
                                <tr>
                                    <td>
                                        اعتبار شما:<br />
                                        <a href="pay.aspx" style="color: Gray; text-decoration: none;">( افزایش موجودی )</a>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblJiring" runat="server" Text="Label"></asp:Label>
                                        <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                                            height: 9px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="width: 734px; border-bottom: 1px solid #ccc; height: 1px;">
                    </div>
                </div>
                <div style="width: 733px; padding: 5px; float: right;">
                    <div style="float: right;">
                        <img src="../../content/images/Stage/Jiring/buy.png" /></div>
                    <div style="float: right; padding: 4px;">
                        توضیحات در مورد خرید سرویس ها</div>
                </div>
                <div style="float: right;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS"
                        Width="733px" Style="border: 0px solid #ccc;" GridLines="None" CellPadding="4"
                        ForeColor="#333333">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                                SortExpression="Code" Visible="False" />
                            <asp:BoundField DataField="Subject" HeaderText="سرویس" SortExpression="Subject">
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="زمان سرویس" SortExpression="Month">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Month_(DataBinder.Eval(Container.DataItem,"Month"))%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="وضعیت" SortExpression="Free">
                                <ItemTemplate>
                                    <img src='<%# IIF(Eval("free")=0,"../../content/images/stage/jiring/notfree.jpg","../../content/images/stage/jiring/free.jpg") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="مبلغ به جیرینگ" SortExpression="Jiring">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Jiring") %>'></asp:Label>
                                    <img src="../../content/images/Stage/Jiring/JiringSymbol.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"
                                Visible="False" />
                            <asp:TemplateField SortExpression="Detail">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/content/images/Stage/Jiring/jiring_detail.jpg"
                                        ID="ImageButton2" CommandArgument='<%# Eval("code","{0}") %>' OnCommand="Detail"
                                        runat="server" Height="16px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Flag">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ForeColor="Transparent" CommandArgument='<%# Eval("code","{0}") %>'
                                        OnCommand="Buy" ImageUrl="~/content/images/Stage/Jiring/icon_buy.png" ID="ImageButton1"
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            سرویسی برای ارائه وجود ندارد.
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#f3f3f3" Font-Bold="True" ForeColor="#0e4d6a" BorderColor="#cccccc"
                            BorderStyle="Solid" BorderWidth="1" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_StageTableAdapters.CMS_Jiring_ServiceTableAdapter">
                        <InsertParameters>
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Detail" Type="String" />
                            <asp:Parameter Name="Month" Type="Int32" />
                            <asp:Parameter Name="Free" Type="Boolean" />
                            <asp:Parameter Name="Jiring" Type="String" />
                            <asp:Parameter Name="Type" Type="Int32" />
                            <asp:Parameter Name="Flag" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
