using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EstoreApp.App_Code
{
    public abstract class Product
    {

        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int UserID { get; set; }
        public int TypeID { get; set; }
        public string action { get; set; }
        public abstract int CudProduct();

        public SqlConnection con ;
        public SqlCommand cmd;

        
        public Product()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("sp_Product");
            cmd.CommandType = CommandType.StoredProcedure;
        }


    }


    public class FlatClass : Product
    {
        public int Rooms { get; set; }
        public int Area { get; set; }

        public override int CudProduct()
        {
           
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@action", action);

            if (action == "insert" || action == "update")
            {
                cmd.Parameters.AddWithValue("@Rooms", Rooms);
                cmd.Parameters.AddWithValue("@Area", Area);

            }

          return  cmd.ExecuteNonQuery();
        }



    }
    public class CarClass : Product
    {
        public DateTime Year { get; set; }
        public string Color  { get; set; }

        public override int CudProduct()
        {

            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@action", action);

            if (action == "insert" || action == "update")
            {
                cmd.Parameters.AddWithValue("@Year", Year);
                cmd.Parameters.AddWithValue("@Color", Color);

            }

            return cmd.ExecuteNonQuery();
        }
    }


}