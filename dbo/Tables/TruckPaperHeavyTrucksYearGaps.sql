CREATE TABLE [dbo].[TruckPaperHeavyTrucksYearGaps] (
    [MAKE]        VARCHAR (250) NOT NULL,
    [source]      VARCHAR (7)   NOT NULL,
    [Model]       VARCHAR (250) NULL,
    [Year]        INT           NOT NULL,
    [AvgPrice]    MONEY         NULL,
    [CountPrice]  INT           NULL,
    [Subcategory] VARCHAR (250) NULL
);


GO

