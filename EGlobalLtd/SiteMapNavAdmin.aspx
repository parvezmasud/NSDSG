<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="SiteMapNavAdmin.aspx.cs" Inherits="EGlobalLtd.SiteMapNavAdmin" %>

<%@ Register Src="~/UserControls/Nav.ascx" TagPrefix="uc1" TagName="Nav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <uc1:Nav runat="server" id="Nav" />
</asp:Content>
