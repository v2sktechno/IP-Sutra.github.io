using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace IP_Sutra
{
    public partial class Patent1 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showGridApplicant();
                showGridInventor();
                showGridCollaborator();
            }

            //showSelectedApplicant();
            //if (ViewState["SelectedRowID"] != null)
            //{
            //    // Retrieve the ID of the selected row from ViewState and use it to find the row in the GridView
            //    string selectedRowID = ViewState["SelectedRowID"].ToString();
            //    GridViewRow selectedRow = Gridview1.Rows.Cast<GridViewRow>()
            //                                  .SingleOrDefault(row => row.Cells[0].Text == selectedRowID);
            //    if (selectedRow != null)
            //    {
            //        // Display the Name of the selected row in the TextBox
            //        txtApp_Name.Text = selectedRow.Cells[1].Text;
            //    }
            //}

        }

        //public void showSelectedApplicant()
        //{

        //    if (ViewState["SelectedRowID"] != null)
        //    {
        //        // Retrieve the ID of the selected row from ViewState and use it to find the row in the GridView
        //        string selectedRowID = ViewState["SelectedRowID"].ToString();
        //        GridViewRow selectedRow = Gridview1.Rows.Cast<GridViewRow>()
        //                                      .SingleOrDefault(row => row.Cells[0].Text == selectedRowID);
        //        if (selectedRow != null)
        //        {
        //            // Display the Name of the selected row in the TextBox
        //            txtApp_Name.Text = selectedRow.Cells[1].Text;
        //        }
        //    }

        //}

        //show applicant grid
        public void showGridApplicant()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5]
            { new DataColumn("ID"), new DataColumn("Name"), new DataColumn("Nationality"), new DataColumn("Address"), new DataColumn("Category") });
            ViewState["Patent_Applicants"] = dt;
            this.BindGrid();
        }

        //show inventor grid
        public void showGridInventor()
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.AddRange(new DataColumn[8]
            { new DataColumn("Inv_Id"),new DataColumn("FirstName"), new DataColumn("LastName"), new DataColumn("Nationality"), new DataColumn("Address"),
                new DataColumn("Designation"), new DataColumn("PhoneNo"), new DataColumn("EmailId") });
            ViewState["Patent_Inventors"] = dt1;
            this.BindGrid1();
        }

        //show collabolator grid
        public void showGridCollaborator()
        {
            DataTable dt2 = new DataTable();
            dt2.Columns.AddRange(new DataColumn[6]
            { new DataColumn("GrantCollab_Id"),new DataColumn("StartDate"), new DataColumn("EndDate"), new DataColumn("Collaborators"),
                new DataColumn("Affilliation"), new DataColumn("Contribution") });
            ViewState["Patent_GrantExCollab"] = dt2;
            this.BindGrid2();
        }

        protected void BindGrid()
        {
            if (ViewState["Patent_Applicants"] != null)
            {
                Gridview1.DataSource = (DataTable)ViewState["Patent_Applicants"];
                Gridview1.DataBind();
            }

        }

        protected void BindGrid1()
        {
            if (ViewState["Patent_Inventors"] != null)
            {
                Gridview2.DataSource = (DataTable)ViewState["Patent_Inventors"];
                Gridview2.DataBind();
            }
        }

        protected void BindGrid2()
        {

            if (ViewState["Patent_GrantExCollab"] != null)
            {
                Gridview3.DataSource = (DataTable)ViewState["Patent_GrantExCollab"];
                Gridview3.DataBind();
            }
        }

        //save Applicant Log
        public void saveApplicant()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Patent WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from tbl_Patent WHERE ID = (SELECT IDENT_CURRENT('tbl_Patent')) and Ref_No = '" + txt_RefNo.Text + "'";
            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string PId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview1.Rows.Count) > 0)
            {
                foreach (GridViewRow g1 in Gridview1.Rows)
                {
                    com = new SqlCommand("Insert into Patent_Applicants (PId,App_Name,App_Nationality,App_Address,App_Category,Ref_No) " +
                        " values ('" + PId.ToString() + "','" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" + g1.Cells[3].Text +
                        "','" + g1.Cells[4].Text + "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Patent_Applicants (PId,App_Name,App_Nationality,App_Address,App_Category,Ref_No) " +
                    " values ('" + PId.ToString() + "','" + txtApp_Name.Text + "','" + txtApp_Nationality.Text + "','" + txtApp_Address.Text +
                    "','" + ddl_AppCategory.SelectedItem.Text.ToString() + "','" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }


        }

        //save Inventor Log
        public void saveInventor()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Patent WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from tbl_Patent WHERE ID = (SELECT IDENT_CURRENT('tbl_Patent')) and Ref_No = '" + txt_RefNo.Text + "'";

            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string PId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview2.Rows.Count) > 0)
            {
                foreach (GridViewRow g2 in Gridview2.Rows)
                {
                    com = new SqlCommand("Insert into Patent_Inventors (PId,Inv_FirstName,Inv_LastName,Inv_Nationality,Inv_Address,Inv_Designation,Inv_PhoneNumber,Inv_EmailId,Ref_No) " +
                    "values ('" + PId.ToString() + "','" + g2.Cells[1].Text + "','" + g2.Cells[2].Text + "','" + g2.Cells[3].Text + "','" + g2.Cells[4].Text + "','" +
                    g2.Cells[5].Text + "','" + g2.Cells[5].Text + "','" + g2.Cells[7].Text + "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Patent_Inventors (PId,Inv_FirstName,Inv_LastName,Inv_Nationality,Inv_Address,Inv_Designation,Inv_PhoneNumber,Inv_EmailId,Ref_No) " +
                    "values ('" + PId.ToString() + "','" + txt_FirstName.Text + "','" + txt_LastName.Text + "','" + txt_InvNationality.Text + "','" + txt_InvAddress.Text + "','" +
                    txt_Invdesignation.Text + "','" + txt_InvPhoneNo.Text + "','" + txt_InvEmailId.Text + "','" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }
        }

        //save Grant Log
        public void saveGrantDetails()
        {
            con.Open();
            //string strID = "SELECT Ref_No FROM Patent WHERE Ref_No =  '" + txt_RefNo.Text + "'";
            string strID = "SELECT Id, Ref_No from tbl_Patent WHERE ID = (SELECT IDENT_CURRENT('tbl_Patent')) and Ref_No = '" + txt_RefNo.Text + "'";

            SqlCommand sqlcmd = new SqlCommand(strID, con);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string PId = dt.Rows[0]["Id"].ToString();
            string RefNo = dt.Rows[0]["Ref_No"].ToString();
            con.Close();

            if ((Gridview3.Rows.Count) > 0)
            {
                foreach (GridViewRow g3 in Gridview3.Rows)
                {
                    string strSdate = (g3.Cells[1].Text == null) || (g3.Cells[1].Text == "") ? null : Convert.ToDateTime(g3.Cells[1].Text).ToString("yyyy-MM-dd");
                    string strEdate = (g3.Cells[2].Text == null) || (g3.Cells[2].Text == "") ? null : Convert.ToDateTime(g3.Cells[2].Text).ToString("yyyy-MM-dd");                    

                    com = new SqlCommand("Insert into Patent_GrantExCollab (PId,GrantCollab_StartDate,GrantCollab_EndDate,GrantCollab_Collaborator,GrantCollab_Affilliation,GrantCollab_Contribution,Ref_No)" +
                    " values ('" + PId.ToString() + "','" + strSdate + "','" + strEdate + "','" + g3.Cells[3].Text + "','" + g3.Cells[4].Text +
                    "','" + g3.Cells[5].Text + "','" + RefNo.ToString() + "')", con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                com = new SqlCommand("Insert into Patent_GrantExCollab (PId,GrantCollab_StartDate,GrantCollab_EndDate,GrantCollab_Collaborator,GrantCollab_Affilliation,GrantCollab_Contribution,Ref_No)" +
                    " values ('" + PId.ToString() + "','" + txt_StartDate.Text + "','" + txt_EndDate.Text + "','" + txt_Collaborator.Text + "','" + txt_Affilliation.Text +
                    "','" + txt_Contribution.Text + "','" + RefNo.ToString() + "')", con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void Butt_Copy_Click(object sender, EventArgs e)
        {
            Response.Redirect("Copyright.aspx");
        }

        protected void Butt_Patent_Click(object sender, EventArgs e)
        {
            Response.Redirect("patent.aspx");
        }

        protected void Butt_Design_Click(object sender, EventArgs e)
        {
            Response.Redirect("Design.aspx");
        }

        protected void Butt_Trade_Click(object sender, EventArgs e)
        {
            Response.Redirect("Trademark.aspx");
        }

        //Add Applicant data to GridView
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (LinkButton1.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID1"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                GridViewRow row = Gridview1.Rows[rowIndex];

                // Update the data in the ViewState
                ViewState["AppName"] = txtApp_Name.Text.ToString();
                ViewState["AppNationality"] = txtApp_Nationality.Text.ToString();
                ViewState["AppAddress"] = txtApp_Address.Text.ToString();
                ViewState["AppCategory"] = ddl_AppCategory.SelectedItem.Text.ToString();

                // Update the data in the selected row
                row.Cells[1].Text = ViewState["AppName"].ToString();
                row.Cells[2].Text = ViewState["AppNationality"].ToString();
                row.Cells[3].Text = ViewState["AppAddress"].ToString();
                row.Cells[4].Text = ViewState["AppCategory"].ToString();

            }
            else
            {
                int rowNo = Convert.ToInt32(Gridview1.Rows.Count) + 1;

                DataTable dt = (DataTable)ViewState["Patent_Applicants"];
                dt.Rows.Add(rowNo, txtApp_Name.Text.Trim(), txtApp_Nationality.Text.Trim(), txtApp_Address.Text.Trim(), ddl_AppCategory.SelectedItem.Text.Trim());
                ViewState["Patent_Applicants"] = dt;
                this.BindGrid();
            }

            // Clear the textboxes
            txtApp_Name.Text = string.Empty;
            txtApp_Address.Text = string.Empty;
            txtApp_Nationality.Text = string.Empty;
            ddl_AppCategory.ClearSelection();
            LinkButton1.Text = "Add more";
            lblMsg.Text = "";


            //Page.ClientScript.RegisterStartupScript(this.GetType(), "StopRefresh", "window.stop();", true);
        }

        //Add Inventor data to GridView
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (LinkButton2.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID2"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                GridViewRow row = Gridview2.Rows[rowIndex];

                // Update the data in the ViewState
                ViewState["InvFName"] = txt_FirstName.Text.ToString();
                ViewState["InvLName"] = txt_LastName.Text.ToString();
                ViewState["InvAddress"] = txt_InvAddress.Text.ToString();
                ViewState["InvDesignation"] = txt_Invdesignation.Text.ToString();
                ViewState["InvNationality"] = txt_InvNationality.Text.ToString();
                ViewState["InvPhone"] = txt_InvPhoneNo.Text.ToString();
                ViewState["InvEmail"] = txt_InvEmailId.Text.ToString();

                // Update the data in the selected row
                row.Cells[1].Text = ViewState["InvFName"].ToString();
                row.Cells[2].Text = ViewState["InvLName"].ToString();
                row.Cells[3].Text = ViewState["InvNationality"].ToString();
                row.Cells[4].Text = ViewState["InvAddress"].ToString();
                row.Cells[5].Text = ViewState["InvDesignation"].ToString();
                row.Cells[6].Text = ViewState["InvPhone"].ToString();
                row.Cells[7].Text = ViewState["InvEmail"].ToString();
            }
            else
            {
                int rowNo = Convert.ToInt32(Gridview2.Rows.Count) + 1;

                DataTable dt = (DataTable)ViewState["Patent_Inventors"];
                dt.Rows.Add(rowNo, txt_FirstName.Text.Trim(), txt_LastName.Text.Trim(), txt_InvNationality.Text.Trim(), txt_InvAddress.Text.Trim(),
                    txt_Invdesignation.Text.Trim(), txt_InvPhoneNo.Text.Trim(), txt_InvEmailId.Text.Trim());
                ViewState["Patent_Inventors"] = dt;
                this.BindGrid1();

                
            }

            // Clear the textboxes
            txt_FirstName.Text = string.Empty;
            txt_LastName.Text = string.Empty;
            txt_InvAddress.Text = string.Empty;
            txt_InvNationality.Text = string.Empty;
            txt_Invdesignation.Text = string.Empty;
            txt_InvPhoneNo.Text = string.Empty;
            txt_InvEmailId.Text = string.Empty;
            LinkButton2.Text = "Add more";
            lblMsg.Text = "";
        }

        //Add Grant data to GridView
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (LinkButton3.Text == "Update")
            {
                int rowIndex = Convert.ToInt32(ViewState["SelectedRowID3"]);
                // Get the selected row from the GridView
                //GridViewRow selectedRow = Gridview1.SelectedRow;

                GridViewRow row = Gridview3.Rows[rowIndex];

                // Update the data in the ViewState
                ViewState["GrStartDate"] = txt_StartDate.Text.ToString();
                ViewState["GrEndDate"] = txt_EndDate.Text.ToString();
                ViewState["GrCollab"] = txt_Collaborator.Text.ToString();
                ViewState["GrAffil"] = txt_Affilliation.Text.ToString();
                ViewState["GrContr"] = txt_Contribution.Text.ToString();

                // Update the data in the selected row
                row.Cells[1].Text = (ViewState["GrStartDate"]).ToString().Trim() == "" ? "" : (Convert.ToDateTime(ViewState["GrStartDate"]).ToString("dd-MM-yyyy"));
                row.Cells[2].Text = (ViewState["GrEndDate"]).ToString().Trim() == "" ? "" : (Convert.ToDateTime(ViewState["GrEndDate"]).ToString("dd-MM-yyyy"));
                row.Cells[3].Text = ViewState["GrCollab"].ToString();
                row.Cells[4].Text = ViewState["GrAffil"].ToString();
                row.Cells[5].Text = ViewState["GrContr"].ToString();

            }
            else
            {
                int rowNo = Convert.ToInt32(Gridview3.Rows.Count) + 1;

                DataTable dt = (DataTable)ViewState["Patent_GrantExCollab"];

                string datet = txt_StartDate.Text;

                dt.Rows.Add(rowNo, txt_StartDate.Text.Trim() == "" ? null : (Convert.ToDateTime(txt_StartDate.Text.Trim()).ToString("dd-MM-yyyy")),
                    txt_EndDate.Text.Trim() == "" ? null : (Convert.ToDateTime(txt_EndDate.Text.Trim()).ToString("dd-MM-yyyy")),
                    txt_Collaborator.Text.Trim(), txt_Affilliation.Text.Trim(), txt_Contribution.Text.Trim());
                ViewState["Patent_GrantExCollab"] = dt;
                this.BindGrid2();
                
            }

            // Clear the textboxes
            txt_StartDate.Text = string.Empty;
            txt_EndDate.Text = string.Empty;
            txt_Collaborator.Text = string.Empty;
            txt_Affilliation.Text = string.Empty;
            txt_Contribution.Text = string.Empty;
            LinkButton3.Text = "Add more";
            lblMsg.Text = "";
        }

        // Checks Ref. No in Record
        public Boolean checkRecord()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Ref_No from tbl_Patent WHERE Ref_No = '" + txt_RefNo.Text.ToString() + "' ", con);                

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

        //Save data to Patent(Main) Table 
        protected void Buttonsubmit_Click(object sender, EventArgs e)
        {
            Boolean strRefNo = checkRecord();

            if (hdn.Value == "save")
            {
                if (strRefNo == true)
                {

                    SqlCommand cmd = new SqlCommand("sp_Patent_insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Ref_No", txt_RefNo.Text);
                    cmd.Parameters.AddWithValue("@Title", txt_Title.Text);
                    cmd.Parameters.AddWithValue("@Com_Title", txt_ComTitle.Text);

                    cmd.Parameters.AddWithValue("@Com_Name", txt_ComName.Text);
                    cmd.Parameters.AddWithValue("@Com_Designation", txt_ComDesignation.Text);
                    cmd.Parameters.AddWithValue("@Com_PhoneNo", txt_ComPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@Com_EmailId", txt_ComEmail.Text);
                    cmd.Parameters.AddWithValue("@Com_Category", ddl_Category.SelectedItem.Text);
                    //cmd.Parameters.AddWithValue("@Forth_Disclosure", ddlForDisclosure.SelectedItem.Text);

                    if (!rblFcDisclosures.Items.Cast<ListItem>().Any(i => i.Selected))
                    {
                        cmd.Parameters.AddWithValue("@Forth_Disclosure", DBNull.Value);

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Forth_Disclosure", rblFcDisclosures.SelectedItem.Text);
                    }
                    cmd.Parameters.AddWithValue("@FcDiscDetails", txt_FcDisclosures.Text);
                    //cmd.Parameters.AddWithValue("@Past_Disclosure", chkyes.Checked);
                    //bool isChecked = false;
                    //foreach (ListItem item in rblDisclosure.Items)
                    //{
                    //    if (item.Selected)
                    //    {
                    //        cmd.Parameters.AddWithValue("@Past_Disclosure", rblDisclosure.SelectedItem.Text);

                    //    }
                    //}
                    //if (!isChecked)
                    //{
                    //    cmd.Parameters.AddWithValue("@Past_Disclosure", null);

                    //}
                    if (!rblDisclosure.Items.Cast<ListItem>().Any(i => i.Selected))
                    {
                        cmd.Parameters.AddWithValue("@Past_Disclosure", DBNull.Value);

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Past_Disclosure", rblDisclosure.SelectedItem.Text);
                    }
                    cmd.Parameters.AddWithValue("@PastDiscDetails", txt_PastDisclosure.Text);

                    //cmd.Parameters.AddWithValue("@Grantchk", Checkyes.Checked);
                    if (!rblGrant.Items.Cast<ListItem>().Any(i => i.Selected))
                    {
                        cmd.Parameters.AddWithValue("@Grantchk", DBNull.Value);

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Grantchk", rblGrant.SelectedItem.Text);
                    }


                    cmd.Parameters.AddWithValue("@Grant_RefNo", txt_GrantRefNo.Text);
                    cmd.Parameters.AddWithValue("@Grant_Title", txt_GrantTitle.Text);
                    cmd.Parameters.AddWithValue("@Grant_Sponsor", txt_GrantSponsor.Text);
                    cmd.Parameters.AddWithValue("@Grant_Collaborator", txt_GrantCollaborator.Text);

                    //cmd.Parameters.AddWithValue("@Grant_StartDate", txt_GrantStartDate.Text);
                    if ((txt_GrantStartDate.Text == null) || (txt_GrantStartDate.Text == ""))
                    {
                        cmd.Parameters.AddWithValue("@Grant_StartDate", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Grant_StartDate", txt_GrantStartDate.Text);
                    }

                    //cmd.Parameters.AddWithValue("@Grant_EndDate", txt_GrantEndDate.Text);
                    if ((txt_GrantEndDate.Text == null) || (txt_GrantEndDate.Text == ""))
                    {
                        cmd.Parameters.AddWithValue("@Grant_EndDate", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Grant_EndDate", txt_GrantEndDate.Text);
                    }
                    cmd.Parameters.AddWithValue("@Grant_IpOwnership", txt_GrantIPOwnershipclauses.Text);

                    cmd.Parameters.AddWithValue("@Abstract", txt_Abstract.Text);
                    cmd.Parameters.AddWithValue("@Dir_Indirect_App", txt_InvApplication.Text);
                    cmd.Parameters.AddWithValue("@Problem", txt_Problem.Text);
                    cmd.Parameters.AddWithValue("@Solution", txt_Solution.Text);
                    cmd.Parameters.AddWithValue("@Invention_LiteratureReview", txt_LiteratureReview.Text);
                    cmd.Parameters.AddWithValue("@Invention_NovelFeatures", txt_InvNovelFeatures.Text);
                    cmd.Parameters.AddWithValue("@Invention_Advantages", txt_InvAdvantages.Text);
                    cmd.Parameters.AddWithValue("@Invention_Category", ddl_InvCategory.Text);
                    //if (!FileUpload1.HasFile)
                    //{
                    //    Label1.Visible = true;
                    //    Label1.Text = "Please Select Image File";    //checking if file uploader has no file selected
                    //}
                    //else
                    //{
                    //int length = FileUpload1.PostedFile.ContentLength;
                    //byte[] pic = new byte[length];
                    //FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                    //string str1 = FileUpload1.FileName;
                    //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str1));
                    //string Image = "~/Upload/" + str1.ToString();
                    //cmd.Parameters.AddWithValue("@Invention_Experiment", pic);
                    //}

                    if (FileUpload1.HasFile)
                    {
                        string filename1 = Path.GetFileName(FileUpload1.FileName);
                        string rename1 = txt_RefNo.Text.ToString() + "_exp_" + filename1;

                        string folderPath1 = Server.MapPath("~/Uploads/");

                        //Check whether Directory (Folder) exists.
                        if (!Directory.Exists(folderPath1))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(folderPath1);
                        }

                        //Save the File to the Directory (Folder).
                        //FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                        FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + rename1));
                        cmd.Parameters.AddWithValue("@Invention_Experiment", "Uploads/" + rename1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Invention_Experiment", "Uploads/" + "");
                    }


                    //cmd.Parameters.AddWithValue("@Biological_Resource", checkyesresource.Checked);
                    if (!rblResource.Items.Cast<ListItem>().Any(i => i.Selected))
                    {
                        cmd.Parameters.AddWithValue("@Biological_Resource", DBNull.Value);

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Biological_Resource", rblResource.SelectedItem.Text);
                    }
                    //cmd.Parameters.AddWithValue("@Biological_Resource", rblResource.SelectedItem.Text);

                    cmd.Parameters.AddWithValue("@Modeof_Procurement", ddl_Mode.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Nameof_Vendor", txt_NameofVendor.Text);
                    cmd.Parameters.AddWithValue("@Addressof_Vendor", txt_AddressofVendor.Text);
                    //if (!FileUpload2.HasFile)
                    //{
                    //    Label1.Visible = true;
                    //    Label1.Text = "Please Select Image File";    //checking if file uploader has no file selected
                    //}
                    //else
                    //{
                    //int length = FileUpload2.PostedFile.ContentLength;
                    //byte[] pic = new byte[length];
                    //FileUpload2.PostedFile.InputStream.Read(pic, 0, length);
                    //string str1 = FileUpload2.FileName;
                    //FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str1));
                    //string Image = "~/Upload/" + str1.ToString();
                    //cmd.Parameters.AddWithValue("@Bill_Recipients", pic);
                    //}

                    if (FileUpload2.HasFile)
                    {
                        string filename2 = Path.GetFileName(FileUpload2.FileName);
                        string rename2 = txt_RefNo.Text.ToString() + "_bill_" + filename2;

                        string folderPath2 = Server.MapPath("~/Uploads/");

                        //Check whether Directory (Folder) exists.
                        if (!Directory.Exists(folderPath2))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(folderPath2);
                        }

                        //Save the File to the Directory (Folder).
                        //FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                        FileUpload2.SaveAs(Server.MapPath("~/Uploads/" + rename2));
                        cmd.Parameters.AddWithValue("@Bill_Recipients", "Uploads/" + rename2);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Bill_Recipients", "Uploads/" + "");
                    }

                    if ((txt_DateofDeposition.Text == null) || (txt_DateofDeposition.Text == ""))
                    {
                        cmd.Parameters.AddWithValue("@Dateof_Deposition", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Dateof_Deposition", txt_DateofDeposition.Text);
                    }
                    //cmd.Parameters.AddWithValue("@Dateof_Deposit", txt_DateofDeposition.Text);
                    cmd.Parameters.AddWithValue("@Accession_Number", txtAccessionNumber.Text);
                    cmd.Parameters.AddWithValue("@Nameof_Deposition", txt_NameofDepository.Text);
                    cmd.Parameters.AddWithValue("@Addressof_Deposition", txt_AddressofDepository.Text);
                    //com = new SqlCommand("Insert into Patent (Ref_No,Title,Abstract,Date,AccessionNumber) values ('" + txt_RefNo.Text.ToString() + "','" + 
                    //txt_Title.Text.ToString() + "','" + txt_Abstract.Text.ToString() + "','" + txt_DateofDeposition.Text.ToString() + "','" + txtAccessionNumber.Text.ToString() + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    saveApplicant();
                    saveInventor();
                    saveGrantDetails();

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
                DataTable dt = ViewState["Patent_Applicants"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Patent_Applicants"] = dt;

                // Re-bind the GridView to the data source
                BindGrid();
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
                txtApp_Name.Text = row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[1].Text.ToString();
                txtApp_Nationality.Text = row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[2].Text.ToString();
                //txtApp_Address.Text = row.Cells[3].Text.ToString();
                txtApp_Address.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();


                ddl_AppCategory.ClearSelection();
                ddl_AppCategory.Items.FindByText(row.Cells[4].Text.ToString().Trim().Replace("&nbsp;", " ") == "" ? "--Select--" :
                    row.Cells[4].Text.ToString()).Selected = true;

                LinkButton1.Text = "Update";
            }

            //if (e.CommandName == "cmd_edit")
            //{
            //    int rowIndex = Convert.ToInt32(e.CommandArgument);
            //    Gridview1.EditIndex = rowIndex;
            //    BindGrid();
            //}
            //else if (e.CommandName == "cmd_delete")
            //{
            //    int rowIndex = Convert.ToInt32(e.CommandArgument);
            //    DataTable dt = (DataTable)ViewState["Patent_Applicants"];
            //    dt.Rows.RemoveAt(rowIndex);
            //    ViewState["Patent_Applicants"] = dt;
            //    BindGrid();
            //}

            //if (e.CommandName == "cmd_edit")
            //{
            //    int index = Convert.ToInt32(e.CommandArgument);

            //    if (ViewState["Patent_Applicants"] != null)
            //    {
            //        DataTable dt = (DataTable)ViewState["Patent_Applicants"];
            //        DataRow row = dt.Rows[index];

            //        Gridview1.EditIndex = index;
            //        BindGrid();
            //    }
            //}

            //if (e.CommandName == "cmd_delete")
            //{
            //    int index = e.RowIndex;

            //    if (ViewState["GridViewData"] != null)
            //    {
            //        DataTable dt = (DataTable)ViewState["GridViewData"];
            //        dt.Rows.RemoveAt(index);

            //        // Save the updated data back to ViewState:
            //        ViewState["GridViewData"] = dt;

            //        // Refresh the GridView:
            //        BindGridView();
            //    }
            //}
        }

        protected void Gridview2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                // Get the index of the row to delete
                //int rowIndex = Convert.ToInt32(ViewState["SelectedRow"]);
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the data source from ViewState
                DataTable dt = ViewState["Patent_Inventors"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Patent_Inventors"] = dt;

                // Re-bind the GridView to the data source
                BindGrid1();
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
                txt_FirstName.Text = row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[1].Text.ToString();
                txt_LastName.Text = row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[2].Text.ToString();
                txt_InvNationality.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();
                txt_InvAddress.Text = row.Cells[4].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[4].Text.ToString();
                txt_Invdesignation.Text = row.Cells[5].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[5].Text.ToString();
                txt_InvPhoneNo.Text = row.Cells[6].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[6].Text.ToString();
                txt_InvEmailId.Text = row.Cells[7].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[7].Text.ToString();

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
                DataTable dt = ViewState["Patent_GrantExCollab"] as DataTable;

                // Remove the row from the data source
                dt.Rows.RemoveAt(rowIndex);

                // Update the ViewState with the modified data source
                ViewState["Patent_GrantExCollab"] = dt;

                // Re-bind the GridView to the data source
                BindGrid2();
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
                txt_StartDate.Text = row.Cells[1].Text.ToString().Trim().Replace("&nbsp;", "") == "" ? "" : (Convert.ToDateTime(row.Cells[1].Text).ToString("yyyy-MM-dd"));
                txt_EndDate.Text = row.Cells[2].Text.ToString().Trim().Replace("&nbsp;", "") == "" ? "" : (Convert.ToDateTime(row.Cells[2].Text).ToString("yyyy-MM-dd"));
                txt_Collaborator.Text = row.Cells[3].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[3].Text.ToString();
                txt_Affilliation.Text = row.Cells[4].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[4].Text.ToString();
                txt_Contribution.Text = row.Cells[5].Text.ToString().Trim().Replace("&nbsp;", " ") == " " ? "" : row.Cells[5].Text.ToString();

                LinkButton3.Text = "Update";
            }
        }

        protected void rblGrant_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblGrant.SelectedValue.ToString()=="Yes")
            {
                pnlGrant.Visible = true;
            }
            else
            {
                pnlGrant.Visible = false;
                txt_GrantRefNo.Text = ""; txt_GrantTitle.Text = "";
                txt_GrantSponsor.Text = ""; txt_GrantCollaborator.Text = ""; txt_GrantStartDate.Text = "";
                txt_GrantEndDate.Text = ""; txt_GrantIPOwnershipclauses.Text = "";

            }
        }

        protected void rblFcDisclosures_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblFcDisclosures.SelectedValue.ToString() == "Yes")
            {
                pnlFcDis.Visible = true;
            }
            else
            {
                pnlFcDis.Visible = false;
                txt_FcDisclosures.Text = "";
            }
        }

        protected void rblDisclosure_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblDisclosure.SelectedValue.ToString() == "Yes")
            {
                pnlPtDis.Visible = true;
            }
            else
            {
                pnlPtDis.Visible = false;
                txt_PastDisclosure.Text = "";
            }
        }



        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    AddNewRowToGrid1();
        //}
        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    AddNewRowToGrid2();
        //}

        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    AddNewRowToGrid3();
        //}

        //private void SetInitialRow1()

        //{

        //    DataTable dt1 = new DataTable();

        //    DataRow dr1 = null;

        //    dt1.Columns.Add(new DataColumn("RowNumber", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("Name", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("Address", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("Nationality", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("Category", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("Designation", typeof(string)));

        //    dt1.Columns.Add(new DataColumn("PhoneNo", typeof(string)));

        //    dr1 = dt1.NewRow();

        //    dr1["RowNumber"] = 1;

        //    dr1["Name"] = string.Empty;

        //    dr1["Address"] = string.Empty;

        //    dr1["Nationality"] = string.Empty;

        //    dr1["Category"] = string.Empty;

        //    dt1.Rows.Add(dr1);

        //    //dr = dt.NewRow();


        //    //Store the DataTable in ViewState

        //    ViewState["CurrentTable1"] = dt1;

        //    Gridview1.DataSource = dt1;

        //    Gridview1.DataBind();

        //}
        //private void AddNewRowToGrid1()

        //{

        //    int rowIndex = 0;


        //    if (ViewState["CurrentTable1"] != null)

        //    {

        //        DataTable dtCurrentTable1 = (DataTable)ViewState["CurrentTable1"];

        //        DataRow drCurrentRow1 = null;

        //        if (dtCurrentTable1.Rows.Count > 0)

        //        {

        //            for (int i = 1; i <= dtCurrentTable1.Rows.Count; i++)

        //            {

        //                //extract the TextBox values

        //                TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[0].FindControl("txt_Name");

        //                TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("txt_Address");

        //                TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("txt_Nationality");

        //                DropDownList list1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[3].FindControl("ddl_Category");


        //                drCurrentRow1 = dtCurrentTable1.NewRow();

        //                drCurrentRow1["RowNumber"] = i + 1;



        //                dtCurrentTable1.Rows[i - 1]["Name"] = box1.Text;

        //                dtCurrentTable1.Rows[i - 1]["Address"] = box2.Text;

        //                dtCurrentTable1.Rows[i - 1]["Nationality"] = box3.Text;

        //                dtCurrentTable1.Rows[i - 1]["Category"] = list1.Text;

        //                rowIndex++;

        //            }

        //            dtCurrentTable1.Rows.Add(drCurrentRow1);

        //            ViewState["CurrentTable1"] = dtCurrentTable1;

        //            Gridview1.DataSource = dtCurrentTable1;

        //            Gridview1.DataBind();

        //        }

        //    }

        //    else

        //    {

        //        Response.Write("ViewState is null");

        //    }



        //    //Set Previous Data on Postbacks

        //    SetPreviousData1();

        //}
        //private void SetPreviousData1()

        //{

        //    int rowIndex = 0;

        //    if (ViewState["CurrentTable1"] != null)

        //    {

        //        DataTable dt1 = (DataTable)ViewState["CurrentTable1"];

        //        if (dt1.Rows.Count > 0)

        //        {

        //            for (int i = 0; i < dt1.Rows.Count; i++)

        //            {

        //                TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("txt_Name");

        //                TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("txt_Address");

        //                TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("txt_Nationality");

        //                DropDownList list1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[4].FindControl("ddl_Category");

        //                box1.Text = dt1.Rows[i]["Name"].ToString();

        //                box2.Text = dt1.Rows[i]["Address"].ToString();

        //                box3.Text = dt1.Rows[i]["Nationality"].ToString();

        //                list1.Text = dt1.Rows[i]["Category"].ToString();

        //                rowIndex++;

        //            }

        //        }

        //    }
        //}
        //private void SetInitialRow2()

        //{

        //    DataTable dt2 = new DataTable();

        //    DataRow dr2 = null;

        //    dt2.Columns.Add(new DataColumn("RowNumber", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("FirstName", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("LastName", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("Nationality", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("Address", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("Designation", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("PhoneNo", typeof(string)));

        //    dt2.Columns.Add(new DataColumn("EmailId", typeof(string)));

        //    dr2 = dt2.NewRow();

        //    dr2["RowNumber"] = 1;

        //    dr2["FirstName"] = string.Empty;

        //    dr2["LastName"] = string.Empty;

        //    dr2["Nationality"] = string.Empty;

        //    dr2["Address"] = string.Empty;

        //    dr2["Designation"] = string.Empty;

        //    dr2["PhoneNo"] = string.Empty;

        //    dr2["EmailId"] = string.Empty;

        //    dt2.Rows.Add(dr2);

        //    //dr = dt.NewRow();


        //    //Store the DataTable in ViewState

        //    ViewState["CurrentTable2"] = dt2;

        //    Gridview2.DataSource = dt2;

        //    Gridview2.DataBind();

        //}
        //private void AddNewRowToGrid2()

        //{

        //    int rowIndex = 0;


        //    if (ViewState["CurrentTable2"] != null)

        //    {

        //        DataTable dtCurrentTable2 = (DataTable)ViewState["CurrentTable2"];

        //        DataRow drCurrentRow2 = null;

        //        if (dtCurrentTable2.Rows.Count > 0)

        //        {

        //            for (int i = 1; i <= dtCurrentTable2.Rows.Count; i++)

        //            {

        //                //extract the TextBox values

        //                TextBox box1 = (TextBox)Gridview2.Rows[rowIndex].Cells[1].FindControl("txt_FirstName");

        //                TextBox box2 = (TextBox)Gridview2.Rows[rowIndex].Cells[0].FindControl("txt_LastName");

        //                TextBox box3 = (TextBox)Gridview2.Rows[rowIndex].Cells[2].FindControl("txt_Nationality");

        //                TextBox box4 = (TextBox)Gridview2.Rows[rowIndex].Cells[3].FindControl("txt_Address");

        //                TextBox box5 = (TextBox)Gridview2.Rows[rowIndex].Cells[4].FindControl("txt_Designation");

        //                TextBox box6 = (TextBox)Gridview2.Rows[rowIndex].Cells[5].FindControl("txt_PhoneNumber");

        //                TextBox box7 = (TextBox)Gridview2.Rows[rowIndex].Cells[6].FindControl("txt_EmailId");


        //                drCurrentRow2 = dtCurrentTable2.NewRow();

        //                drCurrentRow2["RowNumber"] = i + 1;


        //                dtCurrentTable2.Rows[i - 1]["FirstName"] = box1.Text;

        //                dtCurrentTable2.Rows[i - 1]["LastName"] = box2.Text;

        //                dtCurrentTable2.Rows[i - 1]["Nationality"] = box3.Text;

        //                dtCurrentTable2.Rows[i - 1]["Address"] = box4.Text;

        //                dtCurrentTable2.Rows[i - 1]["Designation"] = box5.Text;

        //                dtCurrentTable2.Rows[i - 1]["PhoneNo"] = box6.Text;

        //                dtCurrentTable2.Rows[i - 1]["EmailId"] = box7.Text;

        //                rowIndex++;

        //            }

        //            dtCurrentTable2.Rows.Add(drCurrentRow2);

        //            ViewState["CurrentTable2"] = dtCurrentTable2;

        //            Gridview2.DataSource = dtCurrentTable2;

        //            Gridview2.DataBind();

        //        }

        //    }

        //    else

        //    {

        //        Response.Write("ViewState is null");

        //    }



        //    //Set Previous Data on Postbacks

        //    SetPreviousData2();

        //}
        //private void SetPreviousData2()

        //{

        //    int rowIndex = 0;

        //    if (ViewState["CurrentTable2"] != null)

        //    {

        //        DataTable dt2 = (DataTable)ViewState["CurrentTable2"];

        //        if (dt2.Rows.Count > 0)

        //        {

        //            for (int i = 0; i < dt2.Rows.Count; i++)

        //            {
        //                TextBox box1 = (TextBox)Gridview2.Rows[rowIndex].Cells[1].FindControl("txt_FirstName");

        //                TextBox box2 = (TextBox)Gridview2.Rows[rowIndex].Cells[2].FindControl("txt_LastName");

        //                TextBox box3 = (TextBox)Gridview2.Rows[rowIndex].Cells[3].FindControl("txt_Nationality");

        //                TextBox box4 = (TextBox)Gridview2.Rows[rowIndex].Cells[4].FindControl("txt_Address");

        //                TextBox box5 = (TextBox)Gridview2.Rows[rowIndex].Cells[5].FindControl("txt_Designation");

        //                TextBox box6 = (TextBox)Gridview2.Rows[rowIndex].Cells[6].FindControl("txt_PhoneNumber");

        //                TextBox box7 = (TextBox)Gridview2.Rows[rowIndex].Cells[7].FindControl("txt_EmailId");


        //                box1.Text = dt2.Rows[i]["FirstName"].ToString();

        //                box2.Text = dt2.Rows[i]["LastName"].ToString();

        //                box3.Text = dt2.Rows[i]["Nationality"].ToString();

        //                box4.Text = dt2.Rows[i]["Address"].ToString();

        //                box5.Text = dt2.Rows[i]["Designation"].ToString();

        //                box6.Text = dt2.Rows[i]["PhoneNo"].ToString();

        //                box7.Text = dt2.Rows[i]["EmailId"].ToString();

        //                rowIndex++;

        //            }

        //        }

        //    }
        //}
        //private void SetInitialRow3()

        //{

        //    DataTable dt3 = new DataTable();

        //    DataRow dr3 = null;

        //    dt3.Columns.Add(new DataColumn("RowNumber", typeof(string)));

        //    dt3.Columns.Add(new DataColumn("StartDate", typeof(string)));

        //    dt3.Columns.Add(new DataColumn("EndDate", typeof(string)));

        //    dt3.Columns.Add(new DataColumn("Collaborator", typeof(string)));

        //    dt3.Columns.Add(new DataColumn("Affilliation", typeof(string)));

        //    dt3.Columns.Add(new DataColumn("Contribution", typeof(string)));


        //    dr3 = dt3.NewRow();

        //    dr3["RowNumber"] = 1;

        //    dr3["StartDate"] = string.Empty;

        //    dr3["EndDate"] = string.Empty;

        //    dr3["Collaborator"] = string.Empty;

        //    dr3["Affilliation"] = string.Empty;

        //    dr3["Contribution"] = string.Empty;

        //    dt3.Rows.Add(dr3);

        //    //dr = dt.NewRow();


        //    //Store the DataTable in ViewState

        //    ViewState["CurrentTable3"] = dt3;

        //    Gridview3.DataSource = dt3;

        //    Gridview3.DataBind();

        //}
        //private void AddNewRowToGrid3()

        //{

        //    int rowIndex = 0;


        //    if (ViewState["CurrentTable3"] != null)

        //    {

        //        DataTable dtCurrentTable3 = (DataTable)ViewState["CurrentTable3"];

        //        DataRow drCurrentRow3 = null;

        //        if (dtCurrentTable3.Rows.Count > 0)

        //        {

        //            for (int i = 1; i <= dtCurrentTable3.Rows.Count; i++)

        //            {

        //                //extract the TextBox values

        //                TextBox box1 = (TextBox)Gridview3.Rows[rowIndex].Cells[0].FindControl("txt_StartDate");

        //                TextBox box2 = (TextBox)Gridview3.Rows[rowIndex].Cells[1].FindControl("txt_EndDate");

        //                TextBox box3 = (TextBox)Gridview3.Rows[rowIndex].Cells[2].FindControl("txt_Collaborator");

        //                TextBox box4 = (TextBox)Gridview3.Rows[rowIndex].Cells[3].FindControl("txt_Affilliation");

        //                TextBox box5 = (TextBox)Gridview3.Rows[rowIndex].Cells[4].FindControl("txt_Contribution");

        //                drCurrentRow3 = dtCurrentTable3.NewRow();

        //                drCurrentRow3["RowNumber"] = i + 1;



        //                dtCurrentTable3.Rows[i - 1]["StartDate"] = box1.Text;

        //                dtCurrentTable3.Rows[i - 1]["EndDate"] = box2.Text;

        //                dtCurrentTable3.Rows[i - 1]["Collaborator"] = box3.Text;

        //                dtCurrentTable3.Rows[i - 1]["Affilliation"] = box4.Text;

        //                dtCurrentTable3.Rows[i - 1]["Contribution"] = box5.Text;


        //                rowIndex++;

        //            }

        //            dtCurrentTable3.Rows.Add(drCurrentRow3);

        //            ViewState["CurrentTable3"] = dtCurrentTable3;

        //            Gridview3.DataSource = dtCurrentTable3;

        //            Gridview3.DataBind();

        //        }

        //    }

        //    else

        //    {

        //        Response.Write("ViewState is null");

        //    }



        //    //Set Previous Data on Postbacks

        //    SetPreviousData3();

        //}
        //private void SetPreviousData3()

        //{

        //    int rowIndex = 0;

        //    if (ViewState["CurrentTable3"] != null)

        //    {

        //        DataTable dt3 = (DataTable)ViewState["CurrentTable3"];

        //        if (dt3.Rows.Count > 0)

        //        {

        //            for (int i = 0; i < dt3.Rows.Count; i++)

        //            {

        //                TextBox box1 = (TextBox)Gridview3.Rows[rowIndex].Cells[1].FindControl("txt_StartDate");

        //                TextBox box2 = (TextBox)Gridview3.Rows[rowIndex].Cells[2].FindControl("txt_EndDate");

        //                TextBox box3 = (TextBox)Gridview3.Rows[rowIndex].Cells[3].FindControl("txt_Collaborator");

        //                TextBox box4 = (TextBox)Gridview3.Rows[rowIndex].Cells[4].FindControl("txt_Affilliation");

        //                TextBox box5 = (TextBox)Gridview3.Rows[rowIndex].Cells[5].FindControl("txt_Contribution");


        //                box1.Text = dt3.Rows[i]["StartDate"].ToString();

        //                box2.Text = dt3.Rows[i]["EndDate"].ToString();

        //                box3.Text = dt3.Rows[i]["Collaborator"].ToString();

        //                box4.Text = dt3.Rows[i]["Affilliation"].ToString();

        //                box5.Text = dt3.Rows[i]["Contribution"].ToString();

        //                rowIndex++;

        //            }

        //        }

        //    }


        //}
        //protected void Buttonsave1_Click(object sender, EventArgs e)
        //{

        //}
        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    Panel1.Visible = true;
        //}
        //protected void LinkButton2_Click(object sender, EventArgs e)
        //{
        //    Panel2.Visible = true;
        //}
        //protected void LinkButton3_Click(object sender, EventArgs e)
        //{
        //    Panel3.Visible = true;
        //}
    }


}