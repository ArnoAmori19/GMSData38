﻿CREATE TABLE [dbo].[t_SExpE] (
  [AChID] [bigint] NOT NULL,
  [SetCodeID1] [smallint] NOT NULL,
  [SetCodeID2] [smallint] NOT NULL,
  [SetCodeID3] [smallint] NOT NULL,
  [SetCodeID4] [smallint] NOT NULL,
  [SetCodeID5] [smallint] NOT NULL,
  [SetSumCC] [numeric](21, 9) NOT NULL,
  CONSTRAINT [_pk_t_SExpE] PRIMARY KEY CLUSTERED ([AChID], [SetCodeID1], [SetCodeID2], [SetCodeID3], [SetCodeID4], [SetCodeID5])
)
ON [PRIMARY]
GO

CREATE INDEX [AChID]
  ON [dbo].[t_SExpE] ([AChID])
  ON [PRIMARY]
GO

CREATE INDEX [SetCodeID1]
  ON [dbo].[t_SExpE] ([SetCodeID1])
  ON [PRIMARY]
GO

CREATE INDEX [SetCodeID2]
  ON [dbo].[t_SExpE] ([SetCodeID2])
  ON [PRIMARY]
GO

CREATE INDEX [SetCodeID3]
  ON [dbo].[t_SExpE] ([SetCodeID3])
  ON [PRIMARY]
GO

CREATE INDEX [SetCodeID4]
  ON [dbo].[t_SExpE] ([SetCodeID4])
  ON [PRIMARY]
GO

CREATE INDEX [SetCodeID5]
  ON [dbo].[t_SExpE] ([SetCodeID5])
  ON [PRIMARY]
GO

CREATE INDEX [SetSumCC]
  ON [dbo].[t_SExpE] ([SetSumCC])
  ON [PRIMARY]
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.AChID'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetCodeID1'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetCodeID2'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetCodeID3'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetCodeID4'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetCodeID5'
GO

EXEC sp_bindefault @defname = N'dbo.DF_Zero', @objname = N'dbo.t_SExpE.SetSumCC'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TAU1_INS_t_SExpE] ON [t_SExpE]
FOR INSERT
AS
BEGIN
  IF @@RowCount = 0 RETURN
  SET NOCOUNT ON
/* -------------------------------------------------------------------------- */

/* 102 - Обновление итогов в главной таблице */
/* t_SExpE - Разукомплектация товара: Затраты на комплекты */
/* t_SExp - Разукомплектация товара: Заголовок */

  UPDATE r
  SET 
    r.TSetSumCC = r.TSetSumCC + q.TSetSumCC
  FROM t_SExp r, 
    (SELECT t_SExpA.ChID, 
       ISNULL(SUM(m.SetSumCC), 0) TSetSumCC 
     FROM t_SExp WITH (NOLOCK), t_SExpA WITH (NOLOCK), inserted m
     WHERE t_SExp.ChID = t_SExpA.ChID AND t_SExpA.AChID = m.AChID
     GROUP BY t_SExpA.ChID) q
  WHERE q.ChID = r.ChID
  IF @@error > 0 Return
/* -------------------------------------------------------------------------- */

END
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TAU2_UPD_t_SExpE] ON [t_SExpE]
FOR UPDATE
AS
BEGIN
  IF @@RowCount = 0 RETURN
  SET NOCOUNT ON
/* -------------------------------------------------------------------------- */

/* 102 - Обновление итогов в главной таблице */
/* t_SExpE - Разукомплектация товара: Затраты на комплекты */
/* t_SExp - Разукомплектация товара: Заголовок */

IF UPDATE(SetSumCC)
BEGIN
  UPDATE r
  SET 
    r.TSetSumCC = r.TSetSumCC + q.TSetSumCC
  FROM t_SExp r, 
    (SELECT t_SExpA.ChID, 
       ISNULL(SUM(m.SetSumCC), 0) TSetSumCC 
     FROM t_SExp WITH (NOLOCK), t_SExpA WITH (NOLOCK), inserted m
     WHERE t_SExp.ChID = t_SExpA.ChID AND t_SExpA.AChID = m.AChID
     GROUP BY t_SExpA.ChID) q
  WHERE q.ChID = r.ChID
  IF @@error > 0 Return

  UPDATE r
  SET 
    r.TSetSumCC = r.TSetSumCC - q.TSetSumCC
  FROM t_SExp r, 
    (SELECT t_SExpA.ChID, 
       ISNULL(SUM(m.SetSumCC), 0) TSetSumCC 
     FROM t_SExp WITH (NOLOCK), t_SExpA WITH (NOLOCK), deleted m
     WHERE t_SExp.ChID = t_SExpA.ChID AND t_SExpA.AChID = m.AChID
     GROUP BY t_SExpA.ChID) q
  WHERE q.ChID = r.ChID
  IF @@error > 0 Return
