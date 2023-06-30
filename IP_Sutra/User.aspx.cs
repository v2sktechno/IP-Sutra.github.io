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
    public partial class User : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
            {
                bindgrid();
            }

            }
            else
            {
                Response.Redirect("loginform.aspx");
            }
        }

        public void bindgrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_user_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grduser.DataSource = dt;
            grduser.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_user_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txt_UserName.Text);
                cmd.Parameters.AddWithValue("@Password", txt_Password.Text);
                cmd.Parameters.AddWithValue("@Designation", ddl_designation.SelectedValue);
                cmd.Parameters.AddWithValue("@Department", ddl_department.SelectedValue);
                cmd.Parameters.AddWithValue("@Role", ddl_Role.SelectedItem.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("sp_User_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", ViewState["UserId"]);
                cmd.Parameters.AddWithValue("@UserName", txt_UserName.Text);
                cmd.Parameters.AddWithValue("@Password", txt_Password.Text);
                cmd.Parameters.AddWithValue("@Designation", ddl_designation.SelectedValue);
                cmd.Parameters.AddWithValue("@Department", ddl_department.SelectedValue);
                cmd.Parameters.AddWithValue("@Role", ddl_Role.SelectedItem.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                 bindgrid();
            }
            clear();
        }
        public void clear()
        {
            ddl_department.ClearSelection();
            ddl_designation.ClearSelection();
            ddl_Role.ClearSelection();
            txt_UserName.Text = "";
            txt_Password.Text = "";
            btn_save.Text = "Save";
        }
        protected void grduser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "abc")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from mst_User where UserId='" + e.CommandArgument + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            if (e.CommandName == "abc1")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from mst_User where UserId='" + e.CommandArgument + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                txt_UserName.Text = dt.Rows[0]["UserName"].ToString();
                txt_Password.Text = dt.Rows[0]["Password"].ToString();
                ddl_department.Text = dt.Rows[0]["Department"].ToString();
                ddl_designation.Text = dt.Rows[0]["Designation"].ToString();
                ddl_Role.Text = dt.Rows[0]["role"].ToString();
                btn_save.Text = "Update";
                ViewState["UserId"] = e.CommandArgument;
            }

        }

        protected void grduser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grduser.PageIndex = e.NewPageIndex;
            this.bindgrid();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
    }
}


