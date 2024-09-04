CREATE TABLE [dbo].[EquipmentCategoryManufacturer] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (250) NOT NULL,
    [EquipmentCategoryId] INT           NOT NULL,
    CONSTRAINT [PK_EquipmentCategoryManufacturer] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentCategoryManufacturer_EquipmentCategory] FOREIGN KEY ([EquipmentCategoryId]) REFERENCES [dbo].[EquipmentCategory] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategoryManufacturer] NOCHECK CONSTRAINT [FK_EquipmentCategoryManufacturer_EquipmentCategory];


GO

CREATE NONCLUSTERED INDEX [IX_EquipCatManu_CatIdName]
    ON [dbo].[EquipmentCategoryManufacturer]([EquipmentCategoryId] ASC, [Name] ASC);


GO
ALTER INDEX [IX_EquipCatManu_CatIdName]
    ON [dbo].[EquipmentCategoryManufacturer] DISABLE;


GO

