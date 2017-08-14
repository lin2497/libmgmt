using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web;
using System;
using library_managment;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace library_managment
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {


        public ApplicationUser getNewUser(string _account, string _password, string _email,
    string _first_name, string _string_last_name)
        {
            ApplicationUser _user = new ApplicationUser();
            _user.UserName = _account;
            _user.Email = _email;
            _user.PasswordHash = _password;
            return _user;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //modelBuilder.Entity<CUserInfo>().ToTable("UserInfo");
            //modelBuilder.Entity<CList>().ToTable("List");
            //modelBuilder.Entity<CBook>().ToTable("Book");
        }

        public ApplicationDbContext()
            //: base("DefaultConnection")
            : base("onlineConneciton")

        {
        }
    }

    #region Helpers
    public class UserManager : UserManager<ApplicationUser>
    {
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }
    }
}

namespace library_managment
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public static void SignIn(UserManager manager, ApplicationUser user, bool isPersistent)
        {
            IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request[ProviderNameKey];
        }

        public static string GetExternalLoginRedirectUrl(string accountProvider)
        {
            return "/Account/RegisterExternalLogin?" + ProviderNameKey + "=" + accountProvider;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }

        static string CodeKey = "code";
        static string user_email = "user_email";
        public static string GetResetPasswordRedirectUrl(string code, HttpRequest request, string _user_email)
        {
            var absoluteUri = "/Account/reset_password?" + CodeKey + "=" + HttpUtility.UrlEncode(code) +
                "&" + user_email + "=" + HttpUtility.UrlEncode(_user_email);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }
        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }
    }
    #endregion
}