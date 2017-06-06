using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;
using System.Collections;

[DataObject(true)]
public static class TechnicianDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllTechnicians()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "SELECT * "
            + "FROM Technicians ORDER BY Name";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr =
            cmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        return dr;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings
            ["ConnectionString"].ConnectionString;
    }
}