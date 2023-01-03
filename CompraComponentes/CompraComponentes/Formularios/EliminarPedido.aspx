<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarPedido.aspx.cs" Inherits="CompraComponentes.Formularios.EliminarPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="or_MostrarCodPedido" runat="server"
            ConnectionString='<%$ ConnectionStrings:DAM2-EfrainhernandezSPYRO %>'
            SelectCommand="SELECT CodPedido FROM SGE_LineasDePedidos_Tienda GROUP BY CodPedido"></asp:SqlDataSource>
              
        <asp:DropDownList ID="lstCodPedidos"
            runat="server"
            DataSourceID="or_MostrarCodPedido"
            DataTextField="CodPedido"
            DataValueField="CodPedido"
            AutoPostBack="True" OnSelectedIndexChanged="AsginarCod">
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" Text="Códigos de pedido"></asp:Label>
        <asp:TextBox ID="txtCodPedido" runat="server"></asp:TextBox>
        <asp:ObjectDataSource ID="or_EliminarPedidos" runat="server" DeleteMethod="EliminarPedido" SelectMethod="MostrarPedidosCodPedido" TypeName="CompraComponentes.App_Code.DB_Pedidos">
            <DeleteParameters>
                <asp:Parameter  Name="CodPedido" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCodPedido" PropertyName="Text" Name="CodPedido" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="grdDatosLineasPedidos" runat="server" AutoGenerateColumns="False" DataSourceID="or_EliminarPedidos">
            <Columns>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                <asp:BoundField DataField="NumLinea" HeaderText="NumLinea" SortExpression="NumLinea"></asp:BoundField>
                <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <div>
        </div>
    </form>
</body>
</html>
