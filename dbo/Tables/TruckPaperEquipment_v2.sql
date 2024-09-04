CREATE TABLE [dbo].[TruckPaperEquipment_v2] (
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
    [CategoryId]         INT            NOT NULL,
    [SubCategoryId]      INT            NULL,
    [ManufacturerId]     INT            NULL,
    [Filter]             BIT            NULL,
    [LastUpdated]        DATETIME       NOT NULL,
    [DateCreated]        DATETIME       NOT NULL,
    [ParentModel]        VARCHAR (250)  NOT NULL,
    [SiteListingLink]    VARCHAR (1000) NULL,
    [DupeData]           VARCHAR (100)  NULL,
    [SourceFileName]     VARCHAR (250)  NULL,
    [JsonData]           VARCHAR (MAX)  NULL,
    [SalePriceCurrency]  VARCHAR (10)   NULL,
    CONSTRAINT [PK_TruckPaperEquipment_v2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK__TruckPape__Categ__08D548FA] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id]),
    CONSTRAINT [FK__TruckPape__Manuf__0ABD916C] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id]),
    CONSTRAINT [FK__TruckPape__SubCa__09C96D33] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[TruckPaperEquipment_v2] NOCHECK CONSTRAINT [FK__TruckPape__Categ__08D548FA];


GO
ALTER TABLE [dbo].[TruckPaperEquipment_v2] NOCHECK CONSTRAINT [FK__TruckPape__Manuf__0ABD916C];


GO
ALTER TABLE [dbo].[TruckPaperEquipment_v2] NOCHECK CONSTRAINT [FK__TruckPape__SubCa__09C96D33];


GO

