CREATE TABLE [dbo].[TruckPaperLogModelSubCategories] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [MakeModel]       VARCHAR (250)   NULL,
    [Make]            VARCHAR (100)   NULL,
    [Source]          VARCHAR (100)   NULL,
    [Model]           VARCHAR (100)   NULL,
    [SaleCount]       INT             NULL,
    [Year]            INT             NULL,
    [SubCategoryName] VARCHAR (250)   NULL,
    [SalePrice]       MONEY           NULL,
    [x]               DECIMAL (10, 3) NULL,
    [LogFunction]     INT             NULL,
    [Slope]           DECIMAL (10, 3) NULL,
    [Intercept]       DECIMAL (10, 3) NULL,
    [Factor]          INT             NULL,
    [Equation]        VARCHAR (100)   NULL,
    [LastUpdated]     DATETIME        DEFAULT (getdate()) NOT NULL,
    [DateCreated]     DATETIME        DEFAULT (getdate()) NOT NULL,
    [HoursMiles]      VARCHAR (5)     NULL,
    CONSTRAINT [PK_TruckPaperLogModelSubcategories] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

