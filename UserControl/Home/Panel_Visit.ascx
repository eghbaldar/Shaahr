<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_Visit.ascx.vb"
    Inherits="UserControl_Panel_Visit" %>
<%--<script src="Content/talk/jquery.js" type="text/javascript"></script>--%>

<script src="Content/talk/main.js" type="text/javascript"></script>

<style type="text/css">
    #tooltip
    {
        font-family: Tahoma;
        font-size: 11px;
        -moz-border-radius: 5px;
        position: absolute;
        background: #49707e;
        padding: 2px 5px;
        color: #fff;
        display: none;
        width: 150px;
    }
</style>
<div style="width: 210px; height: 100%">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="width: 210px; height: 100%;" runat="server" id="Visit">
                <asp:DataList ID="DL" runat="server" DataSourceID="ODS" RepeatColumns="7" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <a href='<%# "../user/default.aspx?user=" +Convert(DataBinder.Eval(Container.DataItem,"Email")) %>'
                            class="tooltip" title='<%# Text(DataBinder.Eval(Container.DataItem,"Email"),DataBinder.Eval(Container.DataItem,"count"),DataBinder.Eval(Container.DataItem,"time")) %>'>
                            <asp:ImageButton ID="ImageButton1" ForeColor="Transparent" AlternateText="" runat="server"
                                Height="25px" Width="25px" CommandArgument='<%# Eval("Email","{0}") %>' OnCommand="Redirect"
                                ImageUrl='<%# "~/user/Crop.aspx?P="+Eval("picpath", "{0}")+"&W=25&H=25" %>' />
                        </a>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Panel_VisitTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="other_email" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <asp:UpdateProgress ID="UpdateProgress8" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="../Content/images/Profile_View_Users/Loading_0.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
