<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HiraJewelryWeb.Register" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Create Account - Hira Jewelry</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Register</h2>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label><br />

        <asp:Label Text="Full Name:" runat="server" />
        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox><br /><br />

        <asp:Label Text="Email:" runat="server" />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br /><br />

        <asp:Label Text="Password:" runat="server" />
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br /><br />

        <asp:Label Text="Mobile:" runat="server" />
        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox><br /><br />

        <asp:Button ID="btnRegister" Text="Register" runat="server" OnClick="btnRegister_Click" /><br /><br />

        <a href="Login.aspx">Already have an account?</a>
    </form>
</body>
</html>
