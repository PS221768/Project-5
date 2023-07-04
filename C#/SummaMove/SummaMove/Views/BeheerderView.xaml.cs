using MySql.Data.MySqlClient;
using SummaMove.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Common;
using System.Linq;
using System.Runtime.CompilerServices;
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
using System.Xml.Linq;

namespace SummaMove.Views
{
    /// <summary>
    /// Interaction logic for BeheerderView.xaml
    /// </summary>
    /// 
    

    public partial class BeheerderView : Window, INotifyPropertyChanged
    {
        public byte[] Afbeelding { get; set; }

        DBSummaMove _conn = new DBSummaMove();
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string info = null)
        {
            PropertyChanged.Invoke(this, new PropertyChangedEventArgs(info));
        }

        private ObservableCollection<Exercises> exercise = new ObservableCollection<Exercises>();
        public ObservableCollection<Exercises> Exercise 
        { 
            get { return exercise; }
            set { exercise = value; }
        }

        private Exercises selectedexercise;

        public Exercises SelectedExercise
        {
            get { return selectedexercise; }
            set { selectedexercise = value; OnPropertyChanged(); }
        }

        public BeheerderView()
        {
            InitializeComponent();
            PopulateExercises();
            String path = System.IO.Path.GetFullPath(".\\Images\\logo-1861420_1280.jpg");
            Afbeelding = System.IO.File.ReadAllBytes(path);
            //Afbeelding = System.IO.File.ReadAllBytes("C:\\Users\\Omar\\Documents\\Leerjaar 2\\Project5\\Project-5\\C#\\SummaMove\\SummaMove\\bin\\Debug\\Images\\logo-1861420_1280.jpg");
            DataContext = this;
        }

        private void PopulateExercises()
        {
            exercise.Clear();
            string dbresult = _conn.GetExercises(Exercise);
            if (dbresult != DBSummaMove.OK)
            {
                MessageBox.Show(dbresult);
            }
        }

        private void BtNewExercise_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string querry = "INSERT INTO exercises (name, description) VALUES ( @name , @description)";
                DbParameter[] parameters = new DbParameter[]
                {
                    new MySqlParameter("@name", TbName.Text),
                    new MySqlParameter("@description", TbDescription.Text)
                };
                string result = _conn.CreateExercise(querry, parameters);
                if (result == DBSummaMove.OK)
                {
                    PopulateExercises();
                    MessageBox.Show("Exercise succesfully created");
                }
                else
                {
                    MessageBox.Show("There went something wrong with creating an exercise");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("There went something wrong");
            }
            return; 
        }

        private void BtEditExercise_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (SelectedExercise == null)
                {
                    MessageBox.Show("Selecteer eerst de persoon die u wilt wijzigen", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);

                }
                else
                {


                    string name = SelectedExercise.name;
                    string description = SelectedExercise.description;

                    string query = "UPDATE exercises SET name = @Name, description = @Description, email = @Email, postcode = @Postcode , rekeningnummer = @Rekeningnummer, functie = @Functie WHERE id = @Id";
                    DbParameter[] parameters = new DbParameter[]
                    {
                new MySqlParameter("@Name", name),
                new MySqlParameter("@Description", description)
                    };

                    string result = _conn.EditExercise(query, parameters);
                    if (result == DBSummaMove.OK)
                    {
                        PopulateExercises();
                        MessageBox.Show("Exercise succesfully edited");
                    }  
                    else
                    {
                        MessageBox.Show("There went something wrong with editing an exercise " + result);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exercise succesfully edited");
            }

            return;
        }

        private void BtDeleteExercise_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (SelectedExercise == null)
                {
                    MessageBox.Show("First select the exercise you want to delete", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);

                }
                else
                {
                    int id = SelectedExercise.Id;

                    string query = " DELETE FROM `exercises` WHERE id = @Id";
                    DbParameter[] parameters = new DbParameter[]
                    {
                new MySqlParameter("@Id", id),
                    };

                    string result = _conn.DeleteExercise(query, parameters);
                    if (result == DBSummaMove.OK)
                    {
                        PopulateExercises();
                        MessageBox.Show("Exercise succesfully deleted");
                    }
                    else
                    {
                        MessageBox.Show("There went something wrong with deleting an exercise " + result);
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("There went something wrong");
            }

            return;
        }

        private void BtLogout_Click(object sender, RoutedEventArgs e)
        {
            Login logout = new Login();
            logout.Show();
            this.Close();
        }


        private void BtUsers_Click_1(object sender, RoutedEventArgs e)
        {
            UserWindow users = new UserWindow();
            users.Show();
            this.Close();
        }
    }
}
