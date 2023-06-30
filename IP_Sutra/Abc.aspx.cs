using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_Sutra
{
    public partial class Abc : System.Web.UI.Page
    {
        DataTable VehcleDetailsTable = new DataTable(); // For Repeater1
        protected void Page_Load(object sender, EventArgs e)
        {
            VehcleDetailsTable.Columns.Add("DESCRIPTION");
            if (!IsPostBack)
            {
                for (int i = 0; i < 0; i++) // LOAD 0 ROWS FOR EXAMPLE
                {
                    VehcleDetailsTable.Rows.Add(VehcleDetailsTable.NewRow());
                }
                //Bind();
            }
        }
        protected void Bind()
        {
            Repeater1.DataSource = VehcleDetailsTable;
            Repeater1.DataBind();
        }


        protected void PopulateDataTable()
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                TextBox txtDescription = (TextBox)item.FindControl("txtRegNo1");
                DataRow row = VehcleDetailsTable.NewRow();
                row["DESCRIPTION"] = txtDescription.Text;
                VehcleDetailsTable.Rows.Add(row);
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PopulateDataTable();
            VehcleDetailsTable.Rows[e.Item.ItemIndex].Delete();
            Bind();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            PopulateDataTable();
            VehcleDetailsTable.Rows.Add(VehcleDetailsTable.NewRow());

            Bind();
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            StringBuilder strbldr = new StringBuilder();
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    TextBox txtRegNo = (TextBox)item.FindControl("txtRegNo1");
                    strbldr.Append(txtRegNo.Text.Trim());

                    DropDownList DdlVehclCatgry = (DropDownList)item.FindControl("DdlVehclCatgry1");
                    strbldr.Append(" " + DdlVehclCatgry.SelectedItem.Text);

                    TextBox txtInsrncNoteNo = (TextBox)item.FindControl("txtInsrncCovrNo1");
                    strbldr.Append(" " + txtInsrncNoteNo.Text);

                    string FitnessPathRpt = string.Empty;
                    FileUpload FileupldFtnsCertRpt = (FileUpload)item.FindControl("flupldftnsCert1");
                    if (FileupldFtnsCertRpt.HasFile)
                    {

                        FitnessPathRpt = "FitnessCertificate" + Path.GetExtension(FileupldFtnsCertRpt.FileName).ToLower();
                        FileupldFtnsCertRpt.PostedFile.SaveAs(Server.MapPath(@"\" + FitnessPathRpt));

                    }
                    strbldr.Append(" " + FitnessPathRpt + "<br />");

                }
                Response.Write(strbldr.ToString());
            }
        }
    }
}