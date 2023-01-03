<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarProductos.aspx.cs" Inherits="CompraComponentes.MostrarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="or_ProductosProveedores" runat="server" SelectMethod="MostrarProductos" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>

            <asp:GridView ID="grd_Productos" runat="server" AutoGenerateColumns="False" DataSourceID="or_ProductosProveedores">
                <Columns>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="NombreProd" HeaderText="NombreProd" SortExpression="NombreProd"></asp:BoundField>
                    <asp:BoundField DataField="Existencias" HeaderText="Existencias" SortExpression="Existencias"></asp:BoundField>
                    <asp:BoundField DataField="StokcMax" HeaderText="StokcMax" SortExpression="StokcMax"></asp:BoundField>
                    <asp:BoundField DataField="StokcMin" HeaderText="StokcMin" SortExpression="StokcMin"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <%--<asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:DAM2-EfrainHernandezEFRAX %>' SelectCommand="SELECT [CodProducto], [CodProveedor], [NombreProd], [PrecioCoste], [Existencias], [StokcMax], [StokcMin] FROM [SGE_Productos_Proveedores]"></asp:SqlDataSource>--%>
        </div>
    </form>
</body>
</html>
