SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[zf_t_CalcRem]()
RETURNS @out table(OurID int NULL, StockID int NULL, SecID int NULL, ProdID int NULL, PPID int NULL, Qty numeric(21, 9) NULL, AccQty numeric(21, 9) NULL)
AS
BEGIN
  INSERT @out 
  SELECT OurID, StockID, SecID, ProdID, PPID, SUM(Qty), SUM(AccQty) FROM (

/* Возврат товара от получателя: Заголовок */
    SELECT DISTINCT t_Ret.OurID OurID, t_Ret.StockID StockID, t_RetD.SecID SecID, t_RetD.ProdID ProdID, t_RetD.PPID PPID, SUM(t_RetD.Qty) Qty, 0 AccQty
    GROUP BY t_Ret.OurID, t_Ret.StockID, t_RetD.SecID, t_RetD.ProdID, t_RetD.PPID

  UNION ALL 

/* Возврат товара по чеку: Заголовок */
    SELECT DISTINCT t_CRRet.OurID OurID, t_CRRet.StockID StockID, t_CRRetD.SecID SecID, t_CRRetD.ProdID ProdID, t_CRRetD.PPID PPID, SUM(t_CRRetD.Qty) Qty, 0 AccQty
    GROUP BY t_CRRet.OurID, t_CRRet.StockID, t_CRRetD.SecID, t_CRRetD.ProdID, t_CRRetD.PPID

  UNION ALL 

/* Возврат товара поставщику: Заголовок */
    SELECT DISTINCT t_CRet.OurID OurID, t_CRet.StockID StockID, t_CRetD.SecID SecID, t_CRetD.ProdID ProdID, t_CRetD.PPID PPID, -SUM(t_CRetD.Qty) Qty, 0 AccQty
    GROUP BY t_CRet.OurID, t_CRet.StockID, t_CRetD.SecID, t_CRetD.ProdID, t_CRetD.PPID

  UNION ALL 

/* Входящие остатки товара */
    SELECT DISTINCT t_zInP.OurID OurID, t_zInP.StockID StockID, t_zInP.SecID SecID, t_zInP.ProdID ProdID, t_zInP.PPID PPID, SUM(t_zInP.Qty) Qty, 0 AccQty
    GROUP BY t_zInP.OurID, t_zInP.StockID, t_zInP.SecID, t_zInP.ProdID, t_zInP.PPID

  UNION ALL 

/* Инвентаризация товара: Заголовок */
    SELECT DISTINCT t_Ven.OurID OurID, t_Ven.StockID StockID, t_VenD.SecID SecID, t_VenA.ProdID ProdID, t_VenD.PPID PPID, SUM(t_VenD.NewQty) Qty, 0 AccQty
    GROUP BY t_Ven.OurID, t_Ven.StockID, t_VenD.SecID, t_VenA.ProdID, t_VenD.PPID

  UNION ALL 

/* Инвентаризация товара: Заголовок */
    SELECT DISTINCT t_Ven.OurID OurID, t_Ven.StockID StockID, t_VenD.SecID SecID, t_VenA.ProdID ProdID, t_VenD.PPID PPID, -SUM(t_VenD.Qty) Qty, 0 AccQty
    GROUP BY t_Ven.OurID, t_Ven.StockID, t_VenD.SecID, t_VenA.ProdID, t_VenD.PPID

  UNION ALL 

/* Комплектация товара: Заголовок */
    SELECT DISTINCT t_SRec.OurID OurID, t_SRec.StockID StockID, t_SRecA.SecID SecID, t_SRecA.ProdID ProdID, t_SRecA.PPID PPID, SUM(t_SRecA.Qty) Qty, 0 AccQty
    GROUP BY t_SRec.OurID, t_SRec.StockID, t_SRecA.SecID, t_SRecA.ProdID, t_SRecA.PPID

  UNION ALL 

/* Комплектация товара: Заголовок */
    SELECT DISTINCT t_SRec.OurID OurID, t_SRec.SubStockID StockID, t_SRecD.SubSecID SecID, t_SRecD.SubProdID ProdID, t_SRecD.SubPPID PPID, -SUM(t_SRecD.SubQty) Qty, 0 AccQty
    GROUP BY t_SRec.OurID, t_SRec.SubStockID, t_SRecD.SubSecID, t_SRecD.SubProdID, t_SRecD.SubPPID

  UNION ALL 

/* Перемещение товара: Заголовок */
    SELECT DISTINCT t_Exc.OurID OurID, t_Exc.NewStockID StockID, t_ExcD.NewSecID SecID, t_ExcD.ProdID ProdID, t_ExcD.PPID PPID, SUM(t_ExcD.Qty) Qty, 0 AccQty
    GROUP BY t_Exc.OurID, t_Exc.NewStockID, t_ExcD.NewSecID, t_ExcD.ProdID, t_ExcD.PPID

  UNION ALL 

/* Перемещение товара: Заголовок */
    SELECT DISTINCT t_Exc.OurID OurID, t_Exc.StockID StockID, t_ExcD.SecID SecID, t_ExcD.ProdID ProdID, t_ExcD.PPID PPID, -SUM(t_ExcD.Qty) Qty, 0 AccQty
    GROUP BY t_Exc.OurID, t_Exc.StockID, t_ExcD.SecID, t_ExcD.ProdID, t_ExcD.PPID

  UNION ALL 

/* Переоценка цен прихода: Заголовок */
    SELECT DISTINCT t_Est.OurID OurID, t_Est.StockID StockID, t_EstD.SecID SecID, t_EstD.ProdID ProdID, t_EstD.NewPPID PPID, SUM(t_EstD.Qty) Qty, 0 AccQty
    GROUP BY t_Est.OurID, t_Est.StockID, t_EstD.SecID, t_EstD.ProdID, t_EstD.NewPPID

  UNION ALL 

/* Переоценка цен прихода: Заголовок */
    SELECT DISTINCT t_Est.OurID OurID, t_Est.StockID StockID, t_EstD.SecID SecID, t_EstD.ProdID ProdID, t_EstD.PPID PPID, -SUM(t_EstD.Qty) Qty, 0 AccQty
    GROUP BY t_Est.OurID, t_Est.StockID, t_EstD.SecID, t_EstD.ProdID, t_EstD.PPID

  UNION ALL 

/* Приход товара: Заголовок */
    SELECT DISTINCT t_Rec.OurID OurID, t_Rec.StockID StockID, t_RecD.SecID SecID, t_RecD.ProdID ProdID, t_RecD.PPID PPID, SUM(t_RecD.Qty) Qty, 0 AccQty
    GROUP BY t_Rec.OurID, t_Rec.StockID, t_RecD.SecID, t_RecD.ProdID, t_RecD.PPID

  UNION ALL 

/* Приход товара по ГТД: Заголовок */
    SELECT DISTINCT t_Cst.OurID OurID, t_Cst.StockID StockID, t_CstD.SecID SecID, t_CstD.ProdID ProdID, t_CstD.PPID PPID, SUM(t_CstD.Qty) Qty, 0 AccQty
    GROUP BY t_Cst.OurID, t_Cst.StockID, t_CstD.SecID, t_CstD.ProdID, t_CstD.PPID

  UNION ALL 

/* Продажа товара оператором: Заголовок */
    SELECT DISTINCT t_Sale.OurID OurID, t_Sale.StockID StockID, t_SaleD.SecID SecID, t_SaleD.ProdID ProdID, t_SaleD.PPID PPID, -SUM(t_SaleD.Qty) Qty, 0 AccQty
    GROUP BY t_Sale.OurID, t_Sale.StockID, t_SaleD.SecID, t_SaleD.ProdID, t_SaleD.PPID

  UNION ALL 

/* Разукомплектация товара: Заголовок */
    SELECT DISTINCT t_SExp.OurID OurID, t_SExp.StockID StockID, t_SExpA.SecID SecID, t_SExpA.ProdID ProdID, t_SExpA.PPID PPID, -SUM(t_SExpA.Qty) Qty, 0 AccQty
    GROUP BY t_SExp.OurID, t_SExp.StockID, t_SExpA.SecID, t_SExpA.ProdID, t_SExpA.PPID

  UNION ALL 

/* Разукомплектация товара: Заголовок */
    SELECT DISTINCT t_SExp.OurID OurID, t_SExp.SubStockID StockID, t_SExpD.SubSecID SecID, t_SExpD.SubProdID ProdID, t_SExpD.SubPPID PPID, SUM(t_SExpD.SubQty) Qty, 0 AccQty
    GROUP BY t_SExp.OurID, t_SExp.SubStockID, t_SExpD.SubSecID, t_SExpD.SubProdID, t_SExpD.SubPPID

  UNION ALL 

/* Расходная накладная: Заголовок */
    SELECT DISTINCT t_Inv.OurID OurID, t_Inv.StockID StockID, t_InvD.SecID SecID, t_InvD.ProdID ProdID, t_InvD.PPID PPID, -SUM(t_InvD.Qty) Qty, 0 AccQty
    GROUP BY t_Inv.OurID, t_Inv.StockID, t_InvD.SecID, t_InvD.ProdID, t_InvD.PPID

  UNION ALL 

/* Расходный документ: Заголовок */
    SELECT DISTINCT t_Exp.OurID OurID, t_Exp.StockID StockID, t_ExpD.SecID SecID, t_ExpD.ProdID ProdID, t_ExpD.PPID PPID, -SUM(t_ExpD.Qty) Qty, 0 AccQty
    GROUP BY t_Exp.OurID, t_Exp.StockID, t_ExpD.SecID, t_ExpD.ProdID, t_ExpD.PPID

  UNION ALL 

/* Расходный документ в ценах прихода: Заголовок */
    SELECT DISTINCT t_Epp.OurID OurID, t_Epp.StockID StockID, t_EppD.SecID SecID, t_EppD.ProdID ProdID, t_EppD.PPID PPID, -SUM(t_EppD.Qty) Qty, 0 AccQty
    GROUP BY t_Epp.OurID, t_Epp.StockID, t_EppD.SecID, t_EppD.ProdID, t_EppD.PPID

  UNION ALL 

/* Счет на оплату товара: Заголовок */
    SELECT DISTINCT t_Acc.OurID OurID, t_Acc.StockID StockID, t_AccD.SecID SecID, t_AccD.ProdID ProdID, t_AccD.PPID PPID, 0 Qty, SUM(t_AccD.Qty) AccQty
    GROUP BY t_Acc.OurID, t_Acc.StockID, t_AccD.SecID, t_AccD.ProdID, t_AccD.PPID

  ) q 
  GROUP BY OurID,StockID,SecID,ProdID,PPID
  RETURN
END
GO