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
        //public Lineas_Pedidos_Tienda(int CodPedido,int NumLinea, /*int CodProveedor,*/ int CodProducto, int Unidades)
        //{
        //    codPedido = CodPedido;
        //    numLinea = NumLinea;
        //    //codProveedor = CodProveedor;
        //    codProducto = CodProducto;
        //    unidades = Unidades;
        //}
        //public Lineas_Pedidos_Tienda(int CodPedido, int CodProducto, int Unidades)
        //{
        //    codPedido = CodPedido;
        //    codProducto = CodProducto;
        //    unidades = Unidades;
        //}
        //private int codPedido;
        //public int CodPedido
        //{
        //    get { return codPedido; }
        //    set { codPedido = value; }
        //}

        //private int numLinea;
        //public int NumLinea
        //{
        //    get { return numLinea; }
        //    set { numLinea = value; }
        //}

        //private int codProveedor;
        //public int CodProveedor
        //{
        //    get { return codProveedor; }
        //    set { codProveedor = value; }
        //}
        //private int codProducto;
        //public int CodProducto
        //{
        //    get { return codProducto; }
        //    set { codProducto = value; }
        //}

        //private int unidades;
        //public int Unidades{
        //    get { return unidades; }
        //    set { unidades = value; }
        //}

        public Lineas_Pedidos_Tienda(string CodPedido, string NumLinea, /*int CodProveedor,*/ string CodProducto, string Unidades)
        {
            codPedido = CodPedido;
            numLinea = NumLinea;
            //codProveedor = CodProveedor;
            codProducto = CodProducto;
            unidades = Unidades;
        }
        public Lineas_Pedidos_Tienda(string CodPedido, string CodProducto, string Unidades)
        {
            codPedido = CodPedido;
            codProducto = CodProducto;
            unidades = Unidades;
        }
        private string codPedido;
        public string CodPedido
        {
            get { return codPedido; }
            set { codPedido = value; }
        }

        private string numLinea;
        public string NumLinea
        {
            get { return numLinea; }
            set { numLinea = value; }
        }

        private string codProveedor;
        public string CodProveedor
        {
            get { return codProveedor; }
            set { codProveedor = value; }
        }
        private string codProducto;
        public string CodProducto
        {
            get { return codProducto; }
            set { codProducto = value; }
        }

        private string unidades;
        public string Unidades
        {
            get { return unidades; }
            set { unidades = value; }
        }
    }
}