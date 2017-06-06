using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SurveyComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((bool)(Session["SessioncntctMethd"]))
        {
            lbl_SurCom_Msg.Visible = true;

        }
        else
        {
            lbl_SurCom_Msg.Visible = false;
        }
    }

    protected void btn_ConDis_EmpLst_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerSurvey.aspx");
    }
}