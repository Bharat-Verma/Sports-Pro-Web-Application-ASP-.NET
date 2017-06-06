using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactDisplay : System.Web.UI.Page
{
    private CustomerList custdetails;
    Customer customer_obj = new Customer();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_msg_disp_rmv_con.Visible = false;
        lbl_msg_disp_lst_emty.Visible = false;
        if (!IsPostBack)
        {
            if (Session["SessionCustomer"] != null)
            { 
                custdetails = (CustomerList)Session["SessionCustomer"];
                LstBox_ConDis_Contact.Items.Clear();
                for (int i = 0; i < custdetails.Count; i++)
                {
                    customer_obj = custdetails[i];
                    LstBox_ConDis_Contact.Items.Add(customer_obj.ContactDisplay());
                }
            }
        }
    }

    protected void btn_ConDis_SelAddCust_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerDisplay.aspx");
    }

    protected void btn_ConDis_EmpLst_Click(object sender, EventArgs e)
    {
        custdetails = CustomerList.GetCustomers();
        if (custdetails.Count > 0)
        {
            custdetails.Clear();
            LstBox_ConDis_Contact.Items.Clear();
        }
        else
        {
            lbl_msg_disp_lst_emty.Visible = true;
        }
    }

    protected void btn_ConDis_RmvCon_Click(object sender, EventArgs e)
    {
        custdetails = CustomerList.GetCustomers();

        if (custdetails.Count > 0) 
        {
            if (LstBox_ConDis_Contact.SelectedIndex > -1)
            {
                custdetails.RemoveAt(LstBox_ConDis_Contact.SelectedIndex);
                LstBox_ConDis_Contact.Items.Clear();
                for (int i = 0; i < custdetails.Count; i++)
                {
                    customer_obj = custdetails[i];
                    LstBox_ConDis_Contact.Items.Add(customer_obj.ContactDisplay());
                }
            }
            else
            {
                lbl_msg_disp_rmv_con.Visible = true;
            }
        }
        else
        {
            lbl_msg_disp_lst_emty.Visible = true;
        }
    }
}