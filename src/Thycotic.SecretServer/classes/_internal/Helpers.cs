using System;
using System.Net;
using System.Management.Automation;
using RestSharp;
using System.IO;

namespace Thycotic.PowerShell.Internal
{
    internal class Helpers
    {
        internal static void WriteInternalNote(PSCmdlet cmdlet)
        {
            var cmdName = cmdlet.MyInvocation.MyCommand;
            cmdlet.WriteVerbose("[" + cmdName + "] calling an internal endpoint.");
        }

        internal static IRestResponse InvokeTssApi(string Uri, string AccessToken, Method Method, string ContentType, int Timeout = 0)
        {
            Uri requestUri = new Uri(Uri);
            var apiClient = new RestClient();
            apiClient.BaseUrl = requestUri;
            apiClient.Timeout = Timeout;

            var apiRequest = new RestRequest(Method);
            apiRequest.AddHeader("Content-Type", ContentType);
            if (!String.IsNullOrEmpty(AccessToken))
            {
                apiRequest.AddHeader("Authorization", "Bearer " + AccessToken);
            }
            IRestResponse apiResponse = apiClient.Execute(apiRequest);
            return apiResponse;
        }

        internal static IRestResponse InvokeTssApiBody(string Uri, string AccessToken, Method Method, string ContentType, Object Body, int Timeout = 0)
        {
            Uri requestUri = new Uri(Uri);
            var apiClient = new RestClient();
            apiClient.BaseUrl = requestUri;
            apiClient.Timeout = Timeout;

            var apiRequest = new RestRequest(Method);
            apiRequest.AddHeader("Content-Type", ContentType);
            if (!String.IsNullOrEmpty(AccessToken))
            {
                apiRequest.AddHeader("Authorization", "Bearer " + AccessToken);
            }
            apiRequest.AddParameter(ContentType, Body, ParameterType.RequestBody);
            IRestResponse apiResponse = apiClient.Execute(apiRequest);
            return apiResponse;
        }

        internal static IRestResponse InvokeTssApiBodyOutFile(string Uri, string AccessToken, Method Method, string ContentType, Object Body, string OutFile, int Timeout = 0)
        {
            Uri requestUri = new Uri(Uri);
            var apiClient = new RestClient();
            apiClient.BaseUrl = requestUri;
            apiClient.Timeout = Timeout;

            var apiRequest = new RestRequest(Method);
            apiRequest.AddHeader("Content-Type", ContentType);
            if (!String.IsNullOrEmpty(AccessToken))
            {
                apiRequest.AddHeader("Authorization", "Bearer " + AccessToken);
            }
            apiRequest.AddParameter(ContentType, Body, ParameterType.RequestBody);
            IRestResponse apiResponse = apiClient.Execute(apiRequest);
            try
            {
                string content = apiResponse.Content;
                File.WriteAllText(OutFile, content);
            }
            catch
            {
                throw new System.Exception("Unable to write content to file: " + OutFile);
            }
            return apiResponse;
        }

    }
}
