using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MekashronTest
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RegUser.successfullyRegistered)
            {
                successReg.Visible = true;
            }

            if (IsPostBack)
            {
                string inEmail = Request.Form["txtEmail"];
                string inPassword = Request.Form["txtPassword"];
                List<string> errors = new List<string>();

                if (DAL.DAL.CommonDal.CheckCredentials(inEmail, inPassword, errors))
                {
                    Response.Redirect("Cabinet.aspx");    
                }
                else
                {
                    Response.Redirect("index.aspx");
                }

                
            }
        }
    }
}