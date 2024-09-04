CREATE TABLE [dbo].[EquipmentCategory_Subcategory_Manufacturer_V2] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CategoryId]     INT           NULL,
    [SubcategoryId]  INT           NULL,
    [ManufacturerId] INT           NULL,
    [CreatedDate]    DATETIME      NULL,
    [CreatedBy]      VARCHAR (100) NULL,
    [IsDeleted]      BIT           NULL,
    CONSTRAINT [PK__Equipmen__3214EC074630A3B5] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK__Equipment__Categ__6F1576F7] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id]),
    CONSTRAINT [FK__Equipment__Manuf__70FDBF69] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id]),
    CONSTRAINT [FK__Equipment__Subca__70099B30] FOREIGN KEY ([SubcategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id]) ON DELETE SET NULL
);


GO
ALTER TABLE [dbo].[EquipmentCategory_Subcategory_Manufacturer_V2] NOCHECK CONSTRAINT [FK__Equipment__Categ__6F1576F7];


GO
ALTER TABLE [dbo].[EquipmentCategory_Subcategory_Manufacturer_V2] NOCHECK CONSTRAINT [FK__Equipment__Manuf__70FDBF69];


GO
ALTER TABLE [dbo].[EquipmentCategory_Subcategory_Manufacturer_V2] NOCHECK CONSTRAINT [FK__Equipment__Subca__70099B30];


GO

