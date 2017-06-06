using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TechnicianMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred. " +
                e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that customer. " +
                "Please try again.";
        }
        else
        {
            DropDownList1.DataBind();
        }

    }

    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred. " +
                e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that customer. " +
                "Please try again.";
        }
        else
        {
            DropDownList1.DataBind();
        }
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred. " +
                e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
        {
            DropDownList1.DataBind();
        }
    }
}