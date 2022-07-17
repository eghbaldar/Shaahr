<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_Events.ascx.vb"
    Inherits="UserControl_Home_Panel_Events" %>
<asp:UpdatePanel ID="Up_Event" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div style="width: 204px; height: 100%; direction: rtl;">
            <%--            <div class="font" style="height: 15px; width: 198px; text-align: right;padding: 1px; background-color: #F3F3F3;">
                اتفاقات نزدیک
            </div>--%>
            <div class="font" style="height: 100%; width: 210px; text-align: right; padding: 1px;
                direction: rtl;">
                <table class="style1">
                    <tr>
                        <td class="style2">

                            <script type="text/javascript">
                            function Open(e)
                            {
                                document.getElementById('V_Birthday').style.display="none";
                                document.getElementById('V_Shaahr').style.display="none";
                                document.getElementById('V_Software').style.display="none";
                                document.getElementById('V_Book').style.display="none";
                                
                                document.getElementById('img_Birthday').src="../content/images/Home/BirthDay_2.png";
                                document.getElementById('img_Shaahr').src="../content/images/Home/Shaahr_2.png";
                                document.getElementById('img_Software').src="../content/images/Home/Software_2.png";
                                document.getElementById('img_Book').src="../content/images/Home/Book_2.png";
                                
                                if ( e == '1')
                                        {document.getElementById('V_Birthday').style.display="inline";
                                         document.getElementById('img_Birthday').src="../content/images/Home/BirthDay_1.png";}
                                if ( e == '2')
                                        {document.getElementById('V_Shaahr').style.display="inline";
                                        document.getElementById('img_Shaahr').src="../content/images/Home/Shaahr_1.png";}
                                if ( e == '3')
                                        {document.getElementById('V_Software').style.display="inline";
                                        document.getElementById('img_Software').src="../content/images/Home/Software_1.png";}
                                if ( e == '4')
                                        {document.getElementById('V_Book').style.display="inline";
                                        document.getElementById('img_Book').src="../content/images/Home/Book_1.png";}
                            }
                            </script>

                            <img id="img_Birthday" onmousemove="return Open('1');" src="../content/images/Home/BirthDay_2.png"
                                title="تولد دوستان" style="cursor: pointer;" />
                            <img id="img_Shaahr" onmousemove="return Open('2');" src="../content/images/Home/Shaahr_2.png"
                                title="شهرهای تازه تاسیس" style="cursor: pointer;" />
                            <img id="img_Software" onmousemove="return Open('3');" src="../content/images/Home/Software_2.png"
                                title="نرم افزار های بروز شده" style="cursor: pointer;" />
                            <img id="img_Book" onmousemove="return Open('4');" src="../content/images/Home/Book_2.png"
                                title="کتاب های بروزشده" style="cursor: pointer;" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <div id="V_Birthday" style="display: none;">
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="OSD_BirthDay" Width="197px"
                                    Height="27px">
                                    <ItemTemplate>
                                        <asp:Panel ID="PnlVisible" runat="server" Visible='<%# PnlBirthDay(DataBinder.Eval(Container.DataItem,"_date")) %>'>
                                            <table style="width: 100%; font-size: 11px; font-family: Tahoma;">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ForeColor="Transparent" AlternateText="" ID="LinkButton2" OnCommand="GotoToProfile"
                                                            CommandArgument='<%# Eval("email","{0}") %>' Style="color: #396473; text-decoration: none;"
                                                            Text='<%# TextBirth(DataBinder.Eval(Container.DataItem,"_date"),DataBinder.Eval(Container.DataItem,"email")) %>'
                                                            runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="OSD_BirthDay" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.MyFriends_BirthDayTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Email" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div id="V_Shaahr" style="display: none;">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                                    DataSourceID="ODS_Shaahrs" ForeColor="Black" GridLines="None" ShowHeader="False"
                                    Width="205px">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="id" Visible="False" />
                                        <asp:TemplateField HeaderText="name" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Style="text-decoration: none; color: #424242;
                                                    font-family: Tahoma; font-size: 11px;" Text='<%# Eval("name","{0}") %>' CommandArgument='<%# Eval("id","{0}") %>'
                                                    OnCommand="GotoShaahr" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" Visible="False" />
                                        <asp:BoundField DataField="subname" HeaderText="subname" SortExpression="subname"
                                            Visible="False" />
                                        <asp:BoundField DataField="logo" HeaderText="logo" SortExpression="logo" Visible="False" />
                                        <asp:BoundField DataField="visit" HeaderText="visit" SortExpression="visit" Visible="False" />
                                    </Columns>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_Shaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahrs_20LastTableAdapter">
                                </asp:ObjectDataSource>
                            </div>
                            <div id="V_Software" style="display: none;">
                                نرم افزار
                            </div>
                            <div id="V_Book" style="display: none;">
                                کتاب
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="font2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_News"
                    GridLines="None" ShowHeader="False" Width="210px">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                            <ItemTemplate>
                                »&nbsp;<a class="font" style="color: #3b6475; font-size: 11px; padding: 2px;" target="_blank"
                                    href='<%# Eval("ID","../MyShaahr/news/news.aspx?IDnews={0}") %>'>
                                    <asp:Label ID="Label1" runat="server" Style="color: #464646;" Text='<%# Bind("title_news") %>'></asp:Label>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_News" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.CMS_NewsTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="title_news" Type="String" />
                        <asp:Parameter Name="lid_news" Type="String" />
                        <asp:Parameter Name="news" Type="String" />
                        <asp:Parameter Name="tarikh" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="Flag" Type="Boolean" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Code_Category" Type="Int64" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<style type="text/css">
    .font
    {
        font-family: Tahoma;
        font-size: 11px;
        text-decoration: none;
        
    }
    .font2
    {
        /*
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        border: 1px dotted   #366879;
        */
        border-top:3px solid #D9EBF9;
        height: 100%;
        width: 196px;
        text-align: right;
        padding: 1px;
    }
    body, div, p, h1, h2, h3, h4, ul, li, table
    {
        border-style: none;
        border-color: inherit;
        border-width: medium;
        margin: 0;
        padding: 0;
        font-family: Tahoma;
        font-size: 11px;
    }
</style>
