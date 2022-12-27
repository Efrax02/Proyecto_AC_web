<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActualizarPedido.aspx.cs" Inherits="CompraComponentes.Formularios.ActualizarPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="CodPedido" runat="server" Text="Código de Pedido"></asp:Label><br />
            <asp:TextBox ID="txtCodPedido" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            <asp:ObjectDataSource ID="Datos_pedidos" runat="server" SelectMethod="MostrarPedidos" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCodPedido" PropertyName="Text" Name="CodPedido" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="Lineas_de_pedido" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True">
                <Columns>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="NumLinea" HeaderText="NumLinea" SortExpression="NumLinea"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
