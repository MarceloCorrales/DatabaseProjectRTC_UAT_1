CREATE TABLE [dbo].[EquipmentCategoryData] (
    [Id]               INT           NOT NULL,
    [Name]             VARCHAR (250) NOT NULL,
    [SiteId]           INT           NOT NULL,
    [SiteCategoryName] VARCHAR (250) NULL,
    [SiteCategoryId]   INT           NULL,
    CONSTRAINT [PK_EquipmentCategoryData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentCategoryData_Site] FOREIGN KEY ([SiteId]) REFERENCES [dbo].[Site] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentCategoryData] NOCHECK CONSTRAINT [FK_EquipmentCategoryData_Site];


GO

