using library_managment;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security.DataProtection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reset_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btn_reset_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {


            var provider = new DpapiDataProtectionProvider("provider");
            var user_manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            user_manager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
                provider.Create("EmailConfirmation"));

            ApplicationUser user = user_manager.FindByEmail(txt_email.Text);

            if (user == null)
            {
                FailureText.Text = "The user does not exist.";
                ErrorMessage.Visible = true;
                return;
            }
            else
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                // Send email with the code and the redirect to reset password page
                string code = user_manager.GeneratePasswordResetToken(user.Id);
                string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request, txt_email.Text);

                //sending email
                string system_mail_account = WebConfigurationManager.AppSettings["system email account"];
                string system_mail_password = WebConfigurationManager.AppSettings["system email password"];
                string system_mail_stmp = WebConfigurationManager.AppSettings["system email smtp"];

                string userEmailAddress = user.Email;
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient(system_mail_stmp);
                mail.From = new MailAddress(system_mail_account);
                mail.To.Add(userEmailAddress);
                mail.Subject = "Library password reset request";
                string bodyHtml = "<h4>Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>.</h4>";
                AlternateView body = AlternateView.CreateAlternateViewFromString(bodyHtml, new System.Net.Mime.ContentType("text/html"));
                mail.AlternateViews.Add(body);
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(system_mail_account, system_mail_password);
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);

                loginForm.Visible = false;
                ErrorMessage.Visible = true;
                DisplayEmail.Visible = true;
            }
        }
    }
}