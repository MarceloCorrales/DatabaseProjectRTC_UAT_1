CREATE TABLE [dbo].[SubCategory] (
    [Id]                  INT            IDENTITY (1000, 1) NOT NULL,
    [CategoryId]          INT            NOT NULL,
    [Name]                VARCHAR (250)  NOT NULL,
    [IsDeleted]           BIT            CONSTRAINT [DF_SubCategory_IsDeleted] DEFAULT ((0)) NOT NULL,
    [SiteSubCategoryName] VARCHAR (250)  NULL,
    [SiteSubCategoryId]   INT            NULL,
    [PrefixName]          VARCHAR (250)  NULL,
    [LastUpdatedBy]       NVARCHAR (255) NULL,
    [DateUpdated]         DATETIME       NULL,
    [CreatedBy]           NVARCHAR (255) NULL,
    CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id])
);


GO
ALTER TABLE [dbo].[SubCategory] NOCHECK CONSTRAINT [FK_SubCategory_Category];


GO

CREATE NONCLUSTERED INDEX [IX_SubCategory_CategoryId]
    ON [dbo].[SubCategory]([CategoryId] ASC);


GO
ALTER INDEX [IX_SubCategory_CategoryId]
    ON [dbo].[SubCategory] DISABLE;


GO

