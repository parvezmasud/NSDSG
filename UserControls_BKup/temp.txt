<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndexHome.ascx.cs" Inherits="EGlobalLtd.UserControls.IndexHome" %>


    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: right;
            width: 316px;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            width: 316px;
        }
        .auto-style5 {
            text-align: center;
            width: 316px;
        }
    </style>


    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="3"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="880px" CssClass="auto-style43" ForeColor="White">Products available to buy</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style18"></td>
            <td class="auto-style63"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblProductCategory" runat="server" Text="Product Category :"></asp:Label>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style63">
                <asp:DropDownList ID="ddLstProductCategory" runat="server" AutoPostBack="True" Height="16px" Width="400px" OnSelectedIndexChanged="ddLstProductCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style18"></td>
            <td class="auto-style63"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblNewOrUsed" runat="server" Text="New/Used :"></asp:Label>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddLstNewOrUsed" runat="server" Width="400px" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="ddLstNewOrUsed_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Any</asp:ListItem>
                    <asp:ListItem>New</asp:ListItem>
                    <asp:ListItem>Used</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="880px" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <asp:Label ID="lblPrdId" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">

    <asp:GridView ID="GridViewProductList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" OnSelectedIndexChanged="GridViewProductList_SelectedIndexChanged" Width="1074px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Add To Cart" />
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

                <asp:DataList ID="DtaLstProduct" runat="server" RepeatColumns="3" Width="600px" Font-Bold="False" DataKeyField="productId" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl='<%# Eval("productImage") %>' Width="137px" />
                                    <br />
                                    productName:
                                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
                                    <br />
                                    productId:
                                    <asp:Label ID="productIdLabel" runat="server" Text='<%# Eval("productId") %>' />
                                    <br />
                                    unitPrice:
                                    <asp:Label ID="unitPriceLabel" runat="server" Text='<%# Eval("unitPrice") %>' />
                                    <br />
                                    <br />
                                </ItemTemplate>
                </asp:DataList>

            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
    </table>