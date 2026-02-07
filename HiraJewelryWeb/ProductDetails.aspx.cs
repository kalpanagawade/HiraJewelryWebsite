using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["pid"] != null)
            {
                LoadProduct(Request.QueryString["pid"]);
            }
        }

        void LoadProduct(string productId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Products WHERE ProductID=@id", con);

                cmd.Parameters.AddWithValue("@id", productId);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblProductName.Text = dr["ProductName"].ToString();
                    lblPrice.Text = dr["Price"].ToString();
                    lblNetPrice.Text = dr["Price"].ToString();

                    imgProduct.ImageUrl = dr["ImageUrl"].ToString();

                    // Static breakup (can be dynamic later)
                    lblMetalPrice.Text = "26578";
                    lblStonePrice.Text = "7766";
                    lblMaking.Text = "7654";
                    lblTax.Text = "1214";
                }
            }
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            // 1. Check login
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/Auth.aspx");
                return;
            }

            // 2. Get ProductID from QueryString
            if (Request.QueryString["pid"] == null)
            {
                Response.Write("<script>alert('Invalid product');</script>");
                return;
            }

            int productId = Convert.ToInt32(Request.QueryString["pid"]);
            string userEmail = Session["UserEmail"].ToString();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // 3. Get UserID
                SqlCommand cmdUser = new SqlCommand(
                    "SELECT UserID FROM Users WHERE Email=@Email", con);
                cmdUser.Parameters.AddWithValue("@Email", userEmail);

                object userObj = cmdUser.ExecuteScalar();
                if (userObj == null)
                {
                    Response.Write("<script>alert('User not found');</script>");
                    return;
                }

                int userId = Convert.ToInt32(userObj);

                // 4. Get or Create Cart
                SqlCommand cmdCart = new SqlCommand(
                    "SELECT CartID FROM CartMaster WHERE UserID=@UserID", con);
                cmdCart.Parameters.AddWithValue("@UserID", userId);

                object cartObj = cmdCart.ExecuteScalar();
                int cartId;

                if (cartObj == null)
                {
                    SqlCommand cmdNewCart = new SqlCommand(
                        "INSERT INTO CartMaster(UserID) VALUES(@UserID); SELECT SCOPE_IDENTITY();", con);
                    cmdNewCart.Parameters.AddWithValue("@UserID", userId);
                    cartId = Convert.ToInt32(cmdNewCart.ExecuteScalar());
                }
                else
                {
                    cartId = Convert.ToInt32(cartObj);
                }

                // 5. Insert or Update CartDetails
                SqlCommand cmdCheck = new SqlCommand(
                    "SELECT Quantity FROM CartDetails WHERE CartID=@CartID AND ProductID=@ProductID", con);
                cmdCheck.Parameters.AddWithValue("@CartID", cartId);
                cmdCheck.Parameters.AddWithValue("@ProductID", productId);

                object qtyObj = cmdCheck.ExecuteScalar();

                if (qtyObj == null)
                {
                    SqlCommand cmdInsert = new SqlCommand(
                        "INSERT INTO CartDetails (CartID, ProductID, Quantity) VALUES (@CartID,@ProductID,1)", con);
                    cmdInsert.Parameters.AddWithValue("@CartID", cartId);
                    cmdInsert.Parameters.AddWithValue("@ProductID", productId);
                    cmdInsert.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmdUpdate = new SqlCommand(
                        "UPDATE CartDetails SET Quantity = Quantity + 1 WHERE CartID=@CartID AND ProductID=@ProductID", con);
                    cmdUpdate.Parameters.AddWithValue("@CartID", cartId);
                    cmdUpdate.Parameters.AddWithValue("@ProductID", productId);
                    cmdUpdate.ExecuteNonQuery();
                }
            }

            // 6. Success message
            Response.Write("<script>alert('Product added to cart successfully!');</script>");
        }


        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }


    }
}