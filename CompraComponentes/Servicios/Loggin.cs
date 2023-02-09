using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Servicios
{
    public class Loggin
    {
        public Loggin(){}
        public Loggin (string nom_usuario, string contraseña, string nombre, string apellido)
        {
            Nom_Usuario= nom_usuario;
            Contraseña = contraseña;
            Nombre = nombre;
            Apellido = apellido;
        }
        public Loggin(string nom_usuario, string contraseña)
        {
            Nom_Usuario = nom_usuario;
            Contraseña = contraseña;
        }
        public string Nom_Usuario { get; set; }
        public string Contraseña { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
    }
}