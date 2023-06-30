

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace IP_Sutra
{
    public partial class Designation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["idd"] != null && Session["idd"].ToString() != "")
            //{
            if (!IsPostBack)
            {
                bindgrid();
            }

            //}
            //else
            //{
            //    Response.Redirect("logout.aspx");
            //}
        }

        public void bindgrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_designation_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grddesig.DataSource = dt;
            grddesig.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Designation_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Designation", txt_Designation.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("sp_Designation_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ViewState["Id"]);
                cmd.Parameters.AddWithValue("@Designation", txt_Designation.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            clear();
        }
        public void clear()
        {
            txt_Designation.Text = "";
            btn_save.Text = "Save";
        }
        protected void grddesig_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "abc")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from mst_Designation where Id='" + e.CommandArgument + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            if (e.CommandName == "abc1")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from mst_Designation where Id='" + e.CommandArgument + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                txt_Designation.Text = dt.Rows[0]["Designation"].ToString();
                btn_save.Text = "Update";
                ViewState["Id"] = e.CommandArgument;
            }

        }
        protected void grddesig_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddesig.PageIndex = e.NewPageIndex;
            this.bindgrid();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
    }
}