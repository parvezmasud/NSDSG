<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EGlobalLtd.Index2" %>
<%--<%@ Register Src="~/UserControls/Home.ascx" TagPrefix="uc1" TagName="Home" %>--%>
<%@ Register Src="~/UserControls/IndexHome.ascx" TagPrefix="uc1" TagName="IndexHome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<%--    <div>
        <uc1:Home runat="server" id="Home" />     
    </div>--%>
    <uc1:IndexHome runat="server" ID="IndexHome" />
</asp:Content>
