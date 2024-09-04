CREATE TABLE [dbo].[TruckPaperEquipmentYearGaps] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [MAKE]            VARCHAR (250) NOT NULL,
    [MODEL]           VARCHAR (250) NULL,
    [SubCategoryName] VARCHAR (250) NULL,
    [YEARNum]         INT           NULL,
    [IsValue]         INT           NOT NULL,
    [AvgPrice]        MONEY         NULL,
    [DiffPrice]       INT           NULL,
    [NewPrice]        INT           NULL,
    [SaleCount]       INT           NULL,
    CONSTRAINT [PK_TruckPaperEquipmentYearGaps] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

