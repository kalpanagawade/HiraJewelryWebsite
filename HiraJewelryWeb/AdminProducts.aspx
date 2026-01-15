<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HiraJewelryWeb.AdminProducts" %>

<%--<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HiraJewelryWeb.AdminProducts" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <h2 class="mb-3">Admin - Manage Products</h2>

    <!-- SEARCH BOX -->
    <div class="input-group mb-4" style="max-width:350px;">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search product..." />
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClick="btnReset_Click" />
    </div>

    <!-- PRODUCT FORM -->
    <div class="card p-3 mb-4" style="max-width:450px;">
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

</asp:Content>
