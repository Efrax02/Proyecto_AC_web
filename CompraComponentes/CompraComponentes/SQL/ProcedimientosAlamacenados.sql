ALTER PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd,PrecioCoste,Existencias,StokcMax,StokcMin
FROM SGE_Productos_Proveedores


ALTER PROCEDURE [WEB].[realizar_pedido]
--@p_fechaPed as smalldatetime,
--@p_fechaEntrgas as smalldatetime,
@p_CodPedido as int,
@p_codProducto as int,
@p_unidades as int
AS
declare @v_ultimocodPed int
declare @v_ultimoLineaPed int
Begin
	--Begin Transaction
	--	Begin Try
			set @v_ultimocodPed = (SELECT ISNULL(MAX(CodPedido) + 1 , 1) FROM SGE_Pedidos_Tienda)
			INSERT INTO SGE_Pedidos_Tienda (CodPedido, FechaPed/*,FechaEntrega*/)
			VALUES (@v_ultimocodPed,GETDATE()/*,@p_fechaEntrgas*/)

			set @v_ultimoLineaPed = (SELECT ISNULL(MAX(NumLinea) + 1 , 1) FROM SGE_LíneasDePedidos_Tienda)
			INSERT INTO SGE_LíneasDePedidos_Tienda(CodPedido,NumLinea,CodProducto,Unidades)
			VALUES (@p_CodPedido,@v_ultimoLineaPed,@p_codProducto,@p_Unidades)
	--	commit transaction
	--End try
	--Begin Catch
	--	rollback transaction
	--End Catch
End

CREATE PROCEDURE [WEB].[mostrar_pedidos_fecha]
AS
SELECT CodPedido,FechaPed
FROM SGE_Pedidos_Tienda

CREATE PROCEDURE [WEB].[mostrar_nombres_proveedor]
AS
SELECT CodProveedor, NombreProv
FROM SGE_Proveedores

CREATE PROCEDURE [WEB].[mostrar_nombres_producto]
AS
SELECT CodProducto,NombreProd
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[mostrar_pedidos_por_fecha]
@p_fechaPedido as smalldatetime
AS
SELECT CodPedido, FechaPed, FechaEntrega
FROM SGE_Pedidos_Tienda
WHERE FechaPed = @p_fechaPedido

ALTER PROCEDURE [WEB].[mostrar_lineas_pedidos_por_codigo]
@p_codPedido as nchar(10)
AS
SELECT CodPedido, NumLinea, CodProducto, Unidades
FROM SGE_LíneasDePedidos_Tienda
WHERE CodPedido = '1'

ALTER PROCEDURE [WEB].[mostrar_lineas_pedidos_insertar]
AS
SELECT CodPedido, NumLinea, CodProducto, Unidades
FROM SGE_LíneasDePedidos_Tienda

CREATE PROCEDURE [WEB].[eliminar_pedido]
@p_codPedido as int
AS 
DELETE FROM SGE_Pedidos_Tienda WHERE CodPedido = @p_codPedido

DELETE FROM SGE_Lineas_Pedidos_Tienda WHERE CodPedido = @p_codPedido


CREATE PROCEDURE [WEB].[actualizar_pedido]
@p_CodPedido as int,
@p_NumLinea as int,
@p_CodProducto as int,
@p_Cantidad as int
AS
UPDATE SGE_Lineas_Pedidos_Tienda
SET CodProducto = @p_CodProducto,
	Cantidad = @p_Cantidad
WHERE CodPedido = @p_CodPedido