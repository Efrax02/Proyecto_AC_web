<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarPedido.aspx.cs" Inherits="CompraComponentes.Formularios.EliminarPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Código de pedido"></asp:Label><br />
            <asp:TextBox ID="CodPedido" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
            <asp:ObjectDataSource ID="MostararDatosPedidos" runat="server" SelectMethod="MostrarPedidos" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="CodPedido" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="LineasPedido" runat="server" Height="50px" Width="125px" DataSourceID="MostararDatosPedidos" AutoGenerateRows="False">
                <Fields>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="NumLinea" HeaderText="NumLinea" SortExpression="NumLinea"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Fields>                
            </asp:DetailsView>
        </div>
    </form>
</body>
</html>
