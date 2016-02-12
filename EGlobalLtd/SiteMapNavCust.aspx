<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="SiteMapNavCust.aspx.cs" Inherits="EGlobalLtd.SiteMapNavCust" %>

<%@ Register Src="~/UserControls/Nav.ascx" TagPrefix="uc1" TagName="Nav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <uc1:Nav runat="server" id="Nav" />
</asp:Content>
