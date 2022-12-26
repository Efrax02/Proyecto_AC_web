CREATE PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd,PrecioCoste,Existencias,StockMax,StockMin
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[realizar_pedido]
@p_fechaPed as smalldatetime,
@p_fechaEntrgas as smalldatetime,
@p_codProducto as int,
@p_unidades as int
AS
declare @v_ultimocodPed int
declare @v_ultimoLineaPed int
Begin
	set @v_ultimocodPed = (SELECT ISNULL(MAX(CodPedido) + 1 , 1) FROM SGE_Pedidos_Tienda)
	INSERT INTO SGE_Pedidos_Tienda (CodPedido, FechaPed,FechaEntrega)
	VALUES (@v_ultimocodPed,@p_fechaPed,@p_fechaEntrgas)

	set @v_ultimocodPed = (SELECT ISNULL(MAX(NumLinea) + 1 , 1) FROM SGE_Lineas_Pedidos_Tienda)
	INSERT INTO SGE_Lineas_Pedidos_Tienda(CodPedido,NumLinea,CodProducto,Unidades)
	VALUES (@v_ultimocodPed,@v_ultimoLineaPed,@p_codProducto,@p_unidades)
End

CREATE PROCEDURE [WEB].[mostrar_nombres_proveedores]
AS
SELECT CodProveedor, NombreProv
FROM SGE_Proveedores

CREATE PROCEDURE [WEB].[mostrar_productos_nombre]
AS
SELECT CodProducto, NombreProd
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[mostrar_pedidos_fecha]
@p_codPedido int
AS
SELECT CodPedido,FechaPedido
FROM SGE_Pedidos_Tienda

CREATE PROCEDURE [WEB].[mostrar_pedidos_por_fecha]
AS
SELECT PT.CodPedido, FechaPedido, FechaEntrega
FROM SGE_Pedidos_Tienda
WHERE CodPedido = @p_codPedido
CREATE PROCEDURE [WEB].[mostrar_lineas_pedidos_por_fecha]
AS
SELECT CodPedido, NumLinea, CodProducto, Unidades
FROM SGE_Pedidos_Tienda
WHERE CodPedido = @p_codPedido