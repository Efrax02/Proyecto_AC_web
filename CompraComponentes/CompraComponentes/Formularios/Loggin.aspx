

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
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
            <input id="txtContraseña" type="password" /><br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:LoginView runat="server"></asp:LoginView>

        </div>
    </form>
</body>
</html>
