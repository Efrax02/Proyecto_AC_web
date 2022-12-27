<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoPedido.aspx.cs" Inherits="CompraComponentes.Formularios.NuevoPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="or_Proveedores_Nombres" runat="server"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="or_Productos_Nombres" runat="server"></asp:ObjectDataSource>
            <asp:DropDownList ID="IdProveedor" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="IdProducto" runat="server"></asp:DropDownList>            
        </div>
    </form>
</body>
</html>
