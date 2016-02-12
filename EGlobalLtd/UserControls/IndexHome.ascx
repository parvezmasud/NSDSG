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
        </style>


   <table class="auto-style2" align="center">
        <tr>
            <td class="auto-style1" colspan="3"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="880px" CssClass="auto-style43" ForeColor="White">Products available to buy</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style6"></td>
            <td class="auto-style63"></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblProductCategory" runat="server" Text="Product Category :"></asp:Label>
            </td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddLstProductCategory" runat="server" AutoPostBack="True" Height="20px" Width="400px" OnSelectedIndexChanged="ddLstProductCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style6"></td>
            <td class="auto-style63"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblNewOrUsed" runat="server" Text="New/Used :"></asp:Label>
            </td>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddLstNewOrUsed" runat="server" Width="400px" Height="20px" AutoPostBack="True" OnSelectedIndexChanged="ddLstNewOrUsed_SelectedIndexChanged">
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
    <tr></tr>
</table>

<table >
    <tr>
        <td  style="width:160px">

        </td>
        <td style="border:dotted; border-color:darkgrey;">
            <asp:DataList ID="DataListProducts" runat="server" GroupIt-emCount="4" RepeatColumns="4" Width="801px">
                <ItemTemplate>
                    <div class="auto-style1">
                        <asp:Image ID="Img" runat="server" Height="214px" Width="167px" ImageUrl='<%# Eval("productImage") %>'/>
                        <br />
                        <asp:Label ID="lblPriceCurr" runat="server" Text="N"></asp:Label>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("unitPrice", "{0:c}")%>'></asp:Label>
                        <br />
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName")%>'></asp:Label>
                        <br />
                        <asp:Button ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" Text="Add to Cart" CommandArgument='<%# Eval("productId") %>'/>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>