<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="indexOld.aspx.cs" Inherits="EGlobalLtd.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 51px;
            height: 50px;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content> 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style2" style="text-align:center">
                        <asp:LinkButton ID="lBtnCart" runat="server" ></asp:LinkButton> <%--OnClick="lBtnCart_Click"--%>
                        <img alt="MyCart" class="auto-style1" src="images/scart.png" />
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="38px" ImageUrl="~/images/scart.png" Width="42px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="PanelCategory" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Width="364px">
                            <asp:DataList ID="DLCategory" runat="server" Width="359px" Font-Bold="False" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="DLCategory_SelectedIndexChanged" >

                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <ItemTemplate>
                                    <div class="auto-style2">
                                        <asp:LinkButton ID="lbtnCategory" runat="server" Text="<%# Bind('ProductType') %>" OnClick="lbtnCategory_Click" CommandArgument="<%# Bind('ProductTypeId') %>">LinkButton</asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                            </asp:DataList>
                        </asp:Panel>
                    </td>
                    <td colspan="2">
                        <asp:Panel ID="PanelProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
                            <asp:DataList ID="DLProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="False" DataKeyField="productId" DataSourceID="SqlDataSource1" >                           

                                <ItemTemplate>
                                    productId:
                                    <asp:Label ID="productIdLabel" runat="server" Text='<%# Eval("productId") %>' />
                                    <br />
                                    productName:
                                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
                                    <br />
                                    unitPrice:
                                    <asp:Label ID="unitPriceLabel" runat="server" Text='<%# Eval("unitPrice") %>' />
                                    <br />
                                    productImage:
                                    <asp:Label ID="productImageLabel" runat="server" Text='<%# Eval("productImage") %>' />
                                    <br />
                                    <br />
                                </ItemTemplate>

                              

                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EGlobalDBConnectionString %>" SelectCommand="SELECT [productId], [productName], [unitPrice], [productImage] FROM [ProductInfo]"></asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>     
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

</asp:Content>
