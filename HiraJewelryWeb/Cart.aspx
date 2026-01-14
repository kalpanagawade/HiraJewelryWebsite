<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HiraJewelryWeb.Cart" %>

<%--<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Your Cart</h2>
    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="₹{0}" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="₹{0}" />
        </Columns>
    </asp:GridView>
</asp:Content>

