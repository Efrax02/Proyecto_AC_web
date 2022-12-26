using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CompraComponentes.App_Code
{
    public class Proveedores
    {
        public Proveedores(int CodProveedor, 
        string CodFiscalProveedor, 
        string NombreProveedor, 
        string Telefono, 
        string Direccion, 
        string Email)
        {
            codProveedor = CodProveedor;
            codFiscalProveedor = CodFiscalProveedor;
            nombreProveedor = NombreProveedor;
            telefono = Telefono;
            direccion = Direccion;
            email = Email;
        }
        public Proveedores(int CodProveedor,
        string NombreProveedor)
        {
            codProveedor = CodProveedor;
            nombreProveedor = NombreProveedor;
        }
        private int codProveedor;
        public int CodProveedor
        {
            get{ return codProveedor;}
            set{ codProveedor = value; }
        }        
        private string codFiscalProveedor;
        public string CodFiscalProveedor
        {
            get { return codFiscalProveedor; }
            set { codFiscalProveedor = value; }
        }
        private string nombreProveedor;
        public string NombreProveedor
        {
            get { return nombreProveedor; }
            set { nombreProveedor = value; }
        }
        private string telefono;
        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
        private string direccion;
        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }
        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
    }
}