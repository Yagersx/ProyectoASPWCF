using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace ClassRepasoAccesoDatos
{
    public class Class1
    {
        public String cadenaco { set; get; }

        public SqlConnection AbrirConexion(ref String mensaje)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = cadenaco;
            try
            {
                con.Open();
                mensaje = "Conexión abierta";
            }
            catch (Exception e)
            {
                con = null;
                mensaje = "Error: " + e.Message;
            }
            return con;
        }

        public Class1()
        {

        }

        public Class1(String cadena)
        {
            cadenaco = cadena;
        }

        public Boolean InsertarBd(string sentencia, SqlConnection conbd, ref string mensaje)
        {
            SqlCommand comando = new SqlCommand();
            comando.CommandText = sentencia;
            comando.Connection = conbd;
            Boolean salida = false;
            try
            {
                comando.ExecuteNonQuery();
                salida = true;
                mensaje = "Inserción Correcta";
            }
            catch (Exception e)
            {
                mensaje = "Error: " + e.Message;
            }
            return salida;
        }

        public Boolean ConsultarBd(string sentencia, SqlConnection conbd, ref string mensaje)
        {
            SqlCommand comando = new SqlCommand();
            comando.CommandText = sentencia;
            comando.Connection = conbd;
            Boolean salida = false;
            try
            {


                SqlDataAdapter da = new SqlDataAdapter(comando);
                DataTable dt = new DataTable();
                da.Fill(dt);


                int x = 0;
                int rows = dt.Rows.Count;

                if (dt.Rows.Count > 0)
                {
                    mensaje = "Lo que intentas agregar, ya existe.";
                    salida = false;
                }
                else
                {
                    salida = true;
                }
            }
            catch (Exception e)
            {
                mensaje = "Error: " + e.Message;
            }
            return salida;
        }

        public DataSet QueryDataSet(string query_sql, SqlConnection cn_ad, ref string mensaje)
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
                mensaje = "Consulta Correcta";
            }
            catch (Exception e)
            {
                caja = null;
                mensaje = "ERROR." + e.Message;
                throw;
            }

            return caja;
        }
        public Boolean InsertarSeguro(string sentencia, SqlConnection conbd, ref string mensaje, List<SqlParameter> p3)
        {
            SqlCommand comando = new SqlCommand();
            comando.CommandText = sentencia;
            comando.Connection = conbd;
            foreach (SqlParameter item in p3)
            {
                comando.Parameters.Add(item);
            }

            Boolean salida = false;
            try
            {
                comando.ExecuteNonQuery();
                salida = true;
                mensaje = "Inserción Correcta";
            }
            catch (Exception e)
            {
                mensaje = "Error: " + e.Message;
            }
            return salida;
        }
        public SqlDataReader QueryDataReader(string query_sql, SqlConnection cn_ad, ref string mensaje)
        {
            SqlCommand comando = new SqlCommand();
            comando.CommandText = query_sql;
            comando.Connection = cn_ad;
            DataSet caja = new DataSet();
            SqlDataReader cont = null;
            try
            {
                cont = comando.ExecuteReader();
                mensaje = "Consulta correctas";
            }
            catch (Exception e)
            {
                caja = null;
                mensaje = "ERROR." + e.Message;
            }
            return cont;
        }

    }
}
