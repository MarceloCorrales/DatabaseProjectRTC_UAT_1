CREATE TABLE [dbo].[ItemAttribute] (
    [Id]                          BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemId]                      BIGINT         NOT NULL,
    [ExtendedDescription]         VARCHAR (MAX)  NULL,
    [CategoryId]                  INT            NULL,
    [SubCategoryId]               INT            NULL,
    [VeriPointInspectionId]       BIGINT         NULL,
    [ManufacturerId]              INT            NULL,
    [LocationId]                  BIGINT         NULL,
    [YearRangeId]                 INT            NULL,
    [PriceRangeId]                INT            NULL,
    [IsAuctionItem]               BIT            NULL,
    [CanMakePriorityBid]          BIT            NULL,
    [CanMakeOffer]                BIT            NULL,
    [CanBuyNow]                   BIT            NULL,
    [IsFeaturedItem]              BIT            NULL,
    [IsMarketPlaceItem]           BIT            NULL,
    [IsFleetSelectItem]           BIT            NULL,
    [ShowInspection]              BIT            NULL,
    [SellerId]                    BIGINT         NULL,
    [StockNumber]                 VARCHAR (50)   NULL,
    [HoursOrMileage]              INT            NULL,
    [SerialNumberOrVin]           VARCHAR (100)  NULL,
    [InspectionReportJson]        VARCHAR (MAX)  NULL,
    [InspectorEmail]              VARCHAR (300)  NULL,
    [InspectionCompletedDateTime] DATETIME       NULL,
    [WarrantyDate]                DATE           NULL,
    [WarrantyDetail]              VARCHAR (500)  NULL,
    [IsTerraVerse]                BIT            NULL,
    [RejectionNotes]              VARCHAR (MAX)  NULL,
    [Consignor]                   NVARCHAR (250) NULL,
    [SellerContactUserId]         NVARCHAR (128) NULL,
    [IsTerraVerseLive]            BIT            DEFAULT ((0)) NULL,
    [ItemScrapeURL]               VARCHAR (200)  NULL,
    [SortOrder]                   INT            NULL,
    [IsFleetSale]                 BIT            NULL,
    [IsAutoRestartSale]           BIT            DEFAULT ((0)) NULL,
    [ItemPDFURL]                  NVARCHAR (MAX) NULL,
    [IsWholeSale]                 BIT            NULL,
    [Frequency]                   VARCHAR (20)   NULL,
    [Voltage]                     VARCHAR (20)   NULL,
    [Quantity]                    VARCHAR (20)   NULL,
    [PowerFactor]                 VARCHAR (20)   NULL,
    [RatingType]                  VARCHAR (30)   NULL,
    [Phase]                       VARCHAR (30)   NULL,
    [kw]                          VARCHAR (30)   NULL,
    [KWRangeId]                   INT            NULL,
    [Miles]                       INT            NULL,
    [Vin]                         VARCHAR (50)   NULL,
    [ModelId]                     INT            NULL,
    CONSTRAINT [PK_ItemAttribute] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemAttribute_AspNetUsers] FOREIGN KEY ([SellerContactUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id]),
    CONSTRAINT [FK_ItemAttribute_KWRange] FOREIGN KEY ([KWRangeId]) REFERENCES [dbo].[KWRange] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Manufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[EquipmentModel_V2] ([Id]),
    CONSTRAINT [FK_ItemAttribute_PriceRange] FOREIGN KEY ([PriceRangeId]) REFERENCES [dbo].[PriceRange] ([Id]),
    CONSTRAINT [FK_ItemAttribute_Seller] FOREIGN KEY ([SellerId]) REFERENCES [dbo].[Seller] ([Id]),
    CONSTRAINT [FK_ItemAttribute_SubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id]),
    CONSTRAINT [FK_ItemAttribute_YearRange] FOREIGN KEY ([YearRangeId]) REFERENCES [dbo].[YearRange] ([Id])
);


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_AspNetUsers];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Category];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Item];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_KWRange];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Location];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Manufacturer];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Model];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_PriceRange];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_Seller];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_SubCategory];


GO
ALTER TABLE [dbo].[ItemAttribute] NOCHECK CONSTRAINT [FK_ItemAttribute_YearRange];


GO

CREATE NONCLUSTERED INDEX [nci_wi_ItemAttribute_D7B9FF75813335CBAB1B5002A723013C]
    ON [dbo].[ItemAttribute]([SellerId] ASC)
    INCLUDE([CanBuyNow], [CanMakeOffer], [CanMakePriorityBid], [CategoryId], [Consignor], [ExtendedDescription], [HoursOrMileage], [InspectionCompletedDateTime], [InspectionReportJson], [InspectorEmail], [IsAuctionItem], [IsFeaturedItem], [IsFleetSelectItem], [IsMarketPlaceItem], [IsTerraVerse], [IsTerraVerseLive], [ItemId], [ItemScrapeURL], [LocationId], [ManufacturerId], [PriceRangeId], [RejectionNotes], [SellerContactUserId], [SerialNumberOrVin], [ShowInspection], [StockNumber], [SubCategoryId], [VeriPointInspectionId], [WarrantyDate], [WarrantyDetail], [YearRangeId]);


GO
ALTER INDEX [nci_wi_ItemAttribute_D7B9FF75813335CBAB1B5002A723013C]
    ON [dbo].[ItemAttribute] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_StockNumber_ItemAttribute]
    ON [dbo].[ItemAttribute]([StockNumber] ASC);


GO
ALTER INDEX [IX_StockNumber_ItemAttribute]
    ON [dbo].[ItemAttribute] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_VeriPointInspectionId_ItemAttribute]
    ON [dbo].[ItemAttribute]([VeriPointInspectionId] ASC);


GO
ALTER INDEX [IX_VeriPointInspectionId_ItemAttribute]
    ON [dbo].[ItemAttribute] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_ItemId_ItemAttribute]
    ON [dbo].[ItemAttribute]([ItemId] ASC);


GO
ALTER INDEX [IX_ItemId_ItemAttribute]
    ON [dbo].[ItemAttribute] DISABLE;


GO

