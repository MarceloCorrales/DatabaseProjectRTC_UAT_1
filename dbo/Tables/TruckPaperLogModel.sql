CREATE TABLE [dbo].[TruckPaperLogModel] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [MakeModel]       VARCHAR (100)   NULL,
    [Make]            VARCHAR (100)   NULL,
    [Source]          VARCHAR (100)   NULL,
    [Model]           VARCHAR (100)   NULL,
    [HoursMiles]      VARCHAR (5)     NULL,
    [Year]            INT             NULL,
    [SaleCount]       INT             NULL,
    [SalePrice]       MONEY           NULL,
    [LogFunction]     INT             NULL,
    [Slope]           DECIMAL (10, 3) NULL,
    [x]               DECIMAL (10, 3) NULL,
    [Intercept]       DECIMAL (10, 3) NULL,
    [Factor]          INT             NULL,
    [Equation]        VARCHAR (100)   NULL,
    [LastUpdated]     DATETIME        DEFAULT (getdate()) NOT NULL,
    [DateCreated]     DATETIME        DEFAULT (getdate()) NOT NULL,
    [SubCategoryName] VARCHAR (250)   NULL,
    CONSTRAINT [PK_TruckPaperLogModel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

