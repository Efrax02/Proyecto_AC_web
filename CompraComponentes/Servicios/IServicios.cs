using System;
using System.Collections.Generic;
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
        Sesion IniciarSesion(string usuario, string contraseña);
        void NuevoUsuario(string usuario, string contraseña);
    }
}