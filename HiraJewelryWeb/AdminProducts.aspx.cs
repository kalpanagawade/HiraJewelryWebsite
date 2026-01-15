using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{

    public partial class AdminProducts : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/Auth.aspx");
            }

            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts(string search = "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Products";

                if (!string.IsNullOrEmpty(search))
                    query += " WHERE ProductName LIKE @search";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrEmpty(search))
                    cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindProducts(txtSearch.Text.Trim());
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindProducts();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imagePath = "";

            if (fuImage.HasFile)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(fuImage.FileName);
                imagePath = "~/Images/" + fileName;
                fuImage.SaveAs(Server.MapPath(imagePath));
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (hfProductID.Value == "") // Insert
                {
                    cmd = new SqlCommand("INSERT INTO Products (ProductName, Category, Description, Price, Stock, ImageUrl) VALUES (@n,@c,@d,@p,@s,@i)", con);
                }
                else // Update
                {
                    cmd = new SqlCommand("UPDATE Products SET ProductName=@n, Category=@c, Description=@d, Price=@p, Stock=@s" +
                        (imagePath != "" ? ", ImageUrl=@i" : "") +
                        " WHERE ProductID=@id", con);

                    cmd.Parameters.AddWithValue("@id", hfProductID.Value);
                }

                cmd.Parameters.AddWithValue("@n", txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@c", txtCategory.Text.Trim());
                cmd.Parameters.AddWithValue("@d", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@p", Convert.ToDecimal(txtPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@s", Convert.ToInt32(txtStock.Text.Trim()));

                if (imagePath != "")
                    cmd.Parameters.AddWithValue("@i", imagePath);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ClearForm();
            BindProducts();
        }

        protected void gvProducts_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
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
                }
            }
        }

        protected void gvProducts_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindProducts();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfProductID.Value = "";
            txtProductName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
        }
    }
}