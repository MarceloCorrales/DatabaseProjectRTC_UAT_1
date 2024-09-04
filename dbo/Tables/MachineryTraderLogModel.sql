CREATE TABLE [dbo].[MachineryTraderLogModel] (
    [Id]          BIGINT          NOT NULL,
    [MakeModel]   VARCHAR (100)   NULL,
    [Make]        VARCHAR (100)   NULL,
    [Source]      VARCHAR (100)   NULL,
    [Model]       VARCHAR (100)   NULL,
    [HoursMiles]  VARCHAR (20)    NULL,
    [Year]        INT             NULL,
    [SaleCount]   INT             NULL,
    [SalePrice]   MONEY           NULL,
    [LogFunction] INT             NULL,
    [Slope]       DECIMAL (10, 3) NULL,
    [x]           DECIMAL (10, 3) NULL,
    [Intercept]   DECIMAL (10, 3) NULL,
    [Factor]      INT             NULL,
    [Equation]    VARCHAR (100)   NULL,
    [LastUpdated] DATETIME        NOT NULL,
    [DateCreated] DATETIME        NOT NULL,
    [R]           DECIMAL (5, 4)  NULL
);


GO

