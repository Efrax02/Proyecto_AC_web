using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CompraComponentes.Formularios
{
    public partial class Loggin : System.Web.UI.Page
    {
        
        ServicioLoggin.ServicioLoggin servicio = new ServicioLoggin.ServicioLoggin  ();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            bool res = servicio.InicioSesion(txtUsuario.Text, txtContraseña.Text);
            if (res)
            {
                Response.Redirect("NuevoPedido.aspx");
            }
            else
            {
                lblRes.Text = "Usurio o contraseña incorrectos";
            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoUsuario.aspx");
        }
    }
}