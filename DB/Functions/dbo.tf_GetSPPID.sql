SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[tf_GetSPPID](@OurID int, @StockID int, @ProdID int, @SecID int, @SPP int = NULL)
GO