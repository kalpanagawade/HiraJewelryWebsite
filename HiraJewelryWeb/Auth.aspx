<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="HiraJewelryWeb.Auth" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Auth.aspx.cs" Inherits="Auth" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login / Register - Hira Jewelry</title>
    <link href="auth.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="container">

  <div class="flip-card" id="authCard" style="padding: 0px 0px 54px 20px !important; background-color: lightpink;">

    <!-- LOGIN PANEL -->
    <div class="flip-face front">
      <h2>Login</h2>

      <asp:Label ID="lblLoginMsg" runat="server" ForeColor="Red"></asp:Label>

      <asp:TextBox ID="txtLoginEmail" placeholder="Email" CssClass="input" runat="server"></asp:TextBox>
      <asp:TextBox ID="txtLoginPassword" placeholder="Password" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>

      <asp:Button ID="btnLogin" Text="Login" CssClass="btn" runat="server" OnClick="btnLogin_Click" />

      <p>Don't have an account? <span class="link" onclick="flipCard()">Create one</span></p>
    </div>

    <!-- REGISTER PANEL -->
    <div class="flip-face back">
      <h2>Create Account</h2>

      <asp:Label ID="lblRegisterMsg" runat="server" ForeColor="Green"></asp:Label>

      <asp:TextBox ID="txtFullName" placeholder="Full Name" CssClass="input" runat="server"></asp:TextBox>
      <asp:TextBox ID="txtEmail" placeholder="Email" CssClass="input" runat="server"></asp:TextBox>
      <asp:TextBox ID="txtPassword" placeholder="Password" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>
      <asp:TextBox ID="txtMobile" placeholder="Mobile" CssClass="input" runat="server"></asp:TextBox>

      <asp:Button ID="btnRegister" Text="Register" CssClass="btn" runat="server" OnClick="btnRegister_Click" />

      <p>Already have an account? <span class="link" onclick="flipCard()">Login</span></p>
    </div>

  </div>
</div>
</form>

<script>
function flipCard() {
  document.getElementById('authCard').classList.toggle('flip');
}
</script>

</body>
</html>
