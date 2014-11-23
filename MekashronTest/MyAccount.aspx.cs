using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                    users curUser = DAL.DAL.CommonDal.GetUser(RegUser.eMail, errors);

                    if (curUser!=null)
                    {
                        txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);
                        //txtAddress.Value = StringByteConverter.ConvertByteArrayToString(curUser.);
                        //txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);
                        //txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);
                        //txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);
                        //txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);
                        //txtEmail.Value = StringByteConverter.ConvertByteArrayToString(curUser.Email);

                    }

                }
                else
                {
                    errorDiv.Visible = true;
                    errorMsg.InnerHtml = errors.ToHTML();
                }
            }
            else
            {
            }

        }
    }
}