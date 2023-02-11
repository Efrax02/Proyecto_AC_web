using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;

namespace Servicios
{
    /// <summary>
    /// Descripción breve de ServicioCrearUsuario
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ServicioCrearUsuario : System.Web.Services.WebService
    {
        private string ConnectionString;

        public ServicioCrearUsuario()
        {
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSPYRO"].ConnectionString;
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString;
            ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezEFRAX"].ConnectionString;
        }

        [WebMethod]
        public void NuevoUsuario(string contraseña, string usuario, string nombre, string apellido)
        {
            byte[] encriptar = Encoding.Unicode.GetBytes(contraseña);
            string pass = Convert.ToBase64String(encriptar);
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdNuevoUsuario = new SqlCommand("WEB.usuario_nuevo", con);
            cmdNuevoUsuario.CommandType = CommandType.StoredProcedure;

            Loggin sesion = new Loggin(usuario, pass, nombre, apellido);

            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Usuario", SqlDbType.Char, 3));
            cmdNuevoUsuario.Parameters["@p_Usuario"].Value = sesion.Nom_Usuario;
            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Contraseña", SqlDbType.VarChar, 100));
            cmdNuevoUsuario.Parameters["@p_Contraseña"].Value = sesion.Contraseña;
            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Nombre", SqlDbType.VarChar, 50));
            cmdNuevoUsuario.Parameters["@p_Nombre"].Value = sesion.Nombre;
            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Apellido", SqlDbType.VarChar, 50));
            cmdNuevoUsuario.Parameters["@p_Apellido"].Value = sesion.Apellido;

            try
            {
                con.Open();
                cmdNuevoUsuario.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                throw new ApplicationException($"Error en los datos {err.Message}");
            }
            finally
            {
                con.Close();
            }
        }
    }
}
