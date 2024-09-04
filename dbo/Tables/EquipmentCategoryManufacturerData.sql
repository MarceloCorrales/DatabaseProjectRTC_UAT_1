CREATE TABLE [dbo].[EquipmentCategoryManufacturerData] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (250) NOT NULL,
    [EquipmentCategoryId] INT           NOT NULL,
    CONSTRAINT [PK_EquipmentCategoryManufacturerData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentCategoryManufacturerData_EquipmentCategoryData] FOREIGN KEY ([EquipmentCategoryId]) REFERENCES [dbo].[EquipmentCategoryData] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategoryManufacturerData] NOCHECK CONSTRAINT [FK_EquipmentCategoryManufacturerData_EquipmentCategoryData];


GO

