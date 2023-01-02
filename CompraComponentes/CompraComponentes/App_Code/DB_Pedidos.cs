using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using System.Activities.Validation;

namespace CompraComponentes.App_Code
{
    public class DB_Pedidos
    {
        private string ConnectionString;

        public DB_Pedidos()
        {
            ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSPYRO"].ConnectionString;
            //ConnectionString = WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString;
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
        //TODO INSERTAR PEDIDOS  Cambiar los tippos de las variables en el procedimiento almacenado
        public void InsertarPedido(string CodPedido, string CodProducto, string Unidades)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.realizar_pedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            Lineas_Pedidos_Tienda lineas = new Lineas_Pedidos_Tienda(CodPedido,CodProducto, Unidades);

            cmd.Parameters.Add(new SqlParameter("@p_CodPedido", SqlDbType.NChar, 10));
            cmd.Parameters["@p_CodPedido"].Value = lineas.CodPedido;
            cmd.Parameters.Add(new SqlParameter("@p_codProducto", SqlDbType.NChar, 10));
            cmd.Parameters["@p_codProducto"].Value = lineas.CodProducto;
            cmd.Parameters.Add(new SqlParameter("@p_unidades", SqlDbType.NChar, 10));
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
        //TODO MOTRAR PEDIDOS INSERTAR Cambiar los tipos de las variables en el procedimiendo alamacenado
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
                        (string)lector.GetString(0),
                        (string)lector.GetString(1),
                        (string)lector.GetString(2)
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
        public List<Lineas_Pedidos_Tienda> MostrarPedidosCodPedido(string CodPedido)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("WEB.mostrar_lineas_pedidos_por_codigo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.NChar, 10));
            cmd.Parameters["@p_codPedido"].Value = CodPedido;
            List<Lineas_Pedidos_Tienda> lista = new List<Lineas_Pedidos_Tienda>();
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Lineas_Pedidos_Tienda prod = new Lineas_Pedidos_Tienda(
                        (string)lector.GetString(0),
                        (string)lector.GetString(1),
                        (string)lector.GetString(2),
                        (string)lector.GetString(3)
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
        public void ActualizarLineaPedido(string CodPedido, string NumLinea, string CodProducto, string unidades)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmdLeer = new SqlCommand("WEB.mostrar_lineas_pedidos_por_codigo", con);
            cmdLeer.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.NChar,10));
            cmdLeer.Parameters["@p_codPedido"].Value = CodPedido;
            SqlCommand cmdActualizar = new SqlCommand("WEB.actualizar_pedido", con);
            cmdActualizar.Parameters.Add(new SqlParameter("@p_codPedido", SqlDbType.NChar, 10));
            cmdActualizar.Parameters["@p_codPedido"].Value = CodPedido;
            cmdActualizar.Parameters.Add(new SqlParameter("@p_NumLinea", SqlDbType.NChar, 10));
            cmdActualizar.Parameters["@p_NumLinea"].Value = NumLinea;
            cmdActualizar.Parameters.Add(new SqlParameter("@p_CodProducto", SqlDbType.NChar, 10));
            cmdActualizar.Parameters["@p_CodProducto"].Value = CodProducto;
            cmdActualizar.Parameters.Add(new SqlParameter("@p_Cantidad", SqlDbType.NChar, 10));
            cmdActualizar.Parameters["@p_Cantidad"].Value = unidades;
            try
            {
                con.Open();
                SqlDataReader lector = cmdLeer.ExecuteReader();
                List<Lineas_Pedidos_Tienda> lista = new List<Lineas_Pedidos_Tienda>();
                while (lector.Read())
                {
                    Lineas_Pedidos_Tienda prod = new Lineas_Pedidos_Tienda(
                         (string)lector.GetString(0),
                         (string)lector.GetString(1),
                         (string)lector.GetString(2),
                         (string)lector.GetString(3)
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