CREATE TABLE [dbo].[EquipmentManufacturer_PossibleVariations_V2] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (200) NOT NULL,
    [ManufacturerId] INT           NOT NULL,
    [CreatedBy]      VARCHAR (50)  NULL,
    [CreatedDate]    DATETIME      NULL,
    CONSTRAINT [PK_EquipmentManufacturer_PossibleVariations_V2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentManufacturer_PossibleVariations_V2_EquipmentManufacturer_V2] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentManufacturer_PossibleVariations_V2] NOCHECK CONSTRAINT [FK_EquipmentManufacturer_PossibleVariations_V2_EquipmentManufacturer_V2];


GO

