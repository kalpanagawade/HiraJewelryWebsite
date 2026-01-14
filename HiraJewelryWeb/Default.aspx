<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HiraJewelryWeb._Default" %>

<%--<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>Dashboard</h2>
    <p>Welcome to Hira Jewelry Website Dashboard</p>

    <div style="display:flex; gap:20px;">

        <div style="background:#ffccd5; padding:20px; border-radius:8px; width:200px;">
            <h3>Products</h3>
            <p>View product catalog</p>
        </div>

        <div style="background:#ffe5ec; padding:20px; border-radius:8px; width:200px;">
            <h3>Orders</h3>
            <p>Track your orders</p>
        </div>

        <div style="background:#fff0f6; padding:20px; border-radius:8px; width:200px;">
            <h3>Account</h3>
            <p>Manage your profile</p>
        </div>

    </div>

</asp:Content>

