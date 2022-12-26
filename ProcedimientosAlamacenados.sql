ALTER PROCEDURE [WEB].[mostrar_productos]
AS
SELECT CodProducto, CodProveedor, NombreProd,PrecioCoste,Existencias,StockMax,StockMin
FROM SGE_Productos_Proveedores

CREATE PROCEDURE [WEB].[Realizar_Pedidos]
@p_fechaPed as smalldatetime,
@p_fechaEntrgas as smalldatetime,
@p_codProducto as nchar(10),
@p_unidades as int
AS
declare @v_ultimocodPed int
Begin
	set @v_ultimocodPed = (SELECT ISNULL(MAX(CodPedido) + 1 , 1) FROM SGE_Pedidos_Tienda)
	INSERT INTO SGE_Pedidos_Tienda VALUES (@v_ultimocodPed,@p_fechaPed,@p_fechaEntrgas)
	
	
End
