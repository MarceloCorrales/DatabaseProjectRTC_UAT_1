CREATE TABLE [dbo].[ItemContact] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemId]        BIGINT         NOT NULL,
    [AspNetUsersId] NVARCHAR (128) NOT NULL,
    [DateCreated]   DATETIME       NOT NULL,
    CONSTRAINT [PK_ItemContact] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemContact_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_ItemContact_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemContact] NOCHECK CONSTRAINT [FK_ItemContact_AspNetUsers];


GO
ALTER TABLE [dbo].[ItemContact] NOCHECK CONSTRAINT [FK_ItemContact_Item];


GO

CREATE NONCLUSTERED INDEX [IX_ItemContact_ItemIdUserId]
    ON [dbo].[ItemContact]([ItemId] ASC, [AspNetUsersId] ASC);


GO
ALTER INDEX [IX_ItemContact_ItemIdUserId]
    ON [dbo].[ItemContact] DISABLE;


GO

