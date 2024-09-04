CREATE TABLE [dbo].[EquipmentCategory_Subcategory_Manufacturer_V2_bk_2] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CategoryId]     INT           NULL,
    [SubcategoryId]  INT           NULL,
    [ManufacturerId] INT           NULL,
    [CreatedDate]    DATETIME      NULL,
    [CreatedBy]      VARCHAR (100) NULL,
    [IsDeleted]      BIT           NULL
);


GO

