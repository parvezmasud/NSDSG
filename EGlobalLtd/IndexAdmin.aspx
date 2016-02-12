<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="IndexAdmin.aspx.cs" Inherits="EGlobalLtd.IndexAdmin" %>

<%@ Register Src="~/UserControls/Home.ascx" TagPrefix="uc1" TagName="Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <div>
        <uc1:Home runat="server" ID="Home" />
    </div>
    <br />
</asp:Content>
