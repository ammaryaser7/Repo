using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EstoreApp.App_Code
{
    public class Operation
    {


        private SqlConnection con;
        public Operation()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
        }

        public SqlDataReader GetTypes() // select
        {
            SqlCommand cmd = new SqlCommand("sp_Product", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "getTypes");
            return cmd.ExecuteReader();


        }

    }
}