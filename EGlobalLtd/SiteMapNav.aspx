<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="SiteMapNav.aspx.cs" Inherits="EGlobalLtd.SiteMapNav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
<asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows" NodeIndent="50">
    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
    <LeafNodeStyle BackColor="White" />
    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
    <ParentNodeStyle Font-Bold="False" />
    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
</asp:TreeView>
</asp:Content>
