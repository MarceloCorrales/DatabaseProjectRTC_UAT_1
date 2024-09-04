CREATE TABLE [dbo].[Event] (
    [Id]                      BIGINT         IDENTITY (2500, 1) NOT NULL,
    [Description]             VARCHAR (1000) NULL,
    [StartDateTime]           DATETIME       NOT NULL,
    [ClosingDateTime]         DATETIME       NULL,
    [InspectionStartDateTime] DATETIME       NULL,
    [InspectionEndDateTime]   DATETIME       NULL,
    [InspectionInstructions]  VARCHAR (MAX)  NULL,
    [LocationText]            VARCHAR (100)  NULL,
    [ContactName]             VARCHAR (100)  NULL,
    [ContactDirectNumber]     VARCHAR (100)  NULL,
    [ContactEmail]            VARCHAR (100)  NULL,
    [IsImmediateSale]         BIT            NULL,
    [IsOnsiteEvent]           BIT            NULL,
    [IsOnlineEvent]           BIT            NULL,
    [BuyersPremiumText]       VARCHAR (250)  NULL,
    [BannerImageFullUrl]      VARCHAR (250)  NULL,
    [BannerImageSideUrl]      VARCHAR (250)  NULL,
    [CollectionsImageUrl]     VARCHAR (250)  NULL,
    [PreviewItemsUrl]         VARCHAR (250)  NULL,
    [CalendarLinkOutlook]     VARCHAR (1000) NULL,
    [CalendarLinkApple]       VARCHAR (1000) NULL,
    [CalendarLinkGoogle]      VARCHAR (1000) NULL,
    [BroadcastMessage]        VARCHAR (MAX)  NULL,
    [DateCreated]             DATETIME       NOT NULL,
    [DateUpdated]             DATETIME       NOT NULL,
    [LastUpdatedBy]           VARCHAR (250)  NOT NULL,
    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_StartAndCloseDate_Event]
    ON [dbo].[Event]([StartDateTime] ASC, [ClosingDateTime] ASC);


GO
ALTER INDEX [IX_StartAndCloseDate_Event]
    ON [dbo].[Event] DISABLE;


GO

