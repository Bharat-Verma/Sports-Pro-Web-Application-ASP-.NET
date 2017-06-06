using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class CustomerDisplay : Page
{
    private Customer selectedCustomer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ddl_CusDis_cust_name.DataBind();

        selectedCustomer = GetSelectedCustomer();
        lbl_CusDis_cust_add_info.Text = selectedCustomer.Address;
        lbl_CusDis_cust_city_info.Text = selectedCustomer.City;
        lbl_CusDis_cust_State_info.Text = selectedCustomer.State;
        lbl_CusDis_cust_zip_info.Text = selectedCustomer.ZipCode;
        lbl_CusDis_phone_info.Text = selectedCustomer.Phone;
        lbl_CusDis_email_info.Text = selectedCustomer.Email;
        lblMessage.Visible = false;
    }

    private Customer GetSelectedCustomer()
    {
        DataView customerTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        customerTable.RowFilter = 
            "CustomerID = '" + ddl_CusDis_cust_name.SelectedValue + "'";
        DataRowView row = (DataRowView)customerTable[0];

        Customer cust = new Customer();
        cust.CustomerID = (int)row["CustomerID"];
        cust.Name = row["Name"].ToString();
        cust.Address = row["Address"].ToString();
        cust.City = row["City"].ToString();
        cust.State = row["State"].ToString();
        cust.ZipCode = row["ZipCode"].ToString();
        cust.Phone = row["Phone"].ToString();
        cust.Email = row["Email"].ToString();
        return cust;
    }


    protected void btn_CusDis_DisConLst_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactDisplay.aspx");
    }

    protected void btn_CusDis_AddToConLst_Click(object sender, EventArgs e)
    {
        //if (Page.IsValid)
        {
            CustomerList cust_list_details;
            cust_list_details = CustomerList.GetCustomers();
            selectedCustomer = GetSelectedCustomer();
            if (cust_list_details.Count != 0 && cust_list_details[selectedCustomer.Name] != null)
            {
                if (cust_list_details[selectedCustomer.Name].Name != selectedCustomer.Name)
                {
                    cust_list_details.AddItem(selectedCustomer);
                    Response.Redirect("ContactDisplay.aspx");
                }
                else
                {
                    lblMessage.Visible = true;
                }
            }
            else
            {
                cust_list_details.AddItem(selectedCustomer);
                Response.Redirect("ContactDisplay.aspx");
            }
        }
    }
}