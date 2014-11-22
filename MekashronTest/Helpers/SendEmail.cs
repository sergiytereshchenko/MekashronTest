using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace MekashronTest.Helpers
{
    public static class SendEmail
    {
        public static void Send(MailMessage inMessage, ErrorList errors)
        {
            using (SmtpClient client = new SmtpClient())
            {
                try
                {
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.EnableSsl = true;
                    client.Credentials = new NetworkCredential("sertest99@gmail.com", "SerTer99");
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(inMessage);

                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                }
            }
        }
    }
}