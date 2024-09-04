CREATE TABLE [dbo].[ItemBid] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemId]        BIGINT         NOT NULL,
    [Type]          INT            NOT NULL,
    [BuyerId]       NVARCHAR (128) NOT NULL,
    [Notes]         VARCHAR (250)  NULL,
    [BidPrice]      MONEY          NULL,
    [Quantity]      INT            NOT NULL,
    [Status]        INT            NULL,
    [DateCreated]   DATETIME       NOT NULL,
    [DateUpdated]   DATETIME       NOT NULL,
    [LastUpdatedBy] VARCHAR (250)  NULL,
    CONSTRAINT [PK_ItemBid] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemBid_BuyerId_AspNetUsers] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_ItemBid_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id]),
    CONSTRAINT [FK_ItemBid_LookupItemBidStatus] FOREIGN KEY ([Status]) REFERENCES [dbo].[LookupItemBidStatus] ([Id]),
    CONSTRAINT [FK_ItemBid_LookupItemBidType] FOREIGN KEY ([Type]) REFERENCES [dbo].[LookupItemBidType] ([Id])
);


GO
ALTER TABLE [dbo].[ItemBid] NOCHECK CONSTRAINT [FK_ItemBid_BuyerId_AspNetUsers];


GO
ALTER TABLE [dbo].[ItemBid] NOCHECK CONSTRAINT [FK_ItemBid_Item];


GO
ALTER TABLE [dbo].[ItemBid] NOCHECK CONSTRAINT [FK_ItemBid_LookupItemBidStatus];


GO
ALTER TABLE [dbo].[ItemBid] NOCHECK CONSTRAINT [FK_ItemBid_LookupItemBidType];


GO

CREATE NONCLUSTERED INDEX [IX_ItemIdBuyerId_ItemBid]
    ON [dbo].[ItemBid]([ItemId] ASC, [BuyerId] ASC);


GO
ALTER INDEX [IX_ItemIdBuyerId_ItemBid]
    ON [dbo].[ItemBid] DISABLE;


GO

