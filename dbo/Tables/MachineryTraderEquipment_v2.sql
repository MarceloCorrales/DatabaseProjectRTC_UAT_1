CREATE TABLE [dbo].[MachineryTraderEquipment_v2] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [HoursMiles]         INT            NOT NULL,
    [Year]               INT            NOT NULL,
    [Seller]             VARCHAR (250)  NULL,
    [CityState]          VARCHAR (250)  NULL,
    [SalePrice]          MONEY          NOT NULL,
    [SaleDate]           DATETIME       NOT NULL,
    [ImageUrl]           VARCHAR (1000) NULL,
    [SiteListingId]      BIGINT         NULL,
    [SiteListingName]    VARCHAR (250)  NULL,
    [Model]              VARCHAR (250)  NULL,
    [VinNumber]          VARCHAR (250)  NULL,
    [StockNumber]        VARCHAR (250)  NULL,
    [EngineManufacturer] VARCHAR (250)  NULL,
    [EngineHorsepower]   VARCHAR (250)  NULL,
    [Transmission]       VARCHAR (250)  NULL,
    [Length]             VARCHAR (100)  NULL,
    [Width]              VARCHAR (100)  NULL,
    [Suspension]         VARCHAR (250)  NULL,
    [SerialNumber]       VARCHAR (250)  NULL,
    [Condition]          VARCHAR (250)  NULL,
    [Horsepower]         VARCHAR (250)  NULL,
    [Capacity]           VARCHAR (250)  NULL,
    [FreeAirDelivery]    VARCHAR (250)  NULL,
    [CategoryId]         INT            NOT NULL,
    [SubCategoryId]      INT            NULL,
    [ManufacturerId]     INT            NULL,
    [LastUpdated]        DATETIME       NOT NULL,
    [DateCreated]        DATETIME       NOT NULL,
    [ParentModel]        VARCHAR (250)  NOT NULL,
    [SiteListingLink]    VARCHAR (1000) NULL,
    [DupeData]           VARCHAR (100)  NULL,
    [SourceFileName]     VARCHAR (250)  NULL,
    [JsonData]           VARCHAR (MAX)  NULL,
    [SalePriceCurrency]  VARCHAR (10)   NULL,
    CONSTRAINT [FK__Machinery__Categ__0CA5D9DE] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id]),
    CONSTRAINT [FK__Machinery__Manuf__0E8E2250] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id]),
    CONSTRAINT [FK__Machinery__SubCa__0D99FE17] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[MachineryTraderEquipment_v2] NOCHECK CONSTRAINT [FK__Machinery__Categ__0CA5D9DE];


GO
ALTER TABLE [dbo].[MachineryTraderEquipment_v2] NOCHECK CONSTRAINT [FK__Machinery__Manuf__0E8E2250];


GO
ALTER TABLE [dbo].[MachineryTraderEquipment_v2] NOCHECK CONSTRAINT [FK__Machinery__SubCa__0D99FE17];


GO

