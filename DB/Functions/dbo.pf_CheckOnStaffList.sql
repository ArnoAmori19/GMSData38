SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[pf_CheckOnStaffList](@DocDate datetime, @EmpID INT, @OurID int, @SubID int, @PostID int, @BSalary numeric(21,9), @BSalaryQty numeric(21,9))
GO