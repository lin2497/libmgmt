using library_managment;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security.DataProtection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_reset_password_confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);

            if (code != null && Request.QueryString["user_email"] != null)
            {
                ApplicationUser user =  (new UserManager()).FindByEmail(Request.QueryString["user_email"].ToString());

                if (user == null)
                {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "No user found.";
                    return;
                }
                else
                {
                    section_reset.Visible = true;
                }
            }
            else
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "An error has occurred.";
            }
        }
    }

    protected void btn_password_renew_Click(object sender, EventArgs e)
    {
        var provider = new DpapiDataProtectionProvider("provider");
        var user_manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
        user_manager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
            provider.Create("EmailConfirmation"));

        ApplicationUser user = user_manager.FindByEmail(Request.QueryString["user_email"].ToString());

        string code = IdentityHelper.GetCodeFromRequest(Request);
        var result = user_manager.ResetPassword(user.Id, code, txt_password.Text);

        if (result.Succeeded)
            Response.Redirect("~/message" + "?msg=" + "Password has reset. Please use your new password to login.");
        else
            ErrorMessage.Text = result.Errors.FirstOrDefault();
    }
}