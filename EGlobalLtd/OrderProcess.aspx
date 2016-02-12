<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="OrderProcess.aspx.cs" Inherits="EGlobalLtd.OrderProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <table style="width: 100%;">
        <tr>
             <td class="auto-style1" colspan="3">
                
                <strong>
                <asp:Label ID="lblCaption" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="1000px" CssClass="auto-style43" ForeColor="White">Purchase Orders Placed by Customers</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style1"colspan="3">
                <asp:Label ID="lblProductCategory" runat="server" Text="Type of PO Orders"></asp:Label>
                <asp:DropDownList ID="ddLstPOCategory" runat="server" AutoPostBack="True" Height="20px" Width="379px" OnSelectedIndexChanged="ddLstPOCategory_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">New/In-Process</asp:ListItem>
                    <asp:ListItem Value="1">Processed</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
        <td>                
            &nbsp;</td>
            <td class="auto-style3"colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" style="width:260px">&nbsp;</td>
            <td class="auto-style1" colspan="1">         

    <asp:GridView ID="GridViewPOList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" Width="834px" OnSelectedIndexChanged="GridViewPOList_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                        </td>
            <td class="auto-style1">
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                
                <strong>
                <asp:Label ID="lblCaption0" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="1000px" CssClass="auto-style43" ForeColor="White">Purchase Order Detail</asp:Label>
                </strong>
                        </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" style="width:260px">&nbsp;</td><td class="auto-style1" colspan="2">

    <asp:GridView ID="GridViewProductList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" Width="834px">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
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
            <td class="auto-style44">
                &nbsp;</td>
            <td class="auto-style45">
                &nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Button ID="btnOrderProcessed" runat="server" Text="Order the Processed" OnClick="btnCheckOut_Click" Width="261px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="1000px" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style44">
                &nbsp;</td>
            <td class="auto-style45">
                &nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
