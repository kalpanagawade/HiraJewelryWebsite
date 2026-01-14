<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HiraJewelryWeb.Login" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>User Login - Hira Jewelry</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Login</h2>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label><br />

        <asp:Label Text="Email:" runat="server" />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br /><br />

        <asp:Label Text="Password:" runat="server" />
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br /><br />

        <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" /><br /><br />

        <a href="Register.aspx">Create account</a>
    </form>
</body>
</html>

