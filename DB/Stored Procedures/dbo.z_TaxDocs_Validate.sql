SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[z_TaxDocs_Validate](@Continue bit OUTPUT, @Msg varchar(200) OUTPUT)
GO