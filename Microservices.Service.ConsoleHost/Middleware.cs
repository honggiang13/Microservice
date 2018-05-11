using System.Threading.Tasks;
using Microsoft.Owin;

namespace Microservices.Service.ConsoleHost
{
    class Middleware : OwinMiddleware
    {
        public Middleware(OwinMiddleware next)
            :base(next)
        {

        }

        public async override Task Invoke(IOwinContext context)
        {
            context.Response.Headers["MachineName"] = "demo machine name";
            await Next.Invoke(context);
        }
    }
}
