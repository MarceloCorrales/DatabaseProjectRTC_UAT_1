CREATE TABLE [dbo].[PrivateEventBlock] (
    [Id]                     BIGINT IDENTITY (250000, 1) NOT NULL,
    [PrivateEventSummaryId]  BIGINT NOT NULL,
    [Quantity]               INT    NOT NULL,
    [StartingPrice]          MONEY  NULL,
    [CurrentPrice]           MONEY  NULL,
    [PriceReduceIntervalSec] INT    NULL,
    [PriceReduceAmount]      MONEY  NULL,
    [StartingFloorPrice]     MONEY  NULL,
    [CurrentFloorPrice]      MONEY  NULL,
    [SortOrder]              INT    NOT NULL,
    CONSTRAINT [PK_PrivateEventBlock] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventBlock_PrivateEventSummary] FOREIGN KEY ([PrivateEventSummaryId]) REFERENCES [dbo].[PrivateEventSummary] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventBlock] NOCHECK CONSTRAINT [FK_PrivateEventBlock_PrivateEventSummary];


GO

