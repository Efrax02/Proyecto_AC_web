using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.Configuration;

namespace Servicios
{
    /// <summary>
    /// Descripción breve de ServicioLoggin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ServicioLoggin : System.Web.Services.WebService
    {
        private string ConnectionString;

        public ServicioLoggin()
        {
            ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString;
        }

        [WebMethod]
        public bool InicioSesion(string usuario, string contraseña)
        {
            Loggin sesion;
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdIniciarSesion = new SqlCommand("WEB.obtener_usuario", con);
            cmdIniciarSesion.CommandType = CommandType.StoredProcedure;
            cmdIniciarSesion.Parameters.Add(new SqlParameter("@p_Usuario", SqlDbType.Char, 3));
            cmdIniciarSesion.Parameters["@p_Usuario"].Value = usuario;
            con.Open();
            SqlDataReader lector = cmdIniciarSesion.ExecuteReader();
            try
            {
                sesion = new Loggin((string)lector.GetString(0));
                byte[] encriptado = Convert.FromBase64String(sesion.Contraseña);
                string pass = Encoding.Unicode.GetString(encriptado);
                if (contraseña.CompareTo("pass") == 0)
                {
                    return true;
                }
                return false;

            }
            catch (SqlException err)
            {
                throw new ApplicationException($"Error en los datos {err.Message}");
            }
            finally
            {
                cmdIniciarSesion.Connection.Close();
            }
        }
    }
}
