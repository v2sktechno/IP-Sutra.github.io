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



using System.Collections;

using System.Web.Security;

using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Globalization;
using System.Web.Services;

namespace IP_Sutra
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        //SqlConnection conmesp = new SqlConnection(ConfigurationManager.ConnectionStrings["conmes"].ConnectionString);

        
        protected void Page_Load(object sender, EventArgs e)       {

            
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {

                }


            }
            else
            {
                //Response.Redirect("loginform.aspx");
            }
            GetData();
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string fetchPopuData(string val)
        {
            string str1 = "";
            if (int.Parse(val) == 1)
            {
                str1 = orderpop1();
            }
            else if (int.Parse(val) == 2)
            {
                str1 = orderpop2();
            }
            else if (int.Parse(val) == 3)
            {
                str1 = orderpop3();
            }
            else if (int.Parse(val) == 4)
            {
                str1 = orderpop4();
            }
            else if (int.Parse(val) == 5)
            {
                str1 = orderpop5();
            }
            return str1;


        }

        //For Patent
        public static string orderpop6()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Contact Person</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Applicant Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Inventor Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Collaborator</td>");


            builderOppmodel.Append("</tr>");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";
                string q = "SELECT p.id,p.Ref_No, p.Title,p.Com_Name," +
                    "STUFF((SELECT ', ' + COALESCE(pa.App_Name, '') FROM Patent_Applicants pa WHERE p.id = pa.PId FOR XML PATH('')), 1, 2, '') AS App_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(pi.Inv_FirstName, '') FROM Patent_Inventors pi WHERE p.id = pi.PId FOR XML PATH('')), 1, 2, '') AS Inv_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(pg.GrantCollab_Collaborator, '') FROM Patent_GrantExCollab pg WHERE p.id = pg.PId FOR XML PATH('')), 1, 2, '') AS Grant_Coll from tbl_Patent p";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();

                j = 1;

                while (rd1.Read())
                {

                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Ref_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Title"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Com_Name"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["App_Name_Log"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Inv_Name_Log"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Grant_Coll"] + "</td>");


                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"7\" style=\"text - align:Left\">PATENT</td>");


            builderOppmodel.Append("</tr>");


            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }
        
        //For Trademark
        public static string orderpop5()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Contact Person</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Applicant Name</td>");
            
            builderOppmodel.Append("</tr>");

            
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            { 
                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";
                string q = "SELECT t.id,t.Ref_No, t.Title,t.Com_Name," +
                    "STUFF((SELECT ', ' + COALESCE(ta.App_Name, '') FROM Trademark_Applicants ta WHERE t.id = ta.TId FOR XML PATH('')), 1, 2, '') AS App_Name_Log from tbl_Trademark t";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();

                j = 1;

                while (rd1.Read())
                {

                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Ref_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Title"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Com_Name"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["App_Name_Log"] + "</td>");

                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"5\" style=\"text - align:Left\">TRADEMARK</td>");


            builderOppmodel.Append("</tr>");


            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }

        //For Patent
        public static string orderpop4()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Contact Person</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Applicant Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Inventor Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Collaborator</td>");


            builderOppmodel.Append("</tr>");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";
                string q = "SELECT p.id,p.Ref_No, p.Title,p.Com_Name," +
                    "STUFF((SELECT ', ' + COALESCE(pa.App_Name, '') FROM Patent_Applicants pa WHERE p.id = pa.PId FOR XML PATH('')), 1, 2, '') AS App_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(pi.Inv_FirstName, '') FROM Patent_Inventors pi WHERE p.id = pi.PId FOR XML PATH('')), 1, 2, '') AS Inv_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(pg.GrantCollab_Collaborator, '') FROM Patent_GrantExCollab pg WHERE p.id = pg.PId FOR XML PATH('')), 1, 2, '') AS Grant_Coll from tbl_Patent p";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();

                j = 1;

                while (rd1.Read())
                {

                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Ref_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Title"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Com_Name"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["App_Name_Log"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Inv_Name_Log"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Grant_Coll"] + "</td>");


                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"7\" style=\"text - align:Left\">PATENT</td>");


            builderOppmodel.Append("</tr>");


            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }

        //For File Entry
        public static string orderpop3()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Type Of IP</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Application No.</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Inventor Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Stage</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Status</td>");


            builderOppmodel.Append("</tr>");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";
                string q = " Select id,Ref_No,TypeofIp,Title, Appl_No,Inventor_Details,Stage,Status from mst_FileEntry";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();

                j = 1;

                while (rd1.Read())
                {

                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Ref_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["TypeofIp"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Title"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Appl_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Inventor_Details"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Stage"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Status"] + "</td>");


                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"8\" style=\"text - align:Left\">FILE ENTRY</td>");


            builderOppmodel.Append("</tr>");


            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }

        //For Design
        public static string orderpop2()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Communicating Person</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Applicant Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Collaborator</td>");


            builderOppmodel.Append("</tr>");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";
                string q = "SELECT d.id,d.Ref_No, d.Title,d.Com_Name," +
                    "STUFF((SELECT ', ' + COALESCE(da.App_Name, '') FROM Design_Applicants da WHERE d.id = da.DId FOR XML PATH('')), 1, 2, '') AS App_Name_Log," +
                    "STUFF((SELECT ', ' + COALESCE(dg.GrantCollab_Collaborator, '') FROM Design_GrantExColl dg WHERE d.id = dg.DId FOR XML PATH('')), 1, 2, '') AS Grant_Coll FROM tbl_Design d";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();

                j = 1;

                while (rd1.Read())
                {
                    
                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Ref_No"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Title"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Com_Name"] + "</td>");
                    //builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Language"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["App_Name_Log"] + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + (string)rd1["Grant_Coll"] + "</td>");
                                       
                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"6\" style=\"text - align:Left\">Design</td>");


            builderOppmodel.Append("</tr>");


            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }

        //For Copyright
        public static string orderpop1()
        {
            StringBuilder builderOppmodel = new StringBuilder();

            int j = 0;
            builderOppmodel.Append("<table border=\"1\" width=\"100%\" align=\"Center\"  bordercolor=\"#A6A6B7\">");

            builderOppmodel.Append("<tr bgcolor=\"#ccccff\">");

            builderOppmodel.Append("<td style=\"text-align:center\">Sr.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Ref.No</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Title</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Applicant Name</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Communicating Person</td>");
            builderOppmodel.Append("<td style=\"text-align:center\">Language</td>");
            //builderOppmodel.Append("<td style=\"text-align:center\">Contributor Name</td>");

            builderOppmodel.Append("</tr>");

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                

                con.Open();
                //string q = " Select pln.Line_No as LineName, pln.TAT,pln.ActTat as CurrTat, (Select Avg(TAT) from tbl_tat_log where planid=pln.id) as AvgTat, " +
                //    "wo.quantity as TargetQty, pln.StartOutDate, pln.CurrOutDate,  pln.Quantity as PlannedQty,pln.ProdQty,pln.Quantity-pln.ProdQty as Balance,  " +
                //    "pln.InQty as LineIn,pln.RepairQty, pln.Quantity - pln.ProdQty as GapQty, pln.Rate, wo.Brand,wo.ModelNo as Model, pln.ActivityDate," +
                //    "wo.id as workorderid from tbl_plan pln inner join tbl_workorder wo on pln.Order_No = wo.id Where   (CONVERT(varchar, pln.Date, 103) = CONVERT(varchar, GETDATE(), 103))";

                string q2 = " Select c.id,c.Ref_No,c.Title, c.Com_Name, c.Language,ca.App_Name from tbl_Copyright c LEFT OUTER JOIN Copyright_Applicants ca ON c.id = ca.CId";
                string q = "SELECT c.id,c.Ref_No,c.Title, c.Com_Name, c.Language," +
                    "STUFF((SELECT ', ' + Copyright_Applicants.App_Name FROM Copyright_Applicants WHERE c.id = Copyright_Applicants.CId FOR XML PATH('')), 1, 2, '') AS App_Name_Log FROM tbl_Copyright c";
                string q1 = "Select c.id,c.Ref_No,c.Title, c.Com_Name, c.Language,ca.App_Name,concat(cb.Con_FirstName, cb.Con_LastName) as Con_Name " +
                    "from tbl_Copyright c LEFT OUTER JOIN Copyright_Applicants ca ON c.id = ca.CId LEFT OUTER JOIN Copyright_Contributors cb ON c.id = cb.CId order by c.ID";

                SqlCommand cmd1 = new SqlCommand(q, con);
                SqlDataReader rd1 = cmd1.ExecuteReader();
                
                j = 1;                

                while (rd1.Read())
                {                    
                    int id = (int)rd1["id"];
                    string strRefNo = (string)rd1["Ref_No"];
                    string strTitle = (string)rd1["Title"];
                    string strComName = (string)rd1["Com_Name"];
                    string strLang = (string)rd1["Language"];
                    string strAppName = (string)rd1["App_Name_Log"];

                    //// Concatenate status values into a comma-separated string
                    //string allApplicant = strAppName;
                    //while (rd1.Read() && (int)rd1["id"] == id)
                    //{
                    //    allApplicant += ", " + (string)rd1["App_Name"];
                    //}

                    //string strContr = (string)rd1["Con_Name"];
                    //string allContributor = strContr;
                    //while (rd1.Read() && (int)rd1["id"] == id)
                    //{
                    //    allContributor += ", " + (string)rd1["Con_Name"];
                    //}
                    //rd1.Close();

                    builderOppmodel.Append("<tr>");

                    builderOppmodel.Append("<td style=\"text-align:center\">" + j.ToString() + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + strRefNo + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + strTitle + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + strAppName + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + strComName + "</td>");
                    builderOppmodel.Append("<td style=\"text-align:center\">" + strLang + "</td>");
                    //builderOppmodel.Append("<td style=\"text-align:center\">" + allContributor + "</td>");

                    //SqlCommand cmd = new SqlCommand("SELECT App_Name FROM Copyright_Applicants where CId = '" + cID.ToString() + "' ", con);

                    //List<string> records = new List<string>();
                    //using (SqlDataReader reader = cmd.ExecuteReader())
                    //{
                    //    while (reader.Read())
                    //    {
                    //        // Assuming that the "name" column is the first column of the result set
                    //        string name = reader.GetString(0);
                    //        records.Add(name);
                    //    }
                    //}

                    //string result = string.Join(",", records);


                    builderOppmodel.Append("</tr>");


                    j = j + 1;

                    // Move on to the next row
                    //rd1 = cmd1.ExecuteReader();

                }

                con.Close();
                con.Dispose();
            }

            builderOppmodel.Append("<tr bgcolor=\"#ccebff\">");

            builderOppmodel.Append("<td colspan=\"6\" style=\"text - align:Left\">Copyright</td>");


            builderOppmodel.Append("</tr>");
                

            builderOppmodel.Append("</table>");

            return builderOppmodel.ToString();
        }

        void GetData()
        {
            //totalPending.InnerText = "0";
            //totalNew.InnerText = "0";
            //totalCancel.InnerText = "0";
            //Support.InnerText = "0";
            countCopyright();
            countDesign();
            //count_Notapproved();
            countPatent();
            countTrademark();
            countDeadline();
            countStatus();
            countFileEntry();
            countInvention();
            countTTRecord();
            countAgreement();

        }

        //Returns count of number of Entries
        public string returnCount(string st)
        {
            
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand(st, con);
                int count = (int)command.ExecuteScalar();
                con.Close();
                return count.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void countCopyright()
        {
            //try
            //{
            //    string str = "select COUNT(*) from tbl_Copyright";
            //    con.Open();
            //    SqlCommand command = new SqlCommand(str, con);
            //    int count = (int)command.ExecuteScalar();

            //    //lbtotalPending.Text = dt.Rows.Count.ToString();
            //    totalCopyright.InnerText = count.ToString();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //finally
            //{
            //    con.Close();
            //}

            string strTotal = "select COUNT(*) from tbl_Copyright";
            totalCopyright.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM tbl_Copyright WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currCopyright.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM tbl_Copyright WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevCopyright.InnerText = returnCount(strPrevMonth);

        }
        public void countCStatus1(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //lbtotalPending.Text = dt.Rows.Count.ToString();
            totalCopyright.InnerText= dt.Rows.Count.ToString();
            con.Close();
        }

        public void countDesign()
        {
            string strTotal = "select COUNT(*) from tbl_Design";
            totalDesign.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM tbl_Design WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currDesign.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM tbl_Design WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevDesign.InnerText = returnCount(strPrevMonth);
        }
        
        public void countPatent()
        {
            string strTotal = "select COUNT(*) from tbl_Patent";
            totalPatent.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM tbl_Patent WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currPatent.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM tbl_Patent WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevPatent.InnerText = returnCount(strPrevMonth);
        }
        public void count_status3(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //lbtotalNotApproved.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countTrademark()
        {
            string strTotal = "select COUNT(*) from tbl_Trademark";
            totalTrademark.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM tbl_Trademark WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currTrademark.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM tbl_Trademark WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevTrademark.InnerText = returnCount(strPrevMonth);

        }
        public void count_status4(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //lbtotalOnHold.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countDeadline()
        {
            string strTotal = "select COUNT(*) from mst_Deadline";
            totalDeadline.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_Deadline WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currDeadline.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_Deadline WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevDeadline.InnerText = returnCount(strPrevMonth);

        }
        public void count_Deadline(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //LinkButton1.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countStatus()
        {
            string strTotal = "select COUNT(*) from mst_Status";
            totalStatus.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_Status WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currStatus.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_Status WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevStatus.InnerText = returnCount(strPrevMonth);
        }
        public void count_button(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //LinkButton2.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countFileEntry()
        {
            string strTotal = "select COUNT(*) from mst_FileEntry";
            totalFiles.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_FileEntry WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currFiles.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_FileEntry WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevFiles.InnerText = returnCount(strPrevMonth);
            
        }
        public void count_button3(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //LinkButton3.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countInvention()
        {
            string strTotal = "select COUNT(*) from mst_InventionDetails";
            totalInvention.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_InventionDetails WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currInvention.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_InventionDetails WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevInvention.InnerText = returnCount(strPrevMonth);
        }
        public void count_btn4(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //LinkButton4.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countTTRecord()
        {
            string strTotal = "select COUNT(*) from mst_TTRecord";
            totalTTRecord.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_TTRecord WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currTTRecord.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_TTRecord WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevTTRecord.InnerText = returnCount(strPrevMonth);
            
        }
        public void count_btn5(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

           //LinkButton5.Text = dt.Rows.Count.ToString();
            con.Close();
        }
        public void countAgreement()
        {
            string strTotal = "select COUNT(*) from mst_Agreement";
            totalAgreement.InnerText = returnCount(strTotal);

            string strCurrMonth = "SELECT COUNT(*) FROM mst_Agreement WHERE MONTH(EntryDate) = MONTH(GETDATE()) AND YEAR(EntryDate) = YEAR(GETDATE())";
            currAgreement.InnerText = returnCount(strCurrMonth);

            string strPrevMonth = "SELECT COUNT(*) FROM mst_Agreement WHERE EntryDate >= DATEADD(month, -1, GETDATE())";
            prevAgreement.InnerText = returnCount(strPrevMonth);            
        }
        public void count_btn6(string st)
        {
            string stt = st;
            //string str1 = "select * from tbl_RMAReq where status like %pending";
            //string str2 = "select * from tbl_RMAReq where status like %approved"; 
            //string str3 = "select * from tbl_RMAReq where status like %not approved"; 
            //string str4 = "select * from tbl_RMAReq where status like %on hold";


            con.Open();
            SqlCommand command = new SqlCommand(stt, con);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            //LinkButton6.Text = dt.Rows.Count.ToString();
            con.Close();
        }


        

        protected void lbtotalApproved_Click(object sender, EventArgs e)
        {

        }

        protected void lbtotalNotApproved_Click(object sender, EventArgs e)
        {

        }

        protected void lbtotalOnHold_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        protected void lbtotalPending_Click(object sender, EventArgs e)
        {
            fetchPopuData("1");
        }
    }
}