using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;

namespace CompraComponentes.App_Code
{
    public class DB_Pedidos
    {
        private string ConnectionString;

        public DB_Pedidos()
        {
            ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString;
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezEFRAX"].ConnectionString;
        }
        public DB_Pedidos(string connectionString)
        {
            ConnectionString = connectionString;
        }

        public List<Productos_Proveedores> MostrarProductos()
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_productos", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Productos_Proveedores> lista = new List<Productos_Proveedores>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while(lector.Read())
                {
                    Productos_Proveedores prod = new Productos_Proveedores(
                        (int)lector.GetInt32(0),
                        (int)lector.GetInt32(1),
                        (string)lector.GetString(2),
                        (SqlMoney)lector.GetSqlMoney(3),
                        (int)lector.GetInt32(4),
                        (int)lector.GetInt32(5),
                        (int)lector.GetInt32(6)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
            }
            catch(SqlException err)
            {
                throw new ApplicationException("Error en los datos" + err.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public void InsertarPedido(Pedidos_Tienda pedidos_Tienda,
            Lineas_Pedidos_Tienda lineas)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.realizar_pedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@p_fechaPed", SqlDbType.SmallDateTime));
            cmd.Parameters["@p_fechaPed"].Value = pedidos_Tienda.FechaPedido;
            cmd.Parameters.Add(new SqlParameter("@p_fechaEntrgas", SqlDbType.SmallDateTime));
            cmd.Parameters["@p_fechaEntrgas"].Value = pedidos_Tienda.FechaEntrega;
            cmd.Parameters.Add(new SqlParameter("@p_codProducto", SqlDbType.Int));
            cmd.Parameters["@p_codProducto"].Value = lineas.CodProducto;
            cmd.Parameters.Add(new SqlParameter("@p_unidades", SqlDbType.Int));
            cmd.Parameters["@p_unidades"].Value = lineas.Unidades;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Error en los datos" + err.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}