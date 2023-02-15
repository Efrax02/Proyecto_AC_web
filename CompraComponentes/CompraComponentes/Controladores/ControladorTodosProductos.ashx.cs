using CompraComponentes.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CompraComponentes.Controladores
{
    /// <summary>
    /// Descripción breve de ControladorTodosProductos
    /// </summary>
    public class ControladorTodosProductos : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlCommand cmdProuctos = new SqlCommand()
            {
                CommandText = "select CodProducto, NombreProd from SGE_Productos_Proveedores",
                CommandType = CommandType.Text,
                Connection = new SqlConnection("Data Source=SEGUNDO150\\SEGUNDO;Initial Catalog=DAM2-EfrainHernandez;Integrated Security=True")
            };
            cmdProuctos.Connection.Open();

            SqlDataReader reader = cmdProuctos.ExecuteReader();

            List<Productos_Proveedores> productos = new List<Productos_Proveedores>();

            while (reader.Read())
            {
                productos.Add(new Productos_Proveedores(reader.GetInt32(0), reader.GetString(1)));
            }
            JavaScriptSerializer serializador = new JavaScriptSerializer();
            string json = serializador.Serialize(productos);

            context.Response.ContentType = "text/plain";
            context.Response.Write(json);
            cmdProuctos.Connection.Close();
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