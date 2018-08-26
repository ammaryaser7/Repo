using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EstoreApp.App_Code
{
    public class userClass
    {
        public int Id { get; set; }
        public string  Email { get; set; }
        public string  Password { get; set; }

        private SqlConnection con;
        public userClass()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
        }
        public int addUser()
        {
            SqlCommand cmd = new SqlCommand("sp_Insertuser",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email",Email);
            cmd.Parameters.AddWithValue("@password", Password);

            return cmd.ExecuteNonQuery();
        }
        public DataTable UserLog()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_UserLog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@password", Password);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;

        }
        


         

    }
}