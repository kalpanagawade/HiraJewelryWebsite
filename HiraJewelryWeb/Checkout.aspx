<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs"
    Inherits="YourProject.Checkout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Checkout - Hira Jewellery</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            display: flex;
            gap: 30px;
            padding: 20px;
        }

        .left, .right {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
        }

        .left { width: 60%; }
        .right { width: 40%; }

        h3 {
            margin-top: 20px;
        }

        .width88{
            width:88%;
        }

        input {
            /*width: 100%;*/
            padding: 10px;
            margin-top: 4px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        select {
            width: 100%;
            padding: 10px;
            margin-top: 4px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .row {
            display: flex;
            gap: 10px;
        }

        .row div {
            width: 100%;
        }

        .payment-box {
            border: 1px solid #ddd;
            padding: 12px;
            border-radius: 8px;
            margin-top: 10px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
        }

        .pay-btn {
            width: 100%;
            background: #5a2d82;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 30px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        .small {
            font-size: 13px;
            color: gray;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">

    <!-- LEFT SIDE -->
    <div class="left">

        <h3>Contact</h3>
        <asp:TextBox ID="txtEmail" runat="server" style="width:50%"
            placeholder="Email or mobile phone number" />
        <asp:CheckBox ID="chkOffers" runat="server"
            Text="Email me with news and offers" />

        <h3>Delivery</h3>

        <label>Country/Region</label>
        <asp:DropDownList ID="ddlCountry" runat="server">
            <asp:ListItem>India</asp:ListItem>
        </asp:DropDownList>

        <div class="row">
            <div>
                <asp:TextBox ID="txtFirstName" runat="server" placeholder="First name" class="width88"/>
            </div>
            <div>
                <asp:TextBox ID="txtLastName" runat="server" placeholder="Last name" class="width88" />
            </div>
        </div>

        <div class="row">
        <div>
            <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" class="width88" />
        </div>
        <div>
        <asp:TextBox ID="txtApartment" runat="server" class="width88"
            placeholder="Apartment, suite, etc. (optional)" />
         </div>
        </div>

        <div class="row">
            <div>
                <asp:TextBox ID="txtCity" runat="server" placeholder="City" class="width88"/>
            </div>
            <div>
                <asp:DropDownList ID="ddlState" runat="server" class="width88">
                    <asp:ListItem>Maharashtra</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div>
                <asp:TextBox ID="txtPin" runat="server" placeholder="PIN code" class="width88"/>
            </div>
            <div>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone" class="width88"/>
            </div>
        </div>

        <asp:CheckBox ID="chkSave" runat="server"
            Text="Save this information for next time" />

        <h3>Shipping method</h3>
        <p class="small">
            Enter your shipping address to view available shipping methods.
        </p>

      

    </div>

    <!-- RIGHT SIDE -->
    <div class="right">

          <h3>Payment</h3>
  <p class="small">All transactions are secure and encrypted.</p>

  <div class="payment-box">
      <asp:RadioButton ID="rbRazorpay" runat="server" style="display:flex;"
          GroupName="pay" Checked="true"
          Text="Razorpay Secure (UPI, Cards, Wallets)" />
  </div>

  <div class="payment-box">
      <asp:RadioButton ID="rbEasebuzz" runat="server" style="display:flex;"
          GroupName="pay"
          Text="Easebuzz (Cards / UPI)" />
  </div>

  <div class="payment-box">
      <asp:RadioButton ID="rbCOD" runat="server" style="display:flex;"
          GroupName="pay"
          Text="Cash on Delivery (COD)" />
  </div>
        <h3>Order summary</h3>

        <div class="summary-row">
            <span>1 Item</span>
            <span>₹ <asp:Label ID="lblItemPrice" runat="server" /></span>
        </div>

        <div class="summary-row">
            <span>Tax</span>
            <span>₹ <asp:Label ID="lblTax" runat="server" /></span>
        </div>

        <hr />

        <div class="summary-row">
            <b>Total</b>
            <b>INR ₹ <asp:Label ID="lblTotal" runat="server" /></b>
        </div>

        <p class="small">
            Including <asp:Label ID="lblTax2" runat="server" /> in taxes
        </p>

        <asp:Button ID="btnPayNow" runat="server"
            Text="Pay now" CssClass="pay-btn"
            OnClick="btnPayNow_Click" />

        <p class="small">
            Refund policy · Privacy policy · Terms of service
        </p>

    </div>

</div>

</form>
</body>
</html>
