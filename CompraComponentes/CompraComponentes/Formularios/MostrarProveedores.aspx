<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarProveedores.aspx.cs" Inherits="CompraComponentes.Formularios.MostrarProveedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="or_Proveedores" runat="server" SelectMethod="MostrarProveedores" TypeName="CompraComponentes.App_Code.DB_Pedidos"></asp:ObjectDataSource>

            <asp:GridView ID="grd_Proveedores" runat="server" AutoGenerateColumns="False" DataSourceID="or_Proveedores">
                <Columns>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="CodFiscalProveedor" HeaderText="CodFiscalProveedor" SortExpression="CodFiscalProveedor"></asp:BoundField>
                    <asp:BoundField DataField="NombreProveedor" HeaderText="NombreProveedor" SortExpression="NombreProveedor"></asp:BoundField>
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono"></asp:BoundField>
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion"></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