END
/* -------------------------------------------------------------------------- */

END
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TAU3_DEL_t_SExpE] ON [t_SExpE]
FOR DELETE
AS
BEGIN
  IF @@RowCount = 0 RETURN
  SET NOCOUNT ON
/* -------------------------------------------------------------------------- */

/* 102 - Обновление итогов в главной таблице */
/* t_SExpE - Разукомплектация товара: Затраты на комплекты */
/* t_SExp - Разукомплектация товара: Заголовок */

  UPDATE r
  SET 
    r.TSetSumCC = r.TSetSumCC - q.TSetSumCC
  FROM t_SExp r, 
    (SELECT t_SExpA.ChID, 
       ISNULL(SUM(m.SetSumCC), 0) TSetSumCC 
     FROM t_SExp WITH (NOLOCK), t_SExpA WITH (NOLOCK), deleted m
     WHERE t_SExp.ChID = t_SExpA.ChID AND t_SExpA.AChID = m.AChID
     GROUP BY t_SExpA.ChID) q
  WHERE q.ChID = r.ChID
  IF @@error > 0 Return
/* -------------------------------------------------------------------------- */

END
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel1_Ins_t_SExpE] ON [t_SExpE]
FOR INSERT AS
/* t_SExpE - Разукомплектация товара: Затраты на комплекты - INSERT TRIGGER */
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
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, inserted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, deleted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM  t_SExp a, t_SExpA b, inserted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate < t.BDate))

  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID AS varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM  t_SExp a, t_SExpA b, inserted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF @ADate IS NOT NULL
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Возможно ли редактирование документа */
  IF EXISTS(SELECT * FROM t_SExp a, t_SExpA b, inserted c WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND dbo.zf_CanChangeDoc(11322, a.ChID, a.StateCode) = 0)
    BEGIN
      RAISERROR ('Изменение документа ''Разукомплектация товара'' в данном статусе запрещено.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* t_SExpE ^ r_Codes1 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 1 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
    BEGIN
      EXEC z_RelationError 'r_Codes1', 't_SExpE', 0
      RETURN
    END

/* t_SExpE ^ r_Codes2 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 2 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
    BEGIN
      EXEC z_RelationError 'r_Codes2', 't_SExpE', 0
      RETURN
    END

/* t_SExpE ^ r_Codes3 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 3 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
    BEGIN
      EXEC z_RelationError 'r_Codes3', 't_SExpE', 0
      RETURN
    END

/* t_SExpE ^ r_Codes4 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 4 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
    BEGIN
      EXEC z_RelationError 'r_Codes4', 't_SExpE', 0
      RETURN
    END

/* t_SExpE ^ r_Codes5 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 5 - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
    BEGIN
      EXEC z_RelationError 'r_Codes5', 't_SExpE', 0
      RETURN
    END

/* t_SExpE ^ t_SExpA - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Разукомплектация товара: Комплекты - Проверка в PARENT */
  IF EXISTS (SELECT * FROM inserted i WHERE i.AChID NOT IN (SELECT AChID FROM t_SExpA))
    BEGIN
      EXEC z_RelationError 't_SExpA', 't_SExpE', 0
      RETURN
    END

/* Регистрация создания записи */
  INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
  SELECT 11322005, 0, 
    '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID5 as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i

END
GO

EXEC sp_settriggerorder N'dbo.TRel1_Ins_t_SExpE', N'Last', N'INSERT'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel2_Upd_t_SExpE] ON [t_SExpE]
FOR UPDATE AS
/* t_SExpE - Разукомплектация товара: Затраты на комплекты - UPDATE TRIGGER */
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
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, inserted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, deleted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM  t_SExp a, t_SExpA b, inserted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Новая дата или одна из дат документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM  t_SExp a, t_SExpA b, inserted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isIns = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Новая дата или одна из дат документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.BDate FROM  t_SExp a, t_SExpA b, deleted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM  t_SExp a, t_SExpA b, deleted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Возможно ли редактирование документа */
  IF EXISTS(SELECT * FROM t_SExp a, t_SExpA b, deleted c WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND dbo.zf_CanChangeDoc(11322, a.ChID, a.StateCode) = 0)
    BEGIN
      RAISERROR ('Изменение документа ''Разукомплектация товара'' в данном статусе запрещено.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* t_SExpE ^ r_Codes1 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 1 - Проверка в PARENT */
  IF UPDATE(SetCodeID1)
    IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID1 NOT IN (SELECT CodeID1 FROM r_Codes1))
      BEGIN
        EXEC z_RelationError 'r_Codes1', 't_SExpE', 1
        RETURN
      END

