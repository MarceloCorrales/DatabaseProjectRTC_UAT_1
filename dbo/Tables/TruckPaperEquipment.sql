CREATE TABLE [dbo].[TruckPaperEquipment] (
    [Id]                              BIGINT         IDENTITY (1, 1) NOT NULL,
    [HoursMiles]                      INT            NOT NULL,
    [Year]                            INT            NOT NULL,
    [Seller]                          VARCHAR (250)  NULL,
    [CityState]                       VARCHAR (250)  NULL,
    [SalePrice]                       MONEY          NOT NULL,
    [SaleDate]                        DATETIME       NOT NULL,
    [ImageUrl]                        VARCHAR (1000) NULL,
    [SiteListingId]                   BIGINT         NULL,
    [SiteListingName]                 VARCHAR (250)  NULL,
    [Model]                           VARCHAR (250)  NULL,
    [VinNumber]                       VARCHAR (250)  NULL,
    [StockNumber]                     VARCHAR (250)  NULL,
    [EngineManufacturer]              VARCHAR (250)  NULL,
    [EngineHorsepower]                VARCHAR (250)  NULL,
    [Transmission]                    VARCHAR (250)  NULL,
    [Length]                          VARCHAR (100)  NULL,
    [Width]                           VARCHAR (100)  NULL,
    [Suspension]                      VARCHAR (250)  NULL,
    [EquipmentCategoryManufacturerId] INT            NOT NULL,
    [EquipmentSubCategoryId]          INT            NULL,
    [Filter]                          BIT            DEFAULT ((1)) NULL,
    [LastUpdated]                     DATETIME       NOT NULL,
    [DateCreated]                     DATETIME       NOT NULL,
    [ParentModel]                     VARCHAR (250)  CONSTRAINT [TP_DEF_ParentModel] DEFAULT ('ParentModel') NOT NULL,
    [SiteListingLink]                 VARCHAR (1000) NULL,
    [DupeData]                        VARCHAR (100)  NULL,
    [SourceFileName]                  VARCHAR (250)  NULL,
    [JsonData]                        VARCHAR (MAX)  NULL,
    CONSTRAINT [PK_TruckPaperEquipment] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_TPE_SiteListingId]
    ON [dbo].[TruckPaperEquipment]([SiteListingId] ASC);


GO
ALTER INDEX [IX_TPE_SiteListingId]
    ON [dbo].[TruckPaperEquipment] DISABLE;


GO

