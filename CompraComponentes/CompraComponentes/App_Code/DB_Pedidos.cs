﻿using System;
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
        public List<Pedidos_Tienda> MostrarPedidos(string fecha)
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
                throw new ApplicationException("Error en los datos" + err.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public List<Lineas_Pedidos_Tienda> MostrarPedidos(int CodPedido)
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
                        (int)lector.GetInt32(3)
                        );
                    lista.Add(prod);
                }
                lector.Close();
                return lista;
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
        public void EliminarPedido(int CodPedido)
        {
            //TODO Implementar Metodo Eliminar Pedido
        }
        public void ActualizarLineaPedido(int CodPedido, int NumLinea, int CodProducto, int unidades)
        {
            //TODO Implementar Metodo Actualizar Pedido
        }
    }
}