using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HiraJewelryWeb
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts(string search = "")
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Products";

                if (!string.IsNullOrEmpty(search))
                    query += " WHERE ProductName LIKE @search";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrEmpty(search))
                    cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                rptProducts.DataSource = dr;
                rptProducts.DataBind();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindProducts();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindProducts(txtSearch.Text.Trim());
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/Auth.aspx");
                return;
            }

            string userEmail = Session["UserEmail"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Get UserID
                SqlCommand cmdUser = new SqlCommand("SELECT UserID FROM Users WHERE Email=@Email", con);
                cmdUser.Parameters.AddWithValue("@Email", userEmail);
                int userId = Convert.ToInt32(cmdUser.ExecuteScalar());

                // Check if CartMaster exists
                SqlCommand cmdCart = new SqlCommand("SELECT CartID FROM CartMaster WHERE UserID=@UserID", con);
                cmdCart.Parameters.AddWithValue("@UserID", userId);
                object cartObj = cmdCart.ExecuteScalar();

                int cartId;
                if (cartObj == null)
                {
                    // Create new CartMaster
                    SqlCommand cmdNewCart = new SqlCommand("INSERT INTO CartMaster (UserID) VALUES (@UserID); SELECT SCOPE_IDENTITY();", con);
                    cmdNewCart.Parameters.AddWithValue("@UserID", userId);
                    cartId = Convert.ToInt32(cmdNewCart.ExecuteScalar());
                }
                else
                {
                    cartId = Convert.ToInt32(cartObj);
                }

                // Check if product already in cart
                SqlCommand cmdDetailCheck = new SqlCommand("SELECT Quantity FROM CartDetails WHERE CartID=@CartID AND ProductID=@ProductID", con);
                cmdDetailCheck.Parameters.AddWithValue("@CartID", cartId);
                cmdDetailCheck.Parameters.AddWithValue("@ProductID", productId);
                object quantityObj = cmdDetailCheck.ExecuteScalar();

                if (quantityObj == null)
                {
                    // Insert new product
                    SqlCommand cmdInsert = new SqlCommand("INSERT INTO CartDetails (CartID, ProductID, Quantity) VALUES (@CartID,@ProductID,1)", con);
                    cmdInsert.Parameters.AddWithValue("@CartID", cartId);
                    cmdInsert.Parameters.AddWithValue("@ProductID", productId);
                    cmdInsert.ExecuteNonQuery();
                }
                else
                {
                    // Update quantity
                    int currentQty = Convert.ToInt32(quantityObj);
                    SqlCommand cmdUpdate = new SqlCommand("UPDATE CartDetails SET Quantity=@Qty WHERE CartID=@CartID AND ProductID=@ProductID", con);
                    cmdUpdate.Parameters.AddWithValue("@Qty", currentQty + 1);
                    cmdUpdate.Parameters.AddWithValue("@CartID", cartId);
                    cmdUpdate.Parameters.AddWithValue("@ProductID", productId);
                    cmdUpdate.ExecuteNonQuery();
                }

                con.Close();
            }

            Response.Write("<script>alert('Product added to cart!');</script>");
        }

    }

}