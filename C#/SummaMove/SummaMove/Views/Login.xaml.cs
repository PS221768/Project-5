using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Newtonsoft.Json;
using SummaMove.Models;

namespace SummaMove.Views
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        private const string ApiUrl = "http://81.16.177.207:8000/api/login";
        public byte[] Afbeelding { get; set; }
        public Login()
        {
            InitializeComponent();
            String path = System.IO.Path.GetFullPath(".\\Images\\logo-1861420_1280.jpg");
            Afbeelding = System.IO.File.ReadAllBytes(path);
            DataContext = this;
        }

        private async void BtLogin_Click(object sender, RoutedEventArgs e)
        {
            string email = TbUsername.Text;
            string password = PbPassword.Password.ToString();
            BeheerderView gelukt = new BeheerderView();

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    string jsonContent = $"{{\"email\":\"{email}\",\"password\":\"{password}\"}}";
                    StringContent content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

                    HttpResponseMessage response = await client.PostAsync(ApiUrl, content);
                    string responseContent = await response.Content.ReadAsStringAsync();
                    if (response.IsSuccessStatusCode)
                    {
                        MessageBox.Show("Login successful!");

                         BeheerderView mainWindow = Application.Current.Windows.OfType<BeheerderView>().FirstOrDefault();
                        if (mainWindow != null)
                        {
                            // Deserialize JSON string
                            var jsonObject = JsonConvert.DeserializeObject<dynamic>(responseContent);

                            // Access properties
                            string res_email = jsonObject.data.user.email;
                            string res_token = jsonObject.data.token;

                            ApiClient user = new ApiClient(res_email, res_token);

                            
                            gelukt.Show();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Login failed. Please check your credentials and try again.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred during login: {ex.Message}");
                
            } finally
            {
                this.Close();
            }

        }

        private void HpRegister_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
