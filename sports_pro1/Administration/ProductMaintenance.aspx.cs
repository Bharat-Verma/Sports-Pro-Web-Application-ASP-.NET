using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowUpdated(
        object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbl_Error.Text = "A database error has occurred. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lbl_Error.Text = "Another user may have updated that product. " +
                "Please try again.";
    }

    protected void GridView1_RowDeleted(
        object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbl_Error.Text = "A database error has occurred. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lbl_Error.Text = "Another user may have updated that product. " +
                "Please try again.";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["ProductCode"].DefaultValue = TextBox4.Text;
        SqlDataSource1.InsertParameters["Name"].DefaultValue = TextBox5.Text;
        SqlDataSource1.InsertParameters["Version"].DefaultValue = TextBox6.Text;
        SqlDataSource1.InsertParameters["ReleaseDate"].DefaultValue = TextBox7.Text;
        try
        {
            SqlDataSource1.Insert();
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
        catch (Exception ex)
        {
            lbl_Error.Text = "A database error has occurred. " +
                "Message: " + ex.Message;
        }
    }
}