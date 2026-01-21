<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminDefault.aspx.cs" Inherits="HiraJewelryWeb.AdminDefault" %>

<%--<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterSite.master"
    AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="AdminDefault" %>--%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <div class="container mt-4">

        <!-- Top Bar -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="mb-0">Admin Dashboard</h3>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger btn-sm" OnClick="btnLogout_Click" />
        </div>

        <!-- Greeting Card -->
        <div class="card shadow-sm mb-4 p-3">
            <h5 class="mb-1">Welcome, Admin 👋</h5>
            <p class="text-muted mb-0">Manage your store information from here.</p>
        </div>

        <!-- Dashboard Actions -->
        <div class="row">

            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-sm p-3">
                    <h6 class="mb-2">Products</h6>
                    <p class="text-muted small">Add, Update & View Products</p>
                    <asp:Button ID="btnManageProducts" runat="server" Text="Manage Products" CssClass="btn btn-primary btn-sm w-100" OnClick="btnManageProducts_Click" />
                </div>
            </div>

            <!-- Future Cards (Enable later) -->
            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-sm p-3 bg-light">
                    <h6 class="mb-2">Orders</h6>
                    <p class="text-muted small">(Coming Soon)</p>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-sm p-3 bg-light">
                    <h6 class="mb-2">Users</h6>
                    <p class="text-muted small">(Coming Soon)</p>
                </div>
            </div>

        </div>
    </div>
</asp:Content>


