using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EstoreApp.App_Code
{
    public class profileClass
    {
        public int profileId { get; set; }
        public string FullName { get; set; }
        public string Address { get; set; }
        public string Street { get; set; }
        public string Image { get; set; }


        private SqlConnection con;
        public profileClass()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
        }

        public SqlDataReader GetProfile() // select
        {
            SqlCommand cmd = new SqlCommand("sp_profile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@profileid", profileId);
            cmd.Parameters.AddWithValue("@action", 1);
            return cmd.ExecuteReader();
  

        }


        public void ProfileCud(int action) // insert update delete
        {
            SqlCommand cmd = new SqlCommand("sp_profile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@profileid", profileId);
            cmd.Parameters.AddWithValue("@action", action);
           
            if(action == 2 || action ==3)
            {
                cmd.Parameters.AddWithValue("@fullname", FullName);
                cmd.Parameters.AddWithValue("@address", Address);
                cmd.Parameters.AddWithValue("@street", Street);
                cmd.Parameters.AddWithValue("@image", Image);
             
            }
           
            cmd.ExecuteNonQuery();



        }
}
}