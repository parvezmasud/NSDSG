<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="ProfileCustomer.aspx.cs" Inherits="EGlobalLtd.ProfileCustomer" %>

<%@ Register Src="~/UserControls/Profile.ascx" TagPrefix="uc1" TagName="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <uc1:Profile runat="server" ID="Profile1" />
</asp:Content>
