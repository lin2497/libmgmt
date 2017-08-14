using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library_managment;
using System.Web.Configuration;

public partial class registeration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var new_user = (new ApplicationUser()).getNewUser(txt_user_name.Text, txt_password.Text,
          txt_email.Text, txt_first_name.Text, txt_last_name.Text);
        IdentityResult result = manager.Create(new_user, txt_password.Text);

        if (result.Succeeded)
        {
            libmgmtEntities db = new libmgmtEntities();
            UserInfo info = new UserInfo();
            info.user_id = new_user.Id;
            info.first_name = txt_first_name.Text;
            info.last_name = txt_last_name.Text;
            info.tel = txt_tel.Text;
            info.fax = txt_fax.Text;
            info.country = drop_country.SelectedValue;
            info.city = txt_city.Text;
            info.post = txt_post.Text;
            info.address_1 = txt_add1.Text;
            info.address_2 = txt_add2.Text;
            db.UserInfoes.Add(info);
            db.SaveChanges();
            IdentityHelper.SignIn(manager, new_user, isPersistent: false);
            Response.Redirect(WebConfigurationManager.AppSettings["homepage"]);
        }
        else
        {
            error_panel.Visible = true;
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}