SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[zf_CorrectPriceForTaxProd](@PriceCC numeric(19, 9), @ProdID int, @DocDate smalldatetime)
GO