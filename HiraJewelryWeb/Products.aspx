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

    <!-- FILTER BUTTON -->
<div class="mb-3">
    <asp:LinkButton ID="btnToggleFilter" runat="server"
        CssClass="btn btn-outline-secondary"
        OnClientClick="toggleFilter(); return false;">
        <i class="fa fa-filter"></i> Filter
    </asp:LinkButton>
</div>

<!-- FILTER PANEL -->
<div id="filterPanel" class="card p-3 mb-4" style="display:none; max-width:100%;">
    <h5>Filter by Price</h5>

    <!-- SORT -->
    <div class="mb-2">
        <asp:DropDownList ID="ddlSortPrice" runat="server" CssClass="form-select">
            <asp:ListItem Text="-- Select --" Value="" />
            <asp:ListItem Text="Low to High" Value="ASC" />
            <asp:ListItem Text="High to Low" Value="DESC" />
        </asp:DropDownList>
    </div>

    <!-- PRICE RANGE -->
    <div class="row mb-2">
        <div class="col">
            <asp:TextBox ID="txtMinPrice" runat="server"
                CssClass="form-control"
                Placeholder="Min Price" />
        </div>
        <div class="col">
            <asp:TextBox ID="txtMaxPrice" runat="server"
                CssClass="form-control"
                Placeholder="Max Price" />
        </div>
    </div>

    <div class="mb-2">
    <label class="form-label">Category</label>
    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
        <asp:ListItem Text="All Categories" Value="" />
    </asp:DropDownList>
</div>

    <asp:Button ID="btnApplyFilter" runat="server"
        Text="Apply Filter"
        CssClass="btn btn-primary w-100"
        OnClick="btnApplyFilter_Click" />
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

    <script>
    function toggleFilter() {
        var panel = document.getElementById("filterPanel");
        panel.style.display = panel.style.display === "none" ? "block" : "none";
    }
    </script>
</asp:Content>

