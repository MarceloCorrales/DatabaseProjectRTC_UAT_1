CREATE TABLE [dbo].[RTVDataStaging_v2] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [RTVDataStagingMasterId] BIGINT         NULL,
    [CategoryId]             INT            NULL,
    [SubcategoryId]          INT            NULL,
    [ManufacturerId]         INT            NULL,
    [HoursMiles]             INT            NULL,
    [Year]                   INT            NULL,
    [Seller]                 NVARCHAR (MAX) NULL,
    [CityState]              NVARCHAR (MAX) NULL,
    [SalePrice]              MONEY          NULL,
    [SaleDate]               DATETIME       NULL,
    [ImageUrl]               NVARCHAR (MAX) NULL,
    [SiteListingId]          BIGINT         NULL,
    [SiteListingName]        NVARCHAR (MAX) NULL,
    [Model]                  NVARCHAR (MAX) NULL,
    [VinNumber]              NVARCHAR (MAX) NULL,
    [StockNumber]            NVARCHAR (MAX) NULL,
    [EngineManufacturer]     NVARCHAR (MAX) NULL,
    [EngineHorsepower]       NVARCHAR (MAX) NULL,
    [Transmission]           NVARCHAR (MAX) NULL,
    [Length]                 NVARCHAR (MAX) NULL,
    [Width]                  NVARCHAR (MAX) NULL,
    [Suspension]             NVARCHAR (MAX) NULL,
    [SerialNumber]           NVARCHAR (MAX) NULL,
    [Condition]              NVARCHAR (MAX) NULL,
    [Horsepower]             NVARCHAR (MAX) NULL,
    [Capacity]               NVARCHAR (MAX) NULL,
    [FreeAirDelivery]        NVARCHAR (MAX) NULL,
    [Filter]                 BIT            NULL,
    [LastUpdated]            DATETIME       NULL,
    [DateCreated]            DATETIME       NULL,
    [ParentModel]            NVARCHAR (MAX) NULL,
    [SiteListingLink]        NVARCHAR (MAX) NULL,
    [DupeData]               NVARCHAR (MAX) NULL,
    [SourceFileName]         NVARCHAR (MAX) NULL,
    [JsonData]               NVARCHAR (MAX) NULL,
    [SourceSite]             INT            NULL,
    [Isprocess]              BIT            NULL,
    [ProcessDate]            DATETIME       NULL,
    [SiteLinkPageDetail]     NVARCHAR (MAX) NULL,
    [SalePriceCurrency]      VARCHAR (10)   NULL,
    [ModelId]                INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [Rtv_Category]
    ON [dbo].[RTVDataStaging_v2]([CategoryId] ASC);


GO
ALTER INDEX [Rtv_Category]
    ON [dbo].[RTVDataStaging_v2] DISABLE;


GO

CREATE NONCLUSTERED INDEX [Rtv_SourceSite]
    ON [dbo].[RTVDataStaging_v2]([SourceSite] ASC);


GO
ALTER INDEX [Rtv_SourceSite]
    ON [dbo].[RTVDataStaging_v2] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IDX_RTVDataStaging_v2_SiteListingId]
    ON [dbo].[RTVDataStaging_v2]([SiteListingId] ASC);


GO
ALTER INDEX [IDX_RTVDataStaging_v2_SiteListingId]
    ON [dbo].[RTVDataStaging_v2] DISABLE;


GO

CREATE NONCLUSTERED INDEX [Rtv_Manufacturer]
    ON [dbo].[RTVDataStaging_v2]([ManufacturerId] ASC);


GO
ALTER INDEX [Rtv_Manufacturer]
    ON [dbo].[RTVDataStaging_v2] DISABLE;


GO

CREATE NONCLUSTERED INDEX [Rtv_Subcategory]
    ON [dbo].[RTVDataStaging_v2]([SubcategoryId] ASC);


GO
ALTER INDEX [Rtv_Subcategory]
    ON [dbo].[RTVDataStaging_v2] DISABLE;


GO

