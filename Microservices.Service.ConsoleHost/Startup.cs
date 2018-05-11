using System;
using Owin;

namespace Microservices.Service.ConsoleHost
{
    class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //app.Use(async (context, next) =>
            //{
            //    context.Response.Headers["Product"] = "Web Api and Owin Middleware";

            //    await next.Invoke();
            //});

            //app.Use(typeof(Middleware));

            //var config = ConfigureWebApi();


            app.Run(context =>
            {
                context.Response.ContentType = "text/plain";
                return context.Response.WriteAsync("Hello, world.");
            });
        }

        //private HttpConfiguration ConfigureWebApi()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
