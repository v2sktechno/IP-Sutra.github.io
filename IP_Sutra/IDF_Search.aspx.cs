using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;
using System.IO;

namespace IP_Sutra
{
    public partial class IDF_Search : System.Web.UI.Page
    {
        SqlConnection conmesp = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadioButtonList1.SelectedIndex = 0;

                checkRadioButton();

            }

        }


        public void clearCopyright()
        {
            txtcr1.Text = "";
            txtcr2.Text = "";
            txtcr3.Text = "";
            txtcr4.Text = "";   
            
        }
        public void clearDesign()
        {
            txtdesign1.Text = "";
            txtdesign2.Text = "";
            txtdesign3.Text = "";
        }
        public void clearPatent()
        {
            txtpatent1.Text = "";
            txtpatent2.Text = "";
            txtpatent3.Text = "";
            txtpatent4.Text = "";
            txtpatent5.Text = "";
            txtpatent6.Text = "";
        }
        public void clearTrademark()
        {
            txttrdmsrk1.Text = "";
            txttrdmsrk2.Text = "";
            txttrdmsrk3.Text = "";
            txttrdmsrk4.Text = "";
            
        }

        //Show Copyright fields in Dropdown List
        public void bindCopyright()
        { 
            // Declare an array of options
            string[] options = { "Date of Publication", "Reference No", "Title" };

            // Declare an array of option values
            string[] optionValues = { "Dateof_Publication", "Ref_No", "Title" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddlcopyrith1.DataSource = items;
            ddlcopyrith1.DataTextField = "Text";
            ddlcopyrith1.DataValueField = "Value";
            ddlcopyrith1.DataBind();
            ddlcopyrith1.SelectedIndex = 2; // Set the selected item to "Title"

            // Set the items and selected value for the second dropdown list
            ddlcopyrith2.DataSource = items;
            ddlcopyrith2.DataTextField = "Text";
            ddlcopyrith2.DataValueField = "Value";
            ddlcopyrith2.DataBind();
            ddlcopyrith2.SelectedIndex = 1; // Set the selected item to "Ref. No"

            // Set the items and selected value for the third dropdown list
            ddlcopyrith3.DataSource = items;
            ddlcopyrith3.DataTextField = "Text";
            ddlcopyrith3.DataValueField = "Value";
            ddlcopyrith3.DataBind();
            ddlcopyrith3.SelectedIndex = 0; // Set the selected item to "Date of Publication"

        }

        //Show Tradmark fields in Dropdown List
        public void bindTradmark()
        {
            ddltradmark1.Items.Clear();ddltradmark2.Items.Clear();
            ddltradmark3.Items.Clear();ddltradmark4.Items.Clear();

            //// Declare an array of options
            //string[] options = { "Applicant Name", "Contributor Name", "Title", "Type of Tradmark" };

            //// Declare an array of option values
            //string[] optionValues = { "App_Name", "Com_Name", "Title", "Type_of_tradmark" };

            //// Create a new array of ListItem objects
            //ListItem[] items = new ListItem[options.Length];

            //// Loop through the options and add them to the array
            //for (int i = 0; i < options.Length; i++)
            //{
            //    items[i] = new ListItem(options[i], optionValues[i]);
            //}

            //// Add the items to the dropdown list
            //ddltradmark1.Items.AddRange(items);
            //ddltradmark2.Items.AddRange(items);
            //ddltradmark3.Items.AddRange(items);
            //ddltradmark4.Items.AddRange(items);

            //Create an array of objects with the text and value properties
            var items = new[] {
                    new { Text = "Applicant Name", Value = "App_Name" },
                    new { Text = "Contributor Name", Value = "Com_Name" },
                    new { Text = "Title", Value = "Title" },
                    new { Text = "Type of Tradmark", Value = "Type_of_tradmark" },
                    new { Text = "Reference Number", Value = "Ref_No" },
               };

            // Loop through the array and add each item to the dropdownlist
            foreach (var item in items)
            {
                ddltradmark1.Items.Add(new ListItem(item.Text, item.Value));
                ddltradmark2.Items.Add(new ListItem(item.Text, item.Value));
                ddltradmark3.Items.Add(new ListItem(item.Text, item.Value));
                ddltradmark4.Items.Add(new ListItem(item.Text, item.Value));
                ddltradmark5.Items.Add(new ListItem(item.Text, item.Value));
            }
           
            ddltradmark4.Items.FindByText("Applicant Name").Selected = true;
            ddltradmark5.Items.FindByText("Contributor Name").Selected = true;
            ddltradmark1.Items.FindByText("Title").Selected = true;
            ddltradmark2.Items.FindByText("Type of Tradmark").Selected = true;
            ddltradmark3.Items.FindByText("Reference Number").Selected = true;
        }

        //Show Design fields in Dropdown List
        public void bindDesign()
        {
            // Declare an array of options
            string[] options = { "Applicant Name", "Contributor Name", "Title", "Reference No." };

            // Declare an array of option values
            string[] optionValues = { "App_Name", "Con_FirstName", "Title", "Ref_No" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddldesign1.DataSource = items;
            ddldesign1.DataTextField = "Text";
            ddldesign1.DataValueField = "Value";
            ddldesign1.DataBind();
            ddldesign1.SelectedIndex = 2;

            // Set the items and selected value for the second dropdown list
            ddldesign2.DataSource = items;
            ddldesign2.DataTextField = "Text";
            ddldesign2.DataValueField = "Value";
            ddldesign2.DataBind();
            ddldesign2.SelectedIndex = 3; 

            // Set the items and selected value for the third dropdown list
            ddldesign3.DataSource = items;
            ddldesign3.DataTextField = "Text";
            ddldesign3.DataValueField = "Value";
            ddldesign3.DataBind();
            ddldesign3.SelectedIndex = 0;

            // Set the items and selected value for the third dropdown list
            ddldesign4.DataSource = items;
            ddldesign4.DataTextField = "Text";
            ddldesign4.DataValueField = "Value";
            ddldesign4.DataBind();
            ddldesign4.SelectedIndex = 1;

        }

        //Show Patent fields in Dropdown List
        public void bindPatent()
        {
            // Declare an array of options
            string[] options = { "Title", "Inventor Name", "Contributor Name", "Accession Number", "File Creation Date", "Reference No" };

            // Declare an array of option values
            string[] optionValues = { "Title", "Inventor_Name", "Com_Name", "Accession_Number", "File_creation_date", "Ref_No" };

            // Create a new array of ListItem objects
            ListItem[] items = new ListItem[options.Length];

            // Loop through the options and add them to the array
            for (int i = 0; i < options.Length; i++)
            {
                items[i] = new ListItem(options[i], optionValues[i]);
            }

            // Set the items and selected value for the first dropdown list
            ddlpatent1.DataSource = items;
            ddlpatent1.DataTextField = "Text";
            ddlpatent1.DataValueField = "Value";
            ddlpatent1.DataBind();
            ddlpatent1.SelectedIndex = 0;

            // Set the items and selected value for the second dropdown list
            ddlpatent2.DataSource = items;
            ddlpatent2.DataTextField = "Text";
            ddlpatent2.DataValueField = "Value";
            ddlpatent2.DataBind();
            ddlpatent2.SelectedIndex = 5;

            // Set the items and selected value for the third dropdown list
            ddlpatent3.DataSource = items;
            ddlpatent3.DataTextField = "Text";
            ddlpatent3.DataValueField = "Value";
            ddlpatent3.DataBind();
            ddlpatent3.SelectedIndex = 3;

            // Set the items and selected value for the fourth dropdown list
            ddlpatent4.DataSource = items;
            ddlpatent4.DataTextField = "Text";
            ddlpatent4.DataValueField = "Value";
            ddlpatent4.DataBind();
            ddlpatent4.SelectedIndex = 1;

            // Set the items and selected value for the fifth dropdown list
            ddlpatent5.DataSource = items;
            ddlpatent5.DataTextField = "Text";
            ddlpatent5.DataValueField = "Value";
            ddlpatent5.DataBind();
            ddlpatent5.SelectedIndex = 2;

            // Set the items and selected value for the sixth dropdown list
            ddlpatent6.DataSource = items;
            ddlpatent6.DataTextField = "Text";
            ddlpatent6.DataValueField = "Value";
            ddlpatent6.DataBind();
            ddlpatent6.SelectedIndex = 4;

        }

        
        public void checkRadioButton()
        {
            //RadioButtonList1.SelectedIndex = 0;
            switch (RadioButtonList1.SelectedItem.Value)
            {
                case "1":
                    bindCopyright();
                    pnlCopyright.Visible = true;
                    pnlTrademark.Visible = false;
                    pnlDesign.Visible = false;
                    pnlPatent.Visible = false;
                    pnlCRSearch.Visible = false;
                    grd_CRSearch.Visible = false;
                    clearCopyright();

                    break;
                case "2":
                    bindTradmark();
                    pnlCopyright.Visible = false;
                    pnlTrademark.Visible = true;
                    pnlDesign.Visible = false;
                    pnlPatent.Visible = false;
                    pnlTMSearch.Visible = false;
                    grd_TMSearch.Visible = false;
                    clearTrademark();

                    break;
                case "3":
                    bindDesign();
                    pnlCopyright.Visible = false;
                    pnlTrademark.Visible = false;
                    pnlDesign.Visible = true;
                    pnlPatent.Visible = false;
                    pnlDGSearch.Visible = false;
                    grd_DGSearch.Visible = false;
                    clearDesign();

                    break;
                case "4":
                    bindPatent();
                    pnlCopyright.Visible = false;
                    pnlTrademark.Visible = false;
                    pnlDesign.Visible = false;
                    pnlPatent.Visible = true;
                    pnlPTSearch.Visible = false;
                    grd_PTSearch.Visible = false;
                    clearPatent();

                    break;
                default:
                    break;
            }

            lblMsg.Text = "";
            lblMsg.Visible = true;

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (RadioButtonList1.SelectedValue == "1")
            //{
            //    bindCopyright();
            //}
            //else if (RadioButtonList1.SelectedValue == "2")
            //{
            //    bindtradmark();
            //}
            //else if (RadioButtonList1.SelectedValue == "3")
            //{
            //    binddesign();
            //}
            //else if (RadioButtonList1.SelectedValue == "4")
            //{
            //    bindpatent();
            //}
            //else
            //{

            //}
            checkRadioButton();
        }

        protected void btnSearch_copyright_Click(object sender, EventArgs e)
        {
            if (btnSearch_copyright.Text == "Search")
            {

                string q = "";

                //q = "select * from tbl_Copyright where 1=1 ";
                q = "SELECT DISTINCT c.id,c.Ref_No,c.Title, c.Com_Name, c.Language, c.Category, c.Original_Work, c.Dateof_Publication, " +
                    "STUFF((SELECT ', ' + COALESCE(ca.App_Name, '') FROM Copyright_Applicants ca WHERE c.id = ca.CId" +
                    " FOR XML PATH('')), 1, 2, '') AS App_Name_Log FROM tbl_Copyright c INNER JOIN Copyright_Applicants ca ON c.ID = ca.CId WHERE 1 = 1";
                int i = 0;

                if (!string.IsNullOrEmpty(txtcr1.Text.Trim()))
                {
                    q = q + " and " + ddlcopyrith1.SelectedValue.ToString() + " like '%" + txtcr1.Text.Trim() + "%'";
                    i = 1;
                }
                if (!string.IsNullOrEmpty(txtcr2.Text.Trim()))
                {
                    q = q + " and " + ddlcopyrith2.SelectedValue.ToString() + " like '%" + txtcr2.Text.Trim() + "%'";
                    i = 1;
                }
                if (!string.IsNullOrEmpty(txtcr3.Text.Trim()))
                {
                    q = q + " and " + ddlcopyrith3.SelectedValue.ToString() + " between '" + txtcr3.Text.Trim() + "' and '" + txtcr4.Text.Trim() + "'";
                    i = 1;
                }

                if (i == 0)
                {
                    lblMsg.Text = "Kindly enter aleast one search value";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);

                    grd_CRSearch.Visible = false;
                }
                else
                {
                    SqlCommand sqlcmd = new SqlCommand(q, conmesp);
                    conmesp.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SqlDataReader sdr = sqlcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        grd_CRSearch.DataSource = dt;
                        grd_CRSearch.DataBind();
                        grd_CRSearch.Visible = true;
                        pnlCRSearch.Visible = true;
                        //ddlStatus.ClearSelection();
                        //txtref_no.Text = "";


                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    }
                    else
                    {
                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        pnlCRSearch.Visible = false;
                        grd_CRSearch.Visible = false;
                    }
                }


            }


        }

        protected void grd_CRSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int startIndex = grd_CRSearch.PageIndex * grd_CRSearch.PageSize + 1;
                int endIndex = Math.Min((grd_CRSearch.PageIndex + 1) * grd_CRSearch.PageSize, grd_CRSearch.Rows.Count);
                int totalCount = grd_CRSearch.Rows.Count;

                //lblEntries.Text = string.Format("Showing {0} to {1} of {2} entries", startIndex, endIndex, totalCount);

                e.Row.Cells[2].Text = startIndex.ToString() + " to " + endIndex.ToString() + " of " + totalCount.ToString() + " entries";

            }
            
        }

        //public void clearCopyright()
        //{
        //    //ddlcopyrith1.ClearSelection();
        //    //ddlcopyrith2.ClearSelection();
        //    //ddlcopyrith3.ClearSelection();

        //    ddlcopyrith1.Items.Clear();
        //    ddlcopyrith2.Items.Clear();
        //    ddlcopyrith3.Items.Clear();

        //}
        //public void cleartradmark()
        //{
        //    ddltradmark1.ClearSelection();
        //    ddltradmark1.Items.Clear();
        //    ddltradmark2.ClearSelection();
        //    ddltradmark2.Items.Clear();
        //    ddltradmark3.ClearSelection();
        //    ddltradmark3.Items.Clear();
        //    ddltradmark4.ClearSelection();
        //    ddltradmark3.Items.Clear();

        //}
        //public void cleardesign()
        //{
        //    ddldesign1.ClearSelection();
        //    ddldesign1.Items.Clear();
        //    ddldesign2.ClearSelection();
        //    ddldesign2.Items.Clear();
        //    ddldesign3.ClearSelection();
        //    ddldesign3.Items.Clear();


        //}
        //public void clearpatent()
        //{
        //    ddlpatent1.ClearSelection();
        //    ddlpatent1.Items.Clear();
        //    ddlpatent2.ClearSelection();
        //    ddlpatent2.Items.Clear();
        //    ddlpatent3.ClearSelection();
        //    ddlpatent3.Items.Clear();
        //    ddlpatent4.ClearSelection();
        //    ddlpatent4.Items.Clear();
        //    ddlpatent5.ClearSelection();
        //    ddlpatent5.Items.Clear();
        //    ddlpatent6.ClearSelection();
        //    ddlpatent6.Items.Clear();
        //}



        protected void btnSearch_Tradmark_Click(object sender, EventArgs e)
        {
            if (btnSearch_Tradmark.Text == "Search")
            {

                string q = "";

                //q = "select * from tbl_Trademark where 1=1 ";
                q = "SELECT DISTINCT t.id,t.Ref_No, t.Title,t.Com_Name,t.WordMarkLogo, STUFF((SELECT ', ' + COALESCE(ta.App_Name, '') FROM Trademark_Applicants ta " +
                        "WHERE t.ID = ta.TId FOR XML PATH('')), 1, 2, '') AS App_Name_Log FROM tbl_Trademark t INNER JOIN Trademark_Applicants ta ON t.ID = ta.TId WHERE 1 = 1";

                int s = 0;
                if (!string.IsNullOrEmpty(txttrdmsrk1.Text.Trim()))
                {
                    q = q + " and t." + ddltradmark1.SelectedValue.ToString() + " like '%" + txttrdmsrk1.Text.Trim() + "%'";
                    s = 1;
                }
                if (!string.IsNullOrEmpty(txttrdmsrk2.Text.Trim()))
                {
                    q = q + " and t." + ddltradmark2.SelectedValue.ToString() + " like '%" + txttrdmsrk2.Text.Trim() + "%'";
                    s = 1;
                }
                if (!string.IsNullOrEmpty(txttrdmsrk3.Text.Trim()))
                {
                    q = q + " and ta." + ddltradmark3.SelectedValue.ToString() + " like '%" + txttrdmsrk3.Text.Trim() + "%'";
                    s = 1;
                }
                if (!string.IsNullOrEmpty(txttrdmsrk4.Text.Trim()))
                {
                    q = q + " and t." + ddltradmark4.SelectedValue.ToString() + " like '%" + txttrdmsrk4.Text.Trim() + "%'";
                    s = 1;
                }
                if (!string.IsNullOrEmpty(txttrdmsrk5.Text.Trim()))
                {
                    q = q + " and t." + ddltradmark5.SelectedValue.ToString() + " like '%" + txttrdmsrk5.Text.Trim() + "%'";
                    s = 1;
                }

                if (s == 0)
                {
                    lblMsg.Text = "Kindly enter aleast one search value";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);

                    grd_TMSearch.Visible = false;
                }
                else
                {
                    SqlCommand sqlcmd = new SqlCommand(q, conmesp);
                    conmesp.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SqlDataReader sdr = sqlcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        grd_TMSearch.DataSource = dt;
                        grd_TMSearch.DataBind();
                        grd_TMSearch.Visible = true;
                        pnlTMSearch.Visible = true;
                        //ddlStatus.ClearSelection();
                        //txtref_no.Text = "";


                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    }
                    else
                    {
                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        pnlTMSearch.Visible = false;
                        grd_TMSearch.Visible = false;
                    }
                }
                
            }


        }
        protected void grd_TMSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int startIndex = grd_TMSearch.PageIndex * grd_TMSearch.PageSize + 1;
                int endIndex = Math.Min((grd_TMSearch.PageIndex + 1) * grd_TMSearch.PageSize, grd_TMSearch.Rows.Count);
                int totalCount = grd_TMSearch.Rows.Count;

                //lblEntries.Text = string.Format("Showing {0} to {1} of {2} entries", startIndex, endIndex, totalCount);

                e.Row.Cells[2].Text = startIndex.ToString() + " to " + endIndex.ToString() + " of " + totalCount.ToString() + " entries";

            }

        }


        protected void btnSearch_Design_Click(object sender, EventArgs e)
        {
            if (btnSearch_Design.Text == "Search")
            {
                string q = "";

                //q = "select * from tbl_Design where 1=1 ";
                q = "SELECT DISTINCT d.id,d.Ref_No,d.Title, d.Com_Name, STUFF((SELECT ', ' + COALESCE(da.App_Name, '') " +
                    "FROM Design_Applicants da WHERE d.id = da.DId FOR XML PATH('')), 1, 2, '') AS App_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(dc.Con_FirstName, '') FROM Design_Contributors dc WHERE d.id = dc.DId FOR XML PATH('')), 1, 2, '') AS Con_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(dg.GrantCollab_Collaborator, '') FROM Design_GrantExColl dg WHERE d.id = dg.DId FOR XML PATH('')), 1, 2, '') AS Coll_Name_Log " +
                    "FROM tbl_Design d INNER JOIN Design_Applicants da ON d.ID = da.DId INNER JOIN Design_Contributors dc ON d.ID = dc.DId " +
                    "INNER JOIN Design_GrantExColl dg ON d.ID = dg.DId WHERE 1 = 1";

                int j = 0;

                if (!string.IsNullOrEmpty(txtdesign1.Text.Trim()))
                {

                    q = q + " and " + ddldesign1.SelectedValue.ToString() + " like '%" + txtdesign1.Text.Trim() + "%'";
                    j = 1;
                }
                if (!string.IsNullOrEmpty(txtdesign2.Text.Trim()))
                {
                    q = q + " and " + ddldesign2.SelectedValue.ToString() + " like '%" + txtdesign2.Text.Trim() + "%'";
                    j = 1;
                }
                
                if (!string.IsNullOrEmpty(txtdesign3.Text.Trim()))
                {
                    q = q + " and " + ddldesign3.SelectedValue.ToString() + " like '%" + txtdesign3.Text.Trim() + "%'";
                    j = 1;
                }
                if (!string.IsNullOrEmpty(txtdesign4.Text.Trim()))
                {
                    q = q + "  and ((Con_FirstName like '%" + txtdesign4.Text.Trim() + "%') or (Con_LastName like '%" + txtdesign4.Text.Trim() + "%'))";
                    j = 1;
                }
                if (j == 0)
                {
                    lblMsg.Text = "Kindly enter aleast one search value";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);

                    grd_DGSearch.Visible = false;
                }
                else
                {
                    SqlCommand sqlcmd = new SqlCommand(q, conmesp);
                    conmesp.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SqlDataReader sdr = sqlcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        grd_DGSearch.DataSource = dt;
                        grd_DGSearch.DataBind();
                        grd_DGSearch.Visible = true;
                        pnlDGSearch.Visible = true;
                        //ddlStatus.ClearSelection();
                        //txtref_no.Text = "";

                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    }
                    else
                    {
                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        pnlDGSearch.Visible = false;
                        grd_DGSearch.Visible = false;
                    }
                }
                
            }


        }
        protected void grd_DGSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int startIndex = grd_DGSearch.PageIndex * grd_DGSearch.PageSize + 1;
                int endIndex = Math.Min((grd_DGSearch.PageIndex + 1) * grd_DGSearch.PageSize, grd_DGSearch.Rows.Count);
                int totalCount = grd_DGSearch.Rows.Count;

                //lblEntries.Text = string.Format("Showing {0} to {1} of {2} entries", startIndex, endIndex, totalCount);

                e.Row.Cells[2].Text = startIndex.ToString() + " to " + endIndex.ToString() + " of " + totalCount.ToString() + " entries";

            }

        }


        protected void btnSearch_Patent_Click(object sender, EventArgs e)
        {
            if (btnSearch_Patent.Text == "Search")
            {

                string q = "";

                q = "select * from tbl_Patent where 1=1 ";
                int k = 0;

                if (!string.IsNullOrEmpty(txtpatent1.Text.Trim()))
                {

                    q = q + " and " + ddlpatent1.SelectedValue.ToString() + " like '%" + txtpatent1.Text.Trim() + "%'";
                    k = 1;
                }
                if (!string.IsNullOrEmpty(txtpatent2.Text.Trim()))
                {
                    q = q + " and " + ddlpatent2.SelectedValue.ToString() + " like '%" + txtpatent2.Text.Trim() + "%'";
                    k = 1;
                }
                if (!string.IsNullOrEmpty(txtpatent3.Text.Trim()))
                {
                    q = q + " and " + ddlpatent3.SelectedValue.ToString() + " like '%" + txtpatent3.Text.Trim() + "%'";
                    k = 1;
                }
                if (!string.IsNullOrEmpty(txtpatent4.Text.Trim()))
                {
                    q = q + " and " + ddlpatent4.SelectedValue.ToString() + " like '%" + txtpatent4.Text.Trim() + "%'";
                    k = 1;
                }
                if (!string.IsNullOrEmpty(txtpatent5.Text.Trim()))
                {
                    q = q + " and " + ddlpatent5.SelectedValue.ToString() + " like '%" + txtpatent5.Text.Trim() + "%'";
                    k = 1;
                }
                if (!string.IsNullOrEmpty(txtpatent6.Text.Trim()))
                {
                    q = q + " and " + ddlpatent6.SelectedValue.ToString() + " like '%" + txtpatent6.Text.Trim() + "%'";
                    k = 1;
                }

                if (k == 0)
                {
                    lblMsg.Text = "Kindly enter aleast one search value";
                    lblMsg.Visible = true;
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);

                    grd_PTSearch.Visible = false;
                }
                else
                {
                    SqlCommand sqlcmd = new SqlCommand(q, conmesp);
                    conmesp.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SqlDataReader sdr = sqlcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        grd_PTSearch.DataSource = dt;
                        grd_PTSearch.DataBind();
                        grd_PTSearch.Visible = true;
                        pnlPTSearch.Visible = true;
                        //ddlStatus.ClearSelection();
                        //txtref_no.Text = "";

                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    }
                    else
                    {
                        lblMsg.Text = "Total " + dt.Rows.Count.ToString() + " record(s) found";
                        lblMsg.Visible = true;
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "HideLabel();", true);
                        pnlPTSearch.Visible = false;
                        grd_PTSearch.Visible = false;
                    }
                }
                
            }
        }
        protected void grd_PTSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int startIndex = grd_PTSearch.PageIndex * grd_PTSearch.PageSize + 1;
                int endIndex = Math.Min((grd_PTSearch.PageIndex + 1) * grd_PTSearch.PageSize, grd_PTSearch.Rows.Count);
                int totalCount = grd_PTSearch.Rows.Count;

                //lblEntries.Text = string.Format("Showing {0} to {1} of {2} entries", startIndex, endIndex, totalCount);

                e.Row.Cells[2].Text = startIndex.ToString() + " to " + endIndex.ToString() + " of " + totalCount.ToString() + " entries";

            }

        }


        protected void grd_PTSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "abc2")
            {
                string urlP = HttpContext.Current.Request.CurrentExecutionFilePath;
                string pageName = Path.GetFileNameWithoutExtension(urlP);

                string url = "FileEntry.aspx?rid=" + e.CommandArgument + "&idfName=" + "Patent";
                Response.Redirect(url);
            }

            if (e.CommandName == "abc1")
            {
                Response.Redirect("Patent.aspx?rid=" + e.CommandArgument);
            }
        }

        protected void grd_DGSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DGfile")
            {
                string urlP = HttpContext.Current.Request.CurrentExecutionFilePath;
                string pageName = Path.GetFileNameWithoutExtension(urlP);

                string url = "FileEntry.aspx?rid=" + e.CommandArgument + "&idfName=" + "Design";
                Response.Redirect(url);
            }
            if (e.CommandName == "DGedit")
            {
                Response.Redirect("Design.aspx?rid=" + e.CommandArgument);
            }
        }

        protected void grd_TMSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "TMfile")
            {
                string urlP = HttpContext.Current.Request.CurrentExecutionFilePath;
                string pageName = Path.GetFileNameWithoutExtension(urlP);

                string url = "FileEntry.aspx?rid=" + e.CommandArgument + "&idfName=" + "Trademark";
                Response.Redirect(url);
            }

            if (e.CommandName == "TMedit") 
            {
                Response.Redirect("Trademark.aspx?rid=" + e.CommandArgument);
            }

        }

        protected void grd_CRSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "CRfile")
            {
                string urlP = HttpContext.Current.Request.CurrentExecutionFilePath;
                string pageName = Path.GetFileNameWithoutExtension(urlP);

                string url = "FileEntry.aspx?rid=" + e.CommandArgument + "&idfName=" + "C";
                Response.Redirect(url);
            }
            if (e.CommandName == "CRedit")
            {
                Response.Redirect("Copyright.aspx?rid=" + e.CommandArgument);
            }

        }


        protected void grd_CRSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_CRSearch.PageIndex = e.NewPageIndex;
            //this.bind();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
        protected void grd_PTSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_PTSearch.PageIndex = e.NewPageIndex;
            //this.bind();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
        protected void grd_DGSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_DGSearch.PageIndex = e.NewPageIndex;
            //this.bind();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
        protected void grd_TMSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_TMSearch.PageIndex = e.NewPageIndex;
            //this.bind();

            lblMsg.Text = "";
            lblMsg.Visible = false;
        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //List<string> selectedIds = new List<string>();

            //// Iterate through the GridView rows
            //foreach (GridViewRow row in grd_DGSearch.Rows)
            //{
            //    // Find the checkbox control in the first column
            //    CheckBox checkbox = (CheckBox)row.FindControl("CheckBox1");

            //    // Find the ID value in the second column
            //    string id = row.Cells[1].Text;
            //    string id1 = row.Cells[0].Text;
            //    string id2 = row.Cells[2].Text;
            //    string id3 = row.Cells[3].Text;
            //    string i4 = row.Cells[4].Text;

            //    // Check if the checkbox is selected
            //    if (checkbox.Checked)
            //    {
            //        // Add the ID value to the selectedIds list
            //        selectedIds.Add(id);
            //    }
            //}

            //// Use the selectedIds list as needed
            //// For example, you can join the IDs into a comma-separated string
            //string selectedIdsString = string.Join(",", selectedIds);

            //// Display the selected IDs
            //Response.Write("Selected IDs: " + selectedIdsString);

            List<string> selectedIds = new List<string>();

            // Iterate through the GridView rows
            foreach (GridViewRow row in grd_DGSearch.Rows)
            {
                // Find the checkbox control in the first column
                CheckBox checkbox = (CheckBox)row.FindControl("CheckBox1");

                // Check if the checkbox is checked
                if (checkbox.Checked)
                {
                    // Find the ID value in the second column
                    string id = row.Cells[1].Text;

                    // Add the ID value to the selectedIds list
                    selectedIds.Add(id);
                }
            }

            // Use the selectedIds list as needed
            // For example, you can join the IDs into a comma-separated string
            string selectedIdsString = string.Join(",", selectedIds);

            // Display the selected IDs
            Response.Write("Selected IDs: " + selectedIdsString);
        }

    }
}




