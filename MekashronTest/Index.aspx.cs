using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MekashronTest.Helpers;

namespace MekashronTest
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorDiv.Visible = false;
            errorMsg.InnerHtml = "";

            if (IsPostBack)
            {

                if (chkRememberMe.Checked)
                {
                    if (Request.Cookies["eMail"] == null)
                    {
                        HttpCookie ce = new HttpCookie("eMail", txtEmail.Value);
                        ce.Expires = DateTime.Now.AddDays(30);
                        ce.Value = txtEmail.Value.ToString();
                        Response.Cookies.Add(ce);
                    }
                    else
                    {
                        Response.Cookies["eMail"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["eMail"].Value = txtEmail.Value;
                    }

                    if (Request.Cookies["Password"] == null)
                    {
                        HttpCookie cp = new HttpCookie("Password", txtPassword.Value);
                        cp.Expires = DateTime.Now.AddDays(30);
                        cp.Value = txtPassword.Value.ToString();
                        Response.Cookies.Add(cp);
                    }
                    else
                    {
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Value = txtPassword.Value;
                    }
                }
                else
                {
                    if (Request.Cookies["eMail"] != null)
                    {
                        Response.Cookies["eMail"].Expires = DateTime.Now.AddDays(-1);
                    }

                    if (Request.Cookies["Password"] != null)
                    {
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                    }
                }

                string inEmail = Request.Form["txtEmail"];
                string inPassword = Request.Form["txtPassword"];
                ErrorList errors = new ErrorList();

                DAL.CheckResults checkresult = DAL.DAL.CommonDal.CheckCredentials(inEmail, inPassword, errors);

                if (checkresult == DAL.CheckResults.AllRight || checkresult == DAL.CheckResults.NotActivated)
                {
                    RegUser.eMail = inEmail;
                    RegUser.Password = inPassword;
                }

                if (checkresult == DAL.CheckResults.AllRight)
                {
                    Response.Redirect("Cabinet.aspx");    
                }
                else
                {
                    if (checkresult == DAL.CheckResults.NotActivated)
                    {
                        strongEmail.InnerText = RegUser.eMail;
                        lkEmail.Attributes["myCustomID"] = RegUser.eMail;
                        RegUser.NotActivated = true;
                        successReg.Visible = true;
                    }
                    errorDiv.Visible = true;
                    errorMsg.InnerHtml = errors.ToHTML();
                   // Response.Redirect("index.aspx");
                }

            }
            else
            {
                if (Request.Cookies["eMail"] != null && Request.Cookies["Password"] != null)
                {
                    string inEmail = Request.Cookies["eMail"].Value;
                    string inPassword = Request.Cookies["Password"].Value;
                    ErrorList errors = new ErrorList();

                    DAL.CheckResults checkresult = DAL.DAL.CommonDal.CheckCredentials(inEmail, inPassword, errors);

                    if (checkresult == DAL.CheckResults.AllRight || checkresult == DAL.CheckResults.NotActivated)
                    {
                        RegUser.eMail = inEmail;
                        RegUser.Password = inPassword;
                    }

                    if (checkresult == DAL.CheckResults.AllRight)
                    {
                        Response.Redirect("Cabinet.aspx");
                    }
                    else
                    {
                        if (checkresult == DAL.CheckResults.NotActivated)
                        {
                            strongEmail.InnerText = RegUser.eMail;
                            lkEmail.Attributes["myCustomID"] = RegUser.eMail;
                            RegUser.NotActivated = true;
                            successReg.Visible = true;
                        }
                        errorDiv.Visible = true;
                        errorMsg.InnerHtml = errors.ToHTML();
                        // Response.Redirect("index.aspx");
                    }
                }
            }

            if (RegUser.NotActivated)
            {
                successReg.Visible = true;
            }

        }
    }
}