CREATE TABLE [dbo].[RTVDataStagingDetails_v2] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [RTVDataStagingId] BIGINT   NOT NULL,
    [AskingPrice]      MONEY    NULL,
    [AuctionSaleDate]  DATETIME NULL,
    [IsInSale]         BIT      NULL,
    [IsDeleted]        BIT      NULL,
    [DateListed]       DATETIME NULL,
    [DateRemoved]      DATETIME NULL,
    [AuctionSalePrice] MONEY    NULL,
    CONSTRAINT [PK_RTVDataStagingDetails_v2] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [nci_wi_RTVDataStagingDetails_v2_16FBB93177A262A976EE0FBD3764B9E8]
    ON [dbo].[RTVDataStagingDetails_v2]([RTVDataStagingId] ASC)
    INCLUDE([AskingPrice], [AuctionSaleDate], [AuctionSalePrice], [DateListed], [DateRemoved], [IsDeleted], [IsInSale]);


GO
ALTER INDEX [nci_wi_RTVDataStagingDetails_v2_16FBB93177A262A976EE0FBD3764B9E8]
    ON [dbo].[RTVDataStagingDetails_v2] DISABLE;


GO

