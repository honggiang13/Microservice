using Owin;
using System.Web.Http;
using Microservices.Service.Client;

namespace Microservices.Service
{
    class Startup
    {
        /// <summary>
        /// Configures the application.
        /// </summary>
        /// <param name="app">OWIN application builder.</param>
        // ReSharper disable once UnusedMember.Global
        public void Configuration(IAppBuilder app)
        {
            var httpConfiguration = new HttpConfiguration();

            // Scan for all Web API attributes
            httpConfiguration.MapHttpAttributeRoutes();

            // Scan and apply logging configuration
            var coreConfig = new CoreConfiguration(httpConfiguration, "LoggingService");

            // Use settings service to get logging settings.
            var settingServiceUrl = ConfigurationManager.AppSettings["SettingsServiceUrl"];
            coreConfig.UseSettingsServiceClient(
                settingServiceUrl,
                x => { x.UseConfigurationManagerSettingsProvider(); });

            coreConfig.Container.Register<ILoggingRepository, LoggingRepository>();

            // Configure Dapper to use AnsiString as the default DbType for all strings
            Dapper.SqlMapper.AddTypeMap(typeof(string), System.Data.DbType.AnsiString);

            // Enable Web API for Owin
            app.UseWebApi(httpConfiguration);
        }
    }
}
