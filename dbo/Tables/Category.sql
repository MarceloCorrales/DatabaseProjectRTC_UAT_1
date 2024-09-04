CREATE TABLE [dbo].[Category] (
    [Id]               INT            IDENTITY (1000, 1) NOT NULL,
    [Name]             VARCHAR (250)  NOT NULL,
    [AuctionSortOrder] INT            NULL,
    [IsDeleted]        BIT            CONSTRAINT [DF_Category_IsDeleted] DEFAULT ((0)) NOT NULL,
    [SiteCategoryName] VARCHAR (250)  NULL,
    [SiteCategoryId]   INT            NULL,
    [LastUpdatedBy]    NVARCHAR (255) NULL,
    [DateUpdated]      DATETIME       NULL,
    [CreatedBy]        NVARCHAR (255) NULL,
    [IsYearRequired]   BIT            CONSTRAINT [IsYearRequired_c] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

