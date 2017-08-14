using library_managment;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserManager<ApplicationUser> usermanager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            ApplicationUser current_user = usermanager.FindById(User.Identity.GetUserId());
            if (current_user != null)
            {
                txt_email.Text = current_user.Email;

                UserInfo info = db.getUserInfoByUserID(current_user.Id);
                if (info != null)
                {
                    txt_first_name.Text = info.first_name;
                    txt_last_name.Text = info.last_name;

                    txt_company.Text = info.company;
                    txt_tel.Text = info.tel;
                    txt_fax.Text = info.fax;

                    drop_country.SelectedValue = info.country;
                    txt_city.Text = info.city;
                    txt_post.Text = info.post;

                    txt_add1.Text = info.address_1;
                    txt_add2.Text = info.address_2;
                    Session["editInfoID"] = info.auto_id;
                }
            }
        }
    }
    CData db = new CData();
    protected void btn_confirm_order_Click(object sender, EventArgs e)
    {
        try
        {
            UserManager<ApplicationUser> usermanager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            ApplicationUser current_user = usermanager.FindById(User.Identity.GetUserId());
            current_user.Email = txt_email.Text;
            usermanager.Update(current_user);

            UserInfo info = db.getUserInfo(Int32.Parse(Session["editInfoID"].ToString()));
            info.first_name = txt_first_name.Text;
            info.last_name = txt_last_name.Text;

            info.company = txt_company.Text;
            info.tel = txt_tel.Text;
            info.fax = txt_fax.Text;

            info.country = drop_country.SelectedValue;
            info.city = txt_city.Text;
            info.post = txt_post.Text;

            info.address_1 = txt_add1.Text;
            info.address_2 = txt_add2.Text;
            db.saveUserInfo(info);



            book_order order = new book_order();
            order.user_id = User.Identity.GetUserId();
            order.order_time = DateTime.Now;

            order.first_name = txt_first_name.Text;
            order.last_name = txt_last_name.Text;

            order.company = txt_company.Text;
            order.tel = txt_tel.Text;
            order.fax = txt_fax.Text;

            order.country = drop_country.SelectedValue;
            order.city = txt_city.Text;
            order.post = txt_post.Text;

            order.address_1 = txt_add1.Text;
            order.address_2 = txt_add2.Text;

            db.checkoutCart(current_user.Id, order);

            Response.Redirect("/message.aspx?msg=" + "Your order is now in process.");
        }
        catch (Exception ex)
        {
            Response.Redirect("/message.aspx?msg=" + ex.ToString());
        }
    }
}