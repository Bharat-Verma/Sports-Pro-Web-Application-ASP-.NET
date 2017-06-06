using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerList
/// </summary>
public class CustomerList
{
    private List<Customer> custdetails;
    public CustomerList()
    {
        custdetails = new List<Customer>();
    }

    public int Count
    {
        get { return custdetails.Count; }
    }

    public Customer this[int index]
    {
        get { return custdetails[index]; }
        set { custdetails[index] = value; }
    }

    public Customer this[string name]
    {
        get
        {
            foreach (Customer c in custdetails)
                if (c.Name == name) return c;
            return null;
        }
    }

    public static CustomerList GetCustomers()
    {
        CustomerList customer = (CustomerList)HttpContext.Current.Session["SessionCustomer"]; ;
        if (customer == null)
            HttpContext.Current.Session["SessionCustomer"] = new CustomerList();
        else
            customer = (CustomerList)HttpContext.Current.Session["SessionCustomer"];
        return (CustomerList)HttpContext.Current.Session["SessionCustomer"];
    }

    public void AddItem(Customer customer)
    {
        custdetails.Add(customer);
    }

    public void RemoveAt(int index)
    {
        custdetails.RemoveAt(index);
    }

    public void Clear()
    {
        custdetails.Clear();
    }

}