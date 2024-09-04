CREATE TABLE [dbo].[EquipmentSubCategory] (
    [Id]                  INT           NOT NULL,
    [Name]                VARCHAR (250) NOT NULL,
    [EquipmentCategoryId] INT           NOT NULL,
    [SiteId]              INT           NOT NULL,
    [SiteSubCategoryName] VARCHAR (250) NULL,
    [SiteSubCategoryId]   INT           NULL,
    [PrefixName]          VARCHAR (250) NULL,
    CONSTRAINT [PK_EquipmentSubCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentSubCategory_EquipmentCategory] FOREIGN KEY ([EquipmentCategoryId]) REFERENCES [dbo].[EquipmentCategory] ([Id]),
    CONSTRAINT [FK_EquipmentSubCategory_Site] FOREIGN KEY ([SiteId]) REFERENCES [dbo].[Site] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentSubCategory] NOCHECK CONSTRAINT [FK_EquipmentSubCategory_EquipmentCategory];


GO
ALTER TABLE [dbo].[EquipmentSubCategory] NOCHECK CONSTRAINT [FK_EquipmentSubCategory_Site];


GO

CREATE NONCLUSTERED INDEX [IX_EquipSubCat_CatIdSubCatName]
    ON [dbo].[EquipmentSubCategory]([EquipmentCategoryId] ASC, [SiteSubCategoryName] ASC);


GO
ALTER INDEX [IX_EquipSubCat_CatIdSubCatName]
    ON [dbo].[EquipmentSubCategory] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_EquipSubCat_SiteCatSubCatName]
    ON [dbo].[EquipmentSubCategory]([SiteId] ASC, [EquipmentCategoryId] ASC, [SiteSubCategoryName] ASC);


GO
ALTER INDEX [IX_EquipSubCat_SiteCatSubCatName]
    ON [dbo].[EquipmentSubCategory] DISABLE;


GO

