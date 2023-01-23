﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using Servicios;

namespace Servicios
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Servicios : IServicios
    {
        private string ConnectionString;

        public Servicios()
        {
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSPYRO"].ConnectionString;
            ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString;
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezEFRAX"].ConnectionString;
        }

        public Sesion IniciarSesion(string usuario, string contraseña)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdIniciarSesion = new SqlCommand("WEB.obtener_usuario", con);
            cmdIniciarSesion.CommandType = CommandType.StoredProcedure;

            cmdIniciarSesion.Parameters.Add(new SqlParameter("@p_Usuario", SqlDbType.Char, 15));
            cmdIniciarSesion.Parameters["@p_Usuario"].Value = usuario;
            cmdIniciarSesion.Parameters.Add(new SqlParameter("@p_Contraseña", SqlDbType.VarChar, 100));
            cmdIniciarSesion.Parameters["@p_Contraseña"].Value = contraseña;
            try
            {

            }
            catch(SqlException err)
            {

            }
            finally 
            { 
                con.Close(); 
            }
            return null;
        }

        public void NuevoUsuario(string usuario, string contraseña)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdNuevoUsuario = new SqlCommand("WEB.usuario_nuevo", con);
            cmdNuevoUsuario.CommandType = CommandType.StoredProcedure;

            Sesion sesion = new Sesion (usuario, contraseña);

            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Usuario", SqlDbType.Char, 15));
            cmdNuevoUsuario.Parameters["@p_Usuario"].Value = sesion.Usuario;
            cmdNuevoUsuario.Parameters.Add(new SqlParameter("@p_Contraseña", SqlDbType.VarChar, 100));
            cmdNuevoUsuario.Parameters["@p_Contraseña"].Value = sesion.Password;

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

    public class Sesion
    {
        public Sesion(){}

        public Sesion(string usuario, string password)
        {
            Usuario = usuario;
            Password = password;
        }

        public string Usuario { get; set; }
        public string Password { get; set; }
    }
}