alter procedure [north].[venta]
	@p_codCliente int,
	@p_codProducto int,
	@p_tlineas t_SGELineasPedido readonly,
	@p_salida int output,
	@p_codPedido int output,
	@p_numLinea int output

as
	declare @v_ultimocodPed int
	declare @v_ultimaLinPed int
	declare cursor_lineas cursor
	for select CodProducto, Unidades
		from @p_tlineas
	declare @v_codProducto int
	declare @v_unidades int

begin
	/*Se obtiene el ultimo pedido de la tabla pedidos*/
	select top 1 @v_ultimocodPed = CodPedido
	from SGE_Pedidos
	order by CodPedido desc

	/*Se añade un pedido más*/
	set @v_ultimocodPed = @v_ultimocodPed + 1

	/*Se obtiene el ultima linea de pedido*/
	select top 1 @v_ultimaLinPed = NumLinea
	from SGE_LineasDePedidos
	order by NumLinea desc

	/*Se añade una linea más*/
	set @v_ultimaLinPed = @v_ultimaLinPed + 1

	/*Comienzo de inserción de pedido*/
	begin transaction
		begin try
			insert into SGE_Pedidos (CodPedido, CodCliente) values (@v_ultimocodPed,@p_codCliente)
			
			/*Abrimos el cursor*/
			open cursor_lineas
				fetch cursor_lineas into @v_ultimaLinPed, @v_codProducto, @v_unidades
				/*Repetir hasta que @@FETCH_STATUS devuelva algo distinto de 0*/
				while @@FETCH_STATUS = 0
				begin
					/*Se obtiene el ultima linea de pedido*/
					select top 1 @v_ultimaLinPed = NumLinea
					from SGE_LineasDePedidos
					order by NumLinea desc

					/*Se añade una linea más*/
					set @v_ultimaLinPed = @v_ultimaLinPed + 1


					insert into SGE_LineasDePedidos (CodPedido,NumLinea,CodProducto,Unidades) values (@v_ultimocodPed,@v_ultimaLinPed,@v_codProducto,@v_unidades)
					fetch cursor_lineas into @v_ultimaLinPed, @v_codProducto, @v_unidades
				end
			/*Cerramos el cursor*/
			close cursor_lineas
		commit transaction
			set @p_salida = 1
			set @p_codPedido = @v_ultimocodPed
			set @p_numLinea = @v_ultimaLinPed
	end try
	begin catch
		set @p_salida = 1
		rollback transaction
	end catch
end

--create type [dbo].[t_SGELineasPedido] as table (
--	[CodProducto] [int] null,
--	[Unidades] [int] null
--)


/******************************************************************/

alter procedure [NORTH].[Facturacion]
@p_CodCliente int,
@p_CodProducto int,
@p_Cantidad int,
@p_Pagada bit,
@p_tLineasFac t_SGELineasFactura readonly,
@p_totalfactura smallmoney,
@p_totalProd smallmoney output,
@p_CodFactura int output,
@p_LinFactura int output,
@p_salida int output

as
declare @v_ultimoCodFact int,
		@v_ultimaLinFact int
declare cursor_lineas cursor 
for select CodProducto,Cantidad,Total
	from @p_tLineasFac
	declare @v_CodProducto int, @v_Cantidad int, @v_Total smallmoney
	declare @v_totalFac int, @v_totalLinFac int

begin

/*Calculo de ultima factura*/
select top 1 @v_ultimoCodFact = CodFactura
from SGE_Factura
order by CodFactura desc

/*Se añade pedido*/
if @v_ultimoCodFact = null
	set @v_ultimoCodFact = 1
else
	set @v_ultimoCodFact = @v_ultimoCodFact + 1

	/*Calculo de ultima Linea factura*/
select top 1 @v_ultimaLinFact = LinFactura
from SGE_LineasFactura
order by LinFactura desc

/*Se añade pedido*/
if @v_ultimaLinFact = null
	set @v_ultimaLinFact = 1
else
	set @v_ultimaLinFact = @v_ultimaLinFact + 1


/*Calculo de totales*/
select @v_totalLinFac = (Cantidad * PVP) from SGE_LineasFactura as LF JOIN SGE_Productos as P on LF.CodProducto = P.CodProducto


/*Comienzo de la insercion de una factura*/
begin transaction
	begin try
		insert into SGE_Factura (CodFactura,CodCliente,[Total a Pagar],Pagada) values (@v_ultimoCodFact,@p_CodCliente,@p_totalfactura,@p_Pagada)

		/*Abrimos el cursor*/
		open cursor_lineas
			fetch cursor_lineas into @v_ultimaLinFact, @v_CodProducto, @v_Cantidad, @v_Total

			while @@FETCH_STATUS = 0
			begin
				insert into SGE_LineasFactura (CodFactura,LinFactura,CodProducto,Cantidad,Total) values (@v_ultimoCodFact, @v_ultimaLinFact, @v_CodProducto, @v_Cantidad, @p_totalProd)
				fetch cursor_lineas into @v_ultimaLinFact, @v_CodProducto, @v_Cantidad, @v_Total
			end
		/*Cerramos el cursor*/
		close cursor_lineas
	 commit transaction
		set @p_salida = 1
		set @p_CodFactura = @v_ultimoCodFact
		set @p_LinFactura = @v_ultimaLinFact
		set @p_totalProd = @v_totalLinFac
	end try
	begin catch
		set @p_salida = 1
		rollback transaction
	end catch
end

--create type [dbo].[t_SGELineasFactura] as table (
--	[CodProducto] [int] null,
--	[Cantidad] [int] null,
--	[Total] [smallmoney] null )

