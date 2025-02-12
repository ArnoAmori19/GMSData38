﻿CREATE TABLE [dbo].[b_Exp] (
  [ChID] [bigint] NOT NULL,
  [DocID] [bigint] NOT NULL,
  [IntDocID] [varchar](50) NULL,
  [DocDate] [smalldatetime] NOT NULL,
  [KursMC] [numeric](21, 9) NOT NULL,
  [OurID] [int] NOT NULL,
  [StockID] [int] NOT NULL,
  [CompID] [int] NOT NULL,
  [CodeID1] [smallint] NOT NULL,
  [CodeID2] [smallint] NOT NULL,
  [CodeID3] [smallint] NOT NULL,
  [CodeID4] [smallint] NOT NULL,
  [CodeID5] [smallint] NOT NULL,
  [EmpID] [int] NOT NULL,
  [Notes] [varchar](200) NULL,
  [TranCC] [numeric](21, 9) NULL,
  [MoreCC] [numeric](21, 9) NULL,
  [GTSum_wt] [numeric](21, 9) NOT NULL,
  [GTTaxSum] [numeric](21, 9) NOT NULL,
  [GTAccID] [int] NOT NULL,
  [LetAttor] [varchar](200) NULL,
  [CompAdd] [varchar](200) NULL,
  [StateCode] [int] NOT NULL DEFAULT (0),
  [CurrID] [smallint] NOT NULL DEFAULT (0),
  [TSumCC_nt] [numeric](21, 9) NOT NULL CONSTRAINT [DF__b_Exp__TSumCC_nt__765A9EBF] DEFAULT (0),
  [TTaxSum] [numeric](21, 9) NOT NULL CONSTRAINT [DF__b_Exp__TTaxSum__774EC2F8] DEFAULT (0),
  [TSumCC_wt] [numeric](21, 9) NOT NULL CONSTRAINT [DF__b_Exp__TSumCC_wt__7842E731] DEFAULT (0),
  [TSumCC_In] [numeric](21, 9) NOT NULL CONSTRAINT [DF__b_Exp__TSumCC_In__79370B6A] DEFAULT (0),
  [GPosID] [int] NOT NULL DEFAULT (0),
  [GTCorrSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTAdvAccID] [int] NOT NULL DEFAULT (0),
  [GTAdvSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrAdvSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTAdvTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrAdvTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TRealSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TLevySum] [numeric](21, 9) NOT NULL DEFAULT (0),
  CONSTRAINT [pk_b_Exp] PRIMARY KEY CLUSTERED ([ChID])
)
ON [PRIMARY]
GO

CREATE INDEX [CodeID1]
  ON [dbo].[b_Exp] ([CodeID1])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID2]
  ON [dbo].[b_Exp] ([CodeID2])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID3]
  ON [dbo].[b_Exp] ([CodeID3])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID4]
  ON [dbo].[b_Exp] ([CodeID4])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID5]
  ON [dbo].[b_Exp] ([CodeID5])
  ON [PRIMARY]
GO

CREATE INDEX [CompID]
  ON [dbo].[b_Exp] ([CompID])
  ON [PRIMARY]
GO

CREATE INDEX [DocDate]
  ON [dbo].[b_Exp] ([DocDate])
  ON [PRIMARY]
GO

CREATE INDEX [DocID]
  ON [dbo].[b_Exp] ([DocID])
  ON [PRIMARY]
GO

CREATE INDEX [EmpID]
  ON [dbo].[b_Exp] ([EmpID])
  ON [PRIMARY]
GO

CREATE INDEX [GTAccID]
  ON [dbo].[b_Exp] ([GTAccID])
  ON [PRIMARY]
GO

CREATE INDEX [IntDocID]
  ON [dbo].[b_Exp] ([IntDocID])
  ON [PRIMARY]
GO

CREATE INDEX [KursMC]
  ON [dbo].[b_Exp] ([KursMC])
  ON [PRIMARY]
GO

CREATE INDEX [OurID]
  ON [dbo].[b_Exp] ([OurID])
  ON [PRIMARY]
GO

