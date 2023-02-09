using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;


namespace Servicios
{
    public interface IServicios
    {
        [OperationContract]
        bool IniciarSesion(string usuario, string contraseña);
        void NuevoUsuario(string usuario, string contraseña, string nombre, string apellido);
    }
}