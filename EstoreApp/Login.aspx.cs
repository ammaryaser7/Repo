using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EstoreApp.App_Code;
using System.Data;

namespace EstoreApp
{

    public partial class Login : System.Web.UI.Page
    {
        userClass user = new userClass(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnadduser_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            user.Email = txtemail.Text;
            user.Password = txtpass.Text;
            dt = user.UserLog();
            if (dt.Rows.Count > 0)
            {
                Session["user"] = dt;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblerror.Text = "Please verify Email or Pass!";
            }

        }
    }
}