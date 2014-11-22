using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MekashronTest.Helpers;

namespace MekashronTest
{
    public partial class register_step_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelEmail.Text = RegUser.eMail;

            if (IsPostBack)
            {
                RegUser.Password = Request.Form["txtPassword1"];
                RegUser.Address = Request.Form["txtAddress"];
                RegUser.City = Request.Form["txtCity"];
                RegUser.ZIP = Request.Form["txtZip"];
                RegUser.Country = Request.Form["selCountry"];

                //DAL.DAL dl = new DAL.DAL();
                ErrorList errors = new ErrorList();

                DAL.DAL.CommonDal.InsertUser(errors);

                if (errors.isEmpty())
                {
                    RegUser.NotActivated = true;

                    try
                    {
                        using (MailMessage newMessage = new MailMessage())
                        {
                            newMessage.From = new MailAddress("sertest99@gmail.com");
                            newMessage.To.Add(new MailAddress(RegUser.eMail));
                            newMessage.Subject = "Mekashron account activation";
                            newMessage.Body = String.Format("For activating please click on this link http://localhost:63710/activate.aspx?email={0}", RegUser.eMail);
                            SendEmail.Send(newMessage, errors);
                        }

                    }
                    catch (Exception ex)
                    {
                        errors.Add(ex.Message);
                    }
                    
                }

                if (!errors.isEmpty())
                {
                    errorDiv.Visible = true;
                    errorMsg.InnerHtml = errors.ToHTML();
                    
                }
                else
                {
                    Response.Redirect("index.aspx");
                }

            }

        }
    }
}