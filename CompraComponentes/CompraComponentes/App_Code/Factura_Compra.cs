using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace CompraComponentes.App_Code
{
    public class Factura_Compra
    {
        public Factura_Compra(int CodFactura, int CodCliente, SqlDateTime Fecha, SqlBinary Pagada)
        {
            codFactura = CodFactura;
            codClinete = CodCliente;
            fecha = Fecha;
            pagada = Pagada;
        }
        private int codFactura;
        public int CodFactura
        {
            get { return codFactura; }
            set { codFactura = value; }
        }
        private int codClinete;
        public int CodClinete
        {
            get { return codClinete; }
            set { codClinete = value; }
        }
        private SqlDateTime fecha;
        public SqlDateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }
        private SqlBinary pagada;
        public SqlBinary Pagada
        {
            get { return pagada; }
            set { pagada = value; }
        }
    }

    public class Linea_Factura_Compra
    {
        public Linea_Factura_Compra(int CodFactura, int NumLinea, int CodProducto, string Descripcion, int Cantidad, SqlMoney Total)
        {
            codFactura = CodFactura;
            numLinea = NumLinea;
            codProducto = CodProducto;
            descripcion = Descripcion;
            total = Total;
        }

        private int codFactura;
        public int CodFactura
        {
            get { return codFactura; }
            set { codFactura = value; }
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
        private string descripcion;
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        private int cantidad;
        public int Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }
        private SqlMoney total;
        public SqlMoney Total
        {
            get { return total; }
            set { total = value; }
        }
    }
}