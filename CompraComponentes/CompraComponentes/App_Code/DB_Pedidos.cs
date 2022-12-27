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
                throw new ApplicationException($"Error en los datos {err.Message}");
            }
            finally
            {
                con.Close();
            }
        }
        public List<Proveedores> MostrarNombresProveedor()
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_nombres_proveedor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Proveedores> lista = new List<Proveedores>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Proveedores prov = new Proveedores(
                        (int)lector.GetInt32(0),
                        (string)lector.GetString(1)
                        );
                    lista.Add(prov);
                }
                lector.Close();
                return lista;
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
        public List<Productos_Proveedores> MostrarNombresProductos()
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_nombres_producto", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Productos_Proveedores> lista = new List<Productos_Proveedores>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Productos_Proveedores prod = new Productos_Proveedores(
                        (int)lector.GetInt32(0),
                        (string)lector.GetString(1)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
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
                throw new ApplicationException($"Error en los datos {err.Message}");
            }
            finally
            {
                con.Close();
            }
        }
        public List<Lineas_Pedidos_Tienda> MostrarPedidosInsertar()
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_lineas_pedidos_insertar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Lineas_Pedidos_Tienda> lista = new List<Lineas_Pedidos_Tienda>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Lineas_Pedidos_Tienda prod = new Lineas_Pedidos_Tienda(
                        (int)lector.GetInt32(0),
                        (int)lector.GetInt32(1),
                        (int)lector.GetInt32(2)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
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
        public List<Pedidos_Tienda> MostrarPedidosFecha(string fecha)
        {
            SqlDateTime.Parse(fecha);
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_pedidos_por_fecha", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@p_fechaPedido", SqlDbType.SmallDateTime));
            cmd.Parameters["@p_fechaPedido"].Value = fecha;
            List<Pedidos_Tienda> lista = new List<Pedidos_Tienda>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Pedidos_Tienda prod = new Pedidos_Tienda(
                        (int)lector.GetInt32(0),
                        (SqlDateTime)lector.GetSqlDateTime(1),
                        (SqlDateTime)lector.GetSqlDateTime(2)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
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
        public List<Lineas_Pedidos_Tienda> MostrarPedidosCodPedido(int CodPedido)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_lineas_pedidos_por_codigo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.Int));
            cmd.Parameters["@p_codPedido"].Value = CodPedido;
            List<Lineas_Pedidos_Tienda> lista = new List<Lineas_Pedidos_Tienda>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Lineas_Pedidos_Tienda prod = new Lineas_Pedidos_Tienda(
                        (int)lector.GetInt32(0),
                        (int)lector.GetInt32(1),
                        (int)lector.GetInt32(2),
                        (int)lector.GetInt32(3),
                        (int)lector.GetInt32(4)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
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
        public void EliminarPedido(int CodPedido)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdLeer = new SqlCommand("WEB.mostrar_lineas_pedidos_por_codigo",con);
            SqlCommand cmdDelete = new SqlCommand("WEB.eliminar_pedido", con);
            cmdLeer.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.Int));
            cmdLeer.Parameters["@p_codPedido"].Value = CodPedido;
            cmdDelete.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.Int));
            cmdDelete.Parameters["@p_codPedido"].Value = CodPedido;
            try
            {
                con.Open();
                SqlDataReader lector = cmdLeer.ExecuteReader();
                while(lector.Read())
                {
                    cmdDelete.ExecuteNonQuery();
                }
                lector.Close();
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
        public void ActualizarLineaPedido(int CodPedido, int CodProducto, int unidades)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdLeer = new SqlCommand("WEB.mostrar_lineas_pedidos_por_codigo", con);
            cmdLeer.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.Int));
            cmdLeer.Parameters["@p_codPedido"].Value = CodPedido;
            SqlCommand cmdActualizar = new SqlCommand("WEB.actualizar_pedido", con);
            cmdActualizar.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.Int));
            cmdActualizar.Parameters["@p_codPedido"].Value = CodPedido;
            cmdActualizar.Parameters.Add(new SqlParameter("@p_CodProducto",SqlDbType.Int));
            cmdActualizar.Parameters["@p_CodProducto"].Value = CodProducto;
            cmdActualizar.Parameters.Add(new SqlParameter("@p_Cantidad", SqlDbType.Int));
            cmdActualizar.Parameters["@p_Cantidad"].Value = unidades;
            try
            {
                con.Open();
                SqlDataReader lector = cmdLeer.ExecuteReader();
                List<Lineas_Pedidos_Tienda> lista = new List<Lineas_Pedidos_Tienda>();
                while (lector.Read())
                {
                    Lineas_Pedidos_Tienda prod = new Lineas_Pedidos_Tienda(
                        (int)lector.GetInt32(0),
                        (int)lector.GetInt32(1),
                        (int)lector.GetInt32(2),
                        (int)lector.GetInt32(3),
                        (int)lector.GetInt32(4)
                        );
                    lista.Add(prod);
                }
                cmdActualizar.ExecuteNonQuery();
            }
            catch(SqlException err)
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