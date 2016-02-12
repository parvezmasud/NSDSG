﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="EGlobalLtd.MyCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style43 {
            margin-left: 0;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1" colspan="3">
                
                <strong>
                <asp:Label ID="lblCaption" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="1000px" CssClass="auto-style43" ForeColor="White">My Shopping Cart</asp:Label>
                </strong></td>
        </tr>
         <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" style="width:260px">&nbsp;</td>
            <td class="auto-style1" colspan="2">
            <asp:GridView ID="GridViewProductList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" Width="834px" OnSelectedIndexChanged="GridViewProductList_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="Cancel from Cart" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>  

            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Button ID="btnCheckOut" runat="server" Text="Checkout" OnClick="btnCheckOut_Click" Width="261px" />
            </td>
        </tr>

       <tr>
            <td class="auto-style1" colspan="3">
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="1000px" ForeColor="White"></asp:Label>
            </td>
        </tr>

    </table>

</asp:Content>
