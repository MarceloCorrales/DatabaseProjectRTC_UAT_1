CREATE TABLE [dbo].[EventItem] (
    [Id]          BIGINT   IDENTITY (1, 1) NOT NULL,
    [ItemId]      BIGINT   NOT NULL,
    [EventId]     BIGINT   NOT NULL,
    [StartTime]   DATETIME NULL,
    [EndTime]     DATETIME NULL,
    [SortOrder]   INT      NULL,
    [GroupNumber] INT      NULL,
    CONSTRAINT [PK_EventItem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EventItem_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
    CONSTRAINT [FK_EventItem_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[EventItem] NOCHECK CONSTRAINT [FK_EventItem_Event];


GO
ALTER TABLE [dbo].[EventItem] NOCHECK CONSTRAINT [FK_EventItem_Item];


GO

CREATE NONCLUSTERED INDEX [IX_EventId_EventItem]
    ON [dbo].[EventItem]([EventId] ASC);


GO
ALTER INDEX [IX_EventId_EventItem]
    ON [dbo].[EventItem] DISABLE;


GO