CREATE INDEX [StockID]
  ON [dbo].[b_Exp] ([StockID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [UniqueIndex]
  ON [dbo].[b_Exp] ([OurID], [DocID])
  ON [PRIMARY]
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.ChID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.DocID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.KursMC'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.OurID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.StockID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CompID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CodeID1'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CodeID2'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CodeID3'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CodeID4'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.CodeID5'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.EmpID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.TranCC'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.MoreCC'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.GTSum_wt'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.GTTaxSum'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_Exp.GTAccID'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TAU2_UPD_b_Exp] ON [b_Exp]
FOR UPDATE
AS
BEGIN
  IF @@RowCount = 0 RETURN
  SET NOCOUNT ON
/* -------------------------------------------------------------------------- */

/* 147 - Текущие остатки товара */
/* b_Exp - ТМЦ: Внутренний расход (Заголовок) */
/* b_Rem - ТМЦ: Текущие остатки (Данные) */

IF UPDATE(OurID) OR UPDATE(StockID)
BEGIN
  INSERT INTO b_Rem (OurID, StockID, PPID, ProdID, Qty)
  SELECT DISTINCT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 0
  FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), inserted m
  WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
  AND (NOT EXISTS (SELECT TOP 1 1 FROM b_Rem r WITH (NOLOCK)
       WHERE m.OurID = r.OurID AND m.StockID = r.StockID AND b_ExpD.PPID = r.PPID AND b_ExpD.ProdID = r.ProdID))
  IF @@error > 0 Return

  INSERT INTO b_Rem (OurID, StockID, PPID, ProdID, Qty)
  SELECT DISTINCT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 0
  FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), deleted m
  WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
  AND (NOT EXISTS (SELECT TOP 1 1 FROM b_Rem r WITH (NOLOCK)
       WHERE m.OurID = r.OurID AND m.StockID = r.StockID AND b_ExpD.PPID = r.PPID AND b_ExpD.ProdID = r.ProdID))
  IF @@error > 0 Return

  UPDATE r
  SET 
    r.Qty = r.Qty + q.Qty
  FROM b_Rem r, 
    (SELECT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 
       ISNULL(SUM(b_ExpD.Qty), 0) Qty 
     FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), deleted m
     WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
     GROUP BY m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID) q
  WHERE q.OurID = r.OurID AND q.StockID = r.StockID AND q.PPID = r.PPID AND q.ProdID = r.ProdID
  IF @@error > 0 Return

  UPDATE r
  SET 
    r.Qty = r.Qty - q.Qty
  FROM b_Rem r, 
    (SELECT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 
       ISNULL(SUM(b_ExpD.Qty), 0) Qty 
     FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), inserted m
     WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
     GROUP BY m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID) q
  WHERE q.OurID = r.OurID AND q.StockID = r.StockID AND q.PPID = r.PPID AND q.ProdID = r.ProdID
  IF @@error > 0 Return
END
/* -------------------------------------------------------------------------- */

END
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TAU3_DEL_b_Exp] ON [b_Exp]
FOR DELETE
AS
BEGIN
  IF @@RowCount = 0 RETURN
  SET NOCOUNT ON
/* -------------------------------------------------------------------------- */

/* 147 - Текущие остатки товара */
/* b_Exp - ТМЦ: Внутренний расход (Заголовок) */
/* b_Rem - ТМЦ: Текущие остатки (Данные) */

  INSERT INTO b_Rem (OurID, StockID, PPID, ProdID, Qty)
  SELECT DISTINCT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 0
  FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), deleted m
  WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
  AND (NOT EXISTS (SELECT TOP 1 1 FROM b_Rem r WITH (NOLOCK)
       WHERE m.OurID = r.OurID AND m.StockID = r.StockID AND b_ExpD.PPID = r.PPID AND b_ExpD.ProdID = r.ProdID))
  IF @@error > 0 Return

  UPDATE r
  SET 
    r.Qty = r.Qty + q.Qty
  FROM b_Rem r, 
    (SELECT m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID, 
       ISNULL(SUM(b_ExpD.Qty), 0) Qty 
     FROM r_Prods WITH (NOLOCK), b_ExpD WITH (NOLOCK), deleted m
     WHERE b_ExpD.ProdID = r_Prods.ProdID AND m.ChID = b_ExpD.ChID AND (r_Prods.InRems <> 0)
     GROUP BY m.OurID, m.StockID, b_ExpD.PPID, b_ExpD.ProdID) q
  WHERE q.OurID = r.OurID AND q.StockID = r.StockID AND q.PPID = r.PPID AND q.ProdID = r.ProdID
  IF @@error > 0 Return
/* -------------------------------------------------------------------------- */

