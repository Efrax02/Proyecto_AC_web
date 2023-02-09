CREATE PROCEDURE [WEB].[mostrar_proveedores]
AS
SELECT CodProveedor, CodFiscal, NombreProv, Telef, Direccion, Email
FROM SGE_Proveedores

CREATE PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd, PrecioCoste, Existencias, StokcMax, StokcMin
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[Codigos_Pedidos]
AS
SELECT CodPedido,CodPedido
FROM SGE_LineasDePedidos_Tienda


CREATE PROCEDURE [WEB].[realizar_pedido]
@p_CodPedido as int,
@p_CodProveedor as int,
@p_codProducto as int,
@p_unidades as int
AS
declare @v_ultimocodPed int
declare @v_ultimoLineaPed int
declare @v_existencias int
Begin
			IF (@p_CodPedido IN (SELECT CodPedido FROM SGE_Pedidos_Tienda))
				BEGIN
					set @v_ultimoLineaPed = (SELECT ISNULL(MAX(NumLinea) + 1 , 1) FROM SGE_LineasDePedidos_Tienda)
					INSERT INTO SGE_LineasDePedidos_Tienda(CodPedido,NumLinea,CodProveedor,CodProducto,Unidades)
					VALUES (@p_CodPedido,@v_ultimoLineaPed,@p_CodProveedor,@p_codProducto,@p_Unidades)
										
				END
			ELSE 
				BEGIN
					set @v_ultimocodPed = (SELECT ISNULL(MAX(CodPedido) + 1 , 1) FROM SGE_Pedidos_Tienda)					
					INSERT INTO SGE_Pedidos_Tienda (CodPedido, FechaPed)
					VALUES (@v_ultimocodPed,GETDATE())

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
			
End

CREATE PROCEDURE [WEB].[mostrar_lineas_pedidos_por_codigo]
@p_codPedido as int
AS
SELECT CodPedido, NumLinea, CodProveedor, CodProducto, Unidades
FROM SGE_LineasDePedidos_Tienda
WHERE CodPedido = @p_codPedido

CREATE PROCEDURE [WEB].[mostrar_lineas_pedidos_insertar]
AS
SELECT CodPedido, NumLinea, CodProducto, Unidades
FROM SGE_LineasDePedidos_Tienda

CREATE PROCEDURE [WEB].[eliminar_pedido]
@p_codPedido as int
AS 
DELETE FROM SGE_LineasDePedidos_Tienda WHERE CodPedido = @p_codPedido

DELETE FROM SGE_Pedidos_Tienda WHERE CodPedido = @p_codPedido

CREATE PROCEDURE [WEB].[eliminar_linea_pedido]
@p_NumLinea as int
AS 
DELETE FROM SGE_LineasDePedidos_Tienda WHERE NumLinea = @p_NumLinea

CREATE PROCEDURE [WEB].[actualizar_pedido]
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

CREATE PROCEDURE [WEB].[mostrar_lineas_pedidos_Codigo]
AS
SELECT CodPedido
FROM SGE_LineasDePedidos_Tienda
GROUP BY CodPedido

CREATE PROCEDURE [WEB].[mostrar_pedidos_Codigo]
@p_CodPedido as int
AS
SELECT CodPedido,FechaPed,FechaEntrega
FROM SGE_Pedidos_Tienda
WHERE CodPedido = @p_CodPedido

CREATE PROCEDURE [WEB].[usuario_nuevo]
@p_Usuario as char(3),
@p_Contraseña as varchar(100),
@p_Nombre as varchar(50),
@p_Apellido as varchar(50)
AS
INSERT INTO SGE_Login (Nom_Usuario,Contraseña,Nombre,Apellido)
VALUES (@p_Usuario, @p_Contraseña,@p_Nombre,@p_Apellido)

ALTER PROCEDURE [WEB].[obtener_usuario]
@p_Usuario as char(3),
@p_Contraseña as varchar(100)
AS
SELECT Nom_Usuario,Contraseña
FROM SGE_Login
WHERE Nom_Usuario = @p_Usuario AND Contraseña = @p_Contraseña