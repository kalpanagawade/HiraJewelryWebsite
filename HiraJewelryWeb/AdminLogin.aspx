<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="HiraJewelryWeb.AdminLogin" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login - Hira Jewelry</title>
    <style>
        body { background:#fafafa; font-family:Arial; display:flex; justify-content:center; align-items:center; height:100vh; }
        .box { width:320px; background:white; padding:30px; border-radius:10px; box-shadow:0 5px 20px rgba(0,0,0,0.2); }
        input, button { width:100%; padding:10px; margin-top:10px; border-radius:5px; }
        button { background:#d6336c; color:#fff; border:none; cursor:pointer; }
        button:hover { background:#c2185b; }
        .err { color:red; margin-bottom:10px; display:block; }
    </style>
</head>
<body>

<form id="form1" runat="server">
    <div class="box">
        <h2 style="text-align:center;">Admin Login</h2>

        <asp:Label ID="lblErr" CssClass="err" runat="server"></asp:Label>

        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" />
    </div>
</form>

</body>
</html>
