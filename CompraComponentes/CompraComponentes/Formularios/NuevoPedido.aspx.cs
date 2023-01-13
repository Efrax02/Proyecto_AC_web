using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompraComponentes.Formularios
{
    public partial class NuevoPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlVerProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostrarProductos.aspx");
        }

        protected void btnlVerProveedores_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostrarProveedores.aspx");
        }

        //SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["DAM2-EfrainHernandezSEIM"].ConnectionString);
        //SqlCommand cmdVerPedidos = new SqlCommand("SELECT * FROM SGE_Productos_Proveedores", con);

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            
        }
    }
}