using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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

            ErrorList errors = new ErrorList();
            if (!IsPostBack)
            {
                //Fill inputs
                long userID;

                if (DAL.DAL.CommonDal.CheckCredentials(RegUser.eMail, RegUser.Password, out userID, errors) == DAL.CheckResults.NotActivated)
                {
                    UserModel curUser = DAL.DAL.CommonDal.GetUser(RegUser.eMail, errors);

                    if (curUser != null)
                    {
                        RegUser.UserID = userID;
                        txtEmail.Value = curUser.eMail;
                        //txtFirstLastname.Value = String.Format("{0} {1}", curUser.FirstName, curUser.LastName);
                        //txtPhone.Value = curUser.Phone;
                        //txtAddress.Value = curUser.Address;
                        //txtCity.Value = curUser.City;
                        //txtZip.Value = curUser.ZIP;
                        //selCountry.Value = curUser.Country;
                    }

                }
                else
                {
                    errors.Add("Credentials are wrong.");
                    form2.Visible = false;
                }
            }
            else
            {
            //    long userID;

            //    if (DAL.DAL.CommonDal.CheckCredentials(RegUser.eMail, RegUser.Password, out userID, errors) == DAL.CheckResults.AllRight)
            //    {

            //        string flName = txtFirstLastname.Value;
            //        flName = Regex.Replace(flName, @"\s+", " ");
            //        string firstNameUs = "", lastNameUs = "";

            //        string[] flNameArray = flName.Split(new Char[] { ' ' });

            //        if (flNameArray.Length > 0)
            //        {
            //            firstNameUs = flNameArray[0];
            //        }

            //        if (flNameArray.Length > 1)
            //        {
            //            lastNameUs = flNameArray[1];
            //        }

            //        UserModel curUser = new UserModel(txtEmail.Value, firstNameUs, lastNameUs, txtPhone.Value, selCountry.Value, txtPassword1.Value, txtAddress.Value, txtCity.Value, txtZip.Value, "", true);

            //        bool result = DAL.DAL.CommonDal.UpdateUser(userID, curUser, errors);

            //        if (result)
            //        {
            //            RegUser.eMail = curUser.eMail;
            //            RegUser.FirstName = curUser.FirstName;
            //            RegUser.LastName = curUser.LastName;
            //            RegUser.Phone = curUser.Phone;
            //            RegUser.Country = curUser.Country;
            //            RegUser.Password = curUser.Password;
            //            RegUser.Address = curUser.Address;
            //            RegUser.City = curUser.City;
            //            RegUser.ZIP = curUser.ZIP;

            //            Response.Redirect("MyAccount.aspx");
            //        }
            //        else
            //        {
            //            errors.Add("Update user failed");
            //        }

            //    }
            //    else
            //    {
            //        errors.Add("Credentials are wrong.");
            //    }

            }

            if (!errors.isEmpty())
            {
                errorDiv.Visible = true;
                errorMsg.InnerHtml = errors.ToHTML();

            }

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            ErrorList errors = new ErrorList();

                long userID;

                if (DAL.DAL.CommonDal.CheckCredentials(RegUser.eMail, RegUser.Password, out userID, errors) == DAL.CheckResults.NotActivated)
                {

                    bool result = DAL.DAL.CommonDal.ChangeEmail(userID, txtEmail.Value, errors);

                    if (result)
                    {
                        RegUser.eMail = txtEmail.Value;

                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        errors.Add("Change e-Mail failed");
                    }

                }
                else
                {
                    errors.Add("Credentials are wrong.");
                }

            

            if (!errors.isEmpty())
            {
                errorDiv.Visible = true;
                errorMsg.InnerHtml = errors.ToHTML();

            }

        }


    }
}