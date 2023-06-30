using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_Sutra
{
    public partial class Invention_Details : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showGridApplicant();
                showGridContact();
                showGridCompany();
                //PanelDDl.Visible = true;

                bindType();bindInvAppType();bindLicenseType();bindStatus();

            }


        }

        //Show Inventor/Applicant Type in Dropdown List
        public void bindInvAppType()
        {
            // Declare an array of options
            string[] options = { "--Select--", "Company", "Individual" };

            // Declare an array of option values
            string[] optionValues = { "--Select--","Company", "Individual" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddlApp_Type.DataSource = items;
            ddlApp_Type.DataBind();
            //ddlApp_Type.SelectedIndex = 2; // Set the selected item to "Title"

        }

        //Show Type in Dropdown List
        public void bindType()
        {
            // Declare an array of options
            string[] options = { "--Select--", "Applicant", "Inventor" };

            // Declare an array of option values
            string[] optionValues = { "--Select--", "Applicant", "Inventor" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddl_Type.DataSource = items;
            ddl_Type.DataBind();
            //ddlApp_Type.SelectedIndex = 2; // Set the selected item to "Title"

        }

        //Show Status in Dropdown List
        public void bindStatus()
        {
            // Declare an array of options
            string[] options = { "--Select--", "Active", "Completed", "Hold" };

            // Declare an array of option values
            string[] optionValues = { "--Select--", "Active", "Completed", "Hold" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddl_Status.DataSource = items;
            ddl_Status.DataBind();
            //ddlApp_Type.SelectedIndex = 2; // Set the selected item to "Title"

        }

        //Show Status in Dropdown List
        public void bindLicenseType()
        {
            // Declare an array of options
            string[] options = { "--Select--", "Active", "Licensed", "Transferred" };

            // Declare an array of option values
            string[] optionValues = { "--Select--", "Active", "Licensed", "Transferred" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddl_LicenseType.DataSource = items;
            ddl_LicenseType.DataBind();
            //ddlApp_Type.SelectedIndex = 2; // Set the selected item to "Title"

        }

        //show Applicant grid
        public void showGridApplicant()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6]
            { new DataColumn("ID"),  new DataColumn("Type"),new DataColumn("App_Type"), new DataColumn("Name"), new DataColumn("ContactNo"), new DataColumn("EmailId") });
            ViewState["Inventor_Applicants"] = dt;
            this.BindGrid();
        }

        //show Contact grid
        public void showGridContact()
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.AddRange(new DataColumn[4]
            { new DataColumn("ID"), new DataColumn("Name"), new DataColumn("ContactNo"),new DataColumn("EmailId") });
            ViewState["Inventor_Contact"] = dt1;
            this.BindGrid1();
        }

        //show Company grid
        public void showGridCompany()
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.AddRange(new DataColumn[5]
            { new DataColumn("ID"), new DataColumn("CompanyName"), new DataColumn("ContactPersonName"),new DataColumn("ContactNo"), new DataColumn("EmailId") });
            ViewState["Inventor_Company"] = dt1;
            this.BindGrid2();
        }

        protected void BindGrid()
        {
            Gridview1.DataSource = (DataTable)ViewState["Inventor_Applicants"];
            Gridview1.DataBind();
        }

        protected void BindGrid1()
        {
            Gridview2.DataSource = (DataTable)ViewState["Inventor_Contact"];
            Gridview2.DataBind();
        }

        protected void BindGrid2()
        {
            Gridview3.DataSource = (DataTable)ViewState["Inventor_Company"];
            Gridview3.DataBind();
        }

         //save Applicant Log
        public void saveApplicant()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Invention WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from mst_InventionDetails WHERE ID = (SELECT IDENT_CURRENT('mst_InventionDetails')) and Ref_No = '" + txt_RefNo.Text + "'";
            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string IId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview1.Rows.Count) > 0)
            {
                foreach (GridViewRow g1 in Gridview1.Rows)
                {
                    com = new SqlCommand("Insert into Inventor_Applicants (IId,Type,App_Type,App_Name,App_ContactNo,App_EmailId,Ref_No) " +
                        " values ('" + IId.ToString() + "','" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" + g1.Cells[3].Text +
                        "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Inventor_Applicants (IId,App_Type,Type,App_Name,App_ContactNo,App_EmailId,Ref_No) " +
                    " values ('" + IId.ToString() + "','" + ddlApp_Type.SelectedItem.Text + "','" + ddl_Type.SelectedItem.Text + "','" + txtApp_Name.Text +
                    "','" + txtApp_ContactNo.Text + "','" + txtApp_EmailId.Text + "','" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }


        }

        //save Contact Log
        public void saveContact()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Invention WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from mst_InventionDetails WHERE ID = (SELECT IDENT_CURRENT('mst_InventionDetails')) and Ref_No = '" + txt_RefNo.Text + "'";
            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string IId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview2.Rows.Count) > 0)
            {
                foreach (GridViewRow g1 in Gridview2.Rows)
                {
                    com = new SqlCommand("Insert into Inventor_Contact (IId,Name,ContactNo,EmailId,Ref_No) " +
                        " values ('" + IId.ToString() + "','" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" + g1.Cells[3].Text +
                        "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Inventor_Contact (IId,Name,ContactNo,EmailId,Ref_No) " +
                    " values ('" + IId.ToString() + "','" + txt_ContactName.Text + "','" + txt_ContactNo.Text + "','" + txt_ContactEmailId.Text + "' ,'" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }


        }

        //save Company Log
        public void saveCompany()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Invention WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from mst_InventionDetails WHERE ID = (SELECT IDENT_CURRENT('mst_InventionDetails')) and Ref_No = '" + txt_RefNo.Text + "'";
            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string IId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview3.Rows.Count) > 0)
            {
                foreach (GridViewRow g1 in Gridview3.Rows)
                {
                    com = new SqlCommand("Insert into Inventor_Company (IId,Company_Name,Contact_Person,ContactNo,EmailId,Ref_No) " +
                        " values ('" + IId.ToString() + "','" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" + g1.Cells[3].Text +
                        "','" + g1.Cells[4].Text + "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Inventor_Company (IId,Company_Name,Contact_Person,ContactNo,EmailId,Ref_No) " +
                    " values ('" + IId.ToString() + "','" + txt_CompanyName.Text + "','" + txt_CompPerName.Text + "','" + txt_CompContactNo.Text + "' ,'" +  txt_CompEmailId + "','" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }


        }

        public void clearApplicant()
        {
            // Clear the textboxes
            ddlApp_Type.ClearSelection();
            ddl_Type.ClearSelection();
            txtApp_Name.Text = string.Empty;
            txtApp_ContactNo.Text = string.Empty;
            txtApp_EmailId.Text = string.Empty;

            LinkButton1.Text = "Add more";
            lblMsg.Text = "";
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (LinkButton1.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID1"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                DataTable dt = (DataTable)ViewState["Inventor_Applicants"];
                
                // Update the data in the ViewState
                ViewState["AppType"] = ddlApp_Type.SelectedItem.Text.ToString();
                ViewState["Type"] = ddl_Type.SelectedItem.Text.ToString();
                ViewState["AppName"] = txtApp_Name.Text.ToString();
                ViewState["AppContactNo"] = txtApp_ContactNo.Text.ToString();
                ViewState["AppEmailId"] = txtApp_EmailId.Text.ToString();

                // Update the data in the DataTable
                DataRow dr = dt.Rows[rowIndex];
                dr["App_Type"] = ViewState["AppType"].ToString();
                dr["Type"] = ViewState["Type"].ToString();
                dr["Name"] = ViewState["AppName"].ToString();
                dr["ContactNo"] = ViewState["AppContactNo"].ToString();
                dr["EmailId"] = ViewState["AppEmailId"].ToString();
                // add more columns if needed

                // Save the updated DataTable back to ViewState
                ViewState["Inventor_Applicants"] = dt;

                // Exit edit mode and rebind the GridView
                Gridview1.EditIndex = -1;
                BindGrid();

            }
            else
            {
                int rowNo, largestID;

                if ((Gridview1.Rows.Count) > 0)
                {
                    largestID = 0;

                    foreach (GridViewRow row in Gridview1.Rows)
                    {
                        int currentID;
                        if (int.TryParse(row.Cells[0].Text, out currentID))
                        {
                            if (currentID > largestID)
                            {
                                largestID = currentID;
                            }
                        }
                    }

                    rowNo = largestID + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Applicants"];
                    dt.Rows.Add(rowNo, ddlApp_Type.SelectedItem.Text.Trim(), ddl_Type.SelectedItem.Text.Trim(), txtApp_Name.Text.Trim(), txtApp_ContactNo.Text.Trim(), txtApp_EmailId.Text.Trim());
                    ViewState["Inventor_Applicants"] = dt;
                    this.BindGrid();
                }
                else
                {
                    rowNo = Convert.ToInt32(Gridview1.Rows.Count) + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Applicants"];
                    dt.Rows.Add(rowNo, ddlApp_Type.SelectedItem.Text.Trim(), ddl_Type.SelectedItem.Text.Trim(), txtApp_Name.Text.Trim(), txtApp_ContactNo.Text.Trim(), txtApp_EmailId.Text.Trim());
                    ViewState["Inventor_Applicants"] = dt;
                    this.BindGrid();
                }
                
            }

            clearApplicant();
        }

        public void clearContact()
        {
            // Clear the textboxes

            txt_ContactName.Text = string.Empty;
            txt_ContactNo.Text = string.Empty;
            txt_ContactEmailId.Text = string.Empty;

            LinkButton2.Text = "Add more";
            lblMsg.Text = "";
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (LinkButton2.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID2"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                DataTable dt = (DataTable)ViewState["Inventor_Contact"];

                // Update the data in the ViewState
                ViewState["Name"] = txt_ContactName.Text.ToString();
                ViewState["ContactNo"] = txt_ContactNo.Text.ToString();
                ViewState["EmailId"] = txt_ContactEmailId.Text.ToString();

                // Update the data in the DataTable
                DataRow dr = dt.Rows[rowIndex];
                
                dr["Name"] = ViewState["Name"].ToString();
                dr["ContactNo"] = ViewState["ContactNo"].ToString();
                dr["EmailId"] = ViewState["EmailId"].ToString();
                // add more columns if needed

                // Save the updated DataTable back to ViewState
                ViewState["Inventor_Contact"] = dt;

                // Exit edit mode and rebind the GridView
                Gridview2.EditIndex = -1;
                BindGrid1();

            }
            else
            {
                int rowNo, largestID;

                if ((Gridview2.Rows.Count) > 0)
                {
                    largestID = 0;

                    foreach (GridViewRow row in Gridview2.Rows)
                    {
                        int currentID;
                        if (int.TryParse(row.Cells[0].Text, out currentID))
                        {
                            if (currentID > largestID)
                            {
                                largestID = currentID;
                            }
                        }
                    }

                    rowNo = largestID + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Contact"];
                    dt.Rows.Add(rowNo, txt_ContactName.Text.Trim(), txt_ContactNo.Text.Trim(), txt_ContactEmailId.Text.Trim());
                    ViewState["Inventor_Contact"] = dt;
                    this.BindGrid1();
                }
                else
                {
                    rowNo = Convert.ToInt32(Gridview2.Rows.Count) + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Contact"];
                    dt.Rows.Add(rowNo, txt_ContactName.Text.Trim(), txt_ContactNo.Text.Trim(), txt_ContactEmailId.Text.Trim());
                    ViewState["Inventor_Contact"] = dt;
                    this.BindGrid1();
                }                
            }

            clearContact();
        }

        public void clearCompany()
        {
            // Clear the textboxes

            txt_CompanyName.Text = string.Empty;
            txt_CompPerName.Text = string.Empty;
            txt_CompContactNo.Text = string.Empty;
            txt_CompEmailId.Text = string.Empty;

            LinkButton3.Text = "Add more";

            lblMsg.Text = "";
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (LinkButton3.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID3"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                DataTable dt = (DataTable)ViewState["Inventor_Company"];

                // Update the data in the ViewState
                ViewState["CompanyName"] = txt_CompanyName.Text.ToString();
                ViewState["ContactPersonName"] = txt_CompPerName.Text.ToString();
                ViewState["ContactNo"] = txt_CompContactNo.Text.ToString();
                ViewState["EmailId"] = txt_CompEmailId.Text.ToString();

                // Update the data in the DataTable
                DataRow dr = dt.Rows[rowIndex];
                
                dr["CompanyName"] = ViewState["CompanyName"].ToString();
                dr["ContactPersonName"] = ViewState["ContactPersonName"].ToString();
                dr["ContactNo"] = ViewState["ContactNo"].ToString();
                dr["EmailId"] = ViewState["EmailId"].ToString();
                // add more columns if needed

                // Save the updated DataTable back to ViewState
                ViewState["Inventor_Company"] = dt;

                // Exit edit mode and rebind the GridView
                Gridview3.EditIndex = -1;
                BindGrid2();

            }
            else
            {
                int rowNo, largestID;

                if ((Gridview3.Rows.Count) > 0)
                {
                    largestID = 0;

                    foreach (GridViewRow row in Gridview3.Rows)
                    {
                        int currentID;
                        if (int.TryParse(row.Cells[0].Text, out currentID))
                        {
                            if (currentID > largestID)
                            {
                                largestID = currentID;
                            }
                        }
                    }

                    rowNo = largestID + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Company"];
                    dt.Rows.Add(rowNo, txt_CompanyName.Text.Trim(), txt_CompPerName.Text.Trim(), txt_CompContactNo.Text.Trim(), txt_CompEmailId.Text.Trim());
                    ViewState["Inventor_Company"] = dt;
                    this.BindGrid2();
                }
                else
                {
                    rowNo = Convert.ToInt32(Gridview3.Rows.Count) + 1;

                    DataTable dt = (DataTable)ViewState["Inventor_Company"];
                    dt.Rows.Add(rowNo, txt_CompanyName.Text.Trim(), txt_CompPerName.Text.Trim(), txt_CompContactNo.Text.Trim(), txt_CompEmailId.Text.Trim());
                    ViewState["Inventor_Company"] = dt;
                    this.BindGrid2();
                }
                
            }

            clearCompany();
        }


        public Boolean checkRecord()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Ref_No from mst_InventionDetails WHERE Ref_No = '" + txt_RefNo.Text.ToString() + "' ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                //DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(ds);


                if (((int)ds.Tables[0].Rows.Count) <= 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception e1)
            {
                throw e1;
            }
            finally
            {
                con.Close();
            }
        }


        //Save data to Invention(Main) Table 
        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            if (hdn.Value == "save")
            {
                Boolean strRefNo = checkRecord();
                if (strRefNo == true)
                {
                    SqlCommand cmd = new SqlCommand("sp_Invention_insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Ref_No", txt_RefNo.Text);
                    cmd.Parameters.AddWithValue("@Title", txt_Title.Text);
                    cmd.Parameters.AddWithValue("@IP_Regd_No", txt_IpRegdNo.Text);
                    cmd.Parameters.AddWithValue("@Status", ddl_Status.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Type_of_License", ddl_LicenseType.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Details_of_Ip_Linked", txt_Details.Text);
                    cmd.Parameters.AddWithValue("@Remarks", txt_Remarks.Text);
                    if (!rblCompany.Items.Cast<ListItem>().Any(i => i.Selected))
                    {
                        cmd.Parameters.AddWithValue("@CompInterest", DBNull.Value);

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompInterest", rblCompany.SelectedItem.Text);
                    }
                    cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    saveApplicant();
                    saveContact();
                    saveCompany();


                    lblMsg.Text = "Record Saved";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                }
                else
                {
                    lblMsg.Text = "Ref. No. already in record";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                }
            }
            else
            {
                lblMsg.Text = "No record saved/updated. Try again.";
                lblMsg.Visible = true;
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
            }


        }



        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                // Get the index of the row to delete
                //int rowIndex = Convert.ToInt32(ViewState["SelectedRow"]);
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the data source from ViewState
                DataTable dt = ViewState["Inventor_Applicants"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Inventor_Applicants"] = dt;

                // Re-bind the GridView to the data source
                BindGrid();

                clearApplicant();
            }

            if (e.CommandName == "cmd_edit")
            {
                // Get the index of the selected row
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = Gridview1.Rows[rowIndex];

                // Store the ID of the selected row in ViewState
                //ViewState["SelectedRowID"] = row.Cells[0].Text;
                ViewState["SelectedRowID1"] = rowIndex;

                // Display the Name of the selected row in the TextBox
                ddlApp_Type.ClearSelection();
                ddlApp_Type.Items.FindByText(row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", " ") == "" ? "--Select--" :
                     row.Cells[1].Text.ToString()).Selected = true;
                ddl_Type.ClearSelection();
                ddl_Type.Items.FindByText(row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", " ") == "" ? "--Select--" :
                     row.Cells[2].Text.ToString()).Selected = true;
                txtApp_Name.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();
                txtApp_ContactNo.Text = row.Cells[4].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[4].Text.ToString();
                txtApp_EmailId.Text = row.Cells[5].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[5].Text.ToString();

                LinkButton1.Text = "Update";
            }
        }


        protected void Gridview2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                // Get the index of the row to delete
                //int rowIndex = Convert.ToInt32(ViewState["SelectedRow"]);
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the data source from ViewState
                DataTable dt = ViewState["Inventor_Contact"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Inventor_Contact"] = dt;

                // Re-bind the GridView to the data source
                BindGrid1();

                clearContact();
            }

            if (e.CommandName == "cmd_edit")
            {
                // Get the index of the selected row
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = Gridview2.Rows[rowIndex];

                // Store the ID of the selected row in ViewState
                //ViewState["SelectedRowID"] = row.Cells[0].Text;
                ViewState["SelectedRowID2"] = rowIndex;

                // Display the Name of the selected row in the TextBox
                txt_ContactName.Text = row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[1].Text.ToString();
                txt_ContactNo.Text = row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[2].Text.ToString();
                txt_ContactEmailId.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();
               

                LinkButton2.Text = "Update";

            }
        }


        protected void Gridview3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                // Get the index of the row to delete
                //int rowIndex = Convert.ToInt32(ViewState["SelectedRow"]);
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the data source from ViewState
                DataTable dt = ViewState["Inventor_Company"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Inventor_Company"] = dt;

                // Re-bind the GridView to the data source
                BindGrid2();

                clearCompany();
            }

            if (e.CommandName == "cmd_edit")
            {
                // Get the index of the selected row
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = Gridview3.Rows[rowIndex];

                // Store the ID of the selected row in ViewState
                //ViewState["SelectedRowID"] = row.Cells[0].Text;
                ViewState["SelectedRowID3"] = rowIndex;

                // Display the Name of the selected row in the TextBox
                txt_CompanyName.Text = row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[1].Text.ToString();
                txt_CompPerName.Text = row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[2].Text.ToString();
                txt_CompContactNo.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();
                txt_CompEmailId.Text = row.Cells[4].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[4].Text.ToString();


                LinkButton3.Text = "Update";

            }
        }



        protected void rblCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblCompany.SelectedValue.ToString() == "Yes")
            {
                PanelComp.Visible = true;
            }
            else
            {
                PanelComp.Visible = false;
            }
        }
    }
}