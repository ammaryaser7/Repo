using EstoreApp.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstoreApp
{
    public partial class userProfile : System.Web.UI.Page
    {
        profileClass pro = new profileClass();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Display();
            }
        }
        private void Display()
        {
            int ID = int.Parse(((DataTable)Session["user"]).Rows[0]["ID"].ToString());
            pro.profileId = ID;
            dr = pro.GetProfile();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblID.Text = dr["ProfileID"].ToString();
                    lblFullName.Text = dr["FullName"].ToString();
                    lblAddress.Text = dr["Address"].ToString();
                    lblstreet.Text = dr["Street"].ToString();
                    Image1.ImageUrl = "~/images/" + dr["Image"].ToString();
                }
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
           

        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {
            // Casting 
            int ID = int.Parse(((DataTable)Session["user"]).Rows[0]["ID"].ToString());

            pro.profileId = ID;
            pro.FullName = txtfullname.Text;
            pro.Address = txtaddress.Text;

            if (FileUpload1.HasFile)
            {
                //upload
                FileUpload1.SaveAs(Server.MapPath("~/images/" + FileUpload1.FileName));
            }
            //save to db
            pro.Image = FileUpload1.FileName;
            pro.ProfileCud(2);
            Display();
            MultiView1.ActiveViewIndex = 1;

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            int ID = int.Parse(((DataTable)Session["user"]).Rows[0]["ID"].ToString());

            pro.profileId = ID;
            pro.FullName = txtfullname.Text;
            pro.Address = txtaddress.Text;
            pro.Street = txtstreet.Text;

            if (FileUpload1.HasFile)
            {
                //upload
                FileUpload1.SaveAs(Server.MapPath("~/images/" + FileUpload1.FileName));
                pro.Image = FileUpload1.FileName;
            }
            else
            {
                pro.Image = ViewState["proimg"].ToString();
            }

            //save to db
            
            pro.ProfileCud(3);
            Display();
            MultiView1.ActiveViewIndex = 1; // Display view 1 : Details
        }

        protected void lnkEditprofile_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            int ID = int.Parse(((DataTable)Session["user"]).Rows[0]["ID"].ToString());
            pro.profileId = ID;
            dr = pro.GetProfile();
            while (dr.Read())
            {
                
               txtfullname.Text = dr["FullName"].ToString();
               txtaddress.Text = dr["Address"].ToString();
               txtstreet.Text = dr["Street"].ToString();
               Image2.ImageUrl = "~/images/" + dr["Image"].ToString();
               ViewState["proimg"] = dr["Image"].ToString();

            }
            Image2.Width = 150;
            Image2.Height = 150;
            btnCreate.Enabled = false;
            Image2.Visible = true;



        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            // Profile prof =  (Profile)Session["user"]; casting
            // prof.profileId 
            int ID = int.Parse(((DataTable)Session["user"]).Rows[0]["ID"].ToString());
            pro.profileId = ID;
            pro.ProfileCud(4);
            Session["user"] = null;
            Session.Clear();
            
            Response.Redirect("Default.aspx");
        }
    }
}