<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HiraJewelryWeb.Products" %>

<%--<%@ Page Title="Products" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>

        .product-card {
    width: 220px;
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    padding: 12px;
    margin: 10px;
    display: inline-block;
    cursor: pointer;
    transition: all 0.3s;
    text-align: center;
    background: #fff;
}

.product-card:hover {
    box-shadow: 0 6px 18px rgba(0,0,0,0.12);
    transform: translateY(-4px);
}

.product-img {
    width: 180px;
    height: 180px;
    border-radius: 10px;
}

.price {
    font-weight: bold;
    font-size: 16px;
}

/* Blur background */
#blurOverlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    backdrop-filter: blur(6px);
    background: rgba(0,0,0,0.4);
    display: none;
    z-index: 999;
}

/* Modal */
#productModal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 80%;
    height: 90%;
    background: #fff;
    border-radius: 18px;
    display: none;
    z-index: 1000;
    box-shadow: 0 10px 40px rgba(0,0,0,0.3);
}

/* iframe */
#productFrame {
    width: 100%;
    height: 100%;
    border: none;
    border-radius: 18px;
}

/* Close button */
.close-btn {
    position: absolute;
    top: 3px;
    right: 20px;
    font-size: 26px;
    cursor: pointer;
    z-index: 10;
    color:red;
}
.close-btn:hover{
    color:white;
    background-color:red;
}
/* Product card */
.product-card {
    display: inline-block;
    margin: 10px;
    cursor: pointer;
}
.product-img {
    width: 200px;
    height: 200px;
    border-radius: 12px;
}


    </style>

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
<div id="filterPanel" class="card p-3 mb-4" style="background-color: aliceblue;display:none; max-width:100%;">
    <h5>Filter by Price</h5>
          <!-- PRICE RANGE -->
    <div class="row mb-2">
        <div class="col">
                    <asp:DropDownList ID="ddlSortPrice" runat="server" CssClass="form-select">
            <asp:ListItem Text="-- Select --" Value="" />
            <asp:ListItem Text="Low to High" Value="ASC" />
            <asp:ListItem Text="High to Low" Value="DESC" />
        </asp:DropDownList>
        </div>
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
    <h5>Filter by Category</h5>
    <%--<label class="form-label">Category</label>--%>
    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
        <asp:ListItem Text="All Categories" Value="" />
    </asp:DropDownList>
</div>

    <div class="row mb-2">
        <div class="col">
            <asp:Button ID="btnApplyFilter" runat="server"
    Text="Apply Filter"
    CssClass="btn btn-primary w-100"
    OnClick="btnApplyFilter_Click" />
        </div>
        <div class="col">
                <asp:Button 
    ID="btnClearFilter" 
    runat="server"
    Text="Clear Filter"
    CssClass="btn btn-secondary w-100 mb-2"
    OnClick="btnClearFilter_Click" />
        </div>
    </div>

</div>


    <%--<asp:Repeater ID="rptProducts" runat="server">
        <ItemTemplate>
            <div style="border:1px solid #ddd; padding:15px; margin:10px; width:220px; display:inline-block; vertical-align:top; text-align:center; border-radius:8px;">
                <img src='<%# Eval("ImageUrl") %>' style="width:180px; height:180px; border-radius:8px;" />
                <h4><%# Eval("ProductName") %></h4>
                <p>Category: <%# Eval("Category") %></p>
                <p>Price: ₹<%# Eval("Price") %></p>
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToCart_Click" CssClass="btn btn-primary" />
            </div>
        </ItemTemplate>
    </asp:Repeater>--%>
   <asp:Repeater ID="rptProducts" runat="server">
    <ItemTemplate>
        <div class="product-card">
            <img src='<%# Eval("ImageUrl") %>'
                 class="product-img"
                 onclick="openProductModal('<%# Eval("ProductID") %>')" />

            <h4><%# Eval("ProductName") %></h4>
            <p>₹ <%# Eval("Price") %></p>
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToCart_Click" CssClass="btn btn-primary" />
        </div>
    </ItemTemplate>
</asp:Repeater>

    <!-- Blur Overlay -->
<div id="blurOverlay"></div>

<!-- Product Modal -->
<div id="productModal">
    <span class="close-btn" onclick="closeModal()">×</span>

    <iframe id="productFrame"></iframe>
</div>


    <script>
    function toggleFilter() {
        var panel = document.getElementById("filterPanel");
        panel.style.display = panel.style.display === "none" ? "block" : "none";
        }

        function openProduct(productId) {
            window.location.href = "ProductDetails.aspx?pid=" + productId;
        }

        function openProductModal(productId) {
            document.getElementById("blurOverlay").style.display = "block";
            document.getElementById("productModal").style.display = "block";

            document.getElementById("productFrame").src =
                "ProductDetails.aspx?pid=" + productId;
        }

        function closeModal() {
            document.getElementById("blurOverlay").style.display = "none";
            document.getElementById("productModal").style.display = "none";
            document.getElementById("productFrame").src = "";
        }
    </script>
</asp:Content>

