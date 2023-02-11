<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="CompraComponentes.Formularios.NuevoUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nombre: <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox><br />
            Apellido: <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox><br />
            Nombre Usuario: <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
            Contraseña: <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox><br />
            <br />
            <asp:Button OnClick="btnRegistrar_Click" ID="btnRegistrar" runat="server" Text="Registrar"/>
        </div>
    </form>
</body>
</html>
