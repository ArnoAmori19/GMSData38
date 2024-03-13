CREATE TABLE [dbo].[c_EmpExc]
(
[ChID] [bigint] NOT NULL,
[OurID] [int] NOT NULL,
[AccountAC] [varchar] (250) NOT NULL,
[DocDate] [smalldatetime] NOT NULL,
[DocID] [bigint] NOT NULL,
[StockID] [int] NOT NULL,
[EmpID] [int] NOT NULL,
[CurrID] [smallint] NOT NULL,
[KursMC] [numeric] (21, 9) NOT NULL,
[KursCC] [numeric] (21, 9) NOT NULL,
[SumAC] [numeric] (21, 9) NOT NULL,
[Subject] [varchar] (200) NULL,
[CodeID1] [smallint] NOT NULL,
[CodeID2] [smallint] NOT NULL,
[CodeID3] [smallint] NOT NULL,
[CodeID4] [smallint] NOT NULL,
[CodeID5] [smallint] NOT NULL,
[NewEmpID] [int] NOT NULL,
[StateCode] [int] NOT NULL DEFAULT (0),
[SrcDocID] [varchar] (250) NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel1_Ins_c_EmpExc] ON [dbo].[c_EmpExc]
FOR INSERT AS
/* c_EmpExc - Перемещение денег между служащими - INSERT TRIGGER */
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
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID AS varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
  IF EXISTS(SELECT * FROM inserted i WHERE dbo.zf_IsValidDocState(12015, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Документ ''Перемещение денег между служащими'' не может иметь указанный статус.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END


/* c_EmpExc ^ r_Codes1 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 1 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
    BEGIN
      EXEC z_RelationError 'r_Codes1', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Codes2 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 2 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
    BEGIN
      EXEC z_RelationError 'r_Codes2', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Codes3 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 3 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
    BEGIN
      EXEC z_RelationError 'r_Codes3', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Codes4 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 4 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
    BEGIN
      EXEC z_RelationError 'r_Codes4', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Codes5 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 5 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
    BEGIN
      EXEC z_RelationError 'r_Codes5', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Currs - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник валют - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.CurrID NOT IN (SELECT CurrID FROM r_Currs))
    BEGIN
      EXEC z_RelationError 'r_Currs', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Emps - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник служащих - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.EmpID NOT IN (SELECT EmpID FROM r_Emps))
    BEGIN
      EXEC z_RelationError 'r_Emps', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Emps - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник служащих - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.NewEmpID NOT IN (SELECT EmpID FROM r_Emps))
    BEGIN
      EXEC z_RelationError 'r_Emps', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_OursAC - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник внутренних фирм - Валютные счета - Проверка в PARENT */
  IF (SELECT COUNT(*) FROM r_OursAC m WITH(NOLOCK), inserted i WHERE i.AccountAC = m.AccountAC AND i.OurID = m.OurID) <> @RCount
    BEGIN
      EXEC z_RelationError 'r_OursAC', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_States - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник статусов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
    BEGIN
      EXEC z_RelationError 'r_States', 'c_EmpExc', 0
      RETURN
    END

/* c_EmpExc ^ r_Stocks - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник складов - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.StockID NOT IN (SELECT StockID FROM r_Stocks))
    BEGIN
      EXEC z_RelationError 'r_Stocks', 'c_EmpExc', 0
      RETURN
    END

/* Регистрация создания записи */
  INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
  SELECT 12015001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i

END
GO
EXEC sp_settriggerorder N'[dbo].[TRel1_Ins_c_EmpExc]', 'last', 'insert', null
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel2_Upd_c_EmpExc] ON [dbo].[c_EmpExc]
FOR UPDATE AS
/* c_EmpExc - Перемещение денег между служащими - UPDATE TRIGGER */
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
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM inserted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.BDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
  IF UPDATE(StateCode) AND EXISTS(SELECT * FROM inserted i, deleted d WHERE i.ChID = d.ChID AND dbo.zf_CanChangeState(12015, i.ChID, d.StateCode, i.StateCode) = 0)
    BEGIN
      RAISERROR ('Переход в указанный статус невозможен (Перемещение денег между служащими).', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  IF UPDATE(StateCode)
    BEGIN
      INSERT INTO z_LogState (StateRuleCode, DocCode, ChID, OldStateCode, NewStateCode, UserCode)
      SELECT s.StateRuleCode, 12015, i.ChID, d.StateCode, i.StateCode, dbo.zf_GetUserCode() FROM inserted i, deleted d, r_StateRules s
      WHERE i.ChID = d.ChID AND s.StateCodeFrom = d.StateCode AND s.StateCodeTo = i.StateCode
    END

/* Возможно ли редактирование документа */
DECLARE @ColumnsUpdated VARBINARY(255)
SET @ColumnsUpdated = COLUMNS_UPDATED()
IF EXISTS(SELECT 1 FROM dbo.zf_GetFieldsUpdated('c_EmpExc', @ColumnsUpdated) WHERE [name] <> 'StateCode')
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(12015, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''Перемещение денег между служащими'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* c_EmpExc ^ r_Codes1 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 1 - Проверка в PARENT */
  IF UPDATE(CodeID1)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
      BEGIN
        EXEC z_RelationError 'r_Codes1', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Codes2 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 2 - Проверка в PARENT */
  IF UPDATE(CodeID2)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
      BEGIN
        EXEC z_RelationError 'r_Codes2', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Codes3 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 3 - Проверка в PARENT */
  IF UPDATE(CodeID3)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
      BEGIN
        EXEC z_RelationError 'r_Codes3', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Codes4 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 4 - Проверка в PARENT */
  IF UPDATE(CodeID4)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
      BEGIN
        EXEC z_RelationError 'r_Codes4', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Codes5 - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник признаков 5 - Проверка в PARENT */
  IF UPDATE(CodeID5)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
      BEGIN
        EXEC z_RelationError 'r_Codes5', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Currs - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник валют - Проверка в PARENT */
  IF UPDATE(CurrID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.CurrID NOT IN (SELECT CurrID FROM r_Currs))
      BEGIN
        EXEC z_RelationError 'r_Currs', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Emps - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник служащих - Проверка в PARENT */
  IF UPDATE(EmpID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.EmpID NOT IN (SELECT EmpID FROM r_Emps))
      BEGIN
        EXEC z_RelationError 'r_Emps', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Emps - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник служащих - Проверка в PARENT */
  IF UPDATE(NewEmpID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.NewEmpID NOT IN (SELECT EmpID FROM r_Emps))
      BEGIN
        EXEC z_RelationError 'r_Emps', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_OursAC - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник внутренних фирм - Валютные счета - Проверка в PARENT */
  IF UPDATE(AccountAC) OR UPDATE(OurID)
    IF (SELECT COUNT(*) FROM r_OursAC m WITH(NOLOCK), inserted i WHERE i.AccountAC = m.AccountAC AND i.OurID = m.OurID) <> @RCount
      BEGIN
        EXEC z_RelationError 'r_OursAC', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_States - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник статусов - Проверка в PARENT */
  IF UPDATE(StateCode)
    IF EXISTS (SELECT * FROM inserted i WHERE i.StateCode NOT IN (SELECT StateCode FROM r_States))
      BEGIN
        EXEC z_RelationError 'r_States', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ r_Stocks - Проверка в PARENT */
/* Перемещение денег между служащими ^ Справочник складов - Проверка в PARENT */
  IF UPDATE(StockID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.StockID NOT IN (SELECT StockID FROM r_Stocks))
      BEGIN
        EXEC z_RelationError 'r_Stocks', 'c_EmpExc', 1
        RETURN
      END

/* c_EmpExc ^ z_DocLinks - Обновление CHILD */
/* Перемещение денег между служащими ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ChildDocCode = 12015, a.ChildChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ChildDocCode = 12015 AND a.ChildChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 12015 AND a.ChildChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Перемещение денег между служащими'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* c_EmpExc ^ z_DocLinks - Обновление CHILD */
/* Перемещение денег между служащими ^ Документы - Взаимосвязи - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.ParentDocCode = 12015, a.ParentChID = i.ChID
          FROM z_DocLinks a, inserted i, deleted d WHERE a.ParentDocCode = 12015 AND a.ParentChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocLinks a, deleted d WHERE a.ParentDocCode = 12015 AND a.ParentChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Перемещение денег между служащими'' => ''Документы - Взаимосвязи''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* c_EmpExc ^ z_DocShed - Обновление CHILD */
/* Перемещение денег между служащими ^ Документы - Процессы - Обновление CHILD */
  IF UPDATE(ChID)
    BEGIN
      IF @RCount = 1
        BEGIN
          UPDATE a SET a.DocCode = 12015, a.ChID = i.ChID
          FROM z_DocShed a, inserted i, deleted d WHERE a.DocCode = 12015 AND a.ChID = d.ChID
          IF @@ERROR > 0 RETURN
        END
      ELSE IF EXISTS (SELECT * FROM z_DocShed a, deleted d WHERE a.DocCode = 12015 AND a.ChID = d.ChID)
        BEGIN
          RAISERROR ('Каскадная операция невозможна ''Перемещение денег между служащими'' => ''Документы - Процессы''.'
, 18, 1)
          ROLLBACK TRAN
          RETURN
        END
    END

/* Обновления информации о документе в связях */
IF UPDATE(DocDate) OR UPDATE(DocID)
  BEGIN
    UPDATE l SET l.ChildDocID = i.DocID, l.ChildDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ChildDocCode = 12015 AND l.ChildChID = i.ChID

    UPDATE l SET l.ParentDocID = i.DocID, l.ParentDocDate = i.DocDate
    FROM z_DocLinks l, inserted i WHERE l.ParentDocCode = 12015 AND l.ParentChID = i.ChID
  END

/* Регистрация изменения записи */


/* Регистрация изменения кода регистрации */
  IF UPDATE(ChID)
    IF ((SELECT COUNT(ChID) FROM deleted GROUP BY ChID) = 1) AND ((SELECT COUNT(ChID) FROM inserted GROUP BY ChID) = 1)
      BEGIN
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogCreate l, inserted i, deleted d WHERE l.TableCode = 12015001 AND l.ChID = d.ChID
        UPDATE l SET l.ChID = i.ChID
        FROM z_LogUpdate l, inserted i, deleted d WHERE l.TableCode = 12015001 AND l.ChID = d.ChID
      END
    ELSE
      BEGIN
          INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
          SELECT 12015001, ChID, 
          '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d
          DELETE FROM z_LogCreate WHERE TableCode = 12015001 AND ChID IN (SELECT ChID FROM deleted)
          DELETE FROM z_LogUpdate WHERE TableCode = 12015001 AND ChID IN (SELECT ChID FROM deleted)
          INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
          SELECT 12015001, ChID, 
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
          FROM z_LogUpdate l, deleted d, inserted i WHERE l.TableCode = 12015001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
          UPDATE l SET PKValue = 
          '[' + cast(i.ChID as varchar(200)) + ']'
          FROM z_LogCreate l, deleted d, inserted i WHERE l.TableCode = 12015001 AND l.PKValue = 
          '[' + cast(d.ChID as varchar(200)) + ']'
        END
      END

  INSERT INTO z_LogUpdate (TableCode, ChID, PKValue, UserCode)
  SELECT 12015001, ChID, 
    '[' + cast(i.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i


End
GO
EXEC sp_settriggerorder N'[dbo].[TRel2_Upd_c_EmpExc]', 'last', 'update', null
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel3_Del_c_EmpExc] ON [dbo].[c_EmpExc]
FOR DELETE AS
/* c_EmpExc - Перемещение денег между служащими - DELETE TRIGGER */
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
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM deleted a , @OpenAges AS t WHERE t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Перемещение денег между служащими (c_EmpExc):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Обработка статуса */
/* Удаление регистрации изменения статуса */
  DELETE z_LogState FROM z_LogState m, deleted i WHERE m.DocCode = 12015 AND m.ChID = i.ChID

/* Возможно ли редактирование документа */
    IF EXISTS(SELECT * FROM deleted a WHERE dbo.zf_CanChangeDoc(12015, a.ChID, a.StateCode) = 0)
      BEGIN
        RAISERROR ('Изменение документа ''Перемещение денег между служащими'' в данном статусе запрещено.', 18, 1)
        ROLLBACK TRAN
        RETURN
      END

/* c_EmpExc ^ z_DocLinks - Удаление в CHILD */
/* Перемещение денег между служащими ^ Документы - Взаимосвязи - Удаление в CHILD */
  DELETE z_DocLinks FROM z_DocLinks a, deleted d WHERE a.ChildDocCode = 12015 AND a.ChildChID = d.ChID
  IF @@ERROR > 0 RETURN

/* c_EmpExc ^ z_DocLinks - Проверка в CHILD */
/* Перемещение денег между служащими ^ Документы - Взаимосвязи - Проверка в CHILD */
  IF EXISTS (SELECT * FROM z_DocLinks a WITH(NOLOCK), deleted d WHERE a.ParentDocCode = 12015 AND a.ParentChID = d.ChID)
    BEGIN
      EXEC z_RelationError 'c_EmpExc', 'z_DocLinks', 3
      RETURN
    END

/* c_EmpExc ^ z_DocShed - Удаление в CHILD */
/* Перемещение денег между служащими ^ Документы - Процессы - Удаление в CHILD */
  DELETE z_DocShed FROM z_DocShed a, deleted d WHERE a.DocCode = 12015 AND a.ChID = d.ChID
  IF @@ERROR > 0 RETURN

/* Удаление регистрации создания записи */
  DELETE z_LogCreate FROM z_LogCreate m, deleted i
  WHERE m.TableCode = 12015001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Удаление регистрации изменения записи */
  DELETE z_LogUpdate FROM z_LogUpdate m, deleted i
  WHERE m.TableCode = 12015001 AND m.PKValue = 
    '[' + cast(i.ChID as varchar(200)) + ']'

/* Регистрация удаления записи */
  INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
  SELECT 12015001, -ChID, 
    '[' + cast(d.ChID as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d

/* Удаление регистрации печати */
  DELETE z_LogPrint FROM z_LogPrint m, deleted i
  WHERE m.DocCode = 12015 AND m.ChID = i.ChID

END
GO
EXEC sp_settriggerorder N'[dbo].[TRel3_Del_c_EmpExc]', 'last', 'delete', null
GO
ALTER TABLE [dbo].[c_EmpExc] ADD CONSTRAINT [pk_c_EmpExc] PRIMARY KEY CLUSTERED ([ChID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AccountAC] ON [dbo].[c_EmpExc] ([AccountAC]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID1] ON [dbo].[c_EmpExc] ([CodeID1]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID2] ON [dbo].[c_EmpExc] ([CodeID2]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID3] ON [dbo].[c_EmpExc] ([CodeID3]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID4] ON [dbo].[c_EmpExc] ([CodeID4]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID5] ON [dbo].[c_EmpExc] ([CodeID5]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CurrID] ON [dbo].[c_EmpExc] ([CurrID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DocDate] ON [dbo].[c_EmpExc] ([DocDate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DocID] ON [dbo].[c_EmpExc] ([DocID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EmpID] ON [dbo].[c_EmpExc] ([EmpID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KursCC] ON [dbo].[c_EmpExc] ([KursCC]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KursMC] ON [dbo].[c_EmpExc] ([KursMC]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NewEmpID] ON [dbo].[c_EmpExc] ([NewEmpID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OurID] ON [dbo].[c_EmpExc] ([OurID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [StockID] ON [dbo].[c_EmpExc] ([StockID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SumAC] ON [dbo].[c_EmpExc] ([SumAC]) ON [PRIMARY]
GO
