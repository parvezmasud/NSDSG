<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="ProfileAdmin.aspx.cs" Inherits="EGlobalLtd.ProfileAdmin" %>

<%@ Register Src="~/UserControls/Profile.ascx" TagPrefix="uc1" TagName="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <uc1:Profile runat="server" ID="Profile1" />
</asp:Content>
