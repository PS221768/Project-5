using SummaMove.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
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

namespace SummaMove.Views
{
    /// <summary>
    /// Interaction logic for UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        DBSummaMove _conn = new DBSummaMove();

        private ObservableCollection<Users> user = new ObservableCollection<Users>();
        public ObservableCollection<Users> User
        {
            get { return user; }
            set { user = value; }
        }
        public UserWindow()
        {
            InitializeComponent();
            PopulateUsers();
            DataContext = this;
        }
        private void PopulateUsers()
        {
            user.Clear();
            string dbresult = _conn.GetUsers(User);
            if (dbresult != DBSummaMove.OK)
            {
                MessageBox.Show(dbresult);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            BeheerderView terug = new BeheerderView();
            terug.Show();
            this.Close();
        }
    }
}
