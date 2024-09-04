CREATE TABLE [dbo].[ItemWatch] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemId]        BIGINT         NOT NULL,
    [AspNetUsersId] NVARCHAR (128) NOT NULL,
    [DateCreated]   DATETIME       CONSTRAINT [DF_DateCreated_ItemWatch] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ItemWatch] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemWatch_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_ItemWatch_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemWatch] NOCHECK CONSTRAINT [FK_ItemWatch_AspNetUsers];


GO
ALTER TABLE [dbo].[ItemWatch] NOCHECK CONSTRAINT [FK_ItemWatch_Item];


GO

CREATE NONCLUSTERED INDEX [IX_ItemWatch_UserId]
    ON [dbo].[ItemWatch]([AspNetUsersId] ASC);


GO
ALTER INDEX [IX_ItemWatch_UserId]
    ON [dbo].[ItemWatch] DISABLE;


GO

