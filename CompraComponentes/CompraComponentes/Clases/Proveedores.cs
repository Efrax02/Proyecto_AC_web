using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CompraComponentes.Clases
{
    public class Proveedores
    {
        public Proveedores(int CodProveedor,
        string NombreProveedor)
        {
            this.CodProveedor = CodProveedor;
            this.NombreProveedor = NombreProveedor;
        }
        public int CodProveedor { get; set; }
        public string NombreProveedor { get; set; }
    }
}