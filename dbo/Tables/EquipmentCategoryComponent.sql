CREATE TABLE [dbo].[EquipmentCategoryComponent] (
    [Id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [Type]                VARCHAR (250) NOT NULL,
    [Name]                VARCHAR (250) NOT NULL,
    [ValueAdd]            MONEY         NOT NULL,
    [EquipmentCategoryId] INT           NOT NULL,
    CONSTRAINT [PK_EquipmentCategoryComponent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentCategoryComponent_EquipmentCategory] FOREIGN KEY ([EquipmentCategoryId]) REFERENCES [dbo].[EquipmentCategory] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategoryComponent] NOCHECK CONSTRAINT [FK_EquipmentCategoryComponent_EquipmentCategory];


GO

