using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MekashronTest.DAL;
using MekashronTest.DBModel;
using MekashronTest.Helpers;

namespace MekashronTest
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Fill inputs
                ErrorList errors = new ErrorList();

                if (DAL.DAL.CommonDal.CheckCredentials(RegUser.eMail, RegUser.Password, errors)==DAL.CheckResults.AllRight)
                {
                    UserModel curUser = DAL.DAL.CommonDal.GetUser(RegUser.eMail, errors);

                    if (curUser!=null)
                    {
                        txtEmail.Value = curUser.eMail;
                        txtFirstLastname.Value = String.Format("{0} {1}", curUser.FirstName, curUser.LastName);
                        txtPhone.Value = curUser.Phone;
                        txtAddress.Value = curUser.Address;
                        txtCity.Value = curUser.City;
                        txtZip.Value = curUser.ZIP;
                        selCountry.Value = curUser.Country;


                    }

                }
                else
                {
                    errorDiv.Visible = true;
                    errorMsg.InnerHtml = errors.ToHTML();
                    form2.Visible = false;
                }
            }
            else
            {
            }

        }
    }
}