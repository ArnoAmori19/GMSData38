SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[p_PrevPaid] (@DocDate smalldatetime, @OurID int, @LRecType int, @EmpID int, @DetSubID int, @DetDepID int, @SubID int, @DepID int, @PayTypeID int, @RetValueType varchar(25), @RetValue numeric(21, 9) OUTPUT)
GO