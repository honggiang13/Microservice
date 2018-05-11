using System;
using Microsoft.Owin.Hosting;
using System.Diagnostics;

namespace Microservices.Service.ConsoleHost
{
    class Program
    {
        static void Main(string[] args)
        {
            var url = "http://localhost:6878/";
            try
            {
                using (WebApp.Start<Startup>(url))
                {
                    Console.WriteLine($"Application is running at: {url}");
                    Console.WriteLine("Press Ctrl+C to exit.");

                    Process.Start(url);

                    Console.ReadLine();
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
        }
    }
}
