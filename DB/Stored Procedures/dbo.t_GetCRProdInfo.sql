SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[t_GetCRProdInfo](@CRID smallint, @ProdID int, @PriceCC varchar(200), @TaxID int, @CheckPrice bit, @ProdName varchar(200), @CashProdID int output, @DecimalQty bit output, @Result bit output) AS
GO