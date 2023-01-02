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
            <%--<asp:ObjectDataSource ID="or_Proveedores_Nombres" runat="server" SelectMethod="MostrarNombresProveedor" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>--%>
            <%--<asp:ObjectDataSource ID="or_Productos_Nombres" runat="server" SelectMethod="MostrarNombresProductos" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>--%>
            <%--<asp:DropDownList ID="IdProveedor" runat="server" DataSourceID="or_Proveedores_Nombres" DataTextField="CodProveedor" DataValueField="NombreProveedor"></asp:DropDownList>--%>
            <%--<asp:Label ID="Label1" runat="server" Text="Productos"></asp:Label>--%>
            <%--<asp:DropDownList ID="IdProducto" runat="server" DataSourceID="or_Productos_Nombres" DataTextField="NombreProd" DataValueField="CodProducto" AutoPostBack="True"></asp:DropDownList>--%>            
            <br />
            <%--<asp:ObjectDataSource ID="or_insertar_pedido" runat="server" InsertMethod="InsertarPedido" SelectMethod="MostrarPedidosInsertar" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <InsertParameters>
                    <asp:Parameter Name="pedidos_Tienda" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="lineas" Type="Object"></asp:Parameter>
                </InsertParameters>
            </asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="or_insertar_pedido" runat="server" InsertMethod="InsertarPedido" SelectMethod="MostrarPedidosInsertar" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <InsertParameters>
                    <asp:Parameter Name="CodProducto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Unidades" Type="Int32"></asp:Parameter>
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="or_insertar_pedido" DefaultMode="Insert"
                AutoGenerateInsertButton="true">
                <Fields>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Fields>
            </asp:DetailsView>
        </div>
        
    </form>
</body>
</html>
