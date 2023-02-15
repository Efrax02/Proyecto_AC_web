using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace CompraComponentes.Controladores
{
    /// <summary>
    /// Descripción breve de ControladorAñadirPedido
    /// </summary>
    public class ControladorAñadirPedido : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlCommand cmdNuevoPedido = new SqlCommand()
            {
                CommandText = "WEB.realizar_pedido",
                CommandType = CommandType.StoredProcedure,
                Connection = new SqlConnection("Data Source=SEGUNDO150\\SEGUNDO;Initial Catalog=DAM2-EfrainHernandez;Integrated Security=True")
            };
            cmdNuevoPedido.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@p_CodPedido",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Input,
                Value = context.Request.QueryString["CodPedido"]
            });

            cmdNuevoPedido.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@p_CodProveedor",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Input,
                Value = context.Request.QueryString["CodProveedor"]
            });

            cmdNuevoPedido.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@p_codProducto",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Input,
                Value = context.Request.QueryString["CodProducto"]
            });

            cmdNuevoPedido.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@p_unidades",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Input,
                Value = context.Request.QueryString["Unidades"]
            });

            cmdNuevoPedido.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@p_salida",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Output,
            });

            cmdNuevoPedido.Connection.Open();
            cmdNuevoPedido.ExecuteNonQuery();

            context.Response.ContentType = "text/plain";
            context.Response.Write(cmdNuevoPedido.Parameters[4].Value);
            cmdNuevoPedido.Connection.Close();
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