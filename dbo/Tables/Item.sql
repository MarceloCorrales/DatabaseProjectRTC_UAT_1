CREATE TABLE [dbo].[Item] (
    [Id]                 BIGINT        IDENTITY (150000, 1) NOT NULL,
    [Name]               VARCHAR (250) NOT NULL,
    [AuctionDate]        DATETIME      NULL,
    [StartingBid]        MONEY         NOT NULL,
    [BidIncrement]       MONEY         NOT NULL,
    [TargetGoalAmount]   MONEY         NULL,
    [Model]              VARCHAR (250) NOT NULL,
    [Year]               INT           NULL,
    [BotJson]            VARCHAR (MAX) NULL,
    [ManufacturerString] VARCHAR (250) NULL,
    [LocationString]     VARCHAR (250) NULL,
    [ConditionString]    VARCHAR (MAX) NULL,
    [SiteListingId]      BIGINT        NULL,
    [SiteListingName]    VARCHAR (250) NULL,
    [IsDeleted]          BIT           NULL,
    [IsPreLaunch]        BIT           NULL,
    [ReserveAmount]      MONEY         NULL,
    [Status]             INT           NULL,
    [DateCreated]        DATETIME      NOT NULL,
    [DateUpdated]        DATETIME      NOT NULL,
    [LastUpdatedBy]      VARCHAR (250) NULL,
    [Rowversion]         BINARY (8)    NOT NULL,
    [WholeSalePrice]     MONEY         NOT NULL,
    CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Item_LookupItemStatusType] FOREIGN KEY ([Status]) REFERENCES [dbo].[LookupItemStatusType] ([Id])
);


GO
ALTER TABLE [dbo].[Item] NOCHECK CONSTRAINT [FK_Item_LookupItemStatusType];


GO

