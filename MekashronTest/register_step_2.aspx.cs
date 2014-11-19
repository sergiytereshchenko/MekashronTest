﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                List<string> errList = new List<string>();
                DAL.DAL.CommonDal.InsertUser(errList);

                if (errList.Count==0)
                {
                    RegUser.successfullyRegistered = true;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    StringBuilder errors = new StringBuilder();
                    foreach (string s in errList)
                    {
                        errors.Append(s + "<br/>");
                    }
                    errors.Remove(errors.Length - 5, 5);
                    errorDiv.Visible = true;
                    errorMsg.InnerHtml = errors.ToString();
                }


            }

        }
    }
}