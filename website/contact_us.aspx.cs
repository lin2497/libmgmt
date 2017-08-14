using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact_us : System.Web.UI.Page
{
    protected static string ReCaptcha_Key = "6LcErR0UAAAAACQ6Lr08Fc-W25KXSJ4qNy4mLjpU";
    protected static string ReCaptcha_Secret = "6LcErR0UAAAAAGO398kAtsjRrJBHsBnz5AlIl1jq";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            //sending email
            string system_mail_account = WebConfigurationManager.AppSettings["system email account"];
            string system_mail_password = WebConfigurationManager.AppSettings["system email password"];
            string system_mail_stmp = WebConfigurationManager.AppSettings["system email smtp"];

            string userEmailAddress = system_mail_account;
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient(system_mail_stmp);
            mail.From = new MailAddress(system_mail_account);
            mail.To.Add(userEmailAddress);
            mail.Subject = "User Message";
            string bodyHtml = "<h2>User: " + txt_name.Value + "</h2>" +
                              "<h3>Email: " + txt_name.Value + "</h3>" +
                              "<h4>" + txt_message.Value + "</h4>";
            AlternateView body = AlternateView.CreateAlternateViewFromString(bodyHtml, new System.Net.Mime.ContentType("text/html"));
            mail.AlternateViews.Add(body);
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential(system_mail_account, system_mail_password);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);

            string doneMsg = "Message is successfully sent to the administrator.";
            Response.Redirect("/message.aspx/?msg=" + doneMsg);
        }
    }
}