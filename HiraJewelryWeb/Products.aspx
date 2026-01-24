<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HiraJewelryWeb.Products" %>

<%--<%@ Page Title="Products" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <h2>Our Jewelry Collection</h2>
        <!-- SEARCH BOX -->
    <div class="input-group mb-4" style="max-width:100%;">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search product..." />
        <%--<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />--%>
        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click">
    <i class="fa fa-search"></i>
</asp:LinkButton>
        <%--<asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClick="btnReset_Click" />--%>
        <asp:LinkButton ID="btnReset" runat="server" CssClass="btn btn-secondary" OnClick="btnReset_Click">
    <i class="fa-solid fa-rotate-left"></i>
</asp:LinkButton>
    </div>

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

