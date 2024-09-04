CREATE TABLE [dbo].[RTVDataStaging] (
    [Id]                              BIGINT         IDENTITY (1, 1) NOT NULL,
    [RTVDataStagingMasterId]          BIGINT         NOT NULL,
    [HoursMiles]                      INT            NOT NULL,
    [Year]                            INT            NOT NULL,
    [Seller]                          NVARCHAR (MAX) NULL,
    [CityState]                       NVARCHAR (MAX) NULL,
    [SalePrice]                       MONEY          NOT NULL,
    [SaleDate]                        DATETIME       NOT NULL,
    [ImageUrl]                        NVARCHAR (MAX) NULL,
    [SiteListingId]                   BIGINT         NULL,
    [SiteListingName]                 NVARCHAR (MAX) NULL,
    [Model]                           NVARCHAR (MAX) NULL,
    [VinNumber]                       NVARCHAR (MAX) NULL,
    [StockNumber]                     NVARCHAR (MAX) NULL,
    [EngineManufacturer]              NVARCHAR (MAX) NULL,
    [EngineHorsepower]                NVARCHAR (MAX) NULL,
    [Transmission]                    NVARCHAR (MAX) NULL,
    [Length]                          NVARCHAR (MAX) NULL,
    [Width]                           NVARCHAR (MAX) NULL,
    [Suspension]                      NVARCHAR (MAX) NULL,
    [SerialNumber]                    NVARCHAR (MAX) NULL,
    [Condition]                       NVARCHAR (MAX) NULL,
    [Horsepower]                      NVARCHAR (MAX) NULL,
    [Capacity]                        NVARCHAR (MAX) NULL,
    [FreeAirDelivery]                 NVARCHAR (MAX) NULL,
    [EquipmentCategoryManufacturerId] INT            NOT NULL,
    [EquipmentSubCategoryId]          INT            NULL,
    [Filter]                          BIT            DEFAULT ((1)) NULL,
    [LastUpdated]                     DATETIME       NOT NULL,
    [DateCreated]                     DATETIME       NOT NULL,
    [ParentModel]                     NVARCHAR (MAX) DEFAULT ('Parent') NOT NULL,
    [SiteListingLink]                 NVARCHAR (MAX) NULL,
    [DupeData]                        NVARCHAR (MAX) NULL,
    [SourceFileName]                  NVARCHAR (MAX) NULL,
    [JsonData]                        NVARCHAR (MAX) NULL,
    [SourceSite]                      INT            NULL,
    [Isprocess]                       BIT            NULL,
    [ProcessDate]                     DATETIME       NULL,
    CONSTRAINT [PK_RTVDataStaging] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RTVDataStaging_EquipmentCategoryManufacturer] FOREIGN KEY ([EquipmentCategoryManufacturerId]) REFERENCES [dbo].[EquipmentCategoryManufacturer] ([Id]),
    CONSTRAINT [FK_RTVDataStaging_RTVDataStagingMaster] FOREIGN KEY ([RTVDataStagingMasterId]) REFERENCES [dbo].[RTVDataStagingMaster] ([Id])
);


GO
ALTER TABLE [dbo].[RTVDataStaging] NOCHECK CONSTRAINT [FK_RTVDataStaging_EquipmentCategoryManufacturer];


GO
ALTER TABLE [dbo].[RTVDataStaging] NOCHECK CONSTRAINT [FK_RTVDataStaging_RTVDataStagingMaster];


GO

