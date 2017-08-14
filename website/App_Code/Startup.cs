using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(library_managment.Startup))]
namespace library_managment
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
