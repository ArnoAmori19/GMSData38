CREATE TABLE [dbo].[v_UFields]
(
[RepID] [int] NOT NULL,
[FieldName] [varchar] (250) NOT NULL,
[UserID] [smallint] NOT NULL,
[Location] [int] NOT NULL,
[SrcPosID] [int] NOT NULL,
[Visible] [bit] NOT NULL,
[VisibleNote] [bit] NOT NULL,
[Width] [int] NOT NULL,
[Alignment] [tinyint] NOT NULL,
[Layout] [tinyint] NOT NULL,
[WordWrap] [bit] NOT NULL,
[Negatives] [bit] NOT NULL,
[Operation] [tinyint] NOT NULL,
[Sorting] [tinyint] NOT NULL,
[SubTotals] [bit] NOT NULL,
[Separator] [bit] NOT NULL,
[DecimalCount] [tinyint] NOT NULL,
[FixedCount] [tinyint] NOT NULL,
[Caption] [varchar] (250) NOT NULL,
[FieldLevel] [tinyint] NOT NULL,
[FieldKind] [tinyint] NOT NULL,
[DataType] [tinyint] NOT NULL,
[FilterOnly] [bit] NOT NULL,
[HideInFilter] [bit] NOT NULL,
[Grouping] [smallint] NOT NULL,
[GroupFactor] [smallint] NOT NULL,
[GroupField] [varchar] (250) NULL,
[LExpr] [varchar] (250) NULL,
[EExpr] [varchar] (250) NULL,
[OFilter] [varchar] (4000) NULL,
[PFilter] [varchar] (1000) NULL,
[FieldPosID] [int] NOT NULL DEFAULT (0)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[v_UFields] ADD CONSTRAINT [_pk_v_UFields] PRIMARY KEY CLUSTERED ([UserID], [RepID], [FieldName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FieldName] ON [dbo].[v_UFields] ([FieldName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Location] ON [dbo].[v_UFields] ([Location]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RepID] ON [dbo].[v_UFields] ([RepID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PosID] ON [dbo].[v_UFields] ([SrcPosID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [UserID] ON [dbo].[v_UFields] ([UserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[v_UFields] ADD CONSTRAINT [FK_v_UFields_v_Reps] FOREIGN KEY ([RepID]) REFERENCES [dbo].[v_Reps] ([RepID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[RepID]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[UserID]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Location]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[SrcPosID]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Visible]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[VisibleNote]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Width]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Alignment]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Layout]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[WordWrap]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Negatives]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Operation]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Sorting]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[SubTotals]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[Separator]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[DecimalCount]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[FixedCount]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[FilterOnly]'
GO
EXEC sp_bindefault N'[dbo].[DF_Zero]', N'[dbo].[v_UFields].[HideInFilter]'
GO
