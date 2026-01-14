<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="HiraJewelryWeb.AdminProducts" %>

<%--<%@ Page Title="Admin Products" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="AdminProducts.aspx.cs" Inherits="AdminProducts" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin - Manage Products</h2>
    
    <!-- Add / Edit Form -->
    <asp:Panel ID="pnlForm" runat="server" Width="400px" Style="border:1px solid #ddd;padding:15px;margin-bottom:20px;">
        <asp:HiddenField ID="hfProductID" runat="server" />
        <asp:TextBox ID="txtProductName" runat="server" Placeholder="Product Name"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtCategory" runat="server" Placeholder="Category"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description" TextMode="MultiLine" Rows="3"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtStock" runat="server" Placeholder="Stock"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Image URL"></asp:TextBox><br /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save Product" OnClick="btnSave_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" />
    </asp:Panel>

    <!-- Product List -->
    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" OnRowEditing="gvProducts_RowEditing" OnRowDeleting="gvProducts_RowDeleting" OnRowCancelingEdit="gvProducts_RowCancelingEdit" OnRowUpdating="gvProducts_RowUpdating">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="₹{0}" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" />
            <asp:BoundField DataField="ImageUrl" HeaderText="Image" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

