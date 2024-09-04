CREATE TABLE [dbo].[PredictiveValues] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Make]           VARCHAR (100) NULL,
    [Model]          VARCHAR (50)  NULL,
    [Year]           INT           NULL,
    [FutureYear]     INT           NULL,
    [AvgSalePrice]   MONEY         NULL,
    [MinSalePrice]   MONEY         NULL,
    [MaxSalePrice]   MONEY         NULL,
    [ProjectedMiles] INT           NULL,
    [MinHoursMiles]  INT           NULL,
    [MaxHoursMiles]  INT           NULL,
    [CountNumber]    INT           NULL,
    [LogSalePrice]   MONEY         NULL,
    CONSTRAINT [PK_PredictiveValues] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