/* t_SExpE ^ r_Codes2 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 2 - Проверка в PARENT */
  IF UPDATE(SetCodeID2)
    IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID2 NOT IN (SELECT CodeID2 FROM r_Codes2))
      BEGIN
        EXEC z_RelationError 'r_Codes2', 't_SExpE', 1
        RETURN
      END

/* t_SExpE ^ r_Codes3 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 3 - Проверка в PARENT */
  IF UPDATE(SetCodeID3)
    IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID3 NOT IN (SELECT CodeID3 FROM r_Codes3))
      BEGIN
        EXEC z_RelationError 'r_Codes3', 't_SExpE', 1
        RETURN
      END

/* t_SExpE ^ r_Codes4 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 4 - Проверка в PARENT */
  IF UPDATE(SetCodeID4)
    IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID4 NOT IN (SELECT CodeID4 FROM r_Codes4))
      BEGIN
        EXEC z_RelationError 'r_Codes4', 't_SExpE', 1
        RETURN
      END

/* t_SExpE ^ r_Codes5 - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Справочник признаков 5 - Проверка в PARENT */
  IF UPDATE(SetCodeID5)
    IF EXISTS (SELECT * FROM inserted i WHERE i.SetCodeID5 NOT IN (SELECT CodeID5 FROM r_Codes5))
      BEGIN
        EXEC z_RelationError 'r_Codes5', 't_SExpE', 1
        RETURN
      END

/* t_SExpE ^ t_SExpA - Проверка в PARENT */
/* Разукомплектация товара: Затраты на комплекты ^ Разукомплектация товара: Комплекты - Проверка в PARENT */
  IF UPDATE(AChID)
    IF EXISTS (SELECT * FROM inserted i WHERE i.AChID NOT IN (SELECT AChID FROM t_SExpA))
      BEGIN
        EXEC z_RelationError 't_SExpA', 't_SExpE', 1
        RETURN
      END

/* Регистрация изменения записи */


