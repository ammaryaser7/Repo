using EstoreApp.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstoreApp
{
    public partial class Register : System.Web.UI.Page
    {
        userClass user = new userClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadduser_Click(object sender, EventArgs e)
        {
            user.Email = txtemail.Text;
            user.Password = txtpass.Text;
         int r=   user.addUser();
            if(r>0)
            {
                Session["email"] = user.Email;
                Response.Redirect("default.aspx");
                
            }
            else
            {
                lblerror.Text = "pleas verify user email and  password";
            }
                   
                 
        }
    }
}