using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Technician
/// </summary>
public class Technician
{
    private int techid;
    private string name;
    private string email;
    private string phone;

    public Technician()
    {
    }

    public int TechID
    {
        get
        {
            return techid;
        }
        set
        {
            techid = value;
        }
    }

    public string Name
    {
        get
        {
            return name;
        }
        set
        {
            name = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }
        set
        {
            email = value;
        }
    }

    public string Phone
    {
        get
        {
            return phone;
        }
        set
        {
            phone = value;
        }
    }


}