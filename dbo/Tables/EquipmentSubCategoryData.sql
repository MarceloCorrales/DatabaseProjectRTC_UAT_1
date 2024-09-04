CREATE TABLE [dbo].[EquipmentSubCategoryData] (
    [Id]                  INT           NOT NULL,
    [Name]                VARCHAR (250) NOT NULL,
    [EquipmentCategoryId] INT           NOT NULL,
    [SiteId]              INT           NOT NULL,
    [SiteSubCategoryName] VARCHAR (250) NULL,
    [SiteSubCategoryId]   INT           NULL,
    [PrefixName]          VARCHAR (250) NULL
);


GO

