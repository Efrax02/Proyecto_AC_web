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
            <asp:ObjectDataSource ID="or_MostrarCodPedido" runat="server" SelectMethod="MostrarPedidos" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>
            <asp:Label ID="Label1" runat="server" Text="Códigos de pedido"></asp:Label>
            <asp:DropDownList ID="lstCodPedidos" runat="server" AutoPostBack="True" DataSourceID="or_MostrarCodPedido" DataTextField="CodPedido" DataValueField="CodPedido"></asp:DropDownList>
            <asp:ObjectDataSource ID="or_ActualizarPedidos" runat="server" SelectMethod="MostrarPedidosCodPedido" TypeName="CompraComponentes.App_Code.DB_Pedidos" UpdateMethod="ActualizarLineaPedido">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lstCodPedidos" PropertyName="SelectedValue" Name="CodPedido" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CodPedido" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="NumLinea" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProducto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="unidades" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="or_ActualizarPedidos" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
