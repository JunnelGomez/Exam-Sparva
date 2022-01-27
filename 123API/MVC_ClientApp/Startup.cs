using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_ClientApp.Startup))]
namespace MVC_ClientApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
