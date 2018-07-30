using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassRepasoAccesoDatos;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Class1 miClase = new Class1();
        DataSet ds;
        DataTable dt = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Reload();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            miClase.AbrirConexion(ref msj);
            TextBox1.Text = msj;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            string sentencia = "Insert into Grupo(Grado, Letra, Nivel) values (";
            SqlConnection ctemp = null;
            ctemp=miClase.AbrirConexion(ref msj);
            bool validate = miClase.ConsultarBd("SELECT * FROM Grupo WHERE Grado='" + DropDownList10.SelectedValue + "' and Letra='" + DropDownList11.SelectedValue + "' AND Nivel='" + DropDownList12.SelectedValue + "';", ctemp, ref msj);
            if (ctemp != null && validate == true)
            {
                sentencia += DropDownList10.SelectedValue + ",'" + DropDownList11.SelectedValue + "','" + DropDownList12.SelectedValue + "');";
                miClase.InsertarBd(sentencia, ctemp, ref msj);
                TextBox1.Text = msj;
            }
            Reload();
            TextBox1.Text = msj;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string mens = "";
            string query1 = "SELECT Ho.IdHora, Ho.HoraInicio, Ho.HoraFin, H.IdDia,D.Dia, M.IdMateria, M.Nombre, CONCAT(P.Nombre,' ',P.Apellidos) AS Profesor  FROM Grupo as G INNER JOIN Asignacion as A ON A.IdGrupo= G.IdGrupo INNER JOIN Horario as H ON H.IdAsignacion = A.IdAsignacion INNER JOIN Materia as M on M.IdMateria= A.IdMateria INNER JOIN Profesor as P ON P.IdProfesor = A.IdProfesor INNER JOIN Hora as Ho on H.IdHora= Ho.IdHora INNER JOIN Dias as D on H.IdDia= D.IdDia  WHERE G.IdGrupo="+DropDownList1.SelectedValue+";";
            string query2 = "SELECT * FROM Hora;";
            string query3 = "SELECT * FROM Dias;";

            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref mens);
            DataSet recupera = null;
            DataTable SQL = new DataTable();
            DataTable Horas = new DataTable();
            DataTable Dias = new DataTable();
            DataTable Horario = new DataTable();

            if (ctemp != null)
            {
                recupera = miClase.QueryDataSet(query1, ctemp,ref mens);
                SQL = recupera.Tables[0];
                recupera = miClase.QueryDataSet(query2, ctemp, ref mens);
                Horas = recupera.Tables[0];
                recupera = miClase.QueryDataSet(query3, ctemp, ref mens);
                Dias = recupera.Tables[0];

                Horario.Columns.Add("Horario/Dias");
                Horario.Columns.Add("Lunes");
                Horario.Columns.Add("Martes");
                Horario.Columns.Add("Miercoles");
                Horario.Columns.Add("Jueves");
                Horario.Columns.Add("Viernes");
                
                for (int i = 0; i < Horas.Rows.Count; i++)
                {
                    DataRow dr = Horario.NewRow();
                    for (int x = 0; x <=5; x++) 
                        {
                            if (x==0)
                            {
                                dr[x] = Horas.Rows[i]["HoraInicio"] + " - " + Horas.Rows[i]["HoraFin"];
                            }
                            else
                            {
                                bool aux = false;
                                for (int s = 0; s < SQL.Rows.Count; s++)
                                {
                                    if ((int)SQL.Rows[s][0] == (int)Horas.Rows[i][0] && (int)SQL.Rows[s][3] == (int)Dias.Rows[x - 1][0])
                                    {
                                        dr[x] = SQL.Rows[s]["Nombre"]+" - "+ SQL.Rows[s]["Profesor"];
                                        aux = true;
                                    }
                                }

                                if (aux==false) { dr[x] = "-"; }
                            }
                    }
                    Horario.Rows.Add(dr);
                }
                
                if(Horario.Rows.Count>0)
                {
                    GridView1.DataSource = Horario;
                    GridView1.DataBind();
                }

                TextBox1.Text = mens;
            }
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                
            /*string msj = "";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("grad", SqlDbType.Int));
            lista.Add(new SqlParameter("letra", SqlDbType.VarChar,1));
            lista.Add(new SqlParameter("Status", SqlDbType.Int));
            lista[0].Value = TextBox2.Text;
            lista[1].Value = TextBox3.Text;
            lista[2].Value = TextBox4.Text;

            string sentencia = "Insert into Grupos(Grado, Letra, Nivel) values (@grad,@letra, @Status)";
            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref msj);
            if (ctemp != null)
            {
                sentencia = TextBox2.Text + "," + TextBox3.Text + "," + TextBox4.Text + ");";
                miClase.InsertarBd(sentencia, ctemp, ref msj);
                TextBox1.Text = msj;
            }*/
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            string sentencia = "Insert into Asignacion(IdCuatrimestre, IdGrupo,IdMateria, IdProfesor) values (";
            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref msj);
            bool validate = miClase.ConsultarBd("SELECT * FROM Asignacion WHERE IdCuatrimestre=" + DropDownList5.SelectedValue + " and IdGrupo=" + DropDownList2.SelectedValue + " AND IdMateria=" + DropDownList3.SelectedValue + " AND IdProfesor=" + DropDownList4.SelectedValue + ";", ctemp, ref msj);
            if (ctemp != null && validate == true)
            {
                sentencia += DropDownList5.SelectedValue + "," + DropDownList2.SelectedValue + "," + DropDownList3.SelectedValue + ","+ DropDownList4.SelectedValue+");";
                miClase.InsertarBd(sentencia, ctemp, ref msj);
                
            }
            Reload();
            TextBox1.Text = msj;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            string sentencia = "Insert into Materia(Nombre) values (";
            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref msj);
            if (ctemp != null)
            {
                if (validar(TextBox5.Text) == true)
                {
                    bool validate = miClase.ConsultarBd("SELECT * FROM Materia WHERE Nombre='" + TextBox5.Text + "';", ctemp, ref msj);
                    if ( validate == true)
                    {
                        sentencia += "'" + TextBox5.Text + "');";
                        miClase.InsertarBd(sentencia, ctemp, ref msj);
                    }
                }
                else
                {
                    msj = "No se permiten caracteres especiales.";
                }
                
            }

            Reload();
            TextBox1.Text = msj;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            string sentencia = "Insert into Profesor(Nombre, Apellidos) values (";
            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref msj);
            if (ctemp != null)
            {
                if (validar(TextBox6.Text) ==true && validar(TextBox2.Text) ==true)
                {
                    bool validate = miClase.ConsultarBd("SELECT * FROM Profesor WHERE Nombre='" + TextBox6.Text + "' AND Apellidos='" + TextBox2.Text + "'", ctemp, ref msj);
                    if (validate == true)
                    {
                        sentencia += "'" + TextBox6.Text + "','" + TextBox2.Text + "'); ";
                        miClase.InsertarBd(sentencia, ctemp, ref msj);
                    }
                }
                else
                {
                    msj = "No se permiten caracteres especiales.";
                }
                
                
            }
            Reload();
            TextBox1.Text = msj;
        }

      

        protected void Button_Click(object sender, EventArgs e)
        {
            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string msj = "";
            string sentencia = "Insert into Horario(IdAsignacion, IdHora,IdDia) values (";
            SqlConnection ctemp = null;
            ctemp = miClase.AbrirConexion(ref msj);
            bool validate = miClase.ConsultarBd("SELECT * FROM Horario WHERE IdAsignacion=" + DropDownList7.SelectedValue + " and IdHora=" + DropDownList9.SelectedValue + " AND IdDia=" + DropDownList8.SelectedValue + ";", ctemp, ref msj);
            if (ctemp != null && validate == true)
            {
                sentencia += DropDownList7.SelectedValue + "," + DropDownList9.SelectedValue + "," + DropDownList8.SelectedValue + ");";
                miClase.InsertarBd(sentencia, ctemp, ref msj);
                
            }
            Reload();
            TextBox1.Text = msj;
        }

        public bool validar(string cadena)
        {
            Regex regx = new Regex("^[a-zA-Z0-9_ ]*$");
            return regx.IsMatch(cadena);
        }

        public void Reload()
        {
            DropDownList1.Items.Clear();
            DropDownList2.Items.Clear();
            DropDownList3.Items.Clear();
            DropDownList4.Items.Clear();
            DropDownList5.Items.Clear();
            DropDownList8.Items.Clear();
            DropDownList7.Items.Clear();
            DropDownList9.Items.Clear();

            miClase.cadenaco = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            string msj = "";

            string sentencia = "select * from Grupo;";
            string materias = "SELECT * FROM Materia;";
            string maestros = "SELECT * FROM Profesor;";
            string periodos = "SELECT * FROM Cuatrimestre;";
            string asignaciones = "SELECT A.IdAsignacion, M.Nombre as Materia, g.Grado, G.Letra, G.Nivel, P.Nombre  FROM Asignacion as A INNER JOIN Grupo as G on G.IdGrupo = A.IdGrupo INNER JOIN Materia as M ON M.IdMateria = A.IdMateria INNER JOIN Profesor as P on P.IdProfesor = A.IdProfesor";
            string horas = "SELECT * FROM Hora;";
            string dias = "SELECT * FROM Dias;";
            
            SqlConnection ctemp = null;

            ctemp = miClase.AbrirConexion(ref msj);
            miClase.AbrirConexion(ref msj);

            if (ctemp != null)
            {
                ds = miClase.QueryDataSet(sentencia, ctemp, ref msj);

                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdGrupo"].ToString();
                        listItem.Text = dt.Rows[x]["Grado"].ToString() + "º" + dt.Rows[x]["Letra"].ToString() + " Nivel: " + dt.Rows[x]["Nivel"].ToString();

                        DropDownList1.Items.Add(listItem);
                        DropDownList2.Items.Add(listItem);
                        DropDownList6.Items.Add(listItem);
                    }
                }

                ds = miClase.QueryDataSet(materias, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdMateria"].ToString();
                        listItem.Text = dt.Rows[x]["Nombre"].ToString();
                        DropDownList3.Items.Add(listItem);
                    }
                }

                ds = miClase.QueryDataSet(maestros, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    ListItem li = new ListItem();
                    li.Value = "";
                    li.Text = "";
                    DropDownList16.Items.Add(li);
                    DropDownList13.Items.Add(li);
                    DropDownList17.Items.Add(li);
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdProfesor"].ToString();
                        listItem.Text = dt.Rows[x]["Nombre"].ToString() + " " + dt.Rows[x]["Apellidos"].ToString();

                        DropDownList4.Items.Add(listItem);
                        DropDownList13.Items.Add(listItem);
                        DropDownList16.Items.Add(listItem);

                        DropDownList17.Items.Add(listItem);

                    }
                }

                ds = miClase.QueryDataSet(periodos, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdCuatrimestre"].ToString();
                        listItem.Text = dt.Rows[x]["Nombre"].ToString();

                        DropDownList5.Items.Add(listItem);
                    }
                }

                ds = miClase.QueryDataSet(asignaciones, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdAsignacion"].ToString();
                        listItem.Text = dt.Rows[x]["Materia"].ToString() + " - " + dt.Rows[x]["Grado"].ToString() + "º" + dt.Rows[x]["Nombre"].ToString() + " " + dt.Rows[x]["Nivel"].ToString();

                        DropDownList7.Items.Add(listItem);
                    }
                }

                

                ds = miClase.QueryDataSet(horas, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdHora"].ToString();
                        listItem.Text = dt.Rows[x]["HoraInicio"].ToString() + " - " + dt.Rows[x]["HoraFin"].ToString();

                        DropDownList9.Items.Add(listItem);
                        Hora.Items.Add(listItem);
                    }
                }

                ds = miClase.QueryDataSet(dias, ctemp, ref msj);
                dt = ds.Tables[0];

                if (dt != null)
                {
                    for (int x = 0; x < dt.Rows.Count; x++)
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = dt.Rows[x]["IdDia"].ToString();
                        listItem.Text = dt.Rows[x]["Dia"].ToString();

                        DropDownList8.Items.Add(listItem);
                        DropDownList14.Items.Add(listItem);
                    }
                }

                ctemp.Close();
            }
            
        }
    }
}