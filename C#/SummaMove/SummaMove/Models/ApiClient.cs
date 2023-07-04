using System.Net.Http;
using System.Threading.Tasks;

using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using System.Collections.Generic;

public class ApiClient
{
    public string Email { get; set; }
    public string Token { get; set; }

    public ApiClient(string email, string token)
    {
        Email = email;
        Token = token;
    }

     private static void AddAuthorizationHeader(string token)

     {

         Dictionary<string, string> headers = new Dictionary<string, string>
         {
             { "Content-Type", "application/json" },
             { "Content-Length", "<calculated when request is sent>" },
             {"Host", "<calculated when request is sent>" },
             {"Accept", "application/json" },
             {"Accept-Encoding","gzip, deflate, br" },
             {"Connection", "keep-alive" }
         };
         if (!string.IsNullOrEmpty(token))
             {
                 client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
             }

             if (headers != null)
             {
                 foreach (var header in headers)
                 {
                     client.DefaultRequestHeaders.Add(header.Key, header.Value);
                 }
             }
     }

     private static readonly HttpClient client = new HttpClient();

     public static async Task<string> Get(string url, string token = null)
     {
         if (token != null)
         {
             AddAuthorizationHeader(token);
         }
         HttpResponseMessage response = await client.GetAsync(url);
         return await response.Content.ReadAsStringAsync();
     }

     public static async Task<string> Post(string url, string content, string token = null)
     {
         if (token != null)
         {
             AddAuthorizationHeader(token);
         }
         HttpResponseMessage response = await client.PostAsync(url, new StringContent(content));
         return await response.Content.ReadAsStringAsync();
     }

     public static async Task<string> Put(string url, string content, string token = null)
     {
         if (token != null)
         {
             AddAuthorizationHeader(token);
         }
         HttpResponseMessage response = await client.PutAsync(url, new StringContent(content));
         return await response.Content.ReadAsStringAsync();
     }

     public static async Task<string> Delete(string url, string token = null)
     {
         if (token != null)
         {
             AddAuthorizationHeader(token);
         }
         HttpResponseMessage response = await client.DeleteAsync(url);
         return await response.Content.ReadAsStringAsync();
     }
}