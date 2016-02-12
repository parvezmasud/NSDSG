<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="EGlobalLtd.CustomerHome" %>
<%@ Register Src="~/UserControls/Home.ascx" TagPrefix="uc1" TagName="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <div>
        <uc1:Home runat="server" ID="Home" />
    </div>
</asp:Content>
