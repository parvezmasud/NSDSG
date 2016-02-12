using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace EGlobalLtd.BusinessLayer
{
    public class ClassBusinessLayer
    {
        public int ProductTypeId;
        public string ProductTypeName;

        public int ProductSubTypeId;
        public string ProductSubTypeName;
        public string ProductSubTypeDesc;

        public string ProductName;
        public string ProductDesc;

        public DataTable GetAllProductType()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataLayer.ClassDataAccess.ExecuteDTByProcedure("ProcProductType", parameters);
            return dt;
        }

        public DataTable GetAllProductSubType()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.ClassDataAccess.AddParameter("@ProductTypeId", ProductTypeId, System.Data.SqlDbType.Int, 100);
            DataTable dt = DataLayer.ClassDataAccess.ExecuteDTByProcedure("ProcProductSubType", parameters);
            return dt;
        }        
    }
}