<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loggin.aspx.cs" Inherits="CompraComponentes.Formularios.Loggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="Icono">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/Usuario.png" Width="150" Height="150"/>
            </div>
            <asp:Label ID="lblRes" runat="server"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label><br />
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label><br />
            <asp:TextBox ID="txtContraseña" runat="server" ></asp:TextBox>    
            <br />
            <asp:Button OnClick="btnIniciar_Click" ID="btnIniciar" runat="server" Text="Iniciar seisón" /><br />
            <asp:LinkButton OnClick="btnCrearUsuario_Click" ID="btnCrearUsuario" runat="server" >No tienes cuenta? Crear Cuenta</asp:LinkButton>
        </div>
    </form>
</body>
</html>
