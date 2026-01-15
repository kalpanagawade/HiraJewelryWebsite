<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HiraJewelryWeb.Cart" %>

<%--<%@ Page Language="C#" MasterPageFile="~/MasterSite.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HiraJewelryWeb.Cart" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .cart-header {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .product-card {
            display: flex;
            align-items: center;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            border: 1px solid #ddd;
            background: #fff;
            transition: 0.3s;
        }

        .product-card:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .product-img {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 20px;
            border: 1px solid #eee;
            padding: 5px;
        }

        .product-info {
            flex: 1;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            color: #d32f2f;
        }

        .total {
            font-weight: bold;
            color: green;
        }

        .empty-cart {
            padding: 20px;
            background: #fff3cd;
            border-left: 5px solid #ff9800;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 18px;
        }
    </style>


    <div class="cart-header">Your Cart</div>

    <asp:Repeater ID="rptCart" runat="server">
        <ItemTemplate>
            <div class="product-card">
                <img src='<%# Eval("ImageUrl") %>' class="product-img" />

                <div class="product-info">
                    <h4><%# Eval("ProductName") %></h4>
                    <p class="price">₹ <%# Eval("Price") %></p>
                    <p>Quantity: <%# Eval("Quantity") %></p>
                    <p class="total">Total: ₹ <%# Eval("Total") %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="empty-cart" Text="Your cart is empty!"></asp:Label>

</asp:Content>

