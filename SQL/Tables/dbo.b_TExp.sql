﻿CREATE TABLE [dbo].[b_TExp] (
  [ChID] [bigint] NOT NULL,
  [DocID] [bigint] NOT NULL,
  [IntDocID] [varchar](50) NULL,
  [DocDate] [smalldatetime] NOT NULL,
  [KursMC] [numeric](21, 9) NOT NULL,
  [OurID] [int] NOT NULL,
  [CompID] [int] NOT NULL,
  [SumCC_nt] [numeric](21, 9) NOT NULL,
  [TaxSum] [numeric](21, 9) NOT NULL,
  [SumCC_wt] [numeric](21, 9) NOT NULL,
  [Notes] [varchar](200) NULL,
  [CodeID1] [smallint] NOT NULL,
  [CodeID2] [smallint] NOT NULL,
  [CodeID3] [smallint] NOT NULL,
  [CodeID4] [smallint] NOT NULL,
  [CodeID5] [smallint] NOT NULL,
  [GOperID] [int] NOT NULL,
  [GTranID] [int] NOT NULL,
  [DocType] [int] NOT NULL,
  [GTSum_wt] [numeric](21, 9) NOT NULL,
  [GTTaxSum] [numeric](21, 9) NOT NULL,
  [GTAccID] [int] NOT NULL,
  [PosType] [tinyint] NOT NULL,
  [TaxType] [tinyint] NOT NULL,
  [TaxCredit] [bit] NOT NULL,
  [StateCode] [int] NOT NULL DEFAULT (0),
  [GPosID] [int] NOT NULL DEFAULT (0),
  [GTCorrSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [IsCorrection] [bit] NOT NULL DEFAULT (0),
  [GTAdvAccID] [int] NOT NULL DEFAULT (0),
  [GTAdvSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrAdvSum_wt] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTAdvTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [GTCorrAdvTaxSum] [numeric](21, 9) NOT NULL DEFAULT (0),
  [SumCC_nt_20] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxSum_20] [numeric](21, 9) NOT NULL DEFAULT (0),
  [SumCC_nt_0] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxSum_0] [numeric](21, 9) NOT NULL DEFAULT (0),
  [SumCC_nt_Free] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxSum_Free] [numeric](21, 9) NOT NULL DEFAULT (0),
  [SumCC_nt_No] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxSum_No] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxCorrType] [tinyint] NOT NULL,
  [SumCC_nt_7] [numeric](21, 9) NOT NULL DEFAULT (0),
  [TaxSum_7] [numeric](21, 9) NOT NULL DEFAULT (0),
  CONSTRAINT [pk_b_TExp] PRIMARY KEY CLUSTERED ([ChID])
)
ON [PRIMARY]
GO

CREATE INDEX [CodeID1]
  ON [dbo].[b_TExp] ([CodeID1])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID2]
  ON [dbo].[b_TExp] ([CodeID2])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID3]
  ON [dbo].[b_TExp] ([CodeID3])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID4]
  ON [dbo].[b_TExp] ([CodeID4])
  ON [PRIMARY]
GO

CREATE INDEX [CodeID5]
  ON [dbo].[b_TExp] ([CodeID5])
  ON [PRIMARY]
GO

CREATE INDEX [CompID]
  ON [dbo].[b_TExp] ([CompID])
  ON [PRIMARY]
GO

CREATE INDEX [DocDate]
  ON [dbo].[b_TExp] ([DocDate])
  ON [PRIMARY]
GO

CREATE INDEX [DocID]
  ON [dbo].[b_TExp] ([DocID])
  ON [PRIMARY]
GO

CREATE INDEX [DocType]
  ON [dbo].[b_TExp] ([DocType])
  ON [PRIMARY]
GO

CREATE INDEX [GOperID]
  ON [dbo].[b_TExp] ([GOperID])
  ON [PRIMARY]
GO

CREATE INDEX [GTAccID]
  ON [dbo].[b_TExp] ([GTAccID])
  ON [PRIMARY]
GO

CREATE INDEX [IntDocID]
  ON [dbo].[b_TExp] ([IntDocID])
  ON [PRIMARY]
GO

