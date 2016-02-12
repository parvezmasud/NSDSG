using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EGlobalLtd.DataLayer
{
    public class ClassDataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString.ToString();
            }
        }

        public static SqlParameter AddParameter(string parameterName, object value, SqlDbType DbType, int size)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = parameterName;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param;
        }

        public static DataTable ExecuteDTByProcedure(string ProcedureName, SqlParameter[] Params)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcedureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adptor = new SqlDataAdapter(cmd);
            DataTable dTable = new DataTable();

            try
            {
                adptor.Fill(dTable);
            }
            catch(Exception ex)
            {
                
            }
            finally
            {
                //Disposing object to clear memories
                adptor.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                conn.Close();
            }
            return dTable;
        }
    }
}