END
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel1_Ins_b_Exp] ON [b_Exp]
FOR INSERT AS
/* b_Exp - ТМЦ: Внутренний расход (Заголовок) - INSERT TRIGGER */
BEGIN
  DECLARE @RCount Int
  SELECT @RCount = @@RowCount
  IF @RCount = 0 RETURN
  SET NOCOUNT ON

/* Проверка открытого периода */
  DECLARE @OurID int, @ADate datetime, @Err varchar(200)
  DECLARE @GetDate datetime
  DECLARE @OpenAges table(OurID int, BDate datetime, EDate datetime, isIns bit, isDel bit)

  SET @GetDate = GETDATE()

  INSERT INTO @OpenAges(OurID, isIns)
  SELECT DISTINCT OurID, 1 FROM inserted a 

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM deleted a 

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate < t.BDate))

  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID AS varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
  IF EXISTS(SELECT * FROM inserted i WHERE dbo.zf_IsValidDocState(14112, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Документ ''ТМЦ: Внутренний расход'' не может иметь указанный статус.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END


/* b_Exp ^ r_Codes1 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 1 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
    BEGIN
      EXEC z_RelationError 'r_Codes1', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Codes2 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 2 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
    BEGIN
      EXEC z_RelationError 'r_Codes2', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Codes3 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 3 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
    BEGIN
      EXEC z_RelationError 'r_Codes3', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Codes4 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 4 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
    BEGIN
      EXEC z_RelationError 'r_Codes4', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Codes5 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 5 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
    BEGIN
      EXEC z_RelationError 'r_Codes5', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Comps - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник предприятий - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CompID NOT IN (SELECT CompID FROM r_Comps))
    BEGIN
      EXEC z_RelationError 'r_Comps', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Currs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник валют - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CurrID NOT IN (SELECT CurrID FROM r_Currs))
    BEGIN
      EXEC z_RelationError 'r_Currs', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Emps - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник служащих - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.EmpID NOT IN (SELECT EmpID FROM r_Emps))
    BEGIN
      EXEC z_RelationError 'r_Emps', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_GAccs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ План счетов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.GTAccID NOT IN (SELECT GAccID FROM r_GAccs))
    BEGIN
      EXEC z_RelationError 'r_GAccs', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_GAccs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ План счетов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.GTAdvAccID NOT IN (SELECT GAccID FROM r_GAccs))
    BEGIN
      EXEC z_RelationError 'r_GAccs', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Ours - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник внутренних фирм - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.OurID NOT IN (SELECT OurID FROM r_Ours))
    BEGIN
      EXEC z_RelationError 'r_Ours', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_States - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник статусов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
    BEGIN
      EXEC z_RelationError 'r_States', 'b_Exp', 0
      RETURN
    END

/* b_Exp ^ r_Stocks - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник складов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.StockID NOT IN (SELECT StockID FROM r_Stocks))
    BEGIN
      EXEC z_RelationError 'r_Stocks', 'b_Exp', 0
      RETURN
    END

/* Регистрация создания записи */
  INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
  SELECT 14112001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i

END
GO

EXEC sp_settriggerorder N'dbo.TRel1_Ins_b_Exp', N'Last', N'INSERT'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel2_Upd_b_Exp] ON [b_Exp]
FOR UPDATE AS
/* b_Exp - ТМЦ: Внутренний расход (Заголовок) - UPDATE TRIGGER */
BEGIN
  DECLARE @RCount Int
  SELECT @RCount = @@RowCount
  IF @RCount = 0 RETURN
  SET NOCOUNT ON

/* Проверка открытого периода */
  DECLARE @OurID int, @ADate datetime, @Err varchar(200)
  DECLARE @GetDate datetime
  DECLARE @OpenAges table(OurID int, BDate datetime, EDate datetime, isIns bit, isDel bit)

  SET @GetDate = GETDATE()

  INSERT INTO @OpenAges(OurID, isIns)
  SELECT DISTINCT OurID, 1 FROM inserted a 

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM deleted a 

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.BDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Возможно ли изменить дату документа */
  IF UPDATE(DocDate) 
    BEGIN
      DECLARE @OldTaxPercent numeric(21, 9)
      DECLARE @NewTaxPercent numeric(21, 9)
      SELECT @OldTaxPercent = dbo.zf_GetTaxPercentByDate(0, (SELECT DocDate FROM deleted)), @NewTaxPercent = dbo.zf_GetTaxPercentByDate(0, (SELECT DocDate FROM inserted))
      IF @OldTaxPercent <> @NewTaxPercent
        BEGIN
          RAISERROR ('Изменение даты документа невозможно (Различные налоговые ставки).', 18, 1)
          ROLLBACK TRAN
          RETURN 
        END
    END  

/* Обработка статуса */
  IF UPDATE(StateCode) AND EXISTS(SELECT * FROM inserted i, deleted d WHERE i.ChID = d.ChID AND dbo.zf_CanChangeState(14112, i.ChID, d.StateCode, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Переход в указанный статус невозможен (ТМЦ: Внутренний расход).', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  IF UPDATE(StateCode)
    BEGIN
      INSERT INTO z_LogState (StateRuleCode, DocCode, ChID, OldStateCode, NewStateCode, UserCode)
      SELECT s.StateRuleCode, 14112, i.ChID, d.StateCode, i.StateCode, dbo.zf_GetUserCode() FROM inserted i, deleted d, r_StateRules s
      WHERE i.ChID = d.ChID AND s.StateCodeFrom = d.StateCode AND s.StateCodeTo = i.StateCode
    END

/* Возможно ли редактирование документа */
  DECLARE @StateCodePosID int
  SELECT @StateCodePosID = colid FROM syscolumns WHERE id = object_id('b_Exp') AND name = 'StateCode'
  DECLARE @BytePos int
  DECLARE @UpdLen int
  DECLARE @FieldsChanged bit
  SET @FieldsChanged = 0
  SET @BytePos = CAST(CEILING(@StateCodePosID / 8.0) AS int)
  SET @UpdLen = LEN(COLUMNS_UPDATED())
  WHILE (@UpdLen > 0 AND @FieldsChanged = 0)
    BEGIN
      IF @UpdLen = @BytePos
        BEGIN
         IF CAST(SUBSTRING(COLUMNS_UPDATED(), @UpdLen, 1) AS Int) <> POWER(2, @StateCodePosID - (CEILING(@StateCodePosID / 8.0) - 1) * 8 - 1)
           SET @FieldsChanged = 1
        END
      ELSE
        IF CAST(SUBSTRING(COLUMNS_UPDATED(), @UpdLen, 1) AS Int) <> 0
          SET @FieldsChanged = 1
      SET @UpdLen = @UpdLen - 1
    END
  IF @FieldsChanged = 1
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(14112, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''ТМЦ: Внутренний расход'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* b_Exp ^ r_Codes1 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 1 - Проверка в PARENT */
  IF UPDATE(CodeID1)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
      BEGIN
        EXEC z_RelationError 'r_Codes1', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Codes2 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 2 - Проверка в PARENT */
  IF UPDATE(CodeID2)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
      BEGIN
        EXEC z_RelationError 'r_Codes2', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Codes3 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 3 - Проверка в PARENT */
  IF UPDATE(CodeID3)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
      BEGIN
        EXEC z_RelationError 'r_Codes3', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Codes4 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 4 - Проверка в PARENT */
  IF UPDATE(CodeID4)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
      BEGIN
        EXEC z_RelationError 'r_Codes4', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Codes5 - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник признаков 5 - Проверка в PARENT */
  IF UPDATE(CodeID5)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
      BEGIN
        EXEC z_RelationError 'r_Codes5', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Comps - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник предприятий - Проверка в PARENT */
  IF UPDATE(CompID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CompID NOT IN (SELECT CompID FROM r_Comps))
      BEGIN
        EXEC z_RelationError 'r_Comps', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Currs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник валют - Проверка в PARENT */
  IF UPDATE(CurrID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CurrID NOT IN (SELECT CurrID FROM r_Currs))
      BEGIN
        EXEC z_RelationError 'r_Currs', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Emps - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник служащих - Проверка в PARENT */
  IF UPDATE(EmpID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.EmpID NOT IN (SELECT EmpID FROM r_Emps))
      BEGIN
        EXEC z_RelationError 'r_Emps', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_GAccs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ План счетов - Проверка в PARENT */
  IF UPDATE(GTAccID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.GTAccID NOT IN (SELECT GAccID FROM r_GAccs))
      BEGIN
        EXEC z_RelationError 'r_GAccs', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_GAccs - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ План счетов - Проверка в PARENT */
  IF UPDATE(GTAdvAccID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.GTAdvAccID NOT IN (SELECT GAccID FROM r_GAccs))
      BEGIN
        EXEC z_RelationError 'r_GAccs', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Ours - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник внутренних фирм - Проверка в PARENT */
  IF UPDATE(OurID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.OurID NOT IN (SELECT OurID FROM r_Ours))
      BEGIN
        EXEC z_RelationError 'r_Ours', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_States - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник статусов - Проверка в PARENT */
  IF UPDATE(StateCode)
    IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
      BEGIN
        EXEC z_RelationError 'r_States', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ r_Stocks - Проверка в PARENT */
/* ТМЦ: Внутренний расход (Заголовок) ^ Справочник складов - Проверка в PARENT */
  IF UPDATE(StockID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.StockID NOT IN (SELECT StockID FROM r_Stocks))
      BEGIN
        EXEC z_RelationError 'r_Stocks', 'b_Exp', 1
        RETURN
      END

/* b_Exp ^ b_ExpD - Обновление CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ ТМЦ: Внутренний расход (ТМЦ) - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ChID = i.ChID
          FROM b_ExpD a, inserted i, deleted d WHERE a.ChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM b_ExpD a, deleted d WHERE a.ChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''ТМЦ: Внутренний расход (Заголовок)'' => ''ТМЦ: Внутренний расход (ТМЦ)''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* b_Exp ^ z_DocLinks - Обновление CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ChildDocCode = 14112, a.ChildChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ChildDocCode = 14112 AND a.ChildChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 14112 AND a.ChildChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''ТМЦ: Внутренний расход (Заголовок)'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* b_Exp ^ z_DocLinks - Обновление CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ParentDocCode = 14112, a.ParentChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ParentDocCode = 14112 AND a.ParentChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ParentDocCode = 14112 AND a.ParentChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''ТМЦ: Внутренний расход (Заголовок)'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* b_Exp ^ z_DocShed - Обновление CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Процессы - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.DocCode = 14112, a.ChID = i.ChID
          FROM z_DocShed a, inserted i, deleted d WHERE a.DocCode = 14112 AND a.ChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocShed a, deleted d WHERE a.DocCode = 14112 AND a.ChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''ТМЦ: Внутренний расход (Заголовок)'' => ''Документы - Процессы''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* Обновления информации о документе в связях */
IF UPDATE(DocDate) OR UPDATE(DocID)
  BEGIN
    UPDATE l SET l.ChildDocID = i.DocID, l.ChildDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ChildDocCode = 14112 AND l.ChildChID = i.ChID

    UPDATE l SET l.ParentDocID = i.DocID, l.ParentDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ParentDocCode = 14112 AND l.ParentChID = i.ChID
  END

/* Регистрация изменения записи */

  IF NOT(UPDATE(DocID) OR UPDATE(IntDocID) OR UPDATE(DocDate) OR UPDATE(KursMC) OR UPDATE(OurID) OR UPDATE(StockID) OR UPDATE(CompID) OR UPDATE(CodeID1) OR UPDATE(CodeID2) OR UPDATE(CodeID3) OR UPDATE(CodeID4) OR UPDATE(CodeID5) OR UPDATE(EmpID) OR UPDATE(Notes) OR UPDATE(TranCC) OR UPDATE(MoreCC) OR UPDATE(GTSum_wt) OR UPDATE(GTTaxSum) OR UPDATE(GTAccID) OR UPDATE(LetAttor) OR UPDATE(CompAdd) OR UPDATE(StateCode) OR UPDATE(CurrID) OR UPDATE(GPosID) OR UPDATE(GTCorrSum_wt) OR UPDATE(GTCorrTaxSum) OR UPDATE(GTAdvAccID) OR UPDATE(GTAdvSum_wt) OR UPDATE(GTCorrAdvSum_wt) OR UPDATE(GTAdvTaxSum) OR UPDATE(GTCorrAdvTaxSum)) RETURN

/* Регистрация изменения кода регистрации */
  IF UPDATE(ChID)
    IF ((SELECT COUNT(ChID) FROM deleted GROUP BY ChID) = 1) AND ((SELECT COUNT(ChID) FROM inserted GROUP BY ChID) = 1)
      BEGIN
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogCreate l, inserted i, deleted d WHERE l.TableCode = 14112001 AND l.ChID = d.ChID
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogUpdate l, inserted i, deleted d WHERE l.TableCode = 14112001 AND l.ChID = d.ChID
      END
    ELSE
      BEGIN
          INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
          SELECT 14112001, ChID, 
          '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d
          DELETE FROM z_LogCreate WHERE TableCode = 14112001 AND ChID IN (SELECT ChID FROM deleted)
          DELETE FROM z_LogUpdate WHERE TableCode = 14112001 AND ChID IN (SELECT ChID FROM deleted)
          INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
          SELECT 14112001, ChID, 
          '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i
      END

/* Регистрация изменения первичного ключа */
  IF UPDATE(ChID)
    BEGIN
      IF ((SELECT COUNT(1) FROM (SELECT DISTINCT ChID FROM deleted) q) = 1) AND ((SELECT COUNT(1) FROM (SELECT DISTINCT ChID FROM inserted) q) = 1)
        BEGIN
          UPDATE l SET PKValue = 
          '[' + cast(i.ChID as varchar(200)) + ']'
          FROM z_LogUpdate l, deleted d, inserted i WHERE l.TableCode = 14112001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
          UPDATE l SET PKValue = 
          '[' + cast(i.ChID as varchar(200)) + ']'
          FROM z_LogCreate l, deleted d, inserted i WHERE l.TableCode = 14112001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
        END
      END

  INSERT INTO z_LogUpdate (TableCode, ChID, PKValue, UserCode)
  SELECT 14112001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i


End
GO

EXEC sp_settriggerorder N'dbo.TRel2_Upd_b_Exp', N'Last', N'UPDATE'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel3_Del_b_Exp] ON [b_Exp]
FOR DELETE AS
/* b_Exp - ТМЦ: Внутренний расход (Заголовок) - DELETE TRIGGER */
BEGIN
  SET NOCOUNT ON

/* Проверка открытого периода */
  DECLARE @OurID int, @ADate datetime, @Err varchar(200)
  DECLARE @GetDate datetime
  DECLARE @OpenAges table(OurID int, BDate datetime, EDate datetime, isIns bit, isDel bit)

  SET @GetDate = GETDATE()

  INSERT INTO @OpenAges(OurID, isIns)
  SELECT DISTINCT OurID, 1 FROM inserted a 

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM deleted a 

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'ТМЦ: Внутренний расход (Заголовок) (b_Exp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
/* Удаление регистрации изменения статуса */
  DELETE z_LogState FROM z_LogState m, deleted i WHERE m.DocCode = 14112 AND m.ChID = i.ChID

/* Возможно ли редактирование документа */
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(14112, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''ТМЦ: Внутренний расход'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* b_Exp ^ b_ExpD - Удаление в CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ ТМЦ: Внутренний расход (ТМЦ) - Удаление в CHILD */
  DELETE b_ExpD FROM b_ExpD a, deleted d WHERE a.ChID = d.ChID
  IF @@ERROR > 0 RETURN

/* b_Exp ^ z_DocLinks - Удаление в CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Взаимосвязи - Удаление в CHILD */
  DELETE z_DocLinks FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 14112 AND a.ChildChID = d.ChID
  IF @@ERROR > 0 RETURN

/* b_Exp ^ z_DocLinks - Проверка в CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Взаимосвязи - Проверка в CHILD */
  IF EXISTS (SELECT * FROM z_DocLinks a WITH(NOLOCK), deleted d WHERE a.ParentDocCode = 14112 AND a.ParentChID = d.ChID)
    BEGIN
      EXEC z_RelationError 'b_Exp', 'z_DocLinks', 3
      RETURN
    END

/* b_Exp ^ z_DocShed - Удаление в CHILD */
/* ТМЦ: Внутренний расход (Заголовок) ^ Документы - Процессы - Удаление в CHILD */
  DELETE z_DocShed FROM z_DocShed a, deleted d WHERE a.DocCode = 14112 AND a.ChID = d.ChID
  IF @@ERROR > 0 RETURN

/* Удаление регистрации создания записи */
  DELETE z_LogCreate FROM z_LogCreate m, deleted i
  WHERE m.TableCode = 14112001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Удаление регистрации изменения записи */
  DELETE z_LogUpdate FROM z_LogUpdate m, deleted i
  WHERE m.TableCode = 14112001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Регистрация удаления записи */
  INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
  SELECT 14112001, -ChID, 
    '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d

/* Удаление регистрации печати */
  DELETE z_LogPrint FROM z_LogPrint m, deleted i
  WHERE m.DocCode = 14112 AND m.ChID = i.ChID

END
GO

EXEC sp_settriggerorder N'dbo.TRel3_Del_b_Exp', N'Last', N'DELETE'
GO