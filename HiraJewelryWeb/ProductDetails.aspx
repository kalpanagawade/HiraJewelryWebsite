<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs"
    Inherits="YourProject.ProductDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Product Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 100%;
            margin: 42px 12px;
            background: #fff;
            padding: 16px;
            display:flex;
            border-radius:18px;
        }
        .Divide{
                padding: 1px 16px;
                width: 48%;
        }

        .product-img {
            width: 75%;
            border-radius: 18px;
        }

        h2 {
            font-size: 20px;
            margin: 10px 0;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
            margin-top: 12px;
            display: block;
        }

        .ddl, .txt {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .pincode-box {
            display: flex;
            gap: 10px;
        }

        .dispatch {
            margin-top: 12px;
            font-size: 14px;
        }

        .price-breakup {
            margin-top: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
        }

        .breakup-header {
            cursor: pointer;
            font-weight: bold;
        }

        .btn-section {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-CHECK,
        .btn-buy:hover{
            background: #5a2d82;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 30px;
            width: 50%;
        }

        .btn-buy,
        .btn-CHECK:hover{
            background: #fff;
            border: 2px solid #5a2d82;
            color: #5a2d82;
            padding: 12px;
            border-radius: 30px;
            width: 50%;
        }
    </style>

    <script>
        function toggleBreakup() {
            var div = document.getElementById("breakupBody");
            div.style.display = div.style.display === "none" ? "block" : "none";
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

<div class="container">
    <div class="Divide">
    <!-- Product Image -->
    <asp:Image ID="imgProduct" runat="server" CssClass="product-img" />

        <!-- Product Name -->
    <h2><asp:Label ID="lblProductName" runat="server" /></h2>

    <!-- Price -->
    <div class="price">₹ <asp:Label ID="lblPrice" runat="server" /></div>
    </div>
    <div class="Divide">
    <!-- Metal -->
    <label>Metal Purity</label>
    <asp:DropDownList ID="ddlMetal" runat="server" CssClass="ddl">
        <asp:ListItem>14KT Yellow Gold</asp:ListItem>
        <asp:ListItem>18KT Yellow Gold</asp:ListItem>
    </asp:DropDownList>

    <!-- Stone -->
    <label>Stone</label>
    <asp:DropDownList ID="ddlStone" runat="server" CssClass="ddl">
        <asp:ListItem>IJ-SI</asp:ListItem>
        <asp:ListItem>FG-VS</asp:ListItem>
        <asp:ListItem>FG-VVS</asp:ListItem>
    </asp:DropDownList>

    <!-- Pincode -->
    <label>Your Pincode</label>
    <div class="pincode-box">
        <asp:TextBox ID="txtPincode" runat="server" CssClass="txt" />
        <asp:Button ID="btnCheck" runat="server" CssClass="btn-CHECK" Text="CHECK" />
    </div>

    <p class="dispatch">🚚 Dispatch in 21 days</p>

    <!-- Price Breakup -->
    <div class="price-breakup">
        <div class="breakup-header" onclick="toggleBreakup()">
            View price breakup ⌄
        </div>

        <div id="breakupBody" style="display:none">
            <p>Metal Price: ₹ <asp:Label ID="lblMetalPrice" runat="server" /></p>
            <p>Diamond/Stone: ₹ <asp:Label ID="lblStonePrice" runat="server" /></p>
            <p>Making Charges: ₹ <asp:Label ID="lblMaking" runat="server" /></p>
            <p>Tax (3%): ₹ <asp:Label ID="lblTax" runat="server" /></p>
            <hr />
            <b>Net Price: ₹ <asp:Label ID="lblNetPrice" runat="server" /></b>
        </div>
    </div>

    <!-- Buttons -->
    <div class="btn-section">
        <asp:Button ID="btnAddCart" runat="server"
            Text="Add To Cart" CssClass="btn-buy"
            OnClick="btnAddCart_Click" />

        <asp:Button ID="btnBuyNow" runat="server"
            Text="Buy Now" CssClass="btn-buy"
            OnClick="btnBuyNow_Click" />
    </div>

    </div>
</div>

</form>
</body>
</html>

