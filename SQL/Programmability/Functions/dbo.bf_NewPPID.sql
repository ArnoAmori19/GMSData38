﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[bf_NewPPID](@ProdID int)
/* Возвращает номер для новой партии (Бизнес) */
RETURNS int AS
BEGIN
  DECLARE @PPStart int, @PPEnd int, @PPID int
  SELECT @PPStart = PPIDStart, @PPEnd = PPIDEnd FROM dbo.zf_PPIDRange()

  IF @PPStart = @PPEnd
    SELECT @PPID = ISNULL(MAX(PPID) + 1, @PPStart) FROM b_pInP WHERE ProdID = @ProdID
  ELSE
    BEGIN
      SELECT @PPID = ISNULL(MAX(PPID) + 1, @PPStart) FROM b_pInP WHERE ProdID = @ProdID AND PPID BETWEEN @PPStart AND @PPEnd
      IF @PPID > @PPEnd SET @PPID = NULL
    END
  RETURN @PPID
END
GO