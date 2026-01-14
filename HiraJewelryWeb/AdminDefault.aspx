<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminDefault.aspx.cs" Inherits="HiraJewelryWeb.AdminDefault" %>

<%--<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterSite.master"
    AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="AdminDefault" %>--%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Welcome Admin</h2>
        <p>Your dashboard overview goes here...</p>
        <asp:Button ID="btnManageProducts" runat="server" Text="Manage Products" CssClass="btn btn-primary" OnClick="btnManageProducts_Click" />


        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
    </div>
</asp:Content>

