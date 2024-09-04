CREATE TABLE [dbo].[ItemShipping] (
    [Id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [ItemBidId]          BIGINT        NOT NULL,
    [Contact]            VARCHAR (200) NULL,
    [Address]            VARCHAR (200) NULL,
    [City]               VARCHAR (50)  NULL,
    [State]              VARCHAR (50)  NULL,
    [PostalCode]         VARCHAR (10)  NULL,
    [Country]            VARCHAR (100) NULL,
    [Notes]              VARCHAR (MAX) NULL,
    [ShippingDate]       DATETIME      NULL,
    [ActualShippingDate] DATETIME      NULL,
    [IsPickupItem]       BIT           NULL,
    [DateCreated]        DATETIME      NULL,
    [DateUpdated]        DATETIME      NULL,
    [LastUpdatedBy]      VARCHAR (250) NULL,
    CONSTRAINT [PK_ItemShipping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemShipping_ItemBid] FOREIGN KEY ([ItemBidId]) REFERENCES [dbo].[ItemBid] ([Id])
);


GO
ALTER TABLE [dbo].[ItemShipping] NOCHECK CONSTRAINT [FK_ItemShipping_ItemBid];


GO

