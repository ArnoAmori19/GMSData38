CREATE TABLE [dbo].[z_UserCodes4]
(
[UserID] [smallint] NOT NULL,
[CodeID4] [smallint] NOT NULL,
[AccRead] [tinyint] NOT NULL DEFAULT (0),
[AccInsert] [tinyint] NOT NULL DEFAULT (0),
[AccUpdate] [tinyint] NOT NULL DEFAULT (0),
[AccDelete] [tinyint] NOT NULL DEFAULT (0)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[z_UserCodes4] ADD CONSTRAINT [pk_z_UserCodes4] PRIMARY KEY CLUSTERED ([UserID], [CodeID4]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AccDelete] ON [dbo].[z_UserCodes4] ([AccDelete]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AccInsert] ON [dbo].[z_UserCodes4] ([AccInsert]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AccRead] ON [dbo].[z_UserCodes4] ([AccRead]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AccUpdate] ON [dbo].[z_UserCodes4] ([AccUpdate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeID4] ON [dbo].[z_UserCodes4] ([CodeID4]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [UserID] ON [dbo].[z_UserCodes4] ([UserID]) ON [PRIMARY]
GO