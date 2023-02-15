using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CompraComponentes.Clases
{
    public class Productos_Proveedores
    {
        public Productos_Proveedores(
            int CodProveedor,
            string NombreProd)
        {
            CodProducto = CodProveedor;
            this.NombreProd = NombreProd;
        }

        public int CodProducto { get; set; }
        public string NombreProd { get; set; }
    }
}