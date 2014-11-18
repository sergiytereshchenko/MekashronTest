using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MekashronTest
{
    public partial class register_step_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                RegUser.Clear();

                RegUser.eMail = Request.Form["txtEmail"];

                string flName = Request.Form["txtFirstLastname"];
                flName = Regex.Replace(flName, @"\s+", " ");

                string[] flNameArray = flName.Split(new Char[] {' '});
                
                if (flNameArray.Length > 0)
                {
                    RegUser.FirstName = flNameArray[0];
                }

                if (flNameArray.Length > 1)
                {
                    RegUser.LastName = flNameArray[1];
                }

                RegUser.Phone = Request.Form["txtPhone"];

               // RegUser.Country = Request.Form["selCountry"];

                
                Response.Redirect("register_step_2.aspx");
            }
        }

    }
}