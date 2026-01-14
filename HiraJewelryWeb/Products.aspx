<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HiraJewelryWeb.Products" %>

<%--<%@ Page Title="Products" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Our Jewelry Collection</h2>
    <asp:Repeater ID="rptProducts" runat="server">
        <ItemTemplate>
            <div style="border:1px solid #ddd; padding:15px; margin:10px; width:220px; display:inline-block; vertical-align:top; text-align:center; border-radius:8px;">
                <img src='<%# Eval("ImageUrl") %>' style="width:180px; height:180px; border-radius:8px;" />
                <h4><%# Eval("ProductName") %></h4>
                <p>Category: <%# Eval("Category") %></p>
                <p>Price: ₹<%# Eval("Price") %></p>
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToCart_Click" CssClass="btn btn-primary" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

