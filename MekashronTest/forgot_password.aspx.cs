using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MekashronTest.Helpers;

namespace MekashronTest
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            ErrorList errors = new ErrorList();
            try
            {
                using (MailMessage newMessage = new MailMessage())
                {
                    newMessage.From = new MailAddress("sertest99@gmail.com");
                    newMessage.To.Add(new MailAddress(txtEmail.Value));
                    newMessage.Subject = "Mekashron new password";
                    newMessage.Body = String.Format("Your new password is {0}", CreateRandomPassword(8));
                    SendEmail.Send(newMessage, errors);
                }
                
            }
            catch (Exception ex)
            {
                errors.Add(ex.Message);
            }
        
            //Add errors displaing
            if (!errors.isEmpty())
            {
                errorDiv.Visible = true;
                errorMsg.InnerHtml = errors.ToHTML();
            }
        }
    }
}