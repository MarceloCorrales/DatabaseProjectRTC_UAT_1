CREATE TABLE [dbo].[MasterCategory_BKP_12_10] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (250)  NULL,
    [SiteId]           INT            NULL,
    [SiteCategoryName] VARCHAR (250)  NULL,
    [SiteCategoryId]   INT            NULL,
    [CreatedDate]      DATETIME       NULL,
    [CreatedBy]        VARCHAR (100)  NULL,
    [Updatedate]       DATETIME       NULL,
    [UpdateBy]         VARCHAR (100)  NULL,
    [IsDeleted]        BIT            NULL,
    [ModelIds]         NVARCHAR (MAX) NULL
);


GO

