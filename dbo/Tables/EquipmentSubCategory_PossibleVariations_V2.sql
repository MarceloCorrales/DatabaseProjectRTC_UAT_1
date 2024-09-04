CREATE TABLE [dbo].[EquipmentSubCategory_PossibleVariations_V2] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (200) NOT NULL,
    [SubCategoryId] INT           NOT NULL,
    [CreatedBy]     VARCHAR (50)  NULL,
    [CreatedDate]   DATETIME      NULL,
    CONSTRAINT [PK_EquipmentSubCategory_PossibleVariations_V2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SubCategory_Variations_SubCategoryId] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentSubCategory_PossibleVariations_V2] NOCHECK CONSTRAINT [FK_SubCategory_Variations_SubCategoryId];


GO

