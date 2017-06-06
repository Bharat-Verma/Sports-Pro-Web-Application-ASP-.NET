using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections;

/// <summary>
/// Summary description for IncidentDB
/// </summary>
public class IncidentDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]

    public static IEnumerable GetOpenTechIncidents(int techID)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = " SELECT Incidents.DateOpened,"
            + " Incidents.ProductCode,"
            + " Customers.Name"
            + " FROM Incidents INNER JOIN Customers"
            + " ON Incidents.CustomerID = Customers.CustomerID"
            + " WHERE (TechID = @TechID) AND (Incidents.DateClosed IS NULL)"
            + " ORDER BY Incidents.DateOpened";
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("@TechID", techID);
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