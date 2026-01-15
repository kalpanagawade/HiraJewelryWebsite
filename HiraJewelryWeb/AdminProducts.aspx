<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HiraJewelryWeb.AdminProducts" %>

<%--<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HiraJewelryWeb.AdminProducts" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        .toggle-btn {
    user-select: none;
}
    </style>

    <h2 class="mb-3">Admin - Manage Products</h2>

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

    <!-- PRODUCT FORM -->
    <%--<div class="card p-3 mb-4" style="max-width:450px;">
        <h5>Add / Update Product</h5>
        <asp:HiddenField ID="hfProductID" runat="server" />

        <div class="mb-2">
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Product Name" />
        </div>

        <div class="mb-2">
            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Category" />
        </div>

        <div class="mb-2">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Description" TextMode="MultiLine" Rows="2" />
        </div>

        <div class="mb-2">
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Price" />
        </div>

        <div class="mb-2">
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Placeholder="Stock" />
        </div>

        <div class="mb-2">
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Product" CssClass="btn btn-success" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
    </div>--%>

    <div class="card p-3 mb-4 position-relative" style="max-width:100%;background-color: aliceblue;">
    
    <!-- Header with toggle -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="mb-0">Add / Update Product</h5>
        <span class="toggle-btn" onclick="toggleCard()" style="cursor:pointer; font-size:20px;">&#x25BC;</span>
    </div>

    <div id="cardBody">
        <asp:HiddenField ID="hfProductID" runat="server" />

        <div class="row g-2">
            <div class="col-md-4">
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Product Name" />
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Category" />
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Description" TextMode="MultiLine" Rows="2" />
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Price" />
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Placeholder="Stock" />
            </div>

            <div class="col-md-4">
                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="mt-3" style="text-align: center;">
            <asp:Button ID="btnSave" runat="server" Text="Save Product" CssClass="btn btn-success me-2" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
        </div>
    </div>
</div>


    <!-- PRODUCT GRID -->
    <asp:GridView ID="gvProducts" runat="server" CssClass="table table-bordered table-hover"
        AutoGenerateColumns="False" DataKeyNames="ProductID" OnRowDeleting="gvProducts_RowDeleting" OnRowEditing="gvProducts_RowEditing">

        <Columns>
            <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Image" ControlStyle-Width="80" ControlStyle-Height="80" />
            <asp:BoundField DataField="ProductName" HeaderText="Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="₹{0}" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-primary me-2" runat="server" />
                    <asp:LinkButton ID="btnDelete" CommandName="Delete" Text="Delete" CssClass="btn btn-sm btn-danger" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

    <script>
function toggleCard() {
    var cardBody = document.getElementById("cardBody");
    var icon = document.querySelector(".toggle-btn");

    if (cardBody.style.display === "none") {
        cardBody.style.display = "block";
        icon.innerHTML = "&#x25BC;"; // down arrow
    } else {
        cardBody.style.display = "none";
        icon.innerHTML = "&#x2715;"; // close symbol (X)
    }
}
    </script>


</asp:Content>
