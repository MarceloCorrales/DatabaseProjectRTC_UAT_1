CREATE TABLE [dbo].[EventItemBid] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [EventItemId] BIGINT         NOT NULL,
    [BuyerId]     NVARCHAR (128) NOT NULL,
    [BidPrice]    MONEY          NULL,
    [MaxBid]      MONEY          NULL,
    [IsAutoBid]   BIT            NOT NULL,
    [DateCreated] DATETIME       NOT NULL,
    CONSTRAINT [PK_EventItemBid] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EventItemBid_BuyerId_AspNetUsers] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_EventItemBid_EventItem] FOREIGN KEY ([EventItemId]) REFERENCES [dbo].[EventItem] ([Id])
);


GO
ALTER TABLE [dbo].[EventItemBid] NOCHECK CONSTRAINT [FK_EventItemBid_BuyerId_AspNetUsers];


GO
ALTER TABLE [dbo].[EventItemBid] NOCHECK CONSTRAINT [FK_EventItemBid_EventItem];


GO

CREATE NONCLUSTERED INDEX [IX_BuyerId_EventItemBid]
    ON [dbo].[EventItemBid]([BuyerId] ASC);


GO
ALTER INDEX [IX_BuyerId_EventItemBid]
    ON [dbo].[EventItemBid] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_EventItemId_EventItemBid]
    ON [dbo].[EventItemBid]([EventItemId] ASC);


GO
ALTER INDEX [IX_EventItemId_EventItemBid]
    ON [dbo].[EventItemBid] DISABLE;


GO

