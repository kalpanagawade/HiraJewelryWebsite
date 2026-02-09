<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="HiraJewelryWeb.Order" %>--%>
<%@ Page Language="C#" 
    MasterPageFile="~/MasterSite.master"
    AutoEventWireup="true"
    CodeBehind="Order.aspx.cs"
    Inherits="HiraJewelryWeb.Order" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Custom CSS -->
    <%--<link href="Content/site.css" rel="stylesheet" />--%>


    <div class="container mt-4">
        <h3 class="mb-3">My Orders</h3>

        <!-- IMPORTANT: OnItemDataBound must match method name in code-behind -->
        <asp:Repeater ID="rptOrders" runat="server"
            OnItemDataBound="rptOrders_ItemDataBound">

            <ItemTemplate>

                <div class="card mb-3 shadow-sm">
                    <div class="card-body">

                        <!-- Header -->
                        <div class="d-flex justify-content-between">
                            <div>
                                <b>Order #<%# Eval("OrderID") %></b><br />
                                <small class="text-muted">
                                    <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy") %>
                                </small>
                            </div>

                            <span class="badge bg-success">
                                <%# Eval("OrderStatus") %>
                            </span>
                        </div>

                        <%--<hr />--%>

                        <!-- Product Images -->
                        <div class="d-flex gap-2 mb-3">
                            <asp:Repeater ID="rptImages" runat="server">
                                <ItemTemplate>
                                    <img src='<%# Container.DataItem %>'
                                         style="width:70PX;height:70PX;border-radius:10px;object-fit:cover;" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <!-- Footer -->
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <b>Total:</b> ₹ <%# Eval("TotalAmount") %>
                            </div>

                            <a href='OrderDetails.aspx?OrderID=<%# Eval("OrderID") %>'
                               class="btn btn-outline-primary btn-sm">
                                View Details
                            </a>
                        </div>

                    </div>
                    <hr />
                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</asp:Content>



