<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="HiraJewelryWeb.AdminOrders" %>--%>

<%@ Page Language="C#" MasterPageFile="~/MasterSite.master"
    AutoEventWireup="true"
    CodeBehind="AdminOrders.aspx.cs"
    Inherits="HiraJewelryWeb.AdminOrders" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <div class="container mt-4">

        <h3 class="mb-3">Manage Orders</h3>

        <asp:GridView ID="gvOrders" runat="server"
            CssClass="table table-bordered table-striped"
            AutoGenerateColumns="false">

            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                <asp:BoundField DataField="FullName" HeaderText="Customer Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date"
                    DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                <asp:BoundField DataField="OrderStatus" HeaderText="Status" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server"
                            Text="View"
                            CssClass="btn btn-primary btn-sm"
                            CommandArgument='<%# Eval("OrderID") %>'
                            OnClick="btnView_Click" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
