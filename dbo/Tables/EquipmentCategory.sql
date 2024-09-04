CREATE TABLE [dbo].[EquipmentCategory] (
    [Id]               INT           NOT NULL,
    [Name]             VARCHAR (250) NOT NULL,
    [SiteId]           INT           NOT NULL,
    [SiteCategoryName] VARCHAR (250) NULL,
    [SiteCategoryId]   INT           NULL,
    CONSTRAINT [PK_EquipmentCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentCategory_Site] FOREIGN KEY ([SiteId]) REFERENCES [dbo].[Site] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategory] NOCHECK CONSTRAINT [FK_EquipmentCategory_Site];


GO

CREATE NONCLUSTERED INDEX [IX_EquipCat_SiteCatId]
    ON [dbo].[EquipmentCategory]([SiteId] ASC, [Id] ASC);


GO
ALTER INDEX [IX_EquipCat_SiteCatId]
    ON [dbo].[EquipmentCategory] DISABLE;


GO

