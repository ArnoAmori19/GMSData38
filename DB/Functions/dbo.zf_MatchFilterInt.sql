SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[zf_MatchFilterInt](@Value int, @FiltStr varchar (4000), @Delim varchar (10))
GO