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
            <%--<asp:ObjectDataSource ID="or_NombresProveedores" runat="server" 
                SelectMethod="MostrarNombresProveedor" 
                TypeName="CompraComponentes.App_Code.DB_Pedidos">
            </asp:ObjectDataSource>--%>
            <asp:SqlDataSource ID="or_NombresProveedores" runat="server" 
                ConnectionString='<%$ ConnectionStrings:DAM2-EfrainhernandezSPYRO %>' 
                SelectCommand="SELECT [CodProveedor], [NombreProv] FROM [SGE_Proveedores]">
            </asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Proveedores"></asp:Label> <br />
            <asp:DropDownList ID="lstProveedores" runat="server"
                DataSourceID="or_NombresProveedores"
                DataTextField="NombreProv"
                DataValueField="CodProveedor" AutoPostBack="True">
            </asp:DropDownList><br />
            
            
            <%--<asp:ObjectDataSource ID="or_NombresProductos" runat="server" 
                SelectMethod="MostrarNombresProductos" 
                TypeName="CompraComponentes.App_Code.DB_Pedidos">
            </asp:ObjectDataSource>--%>
            <asp:SqlDataSource ID="or_NombresProductos" runat="server" 
                ConnectionString='<%$ ConnectionStrings:DAM2-EfrainhernandezSPYRO %>' 
                SelectCommand="SELECT [CodProducto], [NombreProd] FROM [SGE_Productos_Proveedores]">
            </asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server" Text="Productos"></asp:Label> <br />
            <asp:DropDownList ID="lstProductos" runat="server" 
                DataSourceID="or_NombresProductos" 
                DataTextField="NombreProd" 
                DataValueField="CodProducto">
            </asp:DropDownList>
            <br />
            
            
            <%--<asp:SqlDataSource ID="or_MostrarCodPedido" runat="server" 
                ConnectionString='<%$ ConnectionStrings:DAM2-EfrainhernandezSPYRO %>' 
                SelectCommand="SELECT CodPedido FROM SGE_LineasDePedidos_Tienda GROUP BY CodPedido">
            </asp:SqlDataSource>
            <asp:Label ID="Label3" runat="server" Text="Códigos de Pedido"></asp:Label><br />
            <asp:DropDownList ID="lstCodPedido" runat="server"
                DataSourceID="or_MostrarCodPedido"
                DataTextField="CodPedido"
                DataValueField="CodPedido" AutoPostBack="True">
            </asp:DropDownList>--%>


            <asp:ObjectDataSource ID="or_insertar_pedido" runat="server" InsertMethod="InsertarPedido" SelectMethod="MostrarPedidosInsertar" TypeName="CompraComponentes.App_Code.DB_Pedidos">
                <InsertParameters>
                    <asp:Parameter Name="CodPedido" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProveedor" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProducto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Unidades" Type="Int32"></asp:Parameter>
                </InsertParameters>
            </asp:ObjectDataSource>

            <asp:DetailsView ID="dtsDatosInsertar" runat="server" 
                Height="50px" Width="125px" 
                AutoGenerateRows="False" 
                DataSourceID="or_insertar_pedido" 
                DefaultMode="Insert"
                AutoGenerateInsertButton="true">
                <Fields>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Fields>
            </asp:DetailsView><br />

            <asp:LinkButton ID="btnlVerProveedores" runat="server" OnClick="btnlVerProveedores_Click">Ver Proveedores</asp:LinkButton>
            <asp:LinkButton ID="btnlVerProductos" runat="server" OnClick="btnlVerProductos_Click">Ver Productos</asp:LinkButton><br />


            <br /><asp:TextBox ID="txtCodPedido" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" /><br />

            <asp:ObjectDataSource ID="or_Pedidos" runat="server" SelectMethod="MostrarPedidos" TypeName="CompraComponentes.App_Code.DB_Pedidos" DeleteMethod="EliminarPedido">
                <DeleteParameters>
                    <asp:Parameter Name="CodPedido" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCodPedido" PropertyName="Text" Name="CodPedido" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="Label5" runat="server" Text="PEDIDOS"></asp:Label>
            <asp:GridView ID="grd_Pedidos" runat="server"
                AutoGenerateColumns="False"
                DataSourceID="or_Pedidos"
                DataKeyNames="CodPedido" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateSelectButton="True">
                <Columns>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="FechaPedido" HeaderText="FechaPedido" SortExpression="FechaPedido"></asp:BoundField>
                    <asp:BoundField DataField="FechaEntrega" HeaderText="FechaEntrega" SortExpression="FechaEntrega"></asp:BoundField>
                </Columns>
            </asp:GridView><br />

            <asp:ObjectDataSource ID="or_CrudPedidos" runat="server"
                DeleteMethod="EliminarLineaPedido"
                SelectMethod="MostrarPedidosCodPedido"
                TypeName="CompraComponentes.App_Code.DB_Pedidos"
                UpdateMethod="ActualizarLineaPedido">
                <DeleteParameters>
                    <asp:Parameter Name="NumLinea" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grd_Pedidos"
                        PropertyName="SelectedValue"
                        Name="CodPedido"
                        Type="Int32"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CodPedido" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="NumLinea" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProveedor" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="CodProducto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="unidades" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:ObjectDataSource>

            <asp:Label ID="Label4" runat="server" Text="BUSCAR PEDIDOS POR PROVEEDOR"></asp:Label>
            <asp:GridView ID="grd_LineasDePedidos" runat="server" 
                AutoGenerateColumns="False" 
                DataSourceID="or_CrudPedidos" 
                AutoGenerateDeleteButton="True" 
                AutoGenerateEditButton="True" 
                DataKeyNames="NumLinea" 
                AutoGenerateSelectButton="False">
                <Columns>
                    <asp:BoundField DataField="CodPedido" HeaderText="CodPedido" SortExpression="CodPedido"></asp:BoundField>
                    <asp:BoundField DataField="NumLinea" HeaderText="NumLinea" SortExpression="NumLinea"></asp:BoundField>
                    <asp:BoundField DataField="CodProveedor" HeaderText="CodProveedor" SortExpression="CodProveedor"></asp:BoundField>
                    <asp:BoundField DataField="CodProducto" HeaderText="CodProducto" SortExpression="CodProducto"></asp:BoundField>
                    <asp:BoundField DataField="Unidades" HeaderText="Unidades" SortExpression="Unidades"></asp:BoundField>
                </Columns>
            </asp:GridView>

            
        </div>
    </form>
</body>
</html>
