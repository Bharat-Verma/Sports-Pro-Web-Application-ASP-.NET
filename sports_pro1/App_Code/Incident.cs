using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Incident
/// </summary>
public class Incident
{
    public int CustomerID { get; set; }
    public int IncidentID { get; set; }
    public string ProductCode { get; set; }
    public int TechID { get; set; }
    public DateTime DateOpened { get; set; }
    public DateTime DateClosed { get; set; }
    public string Title { get; set; }
    public string Discription { get; set; }

    public string CustomerIncidentDisplay()
    {
        return "Incident For " + ProductCode + " Closed " + DateClosed + "(" + Title + ")";
    }
}