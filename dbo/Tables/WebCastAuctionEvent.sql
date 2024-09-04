CREATE TABLE [dbo].[WebCastAuctionEvent] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [StartDateTime]          DATETIME       NOT NULL,
    [ClosingDateTime]        DATETIME       NOT NULL,
    [Description]            VARCHAR (1000) NULL,
    [DateCreated]            DATETIME       NOT NULL,
    [DateUpdated]            DATETIME       NOT NULL,
    [LastUpdatedBy]          VARCHAR (250)  NULL,
    [ImageReferenceItemId]   BIGINT         NULL,
    [InspectionInstructions] NVARCHAR (250) NULL,
    [BuyersPremiumText]      NVARCHAR (MAX) NULL,
    [ContactDirectNumber]    NVARCHAR (50)  NULL,
    [ContactEmail]           NVARCHAR (50)  NULL,
    [ContactName]            NVARCHAR (100) NULL,
    [LocationText]           NVARCHAR (250) NULL,
    [Currency]               NVARCHAR (50)  NULL,
    [SaleTitle]              VARCHAR (250)  NULL,
    [EquipmentDescription]   VARCHAR (1000) NULL,
    [SaleType]               VARCHAR (250)  NULL,
    [AltTagName]             VARCHAR (100)  NULL,
    [RequireDealerLicense]   BIT            NULL,
    [RequireLogin]           BIT            NULL,
    [ExternalWeblink]        VARCHAR (MAX)  NULL,
    [TabContent]             VARCHAR (MAX)  NULL,
    [DetailsRemoval]         VARCHAR (MAX)  NULL,
    [EquipmentList]          VARCHAR (MAX)  NULL,
    [TabHeading]             VARCHAR (MAX)  NULL,
    CONSTRAINT [PK_WebCastAuctionEvent] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

