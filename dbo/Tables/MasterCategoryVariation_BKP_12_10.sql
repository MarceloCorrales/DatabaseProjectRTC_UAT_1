CREATE TABLE [dbo].[MasterCategoryVariation_BKP_12_10] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [CategoryId]  INT           NOT NULL,
    [CreatedBy]   VARCHAR (50)  NULL,
    [CreatedDate] DATETIME      NULL
);


GO

