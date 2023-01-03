using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace CompraComponentes.App_Code
{
    public class Productos_Proveedores
    {
        public Productos_Proveedores(
            int CodProducto,
            int CodProveedor,
            string NombreProd,
            SqlMoney PrecioCoste,
            int Existencias,
            int StokcMax,
            int StokcMin)
        {
            codProducto = CodProducto;
            codProveedor = CodProveedor;
            nombreProd = NombreProd;
            precioCoste = PrecioCoste;
            existencias = Existencias;
            stokcMax = StokcMax;
            stokcMin = StokcMin;
        }

        public Productos_Proveedores(
            int CodProducto,
            string NombreProd)
        {
            codProducto = CodProducto;
            nombreProd = NombreProd;
        }

        private int codProducto;
        public int CodProducto
        {
            get { return codProducto; }
            set { codProducto = value; }
        }
        private int codProveedor;
        public int CodProveedor
        {
            get { return codProveedor; }
            set { codProveedor = value; }
        }
        private string nombreProd;
        public string NombreProd
        {
            get { return nombreProd; }
            set { nombreProd = value; }
        }
        private SqlMoney precioCoste;
        public SqlMoney PrecioCoste
        {
            get { return precioCoste; }
            set { precioCoste = value; }
        }
        private int existencias;
        public int Existencias
        {
            get { return existencias; }
            set { existencias = value; }
        }
        private int stokcMax;
        public int StokcMax
        {
            get { return stokcMax; }
            set { stokcMax = value; }
        }
        private int stokcMin;
        public int StokcMin
        {
            get { return stokcMin; }
            set { stokcMin = value; }
        }
    }
}