using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MekashronTest.Helpers;

namespace MekashronTest
{
    public partial class activate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string inEmail = Request["email"];

            ErrorList errors = new ErrorList();
            bool resActivate = DAL.DAL.CommonDal.ActivateAcount(inEmail, errors);
            if (resActivate)
            {
                RegUser.NotActivated = false;
                successReg.Visible = true;
            }
            else
            {
                errorDiv.Visible = true;
                errorMsg.InnerHtml = errors.ToHTML();
            }

        }

        [WebMethod]
        public static string SendEmail(string inEmail)
        {
            string result = "";

            ErrorList errors = new ErrorList();
            try
            {
                using (MailMessage newMessage = new MailMessage())
                {
                    newMessage.From = new MailAddress("sertest99@gmail.com");
                    newMessage.To.Add(new MailAddress(inEmail));
                    newMessage.Subject = "Mekashron account activation";
                    newMessage.Body = String.Format("For activating please click on this link http://localhost:63710/activate.aspx?email={0}", RegUser.eMail);
                    Helpers.SendEmail.Send(newMessage, errors);
                }

            }
            catch (Exception ex)
            {
                errors.Add(ex.Message);
            }

            return result;
        }
    }
}