﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;
using System.ServiceModel.Activation;
using System.Data;
using Newtonsoft.Json;

namespace MiServicioWeb
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service1 : IService1
    {
        

        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        public bool AgregarAsesoria(Asesoria a)
        {
            bool exito = false;

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "INSERT INTO Asesorias values(" + a.Idprofesor +"," + a.Cupo +"," + a.Dia + "," + a.Idhora +" )";
                int validacion= comando.ExecuteNonQuery();

                if(validacion>0)
                {
                    exito = true;

                }
                else
                {
                    exito = false;
                }


                conexion.Close();
            }
            catch (Exception x)
            {
                conexion.Close();
            }

            return exito;
        }

        public double Operacion()
        {
            return 1 + 1;
        }

        public List<Person> GetPlayers()
        {
            List<Person> players = new List<Person>();
            players.Add(new Person { FirstName = "Peyton", LastName = "Manning", Age = 35 });
            players.Add(new Person { FirstName = "Drew", LastName = "Brees", Age = 31 });
            players.Add(new Person { FirstName = "Brett", LastName = "Favre", Age = 58 });

            return players;
        }

        public DataSet QueryDataSet(string query_sql, SqlConnection cn_ad)
        {
            SqlCommand comando = new SqlCommand();
            comando.CommandText = query_sql;
            comando.Connection = cn_ad;
            DataSet caja = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            adp.SelectCommand = comando;

            try
            {
                adp.Fill(caja);
            }
            catch (Exception e)
            {
                caja = null;
            }

            return caja;
        }

        public string AsesoriasProfesor(Profesor p)
        {
            string consulta = "SELECT * FROM Asesorias as A INNER JOIN Dias as D ON D.IdDia= A.Dia INNER JOIN Hora as H ON H.IdHora= A.IdHora WHERE A.IdProfesor=" + p.idprofesor + " ;";
            Respuesta respuesta = new Respuesta();
            try
            {
                conexion.Open();
                DataSet ds = QueryDataSet(consulta, conexion);
                conexion.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    respuesta.exito = true;
                    respuesta.html= ds.Tables[0];

                }
                else
                {
                    respuesta.exito = false;
                }
                
            }
            catch (Exception x)
            {
                conexion.Close();
            }
            return JsonConvert.SerializeObject(respuesta);

        }

        public string MH(Profesor p)
        {
            //ese profesor se reutilizo para asesoria
            string AA = "SELECT * FROM Asesorias as A INNER JOIN AA as AA ON AA.IdAsesoria=A.IdAsesoria WHERE A.IdAsesoria="+p.idprofesor+"; ";

            DataSet ds = null;
            Respuesta respuesta = new Respuesta();
            try
            {
                conexion.Open();
                ds = QueryDataSet(AA, conexion);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    respuesta.exito = true;
                    respuesta.html = ds.Tables[0];

                }
                else
                {
                    respuesta.exito =false;
                }

                conexion.Close();
            }
            catch (Exception x)
            {
                conexion.Close();
            }

            return JsonConvert.SerializeObject(respuesta);
        }

        public bool AgregarInscripcion(AA a)
        {
            bool exito = false;

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "INSERT INTO AA values(" + a.Idasesoria + "," + a.Matricula + ",'" + a.Nombre + "','" + a.Tema + "')";
                int validacion = comando.ExecuteNonQuery();

                if (validacion > 0)
                {
                    exito = true;

                }
                else
                {
                    exito = false;
                }


                conexion.Close();
            }
            catch (Exception x)
            {
                conexion.Close();
            }

            return exito;
        }

        public bool EliminarAsesoria(Profesor p)
        {
            bool exito = false;

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "DELETE FROM Asesorias WHERE IdAsesoria="+p.idprofesor+";";
                int validacion = comando.ExecuteNonQuery();

                if (validacion > 0)
                {
                    exito = true;

                }
                else
                {
                    exito = false;
                }


                conexion.Close();
            }
            catch (Exception x)
            {
                conexion.Close();
            }

            return exito;
        }

        public bool EliminarAA(Profesor p)
        {
            bool exito = false;

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "DELETE FROM AA WHERE IdAA="+p.idprofesor+";";
                int validacion = comando.ExecuteNonQuery();

                if (validacion > 0)
                {
                    exito = true;

                }
                else
                {
                    exito = false;
                }


                conexion.Close();
            }
            catch (Exception x)
            {
                conexion.Close();
            }

            return exito;
        }
    }
}
