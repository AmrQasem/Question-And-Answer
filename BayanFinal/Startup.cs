using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BayanFinal.Startup))]
namespace BayanFinal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
