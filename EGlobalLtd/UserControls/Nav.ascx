<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Nav.ascx.cs" Inherits="EGlobalLtd.UserControls.Nav" %>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
<table >
    <tr>
        <td  style="width:340px">

        </td>
        <td style="border-color:darkgrey;">
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows" NodeIndent="50">
    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
    <LeafNodeStyle BackColor="White" />
    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
    <ParentNodeStyle Font-Bold="False" />
    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
</asp:TreeView>
                    </td>
    </tr>
</table>
