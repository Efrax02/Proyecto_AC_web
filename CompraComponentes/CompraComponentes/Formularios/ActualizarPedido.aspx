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
            <asp:TextBox ID="txtCodPedido" runat="server" Text="1"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            <asp:ObjectDataSource ID="ActualizarPedidos" runat="server" SelectMethod="MostrarPedidosCodPedido" 
                TypeName="CompraComponentes.App_Code.DB_Pedidos" 
                UpdateMethod="ActualizarLineaPedido">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCodPedido" PropertyName="Text" Name="CodPedido" Type="Object"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CodPedido" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="CodProducto" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="unidades" Type="Object"></asp:Parameter>
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ActualizarPedidos" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True"></asp:CommandField>
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
