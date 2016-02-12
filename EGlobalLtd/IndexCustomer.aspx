<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="IndexCustomer.aspx.cs" Inherits="EGlobalLtd.indexCustomer" %>

<%@ Register Src="~/UserControls/Home.ascx" TagPrefix="uc1" TagName="Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <div>
        <uc1:Home runat="server" ID="Home" />
    </div>
    <br />
</asp:Content>
