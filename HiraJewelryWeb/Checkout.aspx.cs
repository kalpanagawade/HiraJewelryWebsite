using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



namespace HiraJewelryWeb
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Example static values (from session/cart later)
            //    decimal price = 14272;
            //    decimal tax = 415.69m;

            //    //lblItemPrice.Text = price.ToString("N2");
            //    lblTax.Text = tax.ToString("N2");
            //    lblTax2.Text = tax.ToString("N2");
            //    lblTotal.Text = (price).ToString("N2");
            //    if (Request.QueryString["price"] != null)
            //    {
            //        lblItemPrice.Text = Request.QueryString["price"];
            //    }
            //}
            if (!IsPostBack)
            {
                if (Request.QueryString["price"] != null)
                {
                    decimal price = Convert.ToDecimal(Request.QueryString["price"]);

                    decimal goldGSTPercent = 3;   // GST for gold
                    decimal makingGSTPercent = 5; // if you have making charges

                    decimal goldTax = (price * goldGSTPercent) / 100;

                    // 👉 If you have making charges then use this
                    decimal makingCharge = 0; // set dynamically if available
                    decimal makingTax = (makingCharge * makingGSTPercent) / 100;

                    decimal totalTax = goldTax + makingTax;
                    decimal finalAmount = price + makingCharge + totalTax;

                    lblItemPrice.Text = price.ToString("N2");
                    lblTax.Text = totalTax.ToString("N2");
                    lblTax2.Text = totalTax.ToString("N2");
                    lblTotal.Text = finalAmount.ToString("N2");
                }
            }




        }
        protected void btnPayNow_Click(object sender, EventArgs e)
    {
        if (Session["UserEmail"] == null)
        {
            Response.Redirect("~/Auth.aspx");
            return;
        }

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string email = Session["UserEmail"].ToString();

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlTransaction tran = con.BeginTransaction();

            try
            {
                // 1️⃣ Get UserID
                SqlCommand cmdUser = new SqlCommand(
                    "SELECT UserID FROM Users WHERE Email=@Email",
                    con, tran);
                cmdUser.Parameters.AddWithValue("@Email", email);

                int userId = Convert.ToInt32(cmdUser.ExecuteScalar());

                // 2️⃣ Get CartID
                SqlCommand cmdCart = new SqlCommand(
                    "SELECT CartID FROM CartMaster WHERE UserID=@UserID",
                    con, tran);
                cmdCart.Parameters.AddWithValue("@UserID", userId);

                object cartObj = cmdCart.ExecuteScalar();
                if (cartObj == null)
                {
                    Response.Write("<script>alert('Cart is empty');</script>");
                    tran.Rollback();
                    return;
                }

                int cartId = Convert.ToInt32(cartObj);

                // 3️⃣ Get Cart Items + Total
                SqlCommand cmdItems = new SqlCommand(@"
                SELECT 
                    C.ProductID,
                    C.Quantity,
                    P.Price
                FROM CartDetails C
                INNER JOIN Products P ON C.ProductID = P.ProductID
                WHERE C.CartID=@CartID",
                    con, tran);

                cmdItems.Parameters.AddWithValue("@CartID", cartId);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmdItems);
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Cart is empty');</script>");
                    tran.Rollback();
                    return;
                }

                decimal totalAmount = 0;
                foreach (DataRow row in dt.Rows)
                {
                    totalAmount += Convert.ToDecimal(row["Price"]) *
                                   Convert.ToInt32(row["Quantity"]);
                }

                // 4️⃣ Payment Mode
                string paymentMode =
                    rbCOD.Checked ? "COD" :
                    rbEasebuzz.Checked ? "Easebuzz" : "Razorpay";

                string shippingAddress =
                    txtAddress.Text + ", " +
                    txtCity.Text + ", " +
                    ddlState.SelectedItem.Text + " - " +
                    txtPin.Text;

                // 5️⃣ Insert Order
                SqlCommand cmdOrder = new SqlCommand(@"
                INSERT INTO Orders
                (UserID, TotalAmount, OrderStatus, PaymentMode, ShippingAddress)
                VALUES
                (@UserID, @Total, 'Pending', @Payment, @Address);
                SELECT SCOPE_IDENTITY();",
                    con, tran);

                cmdOrder.Parameters.AddWithValue("@UserID", userId);
                cmdOrder.Parameters.AddWithValue("@Total", totalAmount);
                cmdOrder.Parameters.AddWithValue("@Payment", paymentMode);
                cmdOrder.Parameters.AddWithValue("@Address", shippingAddress);

                int orderId = Convert.ToInt32(cmdOrder.ExecuteScalar());

                // 6️⃣ Insert Order Details
                foreach (DataRow row in dt.Rows)
                {
                    SqlCommand cmdDetail = new SqlCommand(@"
                    INSERT INTO OrderDetails
                    (OrderID, ProductID, Quantity, Price)
                    VALUES
                    (@OrderID,@ProductID,@Qty,@Price)",
                        con, tran);

                    cmdDetail.Parameters.AddWithValue("@OrderID", orderId);
                    cmdDetail.Parameters.AddWithValue("@ProductID", row["ProductID"]);
                    cmdDetail.Parameters.AddWithValue("@Qty", row["Quantity"]);
                    cmdDetail.Parameters.AddWithValue("@Price", row["Price"]);

                    cmdDetail.ExecuteNonQuery();
                }

                // 7️⃣ Clear Cart
                SqlCommand cmdClear = new SqlCommand(@"
                DELETE FROM CartDetails WHERE CartID=@CartID;
                DELETE FROM CartMaster WHERE CartID=@CartID;",
                    con, tran);
                cmdClear.Parameters.AddWithValue("@CartID", cartId);
                cmdClear.ExecuteNonQuery();

                tran.Commit();

                    // 8️⃣ Redirect
                    //Response.Redirect("~/Order.aspx");
                    Response.Write("<script>alert('Order Succsessfully');</script>");
                }
            catch (Exception ex)
            {
                tran.Rollback();
                Response.Write("<script>alert('Order failed: " + ex.Message + "');</script>");
            }
        }
    }

}
}
