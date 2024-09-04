CREATE TABLE [dbo].[MachineryTraderEquipment] (
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
    [SerialNumber]                    VARCHAR (250)  NULL,
    [Condition]                       VARCHAR (250)  NULL,
    [Horsepower]                      VARCHAR (250)  NULL,
    [Capacity]                        VARCHAR (250)  NULL,
    [FreeAirDelivery]                 VARCHAR (250)  NULL,
    [EquipmentCategoryManufacturerId] INT            NOT NULL,
    [EquipmentSubCategoryId]          INT            NULL,
    [LastUpdated]                     DATETIME       NOT NULL,
    [DateCreated]                     DATETIME       NOT NULL,
    [ParentModel]                     VARCHAR (250)  DEFAULT ('Parent') NOT NULL,
    [SiteListingLink]                 VARCHAR (1000) NULL,
    [DupeData]                        VARCHAR (100)  NULL,
    [SourceFileName]                  VARCHAR (250)  NULL,
    [JsonData]                        VARCHAR (MAX)  NULL,
    CONSTRAINT [PK_MachineryTraderEquipment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MachineryTraderEquipment_EquipmentCategoryManufacturer] FOREIGN KEY ([EquipmentCategoryManufacturerId]) REFERENCES [dbo].[EquipmentCategoryManufacturer] ([Id])
);


GO
ALTER TABLE [dbo].[MachineryTraderEquipment] NOCHECK CONSTRAINT [FK_MachineryTraderEquipment_EquipmentCategoryManufacturer];


GO

CREATE NONCLUSTERED INDEX [IX_MTE_SiteListingId]
    ON [dbo].[MachineryTraderEquipment]([SiteListingId] ASC);


GO
ALTER INDEX [IX_MTE_SiteListingId]
    ON [dbo].[MachineryTraderEquipment] DISABLE;


GO

