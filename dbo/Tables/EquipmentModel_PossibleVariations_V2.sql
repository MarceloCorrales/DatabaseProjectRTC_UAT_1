CREATE TABLE [dbo].[EquipmentModel_PossibleVariations_V2] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [ModelId]     INT           NOT NULL,
    [CreatedBy]   VARCHAR (50)  NULL,
    [CreatedDate] DATETIME      NULL,
    CONSTRAINT [PK_EquipmentModel_PossibleVariations_V2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Model_Variations_ModelId] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[EquipmentModel_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentModel_PossibleVariations_V2] NOCHECK CONSTRAINT [FK_Model_Variations_ModelId];


GO

