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
            <asp:ObjectDataSource ID="or_Proveedores_Nombres" runat="server" SelectMethod="MostrarNombresProveedor" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="or_Productos_Nombres" runat="server" SelectMethod="MostrarNombresProductos" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>
            <asp:DropDownList ID="IdProveedor" runat="server" DataSourceID="or_Proveedores_Nombres" DataTextField="CodProveedor" DataValueField="NombreProveedor"></asp:DropDownList>
            <asp:DropDownList ID="IdProducto" runat="server" DataSourceID="or_Productos_Nombres" DataTextField="CodProducto" DataValueField="NombreProd"></asp:DropDownList>            
            <asp:ObjectDataSource ID="or_insertar_pedido" runat="server" InsertMethod="InsertarPedido" SelectMethod="MostrarPedidosInsertar" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <InsertParameters>
                    <asp:Parameter Name="pedidos_Tienda" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="lineas" Type="Object"></asp:Parameter>
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="or_insertar_pedido">
                <Fields>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="NumLinea" HeaderText="NumLinea" SortExpression="NumLinea"></asp:BoundField>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Fields>
            </asp:DetailsView>
        </div>
    </form>
</body>
</html>
