ALTER PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd,PrecioCoste,Existencias,StockMax,StockMin
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[Realizar_Pedidos]
@p_CodProveedor as int,
@p_NombreProd as varchar(70),
@p_PrecioCoste as money,
@p_Existencias as int,
@p_StockMax as int,
@p_StockMin as int
AS
Insert Into 