/* Регистрация изменения первичного ключа */
  IF UPDATE(AChID) OR UPDATE(SetCodeID1) OR UPDATE(SetCodeID2) OR UPDATE(SetCodeID3) OR UPDATE(SetCodeID4) OR UPDATE(SetCodeID5)
    BEGIN
      IF ((SELECT COUNT(1) FROM (SELECT DISTINCT AChID, SetCodeID1, SetCodeID2, SetCodeID3, SetCodeID4, SetCodeID5 FROM deleted) q) = 1) AND ((SELECT COUNT(1) FROM (SELECT DISTINCT AChID, SetCodeID1, SetCodeID2, SetCodeID3, SetCodeID4, SetCodeID5 FROM inserted) q) = 1)
        BEGIN
          UPDATE l SET PKValue = 
          '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID5 as varchar(200)) + ']'
          FROM z_LogUpdate l, deleted d, inserted i WHERE l.TableCode = 11322005 AND l.PKValue = 
          '[' + cast(d.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID5 as varchar(200)) + ']'
          UPDATE l SET PKValue = 
          '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID5 as varchar(200)) + ']'
          FROM z_LogCreate l, deleted d, inserted i WHERE l.TableCode = 11322005 AND l.PKValue = 
          '[' + cast(d.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID5 as varchar(200)) + ']'
        END
      ELSE
        BEGIN
          INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
          SELECT 11322005, 0, 
          '[' + cast(d.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(d.SetCodeID5 as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d
          DELETE FROM z_LogCreate WHERE TableCode = 11322005 AND PKValue IN (SELECT 
          '[' + cast(AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID5 as varchar(200)) + ']' FROM deleted)
          DELETE FROM z_LogUpdate WHERE TableCode = 11322005 AND PKValue IN (SELECT 
          '[' + cast(AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(SetCodeID5 as varchar(200)) + ']' FROM deleted)
          INSERT INTO z_LogCreate (TableCode, ChID, PKValue, UserCode)
          SELECT 11322005, 0, 
          '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
          '[' + cast(i.SetCodeID5 as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i

        END
      END

  INSERT INTO z_LogUpdate (TableCode, ChID, PKValue, UserCode)
  SELECT 11322005, 0, 
    '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID5 as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM inserted i


End
GO

EXEC sp_settriggerorder N'dbo.TRel2_Upd_t_SExpE', N'Last', N'UPDATE'
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TRel3_Del_t_SExpE] ON [t_SExpE]
FOR DELETE AS
/* t_SExpE - Разукомплектация товара: Затраты на комплекты - DELETE TRIGGER */
BEGIN
  SET NOCOUNT ON

/* Проверка открытого периода */
  DECLARE @OurID int, @ADate datetime, @Err varchar(200)
  DECLARE @GetDate datetime
  DECLARE @OpenAges table(OurID int, BDate datetime, EDate datetime, isIns bit, isDel bit)

  SET @GetDate = GETDATE()

  INSERT INTO @OpenAges(OurID, isIns)
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, inserted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  INSERT INTO @OpenAges(OurID, isDel)
  SELECT DISTINCT OurID, 1 FROM  t_SExp a, t_SExpA b, deleted c  WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID)

  UPDATE t
  SET BDate = o.BDate, EDate = o.EDate
  FROM @OpenAges t, dbo.zf_GetOpenAges(@GetDate) o
  WHERE t.OurID = o.OurID
  SELECT @OurID = a.OurID, @ADate = t.BDate FROM  t_SExp a, t_SExpA b, deleted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate < t.BDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Дата или одна из дат изменяемого документа меньше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

  SELECT @OurID = a.OurID, @ADate = t.EDate FROM  t_SExp a, t_SExpA b, deleted c , @OpenAges AS t WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND t.OurID = a.OurID AND t.isDel = 1 AND ((a.DocDate > t.EDate))
  IF (@ADate IS NOT NULL) 
    BEGIN
      SELECT @Err = 'Разукомплектация товара: Затраты на комплекты (t_SExpE):' + CHAR(13) + 'Дата или одна из дат изменяемого документа больше даты открытого периода ' + dbo.zf_DatetoStr(@ADate) + ' для фирмы с кодом ' + CAST(@OurID as varchar(10))
      RAISERROR (@Err, 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Возможно ли редактирование документа */
  IF EXISTS(SELECT * FROM t_SExp a, t_SExpA b, deleted c WHERE (b.ChID = a.ChID) AND (c.AChID = b.AChID) AND dbo.zf_CanChangeDoc(11322, a.ChID, a.StateCode) = 0)
    BEGIN
      RAISERROR ('Изменение документа ''Разукомплектация товара'' в данном статусе запрещено.', 18, 1)
      ROLLBACK TRAN
      RETURN
    END

/* Удаление регистрации создания записи */
  DELETE z_LogCreate FROM z_LogCreate m, deleted i
  WHERE m.TableCode = 11322005 AND m.PKValue = 
    '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID5 as varchar(200)) + ']'

/* Удаление регистрации изменения записи */
  DELETE z_LogUpdate FROM z_LogUpdate m, deleted i
  WHERE m.TableCode = 11322005 AND m.PKValue = 
    '[' + cast(i.AChID as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(i.SetCodeID5 as varchar(200)) + ']'

/* Регистрация удаления записи */
  INSERT INTO z_LogDelete (TableCode, ChID, PKValue, UserCode)
  SELECT 11322005, 0, 
    '[' + cast(d.AChID as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(d.SetCodeID1 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(d.SetCodeID2 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(d.SetCodeID3 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(d.SetCodeID4 as varchar(200)) + ']' + ' \ ' + 
    '[' + cast(d.SetCodeID5 as varchar(200)) + ']'
          , dbo.zf_GetUserCode() FROM deleted d

END
GO

EXEC sp_settriggerorder N'dbo.TRel3_Del_t_SExpE', N'Last', N'DELETE'
GO