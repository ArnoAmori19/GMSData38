SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[t_SaleSrvGetProdsDiff](@CRID int, @MainUM bit, @RefreshOnly bit = 0)
GO