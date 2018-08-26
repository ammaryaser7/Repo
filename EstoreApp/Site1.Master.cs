using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstoreApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                lblsession.Text =((DataTable)Session["user"]).Rows[0]["email"].ToString();
                Literal1.Text = "<a href=Default.aspx?log=out>Logout</a>";
            }
        }
    }
}