CREATE TABLE [dbo].[MachineryTraderLogModel_old] (
    [Id]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [MakeModel]   VARCHAR (100)   NULL,
    [Make]        VARCHAR (100)   NULL,
    [Source]      VARCHAR (100)   NULL,
    [Model]       VARCHAR (100)   NULL,
    [HoursMiles]  VARCHAR (5)     NULL,
    [Year]        INT             NULL,
    [SaleCount]   INT             NULL,
    [SalePrice]   MONEY           NULL,
    [LogFunction] INT             NULL,
    [Slope]       DECIMAL (10, 3) NULL,
    [x]           DECIMAL (10, 3) NULL,
    [Intercept]   DECIMAL (10, 3) NULL,
    [Factor]      INT             NULL,
    [Equation]    VARCHAR (100)   NULL,
    [LastUpdated] DATETIME        DEFAULT (getdate()) NOT NULL,
    [DateCreated] DATETIME        DEFAULT (getdate()) NOT NULL,
    [R]           DECIMAL (5, 4)  NULL,
    CONSTRAINT [PK_MachineryTraderLogModel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

