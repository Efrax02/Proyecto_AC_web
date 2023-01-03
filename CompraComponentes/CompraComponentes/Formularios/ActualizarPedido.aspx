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
            
            <asp:SqlDataSource ID="or_MostrarCodPedido" runat="server" 
                ConnectionString='<%$ ConnectionStrings:DAM2-EfrainhernandezSPYRO %>' 
                SelectCommand="SELECT CodPedido FROM SGE_LineasDePedidos_Tienda GROUP BY CodPedido">
            </asp:SqlDataSource>

            <asp:Label ID="Label1" runat="server" Text="Códigos de pedido"></asp:Label>
            
            <asp:DropDownList ID="lstCodPedidos" 
                runat="server" 
                DataSourceID="or_MostrarCodPedido" 
                DataTextField="CodPedido" 
                DataValueField="CodPedido" 
                AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="or_ActualizarPedidos" 
                runat="server" 
                SelectMethod="MostrarPedidosCodPedido" 
                TypeName="CompraComponentes.App_Code.DB_Pedidos" 
                UpdateMethod="ActualizarLineaPedido">
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
            <asp:GridView ID="grdDatosLineasPedidos" runat="server" DataSourceID="or_ActualizarPedidos">
                <Columns>
                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
