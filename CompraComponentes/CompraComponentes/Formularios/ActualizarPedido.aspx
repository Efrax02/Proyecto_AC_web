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
            <asp:ObjectDataSource ID="ActualizarPedido" runat="server" SelectMethod="MostrarPedidosCodPedido" TypeName="CompraComponentes.App_Code.DB_Pedidos" UpdateMethod="ActualizarLineaPedido">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCodPedido" PropertyName="Text" Name="CodPedido" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CodPedido" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProducto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="unidades" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