CREATE INDEX [OurID]
  ON [dbo].[b_TExp] ([OurID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [UniqueIndex]
  ON [dbo].[b_TExp] ([OurID], [DocID])
  ON [PRIMARY]
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.ChID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.DocID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.KursMC'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.OurID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CompID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.SumCC_nt'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.TaxSum'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.SumCC_wt'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CodeID1'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CodeID2'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CodeID3'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CodeID4'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.CodeID5'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.GOperID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.GTranID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.DocType'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.GTSum_wt'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.GTTaxSum'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.GTAccID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.PosType'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.TaxType'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.b_TExp.TaxCredit'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel1_Ins_b_TExp] ON [b_TExp]
FOR INSERT AS
/* b_TExp - Налоговые накладные: Исходящие - INSERT TRIGGER */
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
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID AS varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
  IF EXISTS(SELECT * FROM inserted i WHERE dbo.zf_IsValidDocState(14342, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Документ ''Налоговые накладные: Исходящие'' не может иметь указанный статус.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END


/* b_TExp ^ r_Codes1 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 1 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
    BEGIN
      EXEC z_RelationError 'r_Codes1', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Codes2 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 2 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
    BEGIN
      EXEC z_RelationError 'r_Codes2', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Codes3 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 3 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
    BEGIN
      EXEC z_RelationError 'r_Codes3', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Codes4 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 4 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
    BEGIN
      EXEC z_RelationError 'r_Codes4', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Codes5 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 5 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
    BEGIN
      EXEC z_RelationError 'r_Codes5', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Comps - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник предприятий - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CompID NOT IN (SELECT CompID FROM r_Comps))
    BEGIN
      EXEC z_RelationError 'r_Comps', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_GAccs - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ План счетов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.GTAccID NOT IN (SELECT GAccID FROM r_GAccs))
    BEGIN
      EXEC z_RelationError 'r_GAccs', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_GAccs - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ План счетов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.GTAdvAccID NOT IN (SELECT GAccID FROM r_GAccs))
    BEGIN
      EXEC z_RelationError 'r_GAccs', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_GOpers - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник проводок - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.GOperID NOT IN (SELECT GOperID FROM r_GOpers))
    BEGIN
      EXEC z_RelationError 'r_GOpers', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Ours - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник внутренних фирм - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.OurID NOT IN (SELECT OurID FROM r_Ours))
    BEGIN
      EXEC z_RelationError 'r_Ours', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_States - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник статусов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
    BEGIN
      EXEC z_RelationError 'r_States', 'b_TExp', 0
      RETURN
    END

/* b_TExp ^ r_Uni - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник универсальный - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.PosType NOT IN (SELECT RefID FROM r_Uni  WHERE RefTypeID = 10041))
    BEGIN
      EXEC z_RelationErrorUni 'b_TExp', 10041, 0
      RETURN
    END

/* b_TExp ^ r_Uni - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник универсальный - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.TaxCorrType NOT IN (SELECT RefID FROM r_Uni  WHERE RefTypeID = 10042))
    BEGIN
      EXEC z_RelationErrorUni 'b_TExp', 10042, 0
      RETURN
    END

/* Регистрация создания записи */
  INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
  SELECT 14342001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i

END
GO

EXEC sp_settriggerorder N'dbo.TRel1_Ins_b_TExp', N'Last', N'INSERT'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel2_Upd_b_TExp] ON [b_TExp]
FOR UPDATE AS
/* b_TExp - Налоговые накладные: Исходящие - UPDATE TRIGGER */
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
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.BDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
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
  IF UPDATE(StateCode) AND EXISTS(SELECT * FROM inserted i, deleted d WHERE i.ChID = d.ChID AND dbo.zf_CanChangeState(14342, i.ChID, d.StateCode, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Переход в указанный статус невозможен (Налоговые накладные: Исходящие).', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  IF UPDATE(StateCode)
    BEGIN
      INSERT INTO z_LogState (StateRuleCode, DocCode, ChID, OldStateCode, NewStateCode, UserCode)
      SELECT s.StateRuleCode, 14342, i.ChID, d.StateCode, i.StateCode, dbo.zf_GetUserCode() FROM inserted i, deleted d, r_StateRules s
      WHERE i.ChID = d.ChID AND s.StateCodeFrom = d.StateCode AND s.StateCodeTo = i.StateCode
    END

/* Возможно ли редактирование документа */
DECLARE @ColumnsUpdated VARBINARY(255)
SET @ColumnsUpdated = COLUMNS_UPDATED()
IF EXISTS(SELECT 1 FROM dbo.zf_GetFieldsUpdated('b_TExp', @ColumnsUpdated) WHERE [name] <> 'StateCode')
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(14342, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''Налоговые накладные: Исходящие'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* b_TExp ^ r_Codes1 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 1 - Проверка в PARENT */
  IF UPDATE(CodeID1)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
      BEGIN
        EXEC z_RelationError 'r_Codes1', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Codes2 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 2 - Проверка в PARENT */
  IF UPDATE(CodeID2)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
      BEGIN
        EXEC z_RelationError 'r_Codes2', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Codes3 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 3 - Проверка в PARENT */
  IF UPDATE(CodeID3)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
      BEGIN
        EXEC z_RelationError 'r_Codes3', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Codes4 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 4 - Проверка в PARENT */
  IF UPDATE(CodeID4)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
      BEGIN
        EXEC z_RelationError 'r_Codes4', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Codes5 - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник признаков 5 - Проверка в PARENT */
  IF UPDATE(CodeID5)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
      BEGIN
        EXEC z_RelationError 'r_Codes5', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Comps - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник предприятий - Проверка в PARENT */
  IF UPDATE(CompID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CompID NOT IN (SELECT CompID FROM r_Comps))
      BEGIN
        EXEC z_RelationError 'r_Comps', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_GAccs - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ План счетов - Проверка в PARENT */
  IF UPDATE(GTAccID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.GTAccID NOT IN (SELECT GAccID FROM r_GAccs))
      BEGIN
        EXEC z_RelationError 'r_GAccs', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_GAccs - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ План счетов - Проверка в PARENT */
  IF UPDATE(GTAdvAccID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.GTAdvAccID NOT IN (SELECT GAccID FROM r_GAccs))
      BEGIN
        EXEC z_RelationError 'r_GAccs', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_GOpers - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник проводок - Проверка в PARENT */
  IF UPDATE(GOperID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.GOperID NOT IN (SELECT GOperID FROM r_GOpers))
      BEGIN
        EXEC z_RelationError 'r_GOpers', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Ours - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник внутренних фирм - Проверка в PARENT */
  IF UPDATE(OurID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.OurID NOT IN (SELECT OurID FROM r_Ours))
      BEGIN
        EXEC z_RelationError 'r_Ours', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_States - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник статусов - Проверка в PARENT */
  IF UPDATE(StateCode)
    IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
      BEGIN
        EXEC z_RelationError 'r_States', 'b_TExp', 1
        RETURN
      END

/* b_TExp ^ r_Uni - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник универсальный - Проверка в PARENT */
  IF UPDATE(PosType)
    IF EXISTS (SELECT * FROM inserted i WHERE i.PosType NOT IN (SELECT RefID FROM r_Uni  WHERE RefTypeID = 10041))
      BEGIN
        EXEC z_RelationErrorUni 'b_TExp', 10041, 1
        RETURN
      END

/* b_TExp ^ r_Uni - Проверка в PARENT */
/* Налоговые накладные: Исходящие ^ Справочник универсальный - Проверка в PARENT */
  IF UPDATE(TaxCorrType)
    IF EXISTS (SELECT * FROM inserted i WHERE i.TaxCorrType NOT IN (SELECT RefID FROM r_Uni  WHERE RefTypeID = 10042))
      BEGIN
        EXEC z_RelationErrorUni 'b_TExp', 10042, 1
        RETURN
      END

/* b_TExp ^ z_DocLinks - Обновление CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ChildDocCode = 14342, a.ChildChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ChildDocCode = 14342 AND a.ChildChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 14342 AND a.ChildChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Налоговые накладные: Исходящие'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* b_TExp ^ z_DocLinks - Обновление CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ParentDocCode = 14342, a.ParentChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ParentDocCode = 14342 AND a.ParentChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ParentDocCode = 14342 AND a.ParentChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Налоговые накладные: Исходящие'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* b_TExp ^ z_DocShed - Обновление CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Процессы - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.DocCode = 14342, a.ChID = i.ChID
          FROM z_DocShed a, inserted i, deleted d WHERE a.DocCode = 14342 AND a.ChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocShed a, deleted d WHERE a.DocCode = 14342 AND a.ChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Налоговые накладные: Исходящие'' => ''Документы - Процессы''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* Обновления информации о документе в связях */
IF UPDATE(DocDate) OR UPDATE(DocID)
  BEGIN
    UPDATE l SET l.ChildDocID = i.DocID, l.ChildDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ChildDocCode = 14342 AND l.ChildChID = i.ChID

    UPDATE l SET l.ParentDocID = i.DocID, l.ParentDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ParentDocCode = 14342 AND l.ParentChID = i.ChID
  END

/* Регистрация изменения записи */


/* Регистрация изменения кода регистрации */
  IF UPDATE(ChID)
    IF ((SELECT COUNT(ChID) FROM deleted GROUP BY ChID) = 1) AND ((SELECT COUNT(ChID) FROM inserted GROUP BY ChID) = 1)
      BEGIN
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogCreate l, inserted i, deleted d WHERE l.TableCode = 14342001 AND l.ChID = d.ChID
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogUpdate l, inserted i, deleted d WHERE l.TableCode = 14342001 AND l.ChID = d.ChID
      END
    ELSE
      BEGIN
          INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
          SELECT 14342001, ChID, 
          '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d
          DELETE FROM z_LogCreate WHERE TableCode = 14342001 AND ChID IN (SELECT ChID FROM deleted)
          DELETE FROM z_LogUpdate WHERE TableCode = 14342001 AND ChID IN (SELECT ChID FROM deleted)
          INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
          SELECT 14342001, ChID, 
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
          FROM z_LogUpdate l, deleted d, inserted i WHERE l.TableCode = 14342001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
          UPDATE l SET PKValue = 
          '[' + cast(i.ChID as varchar(200)) + ']'
          FROM z_LogCreate l, deleted d, inserted i WHERE l.TableCode = 14342001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
        END
      END

  INSERT INTO z_LogUpdate (TableCode, ChID, PKValue, UserCode)
  SELECT 14342001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i


End
GO

EXEC sp_settriggerorder N'dbo.TRel2_Upd_b_TExp', N'Last', N'UPDATE'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel3_Del_b_TExp] ON [b_TExp]
FOR DELETE AS
/* b_TExp - Налоговые накладные: Исходящие - DELETE TRIGGER */
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
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Налоговые накладные: Исходящие (b_TExp):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
/* Удаление регистрации изменения статуса */
  DELETE z_LogState FROM z_LogState m, deleted i WHERE m.DocCode = 14342 AND m.ChID = i.ChID

/* Возможно ли редактирование документа */
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(14342, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''Налоговые накладные: Исходящие'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* Удаление проводок */
  DELETE FROM b_GTran WHERE GTranID IN (SELECT GTranID FROM deleted)

/* b_TExp ^ z_DocLinks - Удаление в CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Взаимосвязи - Удаление в CHILD */
  DELETE z_DocLinks FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 14342 AND a.ChildChID = d.ChID
  IF @@ERROR > 0 RETURN

/* b_TExp ^ z_DocLinks - Проверка в CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Взаимосвязи - Проверка в CHILD */
  IF EXISTS (SELECT * FROM z_DocLinks a WITH(NOLOCK), deleted d WHERE a.ParentDocCode = 14342 AND a.ParentChID = d.ChID)
    BEGIN
      EXEC z_RelationError 'b_TExp', 'z_DocLinks', 3
      RETURN
    END

/* b_TExp ^ z_DocShed - Удаление в CHILD */
/* Налоговые накладные: Исходящие ^ Документы - Процессы - Удаление в CHILD */
  DELETE z_DocShed FROM z_DocShed a, deleted d WHERE a.DocCode = 14342 AND a.ChID = d.ChID
  IF @@ERROR > 0 RETURN

/* Удаление регистрации создания записи */
  DELETE z_LogCreate FROM z_LogCreate m, deleted i
  WHERE m.TableCode = 14342001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Удаление регистрации изменения записи */
  DELETE z_LogUpdate FROM z_LogUpdate m, deleted i
  WHERE m.TableCode = 14342001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Регистрация удаления записи */
  INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
  SELECT 14342001, -ChID, 
    '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d

/* Удаление регистрации печати */
  DELETE z_LogPrint FROM z_LogPrint m, deleted i
  WHERE m.DocCode = 14342 AND m.ChID = i.ChID

END
GO

EXEC sp_settriggerorder N'dbo.TRel3_Del_b_TExp', N'Last', N'DELETE'
GO