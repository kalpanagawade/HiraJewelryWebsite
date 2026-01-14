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

    public partial class AdminProducts : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }

            // Admin session check
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/Auth.aspx");
            }
        }

        private void BindProducts()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfProductID.Value)) // Insert
                {
                    cmd = new SqlCommand("INSERT INTO Products (ProductName, Category, Description, Price, Stock, ImageUrl) VALUES (@Name,@Cat,@Desc,@Price,@Stock,@Img)", con);
                }
                else // Update
                {
                    cmd = new SqlCommand("UPDATE Products SET ProductName=@Name, Category=@Cat, Description=@Desc, Price=@Price, Stock=@Stock, ImageUrl=@Img WHERE ProductID=@ID", con);
                    cmd.Parameters.AddWithValue("@ID", hfProductID.Value);
                }

                cmd.Parameters.AddWithValue("@Name", txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@Cat", txtCategory.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@Stock", Convert.ToInt32(txtStock.Text.Trim()));
                cmd.Parameters.AddWithValue("@Img", txtImageUrl.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearForm();
            BindProducts();
        }

        protected void ClearForm()
        {
            hfProductID.Value = "";
            txtProductName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            txtImageUrl.Text = "";
        }

        // GridView Edit/Delete
        protected void gvProducts_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.NewEditIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfProductID.Value = dr["ProductID"].ToString();
                    txtProductName.Text = dr["ProductName"].ToString();
                    txtCategory.Text = dr["Category"].ToString();
                    txtDescription.Text = dr["Description"].ToString();
                    txtPrice.Text = dr["Price"].ToString();
                    txtStock.Text = dr["Stock"].ToString();
                    txtImageUrl.Text = dr["ImageUrl"].ToString();
                }
                con.Close();
            }
        }

        protected void gvProducts_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            BindProducts();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
        protected void gvProducts_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            BindProducts();
        }

        protected void gvProducts_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            // If not using inline update, leave empty
        }

    }

}