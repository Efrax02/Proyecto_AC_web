ALTER PROCEDURE [WEB].[mostrar_proveedores]
AS
SELECT CodProveedor, CodFiscal, NombreProv, Telef, Direccion, Email
FROM SGE_Proveedores

ALTER PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd, PrecioCoste, Existencias, StokcMax, StokcMin
FROM SGE_Productos_Proveedores

ALTER PROCEDURE [WEB].[Codigos_Pedidos]
AS
SELECT CodPedido,CodPedido
FROM SGE_LineasDePedidos_Tienda


ALTER PROCEDURE [WEB].[realizar_pedido]
--@p_fechaPed as smalldatetime,
--@p_fechaEntrgas as smalldatetime,
@p_CodPedido as int,
@p_CodProveedor as int,
@p_codProducto as int,
@p_unidades as int
AS
declare @v_ultimocodPed int
declare @v_ultimoLineaPed int
declare @v_existencias int
Begin
	--Begin Transaction
	--	Begin Try			
			IF (@p_CodPedido IN (SELECT CodPedido FROM SGE_Pedidos_Tienda))
				BEGIN
					set @v_ultimoLineaPed = (SELECT ISNULL(MAX(NumLinea) + 1 , 1) FROM SGE_LineasDePedidos_Tienda)
					INSERT INTO SGE_LineasDePedidos_Tienda(CodPedido,NumLinea,CodProveedor,CodProducto,Unidades)
					VALUES (@p_CodPedido,@v_ultimoLineaPed,@p_CodProveedor,@p_codProducto,@p_Unidades)
										
				END
			ELSE 
				BEGIN
					set @v_ultimocodPed = (SELECT ISNULL(MAX(CodPedido) + 1 , 1) FROM SGE_Pedidos_Tienda)					
					INSERT INTO SGE_Pedidos_Tienda (CodPedido, FechaPed/*,FechaEntrega*/)
					VALUES (@v_ultimocodPed,GETDATE()/*,@p_fechaEntrgas*/)

					set @v_ultimoLineaPed = (SELECT ISNULL(MAX(NumLinea) + 1 , 1) FROM SGE_LineasDePedidos_Tienda)
					INSERT INTO SGE_LineasDePedidos_Tienda(CodPedido,NumLinea,CodProveedor,CodProducto,Unidades)
					VALUES (@v_ultimocodPed,@v_ultimoLineaPed,@p_CodProveedor,@p_codProducto,@p_Unidades)
				END

			set @v_existencias = (SELECT Existencias FROM SGE_Productos_Proveedores WHERE CodProducto = @p_codProducto)

			IF((SELECT Existencias FROM SGE_Productos_Proveedores) > 0)
				BEGIN
					UPDATE SGE_Productos_Proveedores 
					SET Existencias = (@v_existencias - @p_unidades)
					WHERE CodProducto = @p_codProducto
				END
			
	--	commit transaction
	--End try
	--Begin Catch
	--	rollback transaction
	--End Catch
End

ALTER PROCEDURE [WEB].[mostrar_pedidos_fecha]
AS
SELECT CodPedido,FechaPed
FROM SGE_Pedidos_Tienda

ALTER PROCEDURE [WEB].[mostrar_pedidos_por_fecha]
@p_fechaPedido as smalldatetime
AS
SELECT CodPedido, FechaPed, FechaEntrega
FROM SGE_Pedidos_Tienda
WHERE FechaPed = @p_fechaPedido

ALTER PROCEDURE [WEB].[mostrar_lineas_pedidos_por_codigo]
@p_codPedido as int
AS
SELECT CodPedido, NumLinea, CodProveedor, CodProducto, Unidades
FROM SGE_LineasDePedidos_Tienda
WHERE CodPedido = @p_codPedido

ALTER PROCEDURE [WEB].[mostrar_lineas_pedidos_insertar]
AS
SELECT CodPedido, NumLinea, CodProducto, Unidades
FROM SGE_LineasDePedidos_Tienda

ALTER PROCEDURE [WEB].[eliminar_pedido]
@p_codPedido as int
AS 
DELETE FROM SGE_LineasDePedidos_Tienda WHERE CodPedido = @p_codPedido

DELETE FROM SGE_Pedidos_Tienda WHERE CodPedido = @p_codPedido

ALTER PROCEDURE [WEB].[eliminar_linea_pedido]
@p_NumLinea as int
AS 
DELETE FROM SGE_LineasDePedidos_Tienda WHERE NumLinea = @p_NumLinea

ALTER PROCEDURE [WEB].[actualizar_pedido]
@p_codPedido as int,
@p_NumLinea as int,
@p_CodProveedor as int,
@p_CodProducto as int,
@p_Cantidad as int
AS
UPDATE SGE_LineasDePedidos_Tienda
SET CodProveedor=@p_CodProveedor,
	CodProducto = @p_CodProducto,
	Unidades = @p_Cantidad
WHERE CodPedido = @p_CodPedido

ALTER PROCEDURE [WEB].[mostrar_lineas_pedidos_Codigo]
AS
SELECT CodPedido
FROM SGE_LineasDePedidos_Tienda
GROUP BY CodPedido

ALTER PROCEDURE [WEB].[mostrar_pedidos_Codigo]
@p_CodPedido as int
AS
SELECT CodPedido,FechaPed,FechaEntrega
FROM SGE_Pedidos_Tienda
WHERE CodPedido = @p_CodPedido

CREATE PROCEDURE [WEB].[usuario_nuevo]
@p_Usuario as char(15),
@p_Contraseña as varchar(100)
AS
INSERT INTO SGE_Login (Usuario,Contraseña)
VALUES (@p_Usuario, @p_Contraseña)

CREATE PROCEDURE [WEB].[obtener_usuario]
@p_Usuario as char(15),
@p_Contraseña as varchar(100)
AS
SELECT Usuario
FROM SGE_Login
WHERE Usuario = @p_Usuario AND Contraseña = @p_Contraseña