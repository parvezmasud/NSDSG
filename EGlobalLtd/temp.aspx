<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="EGlobalLtd.temp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center; 
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 100%;
            text-align: left;
        }
        .auto-style4 {
            width: 49%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
        <table class="auto-style2">
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
            <td class="auto-style4">
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
            <td class="auto-style4">
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
</table>
    
    <div class="auto-style1">
    <asp:ListView ID="lvProducts" runat="server" GroupItemCount="3">
<EmptyDataTemplate>
      <table runat="server">
        <tr>
          <td>No data in the Database to display here.</td>
        </tr>
     </table>
    </EmptyDataTemplate>
        <EmptyItemTemplate>
     <td runat="server" />
  </EmptyItemTemplate>
<LayoutTemplate>
    <table runat="server">
      <tr runat="server">
        <td runat="server">
          <table ID="groupPlaceholderContainer" runat="server">
            <tr ID="groupPlaceholder" runat="server"></tr>
          </table>
        </td>
      </tr>
      <tr runat="server"><td runat="server"></td></tr>
    </table>
    </LayoutTemplate>
<GroupTemplate>
    <tr ID="itemPlaceholderContainer" runat="server">
        <td ID="itemPlaceholder" runat="server"></td>
    </tr>
</GroupTemplate>
<ItemTemplate>
    <td runat="server">
        <table style="width:300px; padding:5px; margin:0 40px 0 40px;" >
            <tr style="border:0">
                <td >
                    <a href='ProductDetail.aspx?productID=<%# Eval("productId") %>'>
                        <image src='<%# Eval("productImage") %>' 
                      width="100" height="133" border="0">
                    </a> &nbsp
                </td>
                <td>
                    <a href='ProductDetail.aspx?productID=<%# Eval("productId") %>'><span class="ProductListHead"><%# Eval("productName") %></span><br>
                    </a>                    
                    <asp:Label ID="lblUPrice" runat="server" Text='<%# Eval("unitPrice", "{0:c}")%>'></asp:Label>
                    <%--<span class="ProductListItem"><b>Unit Price: </b><%# Eval("unitPrice", "{0:c}")%></span><br />
                        <asp:HiddenField ID="HFPrdId" runat="server" value='<%# Eval("productId") %>'/>--%>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("productId") %>'/>
                    </a>
                </td>
            </tr>
      </table>
    </td>
</ItemTemplate>
</asp:ListView>

    </div>

</asp:Content>
