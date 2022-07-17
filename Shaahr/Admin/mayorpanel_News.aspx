<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="mayorpanel_News.aspx.vb" ValidateRequest="false" Inherits="Shaahr_Admin_Default2"
    Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                         "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 48px;
        }
        .style11
        {
            width: 162px;
        }
        .style12
        {
            width: 37px;
        }
        .style13
        {
            width: 41px;
        }
    </style>
    <%-------------------------------Editor---------------------------------%>

    <script type="text/javascript" src="../../Content/Other/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>

    <script type="text/javascript">
	tinyMCE.init({
		// General options
		setup : function(ed) {
      ed.onInit.add(function(ed, evt) {

          var new_val = '300px';

          // adjust table element
          var elem = document.getElementById(ed.id + '_tbl');
          elem.style.height = new_val;

          // adjust iframe element
          var iframe = document.getElementById(ed.id + '_ifr');
          iframe.style.height = new_val;
      });
   },
   
   
		mode : "textareas",//exact
		theme : "advanced",		
		plugins : "",
        
		// Theme options
		theme_advanced_buttons1 : "justifyleft,justifyright",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "right",
		theme_advanced_statusbar_location : "",//top//
		theme_advanced_resizing : false,
		
force_br_newlines:true,
force_p_newlines:false,
forced_root_block:'',
theme_advanced_source_editor_wrap:false,

		// Example content CSS (should be your site CSS)
		content_css : "../../Content/Other/tinymce/css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "../../Content/Other/tinymce/lists/template_list.js",
		external_link_list_url : "../../Content/Other/tinymce/lists/link_list.js",
		external_image_list_url : "../../Content/Other/tinymce/lists/image_list.js",
		media_external_list_url : "../../Content/Other/tinymce/lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
		
	});



    </script>

    <%----------------------------------------------------------------------%>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="lblNameSHaahr" Style="font-family: Koodak; font-size: 14px; color: #838383;"
                    runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ButtonShaahr ID="btnMnu_FristPage" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_News" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_Cate" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_assist" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_ShowShaahr" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                خبر ها
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DgNews" runat="server" AutoGenerateColumns="False" DataSourceID="ODSNews"
                    CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                    <PagerStyle CssClass="PageS" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="CodeShaahr" HeaderText="CodeShaahr" SortExpression="CodeShaahr"
                            Visible="False" />
                        <asp:BoundField DataField="Subject" HeaderText="موضوع" SortExpression="Subject">
                            <HeaderStyle Width="338px" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                        <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="100px" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="visit" HeaderText="تعداد بازدیدها" SortExpression="visit">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="flag" HeaderText="وضعیت" SortExpression="flag" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="EditNews" runat="server" ImageUrl="~/Content/images/Shaahrs/Root/edit.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="DeleteNews" ID="ImageButton1" runat="server" ImageUrl="~\content/images/Stage/Jiring/remove.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                    <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                        Font-Bold="false" ForeColor="#567D8C" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSNews" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrNewsTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="codeshaahr" SessionField="Mayor" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeShaahr" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="visit" Type="Int64" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:Panel ID="Pnl_DeleteNews" runat="server" Visible="false">
                    <div style="margin-top: 5px; height: 25px; padding: 5px; background-color: #f6f6f6;
                        margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                        width: 520px;">
                        <div style="float: right; margin-top: 8px;">
                            <img src="../../Content/images/Home/info.gif" />
                        </div>
                        <div style="float: right; margin-right: 5px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style11">
                                        آیا با حذف این خبر موافق هستید؟
                                    </td>
                                    <td class="style12">
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
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="VInser" runat="server">
                        <table class="style1">
                            <tr>
                                <td style="font-family: koodak; font-size: 14px;">
                                    درج خبر
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style13">
                                                عنوان:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSubjectInser" runat="server" Style="padding: 2px; border: 1px solid #929DA3;
                                                    font-family: Tahoma; font-size: 11px;" Width="676px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                متن:
                                            </td>
                                            <td>
                                                <textarea id="txtTextInsert" runat="server" cols="20" name="elm1" rows="1" style="width: 682px;"> 
				
			</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                نمایش:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rbInsert" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="1">نمایش</asp:ListItem>
                                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="btnInsertNews" runat="server" ForeColor="Transparent" runat="server"
                                                    ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubjectInser"
                                                    ErrorMessage="موضوع خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTextInsert"
                                                    ErrorMessage="متن خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="VEdit" runat="server">
                        <table class="style1">
                            <tr>
                                <td style="font-family: koodak; font-size: 14px;">
                                    &nbsp;ویرایش خبر
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style13">
                                                عنوان:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSubjectEdit" runat="server" Style="padding: 2px; border: 1px solid #929DA3;
                                                    font-family: Tahoma; font-size: 11px;" Width="676px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                متن:
                                            </td>
                                            <td>
                                                <textarea id="txtTextEdit" runat="server" cols="20" name="elm2" rows="1" style="width: 682px;"> 
				
			</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                نمایش:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rbEdit" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="1">نمایش</asp:ListItem>
                                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="btnCancelEdit" runat="server" ForeColor="Transparent" runat="server"
                                                    ImageUrl="~/Content/images/Home/btnCancel.jpg" />
                                                <asp:ImageButton ID="btnEditNews" runat="server" ForeColor="Transparent" runat="server"
                                                    Height="21px" ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSubjectEdit"
                                                    ErrorMessage="موضوع خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTextEdit"
                                                    ErrorMessage="متن خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;<script type="text/javascript">
if (document.location.protocol == 'file:') {
	alert("The examples might not work properly on the local file system due to security settings in your browser. Please use a real webserver.");
}
                            </script>

                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
