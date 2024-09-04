CREATE TABLE [dbo].[PrivateEventBlockItem] (
    [Id]                  BIGINT IDENTITY (1, 1) NOT NULL,
    [PrivateEventBlockId] BIGINT NOT NULL,
    [ItemId]              BIGINT NOT NULL,
    CONSTRAINT [PK_PrivateEventBlockItem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventBlockItem_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id]),
    CONSTRAINT [FK_PrivateEventBlockItem_PrivateEventBlock] FOREIGN KEY ([PrivateEventBlockId]) REFERENCES [dbo].[PrivateEventBlock] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventBlockItem] NOCHECK CONSTRAINT [FK_PrivateEventBlockItem_Item];


GO
ALTER TABLE [dbo].[PrivateEventBlockItem] NOCHECK CONSTRAINT [FK_PrivateEventBlockItem_PrivateEventBlock];


GO

