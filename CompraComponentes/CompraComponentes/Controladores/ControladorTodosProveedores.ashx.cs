using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CompraComponentes;
using CompraComponentes.Clases;

namespace CompraComponentes.Controladores
{
    /// <summary>
    /// Descripción breve de ControladorTodosProveedores
    /// </summary>
    public class ControladorTodosProveedores : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlCommand cmdProveedores = new SqlCommand()
            {
                CommandText = "select CodProveedor, NombreProv from SGE_Proveedores",
                CommandType = CommandType.Text,
                Connection = new SqlConnection("Data Source=SEGUNDO150\\SEGUNDO;Initial Catalog=DAM2-EfrainHernandez;Integrated Security=True")
            };
            cmdProveedores.Connection.Open();

            SqlDataReader reader = cmdProveedores.ExecuteReader();

            List<Proveedores> proveedores = new List<Proveedores>();

            while (reader.Read())
            {
                proveedores.Add(new Proveedores(reader.GetInt32(0) , reader.GetString(1)));
            }
            JavaScriptSerializer serializador = new JavaScriptSerializer();
            string json = serializador.Serialize(proveedores);

            context.Response.ContentType = "text/plain";
            context.Response.Write(json);
            cmdProveedores.Connection.Close();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}