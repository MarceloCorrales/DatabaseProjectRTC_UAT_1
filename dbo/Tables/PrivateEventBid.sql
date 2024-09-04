CREATE TABLE [dbo].[PrivateEventBid] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [PrivateEventBlockId]     BIGINT         NOT NULL,
    [Quantity]                INT            NOT NULL,
    [Price]                   MONEY          NOT NULL,
    [IsPurchase]              BIT            NOT NULL,
    [BuyerId]                 NVARCHAR (128) NOT NULL,
    [BuyerNotified]           BIT            NULL,
    [TerraVerseGroupNotified] BIT            NULL,
    [WasFloorPurchase]        BIT            NULL,
    [DateCreated]             DATETIME       NOT NULL,
    [IsDeleted]               BIT            CONSTRAINT [DF_PrivateEventBid_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PrivateEventBid] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventBid_AspNetUsers] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_PrivateEventBid_PrivateEventBlock] FOREIGN KEY ([PrivateEventBlockId]) REFERENCES [dbo].[PrivateEventBlock] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventBid] NOCHECK CONSTRAINT [FK_PrivateEventBid_AspNetUsers];


GO
ALTER TABLE [dbo].[PrivateEventBid] NOCHECK CONSTRAINT [FK_PrivateEventBid_PrivateEventBlock];


GO

