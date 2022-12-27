using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlTypes;
using System.Web;

namespace CompraComponentes.App_Code
{
    public class Pedidos_Tienda
    {
        public Pedidos_Tienda(int CodPedido, SqlDateTime FechaPedido,SqlDateTime FechaEntrega)
        {
            codPedido=CodPedido;
            fechaPedido=FechaPedido;
            fechaEntrega=FechaEntrega;
        }
        private int codPedido;
        public int CodPedido
        {
            get { return codPedido; }
            set { codPedido = value; }
        }

        private SqlDateTime fechaPedido;
        public SqlDateTime FechaPedido
        {
            get { return fechaPedido;}
            set { fechaPedido = value;}
        }
        private SqlDateTime? fechaEntrega;
        public SqlDateTime? FechaEntrega
        {
            get { return fechaEntrega; }
            set { fechaEntrega = value; }
        }
    }

    public class Lineas_Pedidos_Tienda
    {
        public Lineas_Pedidos_Tienda(int CodPedido,int NumLinea, int CodProducto, int Unidades)
        {
            codPedido = CodPedido;
            numLinea = NumLinea;
            codProducto = CodProducto;
            unidades = Unidades;
        }
        private int codPedido;
        public int CodPedido
        {
            get { return codPedido; }
            set { codPedido = value; }
        }

        private int numLinea;
        public int NumLinea
        {
            get { return numLinea; }
            set { numLinea = value; }
        }

        private int codProducto;
        public int CodProducto
        {
            get { return codProducto; }
            set { codProducto = value; }
        }

        private int unidades;
        public int Unidades{
            get { return unidades; }
            set { unidades = value; }
        }
    }
}