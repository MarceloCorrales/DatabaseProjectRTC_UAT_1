CREATE TABLE [dbo].[EquipmentCategory_PossibleVariations_V2] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [CategoryId]  INT           NOT NULL,
    [CreatedBy]   VARCHAR (50)  NULL,
    [CreatedDate] DATETIME      NULL,
    CONSTRAINT [PK_EquipmentCategory_PossibleVariations_V2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Category_Variations_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategory_PossibleVariations_V2] NOCHECK CONSTRAINT [FK_Category_Variations_CategoryId];


GO

