using MySql.Data.MySqlClient;
using SummaMove.Views;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SummaMove.Models
{
    public class DBSummaMove
    {
        private readonly string _conn = ConfigurationManager.ConnectionStrings["MySqlConnectionString"].ConnectionString;
        public static readonly string UNKNOWN = "Unknown";
        public static readonly string OK = "OK";
        public static readonly string NOTFOUND = "Notfound";

        #region Crud Exercises
        public string GetExercises (ICollection<Exercises> exercises)
        {
            if (exercises == null)
            {
                throw new ArgumentException("Ongeldig argumt bij gebruik van GetExercises");
            }
            string methodResult = "unkown";
            using (MySqlConnection conn = new MySqlConnection(_conn))
            {
                try
                {
                    conn.Open();
                    MySqlCommand cmd = conn.CreateCommand();
                    cmd.CommandText = "SELECT * FROM `exercises`";
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Exercises exercise = new Exercises()
                        {
                            name = reader.GetString("name"),
                            description = reader.GetString("description"),
                        };
                        exercises.Add(exercise);
                    }
                    methodResult = OK;
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine(nameof(GetExercises));
                    Console.Error.WriteLine(e.Message);
                    methodResult = e.Message;
                    throw;
                }
            }
            return methodResult;
        }

        public string CreateExercise(string querry, DbParameter[] parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_conn))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand(querry, connection))
                {
                    command.Parameters.AddRange(parameters);
                    try
                    {
                        int rowsaffected = command.ExecuteNonQuery();
                        if (rowsaffected == 1)
                        {
                            return "OK";
                        }
                        else
                        {
                            return "Error";
                        }
                    }
                    catch (SqlException ex)
                    {

                        return "Error: " + ex.Message;
                    }
                }
            }

        }

        public string EditExercise(string querry, DbParameter[] parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_conn))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand(querry, connection))
                {
                    command.Parameters.AddRange(parameters);
                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected == 1)
                        {
                            return "OK";
                        }
                        else
                        {
                            return "Error: Onverwachtte nummers van rijen beïnlvoed";
                        }
                    }
                    catch (SqlException ex)
                    {
                        return "Error: " + ex.Message;
                    }
                }
            }
        }

        public string DeleteExercise(string querry, DbParameter[] parameters)
        {
            using (MySqlConnection connection = new MySqlConnection(_conn))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand(querry, connection))
                {
                    command.Parameters.AddRange(parameters);
                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected == 1)
                        {
                            return "OK";
                        }
                        else
                        {
                            return "Error";
                        }
                    }
                    catch (SqlException ex)
                    {
                        return "Error: " + ex.Message;
                    }
                }
            }
        }
        #endregion
        public string GetUsers(ICollection<Users> users)
        {
            if (users == null)
            {
                throw new ArgumentException("Ongeldig argumt bij gebruik van GetUsers");
            }
            string methodResult = "unkown";
            using (MySqlConnection conn = new MySqlConnection(_conn))
            {
                try
                {
                    conn.Open();
                    MySqlCommand cmd = conn.CreateCommand();
                    cmd.CommandText = "SELECT * FROM `users`";
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Users user = new Users()
                        {
                            name = reader.GetString("name"),
                            email = reader.GetString("email"),
                        };
                        users.Add(user);
                    }
                    methodResult = OK;
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine(nameof(GetUsers));
                    Console.Error.WriteLine(e.Message);
                    methodResult = e.Message;
                    throw;
                }
            }
            return methodResult;
        }
    }
}